using EmployeeManagementModelLayer;
using System.Data;


namespace EmployeeManagementDAL
{
    public interface IEmployeeRepo
    {
        DisplayEmployeeDetails AddEmployee(DisplayEmployeeDetails model);
        Salary AddEmployeeSalary(Salary model);
        DisplayEmployeeDetails GetEmployeeById(int id);
        int DeleteEmployee(int empId);
        DisplayEmployeeDetails UpdateEmployee(DisplayEmployeeDetails details);
        DataSet GetAllEmployee();

    }
}
