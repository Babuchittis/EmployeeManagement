using employee from '../db/schema';

service EmployeeService {

    entity Employees as projection on employee.Employees;

}