sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/sap/em/employeemanagement/test/integration/pages/EmployeesList.gen",
	"com/sap/em/employeemanagement/test/integration/pages/EmployeesObjectPage.gen",
	"com/sap/em/employeemanagement/test/integration/pages/AddressesObjectPage.gen"
], function (JourneyRunner, EmployeesListGenerated, EmployeesObjectPageGenerated, AddressesObjectPageGenerated) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/sap/em/employeemanagement') + '/test/flp.html#app-preview',
        pages: {
			onTheEmployeesListGenerated: EmployeesListGenerated,
			onTheEmployeesObjectPageGenerated: EmployeesObjectPageGenerated,
			onTheAddressesObjectPageGenerated: AddressesObjectPageGenerated
        },
        async: true
    });

    return runner;
});

