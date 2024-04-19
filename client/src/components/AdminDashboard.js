import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import logo from './logo.svg'; 

const departments = ['IT', 'HR', 'Finance', 'Maintenance', 'Security', 'Administration'];
const priorities = ['low', 'medium', 'high', 'emergency'];

const AdminDashboard = () => {
    const [complaints, setComplaints] = useState([]);

    useEffect(() => {
        fetch('http://localhost/cms-php/api/fetch_complaints.php')
            .then(response => response.json())
            .then(data => setComplaints(data))
            .catch(error => console.error('Error fetching complaints:', error));
    }, []);

    const handleUpdate = (complaintId, field, value) => {
        const formData = new FormData();
        formData.append('complaintId', complaintId);
        formData.append(field, value);

        fetch('http://localhost/cms-php/api/update_complaint.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('Update successful!');
                setComplaints(complaints.map(complaint => 
                    complaint.id === complaintId ? { ...complaint, [field]: value } : complaint
                ));
            } else {
                alert('Failed to update complaint');
            }
        })
        .catch(error => alert('Error updating complaint'));
    };

    return (
        <>
            <nav className="navbar navbar-expand-lg navbar-light bg-light">
            <div className="navbar-brand">
                <img src={logo} alt="Logo" style={{ width: "120px" }} /> 
            </div>
                <ul className="navbar-nav mr-auto">
                    <li className="nav-item">
                        <Link className="nav-link" to="/admin-dashboard">Dashboard</Link>
                    </li>
                    <li className="nav-item">
                        <Link className="nav-link" to="/view-complaints">View Complaints</Link>
                    </li>
                </ul>
            </nav>
        <div className="container">
            <h1>Admin Dashboard - Manage Complaints</h1>
            <div className="row">
                {complaints.map(complaint => (
                    <div key={complaint.id} className="col-md-6 mb-4">
                        <div className="card">
                            <div className="card-body">
                                <h5 className="card-title">{complaint.title}</h5>
                                <p className="card-text">{complaint.description}</p>
                                <div className="form-group">
                                    <label>Department</label>
                                    <select className="form-control"
                                        value={complaint.department || ''}
                                        onChange={(e) => handleUpdate(complaint.id, 'department', e.target.value)}>
                                        <option value="">Select Department</option>
                                        {departments.map(dept => (
                                            <option key={dept} value={dept}>{dept}</option>
                                        ))}
                                    </select>
                                </div>
                                <div className="form-group">
                                    <label>Priority</label>
                                    <select className="form-control"
                                        value={complaint.priority || 'low'}
                                        onChange={(e) => handleUpdate(complaint.id, 'priority', e.target.value)}>
                                        {priorities.map(priority => (
                                            <option key={priority} value={priority}>{priority}</option>
                                        ))}
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                ))}
            </div>
        </div>
        </>
    );
};

export default AdminDashboard;
