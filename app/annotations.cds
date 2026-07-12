using EmployeeService as service from '../srv/employee-service';


// //UI Annotations
// annotate service.Employees with {

//     empId
//         @Common.Label : 'Employee ID';

//     firstName
//         @Common.Label : 'First Name';

//     lastName
//         @Common.Label : 'Last Name';

//     email
//         @Common.Label : 'Email';

//     department
//         @Common.Label : 'Department';

//     salary
//         @Common.Label : 'Salary';

// };

//Line Item Annotation
annotate service.Employees with @UI.LineItem: [

    {
        Value : empId
    },

    {
        Value : firstName
    },

    {
        Value : lastName
    },

    {
        Value : department
    },

    {
        Value : salary
    }

];

//Selection Fields
annotate service.Employees with @(UI.SelectionFields:[
    department,
    firstName
]
);

//Identification Section
annotate service.Employees with @UI.Identification:[

    { Value:firstName },
    { Value:lastName },
    { Value:email },
    { Value:department },
    { Value:salary }

];

annotate service.Employees with @UI.HeaderInfo: {

    TypeName : 'Employees',
    Title : { Value:firstName },
    Description : { Value:department }

};

annotate service.Employees with @UI.FieldGroup : {
    @UI.LineItem : [
        { Value:firstName },
        { Value:lastName },
        { Value:email },
        { Value:department },
        { Value:salary }
    ]
};

annotate service.Employees with @UI.FieldGroup#AddressDetails : {
    Label : 'Address Details',
    Data :[
         { Value:firstName },
        { Value:lastName },
        { Value:email },
        { Value:department },
        { Value:salary }
    ]
};

annotate service.Employees with @UI.Facets: [
    {
       $Type : 'UI.ReferenceFacet',
       Label : 'Employee Details',
       Target : '@UI.FieldGroup#AddressDetails'
    }
];




