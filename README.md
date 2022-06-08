# SimplyCourse Online Course Platform

## code download
Use the command below to pull the code from repository, and will require local installed git first.

```
git clone https://github.com/LeonLu2/SimplyCourse.git

Or

git clone ssh://git@github.com:LeonLu2/SimplyCourse.git
```

## Project modules
* **admin**<br>
admin as a vue cli application
* **business**<br>
core business module as a spring boot application
* **doc**<br>
project related docs with a project database initial script
* **eureka**<br>
registration center as a spring boot application
* **file**<br>
file module as a spring boot application
* **gateway**<br>
router module as a spring boot application
* **generator**<br>
code generator used
* **server**<br>
public jar module relied on by business, file, and system
* **system**<br>
system module as a spring boot application
* **web**<br>
web module as a vue cli application


## Project initialize
* need local installed idea, nodejs，jdk1.8, mysql5.7, navicat
* download the code and open with idea
* refresh maven dependencies
* install vue-cli
```
npm install -g @vue/cli
```
* download node module
```
initialize web module
cd web
npm install

initialize admin module
cd admin
npm install
```
* create database courseimooc, password courseimooc
* database initialize script is /doc/db/all.sql

## Start the project
* launch the registration center：EurekaApplication
* launch the router：GatewayApplication
* launch the system：SystemApplication
* launch the business：BusinessApplication
* launch the file：FileApplication
* launch the admin：admin\package.json
* launch the web：web\package.json

## Page visit
* admin address: http://localhost:8080/login<br>
initial user name and password：test/1234
* web address: http://localhost:8081<br>
 support user registration, verification code can be viewed in log or sms table

## resource config
located at /doc/db/resource.json<br>
require copy and paste resource in admin, and allocate access in role management of admin, and after access reallocation, need to re-login
