import React from 'react';
import { BrowserRouter as Router, Route, Routes, Link } from 'react-router-dom';
import Registration from './components/Registration';
import Login from './components/Login';
import StudentDashboard from './components/StudentDashboard';
import StudentViewComplaints from './components/StudentViewComplaints';
import ViewComplaints from './components/ViewComplaints';
import AdminDashboard from './components/AdminDashboard';
import DepartmentDashboard from './components/DepartmentDashboard';

function App() {
  return (
        <Router>
            <Routes>
                <Route path="/register" element={<Registration />} />
                <Route path="/" element={<Login />} />
          <Route path="/student-dashboard" element={<StudentDashboard />} />
          <Route path="/admin-dashboard" element={<AdminDashboard />} />
          <Route path="/department-dashboard" element={<DepartmentDashboard />} />
          <Route path="/student-view-complaints" element={<StudentViewComplaints />} />
          <Route path="/view-complaints" element={<ViewComplaints />} />
              
            </Routes>
        </Router>
    );
}

export default App;
