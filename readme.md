# Description
A Java (Jakarta) EE web application to manage appointments in in medical centers.

# Live Demo 
Link: [http://heal-demo.herokuapp.com/heal-1.0/](http://heal-demo.herokuapp.com/heal-1.0/)<br>
Some accounts for testing, please to not change emails or passwords on the live demo:
| Role    | Email               | Password |
|---------|---------------------|----------|
| admin   | admin@heal.com      | admin    |
| patient | patient@gmail.com   | 123456   |
| doctor  | doctor@gmail.com    | 123456   |

# Frameworks, technologies and libraires
- Java (Jakarta) EE APIs (Servlet, JSP, EJB,JDBC, JPA, JTA)
- JSTL, gson
- Html, CSS, Javascript, Bootstrap, jQuery
- MVC architecture
- MySQL Database
  
# To run locally
1. Clone the project.
2. Install a Java EE-based server application (preferably wildfly).
3. Create a SQL database locally and populate it using the the heal.sql script which can be found in the directory Database.
4. Replace the database connexion parameters with the connexion parmaters of your local database in the file persistence.xml whin can be found in the directory src\main\resources\META-INF.
5. Build the project and deploy the generated WAR in your running application server.