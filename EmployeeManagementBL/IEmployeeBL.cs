using EmployeeManagementModelLayer;
using EmployeeManagementDAL;
using System.Data;


namespace EmployeeManagementBL
{
    public interface IEmployeeBL
    {
        DisplayEmployeeDetails AddEmployee(DisplayEmployeeDetails model);
        Salary AddEmployeeSalary(Salary model);
        DisplayEmployeeDetails GetEmployeeById(int id);
        int DeleteEmployee(int empId);
        DisplayEmployeeDetails UpdateEmployee(DisplayEmployeeDetails details);
        DataSet GetAllEmployee();
    }
}
