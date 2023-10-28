
# Pewlett Hackard Upcoming Retirements analysis

## Resources

CSV Data Sources: [Employees](https://github.com/estridge2014/Pewlett-Hackard-Analysis/blob/main/Data/employees.csv) , [Dept_Employees](https://github.com/estridge2014/Pewlett-Hackard-Analysis/blob/main/Data/dept_emp.csv), [Titles](https://github.com/estridge2014/Pewlett-Hackard-Analysis/blob/main/Data/titles.csv)

Database System: Postgres Version 12.7

Interface: PgAdmin Version 5.2

Language: SQL

## Background: 

Pewlett Hackard is a large company with several thousand employees. Baby boomers are beginning to retire at a rapid rate, which will lead to many thousands of vacancies. The company until now has relied mostly on excel and VBA to analyze and store data. I’ve chosen to update these methods by using SQL in order to handle these large employee information datasets. Through data modeling, engineering, and analysis, HR now has a SQL database of employee data, allowing them to answer the important questions of who is retiring, who is eligible for a retirement package and what positions will need to be filled in the near-future.   

### Process: 

Reference employee database challenge file [here](https://github.com/estridge2014/Pewlett-Hackard-Analysis/blob/main/Queries/Employee_Database_Challenge.sql) for the below process. 

## Deliverable 1 - Find the number of retiring employees by title

Create a [ Retirement Titles ](https://github.com/estridge2014/Pewlett-Hackard-Analysis/blob/main/Data/retirement_titles.csv)  table that holds all the titles of current employees who were born between January 1, 1952 and December 31, 1955.

1. Join the Employees and Titles tables
2. Filter by birth date
3. Order by employee number

Create a [Unique Titles](https://github.com/estridge2014/Pewlett-Hackard-Analysis/blob/main/Data/unique_titles.csv) table that contains the most recent title of each employee.

1. Use "DISTINCT ON" statement from the above Retirements Table to find most recent title for each employee
2. Order by employee number and date of most recent title

Create a [Retiring Titles](https://github.com/estridge2014/Pewlett-Hackard-Analysis/blob/main/Data/retiring_titles.csv) table that has the number of retirement-age employees by most recent job title.

1. Use "COUNT" statment to count number of employees per title from the above Unique Titles table
2. Order by the count of employees

## Deliverable 2 - Find the employees eligible for the mentorship program

Create a [Mentorship Eligibility](https://github.com/estridge2014/Pewlett-Hackard-Analysis/blob/main/Data/mentorship_eligibilty.csv) table that holds the current employees who were born between January 1, 1965 and December 31, 1965.

1. Join the Employees, Dept_Employees, and Titles tables to create a Mentorship Eligibility table
2. Filter by birth date and most recent title
3. Order by employee number

## Results 

1. While the number of employees that are retiring is large, before we filtered our tables the results were decieving. Most of the employees eligible for retirement have had multiple roles in the company over the years, having recieved promotions and switched titles. Once Filtered to show only the retiring employee and their final job title, the list became much smaller.  

2. The total number of employees that will be eligible for retirement is 90,398.

3. Based on the Mentorship Eligibility table, there are 1,549 employees eligible for mentorship

4. The majority of the roles which retirement elegible employees will be leaving are senior roles (64%). Assuming that the senior roles will be filled by promoting current employees, the roles you will be needing to recruit and hire new employees for will be lower roles within the company. 

5. Below displays titles and count of employees who will be retiring. 

<img width="230" alt="Screen Shot 2021-08-01 at 10 47 21 PM" src="https://user-images.githubusercontent.com/84936545/127797949-6188097f-f53d-4ae5-b423-bcea348a7508.png">


## Summary 

How many roles will need to be filled as the "silver tsunami" begins to make an impact?

- 90,398 roles will need to be filled as employees begin to retire.

Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

- No, there are only 1,549 qualified employees eligible to participate in the mentorship program.

Additional queries that may provide more insight into the upcoming "silver tsunami":

1. Filter the retirement information by department to begin high level planning for department goals, team structure and hiring process. This could be used to find team members eligible for promotion in the next few years to reduce the strain of hiring a new employee in every role. See example image below:

![count_retiring_dept](https://github.com/estridge2014/Pewlett-Hackard-Analysis/assets/84936545/e3f98a1f-279c-4e13-a8e1-2fb36a2603ba)


2. Expand the range of qualified employees eligible to participate in the mentorship program to create more mentorship opportunities. By just expanding one year (current employees who were born between January 1, 1964 and December 31, 1965) to the mentorship eligibility, we are increasing to 19,905 qualified employees eligible to participate in the mentorship program.
