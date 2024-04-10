import { Component, OnInit, ViewChild } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { EmpAddEditComponent } from './emp-add-edit/emp-add-edit.component';
import { EmployeeService } from './services/employee.service';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { CoreService } from './core/core.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
})
export class AppComponent implements OnInit {
  displayedColumns: string[] = [];
  dataSource!: MatTableDataSource<any>;

  @ViewChild(MatPaginator) paginator!: MatPaginator;
  @ViewChild(MatSort) sort!: MatSort;

  public selectedOption = "Person";
  public primaryKeyName = "PERSON_ID";
  public username = "";
  public password = "";
  public currentView = "home";
  public isLoggedIn: string | null = "false";
  constructor(
    private _dialog: MatDialog,
    private _empService: EmployeeService,
    private _coreService: CoreService
  ) {}

  ngOnInit(): void {
    this.getEmployeeList();
    this.getPrimaryKeyName();
    // console.log(this.selectedOption);
    this.isLoggedIn = sessionStorage.getItem("isLoggedIn");
  }

  login() {
    if(this.username == 'Anusha' && this.password == 'Anusha') {
      this.currentView = "crud";
      sessionStorage.setItem("isLoggedIn", "true");
      this.isLoggedIn = "true";
    } else {
      alert("Wrong Username or Password!");
    }
  }

  logout() {
    sessionStorage.removeItem("isLoggedIn");
    this.isLoggedIn = "false";
    this.currentView = "login";
  }

  explore() {
    if(this.isLoggedIn == "true") {
      this.currentView = "crud";
    } else {
      this.currentView = "login";
    }
  }

  changeFunction(event: any) {
    console.log(this.selectedOption);
    this._empService.selectedTableName = this.selectedOption;
    this.getEmployeeList();
    this.getPrimaryKeyName();
  }

  openAddEditEmpForm() {
    const dialogRef = this._dialog.open(EmpAddEditComponent);
    dialogRef.afterClosed().subscribe({
      next: (val) => {
        if (val) {
          this.getEmployeeList();
        }
      },
    });
  }

  filterEncryptedFields<T>(data: T[]): T[] {
    return data.map(item => {
      const filteredItem: Partial<T> = {};
      for (const key in item) {
        if (!key.toLowerCase().includes('encrypted')) {
          filteredItem[key] = item[key];
        }
      }
      return filteredItem as T;
    });
  }

  getEmployeeList() {
    this._empService.getEmployeeList().subscribe({
      next: (res) => {
        const filteredData = res;
        this.displayedColumns = Object.keys(filteredData[0]);
        this.displayedColumns.push("action");
        this._empService.displayedColumns = this.displayedColumns;
        console.log(this.displayedColumns);
        this._empService.getDataLength = filteredData.length;
        this.dataSource = new MatTableDataSource(filteredData);
        this.dataSource.sort = this.sort;
        this.dataSource.paginator = this.paginator;
      },
      error: console.log,
    });
  }

  getPrimaryKeyName() {
    this._empService.getPkName().subscribe({
      next: (res) => {
        this.primaryKeyName = res[0].COLUMN_NAME;
        this._empService.pkName = this.primaryKeyName;
      },
      error: console.log,
    });
  }

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();

    if (this.dataSource.paginator) {
      this.dataSource.paginator.firstPage();
    }
  }

  deleteEmployee(id: number) {
    this._empService.deleteEmployee(id).subscribe({
      next: (res) => {
        this._coreService.openSnackBar('Employee deleted!', 'done');
        this.getEmployeeList();
      },
      error: console.log,
    });
  }

  openEditForm(data: any) {
    const dialogRef = this._dialog.open(EmpAddEditComponent, {
      data,
    });

    dialogRef.afterClosed().subscribe({
      next: (val) => {
        if (val) {
          this.getEmployeeList();
        }
      },
    });
  }
}
