### 1) Pull SQL Latest image in docker
- `docker pull mysql:latest`

### 2) Run SQL image & Connect to remote database in intractive mode 
- `docker run --rm -it mysql:latest mysql -h 18.136.157.135 -u dm_team4 -p`
##### Enter password = DM!$!Team!47@4!23&

### 3) In MySQL shell - Change database to (project_medical_data_history)
- `USE project_medical_data_history;`

### 4) Run SQL Querys in MySQL shell
- `SHOW TABLES;`
- .....

### 5) Exit MYSQL shell 
- `\q`
