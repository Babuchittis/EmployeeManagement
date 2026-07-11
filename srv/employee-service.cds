using employee from '../db/schema';

@protocol: ['odata-v4', 'rest']

service EmployeeService @(path:'/employee', impl : 'srv/manage-employee.js', requires:'authenticated-user') {

@restrict:[
    {grant: 'READ', to: ['EMPViewer','EMPAdmin']},
    {grant: ['CREATE','update'], to:['EMPAdmin']},
    {grant:['READ','UPDATE','CREATE','DELETE'], to:['EMPManager']}
    // {
    //     grant: 'UPDATE',
    //     to: ['Employees', 'Addresses', 'Departments']
    // },
    // {
    //     grant: 'CREATE',
    //     to: ['Employees', 'Addresses', 'Departments']
    // },
    // {
    //     grant: 'DELETE',
    //     to: ['Employees', 'Addresses', 'Departments']
    // } 
    ]
    entity Employees as projection on employee.Employees;
    entity Addresses as projection on employee.Addresses;
     entity Departments as projection on employee.Departments;

     function getAnnualSalary(ID : UUID)
        returns Decimal(15,2);

    function getEmployeeCount()
        returns Integer;

    action promoteEmployee(
        ID : UUID,
        department : String
    );

    action increaseSalary(
        ID : UUID,
        percentage : Integer
    );  

}

