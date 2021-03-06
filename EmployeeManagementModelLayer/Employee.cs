﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeManagementModelLayer
{
    public class Employee
    {
        public int EmpId { get; set; }
        public string EName { get; set; }
        public char Gender { get; set; }
        public DateTime HireDate { get; set; }
        public int DeptNo { get; set; }
        public string Email { get; set; }
        public string BirthDay { get; set; }
        public string JobDiscription { get; set; }
        public string Image { get; set; }
    }
}
