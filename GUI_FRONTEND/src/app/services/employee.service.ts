import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class EmployeeService {
  constructor(private _http: HttpClient) {}

  public getDataLength = 0;
  public selectedTableName = "Person";
  public pkName = "PERSON_ID";
  public displayedColumns: string[] = [];

  addEmployee(data: any): Observable<any> {
    return this._http.post(`http://localhost:3000/api/users/${this.selectedTableName}`, data);
  }

  updateEmployee(id: number, data: any): Observable<any> {
    return this._http.put(`http://localhost:3000/api/users/${this.selectedTableName}/${this.pkName}/${id}`, data);
  }

  getEmployeeList(): Observable<any> {
    return this._http.get(`http://localhost:3000/api/users/${this.selectedTableName}`);
  }

  getPkName(): Observable<any> {
    return this._http.get(`http://localhost:3000/api/users/pkname/${this.selectedTableName}`);
  }

  deleteEmployee(id: number): Observable<any> {
    return this._http.delete(`http://localhost:3000/api/users/${this.selectedTableName}/${this.pkName}/${id}`);
  }
}
