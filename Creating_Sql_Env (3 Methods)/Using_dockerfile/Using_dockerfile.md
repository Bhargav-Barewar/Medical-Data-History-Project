### 1) Creating Mysql docker file 
---------------------------------------------------------------------------
`FROM mysql:latest`

`ENV MYSQL_HOST=18.136.157.135`
`ENV MYSQL_USER=dm_team4`
`ENV MYSQL_DATABASE=project_medical_data_history`

`CMD ["sh", "-c", "mysql -h $MYSQL_HOST -u $MYSQL_USER -p$MYSQL_PASSWORD"]`

----------------------------------------------------------------------------

### 2) Build the Docker Image
- `docker build -t my-mysql-client .`

### 3) Run the Container with the Password
- `docker run -it -e MYSQL_PASSWORD="DM!$!Team!47@4!23&" my-mysql-client`
##### - Now we are connected to reomote database 

### 4) Running Queries in MySQL shell 
#### - changing database to (project_medical_data_history)
- `use project_medical_data_history;`
##### - Running the queries in MySQL shell
- `select * from doctors;`
- .....

### 5) To exit MySQL shell
- `\q`