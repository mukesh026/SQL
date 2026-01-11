# 📊 Data Analyst Job Market SQL Analysis

A comprehensive SQL project analyzing the Data Analyst job market, focusing on top-paying jobs, in-demand skills, and optimal skill combinations for career growth.

## 🎯 Project Overview

This project explores the Data Analyst job market using SQL queries to uncover insights about:
- **Top-paying Data Analyst positions** and their requirements
- **Most in-demand skills** in the job market
- **Skills associated with higher salaries**
- **Optimal skills** that balance high demand with high average salaries

## 📁 Project Structure

```
SQL/
├── sql_load/                    # Database setup scripts
│   ├── 1_create_database.sql   # Database creation
│   ├── 2_create_tables.sql     # Table schema definitions
│   └── 3_modify_tables.sql     # Table modifications and data loading
│
└── SQL_Project/                 # Analysis queries
    ├── query_1.sql             # Top 10 highest-paying Data Analyst jobs
    ├── Top_paying_jobs_.sql    # Alternative top-paying jobs query
    ├── Top_paying_job_skills.sql   # Skills required for top-paying jobs
    ├── Top_demanded_skills.sql     # Top 5 most demanded skills
    ├── top_paying_skills.sql       # Highest-paying skills by average salary
    └── high_demand_skills.sql      # Optimal skills (high demand + high salary)
```

## 🗄️ Database Schema

The project uses a relational database with four main tables:

### **company_dim**
- `company_id` (PK) - Unique company identifier
- `name` - Company name
- `link` - Company website
- `link_google` - Google search link
- `thumbnail` - Company logo/image

### **skills_dim**
- `skill_id` (PK) - Unique skill identifier
- `skills` - Skill name
- `type` - Skill category

### **job_postings_fact**
- `job_id` (PK) - Unique job posting identifier
- `company_id` (FK) - References company_dim
- `job_title_short` - Abbreviated job title
- `job_title` - Full job title
- `job_location` - Job location
- `job_via` - Job posting source
- `job_schedule_type` - Full-time, part-time, etc.
- `job_work_from_home` - Remote work indicator
- `search_location` - Search location used
- `job_posted_date` - Posting timestamp
- `job_no_degree_mention` - Degree requirement indicator
- `job_health_insurance` - Health insurance benefit
- `job_country` - Country of job
- `salary_rate` - Salary payment frequency
- `salary_year_avg` - Average yearly salary
- `salary_hour_avg` - Average hourly salary

### **skills_job_dim** (Junction Table)
- `job_id` (PK, FK) - References job_postings_fact
- `skill_id` (PK, FK) - References skills_dim

## 🔍 Analysis Queries

### 1️⃣ Top-Paying Data Analyst Jobs
**File:** [`query_1.sql`](file:///c:/Users/narpa/OneDrive/Desktop/SQL/SQL_Project/query_1.sql)

Identifies the top 10 highest-paying Data Analyst positions that offer remote work ("Anywhere" location).

**Key Insights:**
- Filters for remote Data Analyst positions
- Excludes jobs without salary information
- Returns job details including company name and salary

### 2️⃣ Skills for Top-Paying Jobs
**File:** [`Top_paying_job_skills.sql`](file:///c:/Users/narpa/OneDrive/Desktop/SQL/SQL_Project/Top_paying_job_skills.sql)

Uses a CTE to find what skills are required for the top 10 highest-paying Data Analyst jobs.

**Key Insights:**
- Combines top-paying jobs with their required skills
- Helps identify which skills lead to higher compensation
- Uses JOIN operations to connect jobs with skills

### 3️⃣ Most In-Demand Skills
**File:** [`Top_demanded_skills.sql`](file:///c:/Users/narpa/OneDrive/Desktop/SQL/SQL_Project/Top_demanded_skills.sql)

Analyzes the top 5 most frequently requested skills for Data Analyst positions.

**Key Insights:**
- Counts skill occurrences across all remote Data Analyst jobs
- Identifies market trends in skill requirements
- Helps prioritize learning based on demand

### 4️⃣ Top-Paying Skills
**File:** [`top_paying_skills.sql`](file:///c:/Users/narpa/OneDrive/Desktop/SQL/SQL_Project/top_paying_skills.sql)

Calculates average salaries for each skill to identify the highest-paying technologies.

**Key Categories:**
- 💻 Programming & Niche Tech
- ☁️ Cloud, DevOps & Infrastructure
- 🤖 AI & Data Science

**Key Insights:**
- Shows top 20 skills by average salary
- Reveals which technical skills command premium compensation
- Helps guide career development decisions

### 5️⃣ Optimal Skills (High Demand + High Salary)
**File:** [`high_demand_skills.sql`](file:///c:/Users/narpa/OneDrive/Desktop/SQL/SQL_Project/high_demand_skills.sql)

The most sophisticated query - combines demand and salary data to find optimal skills worth learning.

**Methodology:**
- Uses two CTEs to calculate:
  - `skills_demand`: Count of job postings per skill
  - `skills_average_salary`: Average salary per skill
- Filters for skills with >10 job postings (ensuring relevance)
- Ranks by average salary and demand

**Key Insights:**
- Identifies skills that are both well-paid AND in-demand
- Balances market need with compensation potential
- Top 20 most strategic skills for career growth

## 🛠️ Technologies Used

- **Database:** PostgreSQL
- **SQL Concepts:**
  - Complex JOINs (INNER, LEFT)
  - Common Table Expressions (CTEs)
  - Aggregate Functions (COUNT, AVG, ROUND)
  - Filtering and Sorting
  - Subqueries
  - GROUP BY operations

## 🚀 Getting Started

### Prerequisites
- PostgreSQL installed on your system
- Basic understanding of SQL

### Setup Instructions

1. **Create the database:**
   ```bash
   psql -U postgres -f sql_load/1_create_database.sql
   ```

2. **Create tables:**
   ```bash
   psql -U postgres -d your_database -f sql_load/2_create_tables.sql
   ```

3. **Load and modify data:**
   ```bash
   psql -U postgres -d your_database -f sql_load/3_modify_tables.sql
   ```

4. **Run analysis queries:**
   ```bash
   psql -U postgres -d your_database -f SQL_Project/query_name.sql
   ```

## 📈 Key Findings

Based on the analysis queries, this project reveals:

✅ **Top-paying remote Data Analyst jobs** and their salary ranges  
✅ **Critical skills** that appear most frequently in job postings  
✅ **Premium skills** that command the highest average salaries  
✅ **Strategic skills** that offer both high demand and high compensation  

## 💡 Use Cases

This analysis is valuable for:
- **Job Seekers:** Identify which skills to learn for better career prospects
- **Career Switchers:** Understand the Data Analyst job market landscape
- **Recruiters:** Benchmark salary ranges and skill requirements
- **Educators:** Design curricula based on market demands

## 📝 Notes

- All queries focus on **remote positions** (job_location = 'Anywhere')
- Salary data is filtered to exclude NULL values for accuracy
- Skills are analyzed in the context of Data Analyst roles specifically

## 🤝 Contributing

Feel free to fork this project and add your own analysis queries or improvements!

## 📧 Contact

For questions or suggestions about this project, please reach out!

---

**⭐ If you found this project helpful, please consider giving it a star!**
