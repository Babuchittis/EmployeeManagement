namespace employee;

using { cuid, managed } from '@sap/cds/common';

entity Employees : cuid, managed {
    empId      : String(10);
    firstName  : String(50);
    lastName   : String(50);
    email      : String(100);
    department : String(50);
    salary     : Decimal(15,2);
}