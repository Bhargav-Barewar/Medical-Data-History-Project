# `Medical Data History Project`

## Overview
This project helps to manage and understand medical data about patients. It uses a database to store information about patients, their admissions to the hospital, and medical history. With this project, you can run different queries to get useful information about patients and their health records.

## Features
- Use Docker to easily set up and run the database.
- Store and organize patient information securely.
- Get lists of patients based on different details like gender, age, and admission history.
- Update patient information like allergies with simple commands.
- Generate reports to see important patient data and history.

## Technologies Used
- **Database:** MySQL — to store and manage medical data.
- **Docker:** to create and run the database environment easily.
- **SQL:** to write commands that interact with the database.

---

## How to Set Up and Run
You can perform this project using three different methods:

### 1. Using Docker CLI
- **Pull the MySQL Docker Image:**
  ```bash
  docker pull mysql:latest
  ```
- **Run the MySQL Container and Connect:**
  ```bash
  docker run --rm -it mysql:latest mysql -h 18.136.157.135 -u dm_team4 -p
  ```
  Enter the password: `DM!$!Team!47@4!23&`
- **Select the Database:**
  ```sql
  USE project_medical_data_history;
  ```

### 2. Using Docker Compose
- **Start the Database with Docker Compose:**
  ```bash
  docker-compose up
  ```
- **Get the Container ID:**
  ```bash
  docker ps
  ```
- **Access the MySQL Shell:**
  ```bash
  docker exec -it <container_id> mysql -u dm_team4 -p
  ```
  Enter the password: `DM!$!Team!47@4!23&`
- **Select the Database:**
  ```sql
  USE project_medical_data_history;
  ```

### 3. Using a Custom Dockerfile
- **Create a Dockerfile:**
  ```dockerfile
  FROM mysql:latest
  ENV MYSQL_HOST=18.136.157.135
  ENV MYSQL_USER=dm_team4
  ENV MYSQL_DATABASE=project_medical_data_history
  CMD ["sh", "-c", "mysql -h $MYSQL_HOST -u $MYSQL_USER -p$MYSQL_PASSWORD"]
  ```
- **Build the Docker Image:**
  ```bash
  docker build -t my-mysql-client .
  ```
- **Run the Container with the Password:**
  ```bash
  docker run -it -e MYSQL_PASSWORD="DM!$!Team!47@4!23&" my-mysql-client
  ```
- **Select the Database:**
  ```sql
  USE project_medical_data_history;
  ```
Now you can run SQL commands to view or update patient data.

---

## Common SQL Queries
Here are some examples of what you can do:
- See a list of male patients with their names.
- Count how many patients were born in a certain year.
- Update allergy information for patients.
- Find patients admitted on specific dates.
- Generate reports about patient demographics.

## Why This Project Is Useful
This project makes it easier for medical staff or researchers to organize and analyze patient data. It helps quickly find important information that can assist in patient care and decision making.

---

## `📌Checkout all performed SQL Queries in (SQL_Queries.md) file`

Thank you for checking out the Medical Data History project!
