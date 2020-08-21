-- Create schemas

-- Create tables
CREATE TABLE IF NOT EXISTS department
(
    dept_id INTEGER NOT NULL,
    dept_no INTEGER NOT NULL,
    dept_name VARCHAR(30),
    PRIMARY KEY(dept_id)
);

CREATE TABLE IF NOT EXISTS dept_emp
(
    deptemp_id INTEGER NOT NULL,
    emp_no INTEGER NOT NULL,
    dept_no VARCHAR(30),
    PRIMARY KEY(deptemp_id)
);

CREATE TABLE IF NOT EXISTS employees
(
    emp_id INTEGER NOT NULL,
    emp_no INTEGER NOT NULL,
    emp_title VARCHAR(30),
    birth_date DATE,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    sex VARCHAR(1),
    hire_date DATE,
    PRIMARY KEY(emp_id)
);

CREATE TABLE IF NOT EXISTS dept_manager
(
    deptmgr_id INTEGER NOT NULL,
    dept_no VARCHAR(30) NOT NULL,
    emp_no INTEGER,
    PRIMARY KEY(deptmgr_id)
);

CREATE TABLE IF NOT EXISTS salaries
(
    salary_id INTEGER NOT NULL,
    emp_no INTEGER NOT NULL,
    salary INTEGER,
    PRIMARY KEY(salary_id)
);

CREATE TABLE IF NOT EXISTS titles
(
    titlespk_id INTEGER NOT NULL,
    title_id VARCHAR(30) NOT NULL,
    title VARCHAR(30),
    PRIMARY KEY(titlespk_id)
);


-- Create FKs
ALTER TABLE department
    ADD    FOREIGN KEY (dept_no)
    REFERENCES dept_emp(dept_no)
    MATCH SIMPLE
;
    
ALTER TABLE salaries
    ADD    FOREIGN KEY (emp_no)
    REFERENCES dept_emp(emp_no)
    MATCH SIMPLE
;
    
ALTER TABLE titles
    ADD    FOREIGN KEY (title_id)
    REFERENCES dept_manager(dept_no)
    MATCH SIMPLE
;
    
ALTER TABLE employees
    ADD    FOREIGN KEY (emp_no)
    REFERENCES titles(title_id)
    MATCH SIMPLE
;
    
ALTER TABLE employees
    ADD    FOREIGN KEY (emp_no)
    REFERENCES dept_manager(dept_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_emp
    ADD    FOREIGN KEY (emp_no)
    REFERENCES dept_manager(emp_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_manager
    ADD    FOREIGN KEY (emp_no)
    REFERENCES salaries(emp_no)
    MATCH SIMPLE
;
    
ALTER TABLE employees
    ADD    FOREIGN KEY (emp_no)
    REFERENCES dept_emp(emp_no)
    MATCH SIMPLE
;
    
ALTER TABLE department
    ADD    FOREIGN KEY (dept_no)
    REFERENCES dept_manager(dept_no)
    MATCH SIMPLE
;
    
ALTER TABLE titles
    ADD    FOREIGN KEY (title_id)
    REFERENCES employees(emp_title)
    MATCH SIMPLE
;
    
ALTER TABLE dept_emp
    ADD    FOREIGN KEY (emp_no)
    REFERENCES employees(emp_no)
    MATCH SIMPLE
;
    
ALTER TABLE salaries
    ADD    FOREIGN KEY (emp_no)
    REFERENCES employees(emp_no)
    MATCH SIMPLE
;
    
ALTER TABLE department
    ADD    FOREIGN KEY (dept_no)
    REFERENCES dept_emp(emp_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_emp
    ADD    FOREIGN KEY (emp_no)
    REFERENCES department(dept_no)
    MATCH SIMPLE
;
    

-- Create Indexes

