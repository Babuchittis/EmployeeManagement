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