-- =====================================
-- HR ANALYTICS PROJECT - SQL QUERIES
-- =====================================

-- 1. View all employees
SELECT * FROM Employees;

-- 2. Employees in IT department
SELECT *
FROM Employees
WHERE Department = 'IT';

-- 3. Employees sorted by salary (highest to lowest)
SELECT *
FROM Employees
ORDER BY Salary DESC;

-- 4. Basic salary statistics
SELECT 
    COUNT(*) AS NumberOfEmployees,
    AVG(Salary) AS AverageSalary,
    MAX(Salary) AS HighestSalary,
    MIN(Salary) AS LowestSalary
FROM Employees;

-- 5. Employee with highest salary
SELECT Name, Salary
FROM Employees
WHERE Salary = (SELECT MAX(Salary) FROM Employees);

-- 6. Employee with lowest salary
SELECT Name, Salary
FROM Employees
WHERE Salary = (SELECT MIN(Salary) FROM Employees);

-- 7. Department-wise salary analysis
SELECT 
    Department,
    COUNT(*) AS TotalEmployees,
    AVG(Salary) AS AvgSalary,
    MAX(Salary) AS MaxSalary,
    MIN(Salary) AS MinSalary
FROM Employees
GROUP BY Department;

-- 8. Departments ranked by average salary (highest first)
SELECT 
    Department,
    AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department
ORDER BY AvgSalary DESC;

-- 9. Salary classification (High / Medium / Low)
SELECT 
    Name,
    Department,
    Salary,
    CASE 
        WHEN Salary >= 9000 THEN 'High'
        WHEN Salary >= 7000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryCategory
FROM Employees;

-- 10. Count employees by salary category
SELECT 
    CASE 
        WHEN Salary >= 9000 THEN 'High'
        WHEN Salary >= 7000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryCategory,
    COUNT(*) AS TotalEmployees
FROM Employees
GROUP BY 
    CASE 
        WHEN Salary >= 9000 THEN 'High'
        WHEN Salary >= 7000 THEN 'Medium'
        ELSE 'Low'
    END;

-- 11. Best performing department (highest avg salary)
SELECT TOP 1 
    Department, 
    AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department
ORDER BY AvgSalary DESC;

-- 12. Lowest performing department (lowest avg salary)
SELECT TOP 1 
    Department, 
    AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department
ORDER BY AvgSalary ASC;
