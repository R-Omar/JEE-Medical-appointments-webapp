## Description
A Java EE (Jakarta EE) web application to manage appointments in several medical centers. It allows:
- Doctors  to manage their appointment schedules in each medical center where they work.
- Patients to book appointments with doctors.

3 user profiles:
- Administrator: the administrators has the right to create accounts for doctors and associate them with one or more medical centers.
- Doctor: These are doctors who work in one or more medical centers. A doctor can view/update his disponiblities in a medical center, consult his appointments and cancel an appointment.
- Patient: a person registered with the site. He can create, modify and delete their account, make an appointment with one of the doctors at one of the medical centers, view their appointments and cancel them.

## Live Demo 
Link: [http://heal-demo.herokuapp.com/heal-1.0/](http://heal-demo.herokuapp.com/heal-1.0/)<br>
Some accounts for testing, please to not change emails or passwords on the live demo:
| Role    | Email               | Password |
|---------|---------------------|----------|
| admin   | admin@heal.com      | admin    |
| patient | patient@gmail.com   | 123456   |
| doctor  | doctor@gmail.com    | 123456   |

## Architecture, technologies and libraires
- Java (Jakarta) EE APIs (Servlet, JSP, EJB, JPA, JTA)
- JSTL, gson
- Html, CSS, Javascript, Bootstrap, jQuery
- MVC architecture
- MySQL Database
  
## To run locally
1. Clone the project.
2. Install a Java EE based server application (preferably wildfly).
3. Create a SQL database locally and populate it using the heal.sql script which can be found in the directory Database.
4. Replace the database connexion parameters with the connexion parmaters of your local database in the file persistence.xml which can be found in the directory src\main\resources\META-INF.
5. Build the project and deploy the generated WAR in your running application server.