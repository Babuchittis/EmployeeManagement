module.exports = cds.service.impl(function () {

  const { Employees } = this.entities;

  this.before( ['CREATE', 'UPDATE'], Employees, req => {

    if (!req.data.email.includes("@")) {
      req.error('Invalid Email');
    }

    if (req.data.salary <= 0) {
      req.error('Salary must be greater than zero');
    }

  });

});

module.exports = cds.service.impl(async function () {

    const { Employees } = this.entities;

    this.before(["CREATE", "UPDATE"], Employees, (req) => {

        const firstName = req.data.firstName;

        if (firstName && !/^[A-Za-z ]+$/.test(firstName)) {
            req.error({
                code: "INVALID_FIRSTNAME",
                message: "First Name should contain only alphabets.",
                target: "firstName"
            });
        }

    });

});

module.exports = cds.service.impl(async function () {

    const { Employees } = this.entities;

    this.before("READ", Employees, async (req) => {

        // Execute only when reading a single employee
        if (!req.params || req.params.length === 0) {
            return;
        }

        const ID = req.params[0].ID;

        console.log("Employee ID:", ID);

        const employee = await SELECT.one.from(Employees).where({ ID });

        if (!employee) {
            req.reject(404, "Employee not found.");
        }

    });

});

module.exports = cds.service.impl(async function () {

    const { Employees } = this.entities;

    // Function
    this.on("getAnnualSalary", async (req) => {

        const { ID } = req.data;

        const employee = await SELECT.one
            .from(Employees)
            .where({ ID });

        return employee.salary * 12;

    });

    // Function
    this.on("getEmployeeCount", async () => {

        const result = await SELECT.from(Employees);

        return result.length;

    });

    // Action
    this.on("promoteEmployee", async (req) => {

        const { ID, department } = req.data;

        await UPDATE(Employees)
            .set({
                department: department
            })
            .where({ ID });

        return "Employee promoted successfully";

    });

    // Action
    this.on("increaseSalary", async (req) => {

        const { ID, percentage } = req.data;

        const employee = await SELECT.one
            .from(Employees)
            .where({ ID });

        const newSalary =
            employee.salary +
            (employee.salary * percentage / 100);

        await UPDATE(Employees)
            .set({
                salary: newSalary
            })
            .where({ ID });

        return "Salary updated";

    });

});