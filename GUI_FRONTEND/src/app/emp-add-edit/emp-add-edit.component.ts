import { Component, Inject, OnInit } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { CoreService } from '../core/core.service';
import { EmployeeService } from '../services/employee.service';
import * as CryptoJS from 'crypto-js';

@Component({
  selector: 'app-emp-add-edit',
  templateUrl: './emp-add-edit.component.html',
  styleUrls: ['./emp-add-edit.component.scss'],
})
export class EmpAddEditComponent implements OnInit {
  empForm: FormGroup;

  public selectedTable = "";
  public primaryKeyName = "";
  public currentEncyptedField = "";

  displayedColumns: string[] = [];
  nonActionColumns: string[] = [];

  constructor(
    private _fb: FormBuilder,
    private _empService: EmployeeService,
    private _dialogRef: MatDialogRef<EmpAddEditComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any,
    private _coreService: CoreService
  ) {
    let groupObject : any = {};
    this.displayedColumns = this._empService.displayedColumns;
    this.displayedColumns.forEach((column) => {
      if(column != "action") {
        if(column.toLowerCase().includes("encrypted")) {
          this.currentEncyptedField = column;
          let encyptedArray = column.split("_");
          groupObject[encyptedArray[0]] = '';
        } else {
          groupObject[column] = '';
        }
      }
    });
    console.log(groupObject);
    this.empForm = this._fb.group(groupObject);
  }

  manageEncryption() {
    this.nonActionColumns.forEach((column, index) => {
      if(column.toLowerCase().includes("encrypted")) {
        let encyptedArray = column.split("_");
        this.nonActionColumns[index] = encyptedArray[0];
      }
    })
  }

  ngOnInit(): void {
    this.displayedColumns = this._empService.displayedColumns;
    this.nonActionColumns = this.displayedColumns.filter((column) => column != "action");
    this.manageEncryption();
    this.empForm.patchValue(this.data);
    this.selectedTable = this._empService.selectedTableName;
    this.primaryKeyName = this._empService.pkName;
  }

  addEncryption(data: any) {
    let encryptedArray = this.currentEncyptedField.split("_");
    Object.keys(data).forEach((key) => {
      console.log(key);
      if(key == encryptedArray[0]) {
        let value = data[key];
        delete data[key];
        data[this.currentEncyptedField] = this.getEncryptedValue(value);
      }
    })
    console.log(data);
    return data;
  }

  // addEncryptedKey()

  getEncryptedValue(value: any) {
    console.log(value);
    let encryptedValue = CryptoJS.AES.encrypt( value.trim(), "Northeastern@123").toString();
    return btoa(encryptedValue);
  }

  async encryptData(plaintext: string, password: string): Promise<string> {
    // Generate a random salt
    const salt = crypto.getRandomValues(new Uint8Array(16));

    // Derive a key from the password
    const keyMaterial = await crypto.subtle.importKey(
      'raw',
      new TextEncoder().encode(password),
      { name: 'PBKDF2' },
      false,
      ['deriveKey']
    );

    const key = await crypto.subtle.deriveKey(
      {
        name: 'PBKDF2',
        salt: salt,
        iterations: 100000,
        hash: 'SHA-256',
      },
      keyMaterial,
      { name: 'AES-GCM', length: 256 },
      false,
      ['encrypt', 'decrypt']
    );

    // Encode plaintext to UTF-8
    const encoded = new TextEncoder().encode(plaintext);

    // Create an initialization vector
    const iv = crypto.getRandomValues(new Uint8Array(12));

    // Encrypt the data
    const encrypted = await crypto.subtle.encrypt(
      {
        name: 'AES-GCM',
        iv: iv,
      },
      key,
      encoded
    );

    // Concatenate iv + encrypted data
    const combined: any = new Uint8Array(iv.length + encrypted.byteLength);
    combined.set(iv, 0);
    combined.set(new Uint8Array(encrypted), iv.length);

    // Convert the Uint8Array to a Base64 string
    const base64CipherText = btoa(String.fromCharCode.apply(null, combined));

    return base64CipherText;
  }

  async onFormSubmit() {
    if (this.empForm.valid) {
      if (this.data) {
        console.log(this.data);
        this.data = this.addEncryption(this.empForm.value);
        this._empService
          .updateEmployee(this.data[this.primaryKeyName], this.empForm.value)
          .subscribe({
            next: (val: any) => {
              this._coreService.openSnackBar(this.selectedTable + ' detail updated!');
              this._dialogRef.close(true);
            },
            error: (err: any) => {
              console.error(err);
            },
          });
      } else {
        let payload = this.empForm.value;
        payload = this.addEncryption(payload);
        payload[this.primaryKeyName] = this._empService.getDataLength+1;
        console.log(payload);
        // console.log(typeof await this.encryptData("djvb" , "vcjdbvd"));
        this._empService.addEmployee(payload).subscribe({
          next: (val: any) => {
            this._coreService.openSnackBar(this.selectedTable + ' added successfully');
            this._dialogRef.close(true);
          },
          error: (err: any) => {
            console.error(err);
          },
        });
      }
    }
  }
}
