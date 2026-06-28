using employee from '../db/schema';

service EmployeeService {

    entity Employees as projection on employee.Employees;
    entity Addresses as projection on employee.Addresses;
     entity Departments as projection on employee.Departments;
}

