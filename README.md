# Group__12-Complaint-management-system

The University Complaint Management System is a robust software application designed to streamline the process of reporting, tracking, and resolving various issues and grievances within a university environment. This system provides a user-friendly interface for students to submit complaints and enables administrators and department heads to manage these complaints efficiently.

## Technology Stack

- **Frontend:** React.js
- **Backend API:** PHP
- **Database:** MySQL, managed through phpMyAdmin
- **Server:** Apache (via XAMPP)

## Application Architecture
![arch](https://github.com/yaswant2001/Group__12-Complaint-management-system/assets/73974566/a4c44bb1-763d-47dc-9862-4c7f8d715bee)


## Features

- **Complaint Submission:** Students can log into the system and submit complaints with details such as category, description, and optional photo attachments.
- **Complaint Tracking:** Students can track the status of their complaints from submission through to resolution.
- **Admin Dashboard:** Administrators can view all complaints, update statuses, assign complaints to specific departments, and prioritize complaints based on severity.
- **Department Dashboard:** Department heads can view complaints assigned to their department, respond to complaints, and submit resolutions.
- **Role-Based Access:** The system supports multiple user roles, including students, administrators, and department heads, each with customized access permissions.
- **Real-Time Updates:** Students receive real-time updates about the status of their complaints via notifications.
- **Feedback System:** After a complaint is resolved, students can provide feedback on the resolution process, which can be used for service improvement.
- **Emergency Handling:** The system can flag and prioritize emergency complaints to ensure they are addressed immediately.
- **Secure Authentication:** Users must log in to access the system, ensuring that data privacy and security are maintained.

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
