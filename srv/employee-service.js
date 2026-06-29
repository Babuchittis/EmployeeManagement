module.exports = cds.service.impl(function () {

  const { Employees } = this.entities;

  this.before('CREATE', Employees, req => {

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

        if (firstName && !/^[A-Za-z]+$/.test(firstName)) {
            req.error({
                code: "INVALID_FIRSTNAME",
                message: "First Name should contain only alphabets.",
                target: "firstName"
            });
        }

    });

});