# Group__12-Complaint-management-system

The University Complaint Management System is a feature-rich software application created to simplify the reporting, monitoring, and addressing of different complaints and concerns in a university setting. This system gives students an easy-to-use interface through which to file complaints, and it gives department heads and administrators the ability to handle and promptly handle those complaints.

## Technology Stack

- **Frontend:** React.js
- **Backend API:** PHP
- **Database:** MySQL, managed through phpMyAdmin
- **Server:** Apache (via XAMPP)

## Application Architecture
![arch](https://github.com/yaswant2001/Group__12-Complaint-management-system/assets/73974566/a4c44bb1-763d-47dc-9862-4c7f8d715bee)


## Features

- Submission of Complaints: Students may use the system and enter complaints along with possible photo attachments and details like the complaint's type and description.
- Students can monitor the progress of their complaints from the time they are submitted until they are resolved.
- Administrators get access to the admin dashboard, where they may see all complaints, change their statuses, designate complaints to particular departments, and order them according to severity.
- Department Dashboard: Department heads are able to see the complaints that have been allocated to them, reply to those concerns, and file resolutions.
- Role-Based Access: With different access permissions for each role administrators, department heads, and students the system accommodates a multitude of user roles.
- Emergency Handling: To guarantee that complaints are handled right away, the system has the ability to identify and rank emergencies.
Secure Authentication: By requiring users to check in before they can access the system, data security and privacy are preserved.


## Installation

### Prerequisites

- **XAMPP:** Used for managing the MySQL database and PHP backend.
- **Node.js and npm:** Required to run the React application.

### Setup Instruction
1. **Clone the Repository**
   ```bash
   git clone https://github.com/yaswant2001/Group__12-Complaint-management-system.git
   cd Group__12-Complaint-management-system
2. Setup the Backend
   Start XAMPP and ensure that Apache and MySQL are running (you can click on start if not running).
   Create a new database name Group12_cmsDB via phpMyAdmin and import the provided SQL file to set up the database schema.
3. Configure PHP API
   Place the PHP files in api folder inside the htdocs folder of XAMPP.
   Adjust the database configuration in db_config.php to match your phpMyAdmin credentials.
4. Run the React Frontend
   ```bash
   cd client
   npm install 
   npm start
   
5. Navigate to http://localhost:3000 to access the frontend.
   Use the provided credentials to log in as a student, administrator, or department head.

   Credentials
   1. Admin : ad@gmail.com, password : ad1234
   2. Student : stu@gmail.com, password : stu123
   3. departmet : dept@gmail.com, password : dept123
      
- Make sure you placed the api files in the xampp/htdocs/ folder to use the api endpoints.
  
### Usage
1. Use the application to facilitate the management of complaints within a university setting:

<img width="1268" alt="Screenshot 2024-04-18 at 8 06 53 PM" src="https://github.com/yaswant2001/Group__12-Complaint-management-system/assets/73974566/31e010ab-4369-44e1-a442-4efb1e4d6ff2">

2. Administrators: Access the admin panel to manage and resolve complaints efficiently.

<img width="765" alt="Screenshot 2024-04-18 at 8 08 45 PM" src="https://github.com/yaswant2001/Group__12-Complaint-management-system/assets/73974566/7698b97a-7785-48dd-913a-0618dbe60705">

3.Departments can resolve the complaint:

<img width="1268" alt="Screenshot 2024-04-18 at 8 43 32 PM" src="https://github.com/yaswant2001/Group__12-Complaint-management-system/assets/73974566/e2e7241b-cb22-4d92-aa1a-958dfbb27e77">

4. Students: Log in to submit and track the status of complaints, give the feedback and can also reraise the complaint if not solved.

<img width="1268" alt="Screenshot 2024-04-18 at 9 11 51 PM" src="https://github.com/yaswant2001/Group__12-Complaint-management-system/assets/73974566/c8841152-0fc5-41bc-ab46-eef0825ca279">

5. Users table in the database

<img width="1268" alt="Screenshot 2024-04-18 at 9 30 04 PM" src="https://github.com/yaswant2001/Group__12-Complaint-management-system/assets/73974566/c68d2b41-7313-4dfc-bc48-c521397ed1fd">

6. Complaints table in the database
   
<img width="1268" alt="Screenshot 2024-04-18 at 9 29 55 PM" src="https://github.com/yaswant2001/Group__12-Complaint-management-system/assets/73974566/2f84d6cc-8cf2-44ab-8470-dff4b91656d7">

### Contributors
- **Yaswanth kuragonda** 11712766
- **Harshavardhan podili** 11669498
- **Yalla Visweswara Sai Praveen** 11712824
- **VISHNU VADAN MANDAPATI** 11655795

### Thank You
