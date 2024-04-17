# Group__12-Complaint-management-system

This repository hosts the University Complaint Management System, a mobile application developed using Flutter and Firebase. This system is designed to enable students at a university to report, track, and resolve various issues and grievances in an efficient and streamlined manner. It offers real-time updates and administrative oversight through a comprehensive dashboard.

## Features

- **User Authentication:** Secure login and registration functionality for students and system administrators using Firebase Authentication.
- **Complaint Submission:** Allows students to submit complaints, with options to include detailed descriptions and photographic evidence.
- **Real-Time Updates:** Complaint status updates are delivered in real-time, ensuring that students are always informed of progress.
- **Admin Dashboard:** Administrators can view, assign, and update the status of complaints, managing the workflow efficiently.
- **Notification System:** Integrates Firebase Cloud Messaging to send alerts and notifications to users about important updates related to their complaints.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Before you begin, ensure you have the following installed:
- [Flutter](https://flutter.dev/docs/get-started/install)
- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- A Firebase account

### Installation

1. **Clone the repo:**
   ```sh
   git clone https://github.com/yourusername/university-complaint-system.git
   cd university-complaint-system
2. **Install dependecies:**
   ```sh
   flutter pub get
3. **setup firebase**
  Add your Firebase project configurations:
  Android: Place google-services.json in android/app/.
  iOS: Place GoogleService-Info.plist in ios/Runner/.
  Make sure Firebase Authentication and Firestore are enabled in your Firebase console.
4. **Run**
   ```sh
   flutter run

### Usage
1. Use the application to facilitate the management of complaints within a university setting:

2. Students: Log in to submit and track the status of complaints.
3. Administrators: Access the admin panel to manage and resolve complaints efficiently.

### Thank You
