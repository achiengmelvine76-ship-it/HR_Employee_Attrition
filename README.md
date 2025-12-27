# HR_Employee_Attrition
HR Data Analyzing Employee Attrition
# Employee Attrition Analysis (SQL Project)

## 📌 Project Summary

This project focuses on analyzing **employee attrition** using PostgreSQL to uncover patterns and factors that influence why employees leave an organization. The analysis is based on an HR dataset containing demographic, job, salary, performance, and satisfaction-related information.

The goal is to provide **data-driven insights** that HR teams and management can use to improve **employee retention**, **engagement**, and **workforce planning**.

---

## 🎯 Business Objectives

The key questions answered in this project include:
* Total number of employee in every department
* What percentage of employees have left the company?
* Which departments experience the highest attrition?
* Do salary levels influence attrition?
* How does tenure affect an employee’s likelihood of leaving?
* Does age, overtime, or job satisfaction impact attrition?
* Is lack of promotion linked to employee turnover?

---

## 🗂 Dataset Overview

**Table:** `employee_attrition`

The dataset includes:

* Employee demographics (Age, Gender, Marital Status)
* Job details (Department, Job Role, Job Level)
* Compensation (Monthly Income, Salary Hike, Stock Options)
* Satisfaction & performance metrics
* Career progression indicators

---

## 🧪 Data Validation & Cleaning

* Checked for NULL values in key fields such as `Attrition`
* Verified employee counts per department
* Ensured consistent categorical values for analysis

---

## 📊 Key Analyses & Insights

### 1️⃣ Overall Attrition Rate

* Calculated the percentage of employees who left the organization
* Used aggregation and CROSS JOIN techniques

**Insight:** Attrition exists at a measurable rate and requires proactive HR intervention.

---

### 2️⃣ Attrition by Department

* Grouped attrition counts by department

**Insight:** Certain departments show higher turnover, indicating role-specific or workload-related challenges.

---

### 3️⃣ Salary Comparison (Stayed vs Left)

* Compared average monthly income between employees who stayed and those who left

**Insight:** Employees with lower average salaries are more likely to leave.

---

### 4️⃣ Tenure Analysis

* Analyzed years at company vs attrition
* Created tenure buckets (0–1, 2–5, 6–10, 10+ years)

**Insight:** Attrition is highest among employees with shorter tenure, especially within the first 5 years.

---

### 5️⃣ Age Group Impact

* Grouped employees into age brackets
* Calculated attrition counts and rates

**Insight:** Younger employees (20–30s) show higher attrition compared to older age groups.

---

### 6️⃣ Job Satisfaction & Attrition

* Ranked job satisfaction scores by attrition status

**Insight:** Lower job satisfaction correlates strongly with higher attrition.

---

### 7️⃣ Overtime Impact

* Compared attrition rates between employees who work overtime and those who do not

**Insight:** Employees working overtime have a significantly higher likelihood of leaving.

---

### 8️⃣ Performance Rating Analysis

* Compared average performance ratings for employees who stayed vs left

**Insight:** High-performing employees also leave, suggesting attrition is not purely performance-based.

---

### 9️⃣ Promotion & Career Growth

* Analyzed years since last promotion
* Grouped employees by promotion timelines

**Insight:** Employees with long gaps since promotion show higher attrition.

---

## 🧠 Business Recommendations

Based on the analysis, the following actions are recommended:

### ✔ Improve Early-Career Retention

* Introduce mentorship programs for employees with less than 5 years tenure
* Provide clearer career paths during onboarding

### ✔ Review Compensation Strategy

* Conduct salary benchmarking for high-attrition roles
* Implement targeted salary adjustments

### ✔ Manage Overtime & Workload

* Monitor overtime frequency
* Introduce flexible scheduling and workload balancing

### ✔ Strengthen Career Growth Opportunities

* Create transparent promotion timelines
* Increase internal mobility and upskilling programs

### ✔ Enhance Employee Engagement

* Regular job satisfaction surveys
* Actively address feedback from low-satisfaction groups

---

## 🛠 SQL Skills Demonstrated

* Aggregate functions (SUM, AVG, COUNT)
* CASE statements for grouping
* Window functions (RANK, OVER)
* CTEs (WITH clauses)
* Views creation and management

---

## 📈 Potential Extensions

* Build a Power BI dashboard using this analysis
* Apply predictive modeling to forecast attrition risk
* Segment analysis by job role or education level

---

## 👤 Author

**Melvine**
Data Analyst | HR Analytics Enthusiast

---

⭐ If you find this project useful, feel free to star the repository!
