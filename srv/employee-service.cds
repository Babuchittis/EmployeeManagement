using employee from '../db/schema';

@protocol: ['odata-v4', 'rest']

service EmployeeService @(path:'/employee') {

    entity Employees as projection on employee.Employees;
    entity Addresses as projection on employee.Addresses;
     entity Departments as projection on employee.Departments;
}

