namespace employee;

using { cuid, managed } from '@sap/cds/common';

entity Employees : cuid, managed {

    @title: 'Employee ID'
    empId      : String(10);

    @mandatory
    @title: 'First Name'
    firstName  : String(50);

    @mandatory
    @title: 'Last Name'
    lastName   : String(50);

    @mandatory
    @assert.format: '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
    email      : String(100);

    @title: 'Department'
    department : String(50);

     @title: 'Salary'
    @assert.range:[10000,1000000]
    salary     : Decimal(15,2);

    addresses : Composition of many Addresses
                    on addresses.employee = $self;
    departments : Association to Departments;
}


entity Addresses : cuid {

    employee : Association to Employees;

    @mandatory
    @title : 'House Number'
    houseNo : String(20);
@title : 'Street'
    street : String(100);
@title : 'City'
    city : String(50);
@title : 'State'
    state : String(50);
@title : 'Country'
    country : String(50);
@title : 'Pincode'
    pincode : String(10);
}

entity Departments : cuid, managed {
    deptId   : String(10);
    deptName : String(100);

    employees : Association to many Employees
                    on employees.departments = $self;
}

