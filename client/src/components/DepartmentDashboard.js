import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import logo from './logo.svg'; 

const departments = ['IT', 'HR', 'Finance', 'Maintenance', 'Security', 'Administration'];

const DepartmentDashboard = () => {
    const [complaints, setComplaints] = useState([]);
    const [filteredComplaints, setFilteredComplaints] = useState([]);
    const [selectedDepartment, setSelectedDepartment] = useState('');
    const [comments, setComments] = useState({});

    useEffect(() => {
        fetch('http://localhost/cms-php/api/fetch_dept_complaints.php')
            .then(response => response.json())
            .then(data => {
                setComplaints(data);
                setFilteredComplaints(data.filter(complaint => complaint.status === 'assigned' && complaint.department === selectedDepartment));
            })
            .catch(error => console.error('Error fetching complaints:', error));
    }, [selectedDepartment]);

    const handleDepartmentChange = (e) => {
        setSelectedDepartment(e.target.value);
    };

    const handleCommentChange = (id, value) => {
        setComments(prev => ({ ...prev, [id]: value }));
    };

    const handleResolve = (id) => {
        const body = {
            complaintId: id,
            comments: comments[id],
            status: 'resolved'
        };

        fetch('http://localhost/cms-php/api/update_complaint_status.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(body)
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('Complaint resolved successfully!');
                setComplaints(complaints.filter(complaint => complaint.id !== id));
            } else {
                alert(data.message);
            }
        })
        .catch(error => {
            console.error('Error resolving complaint:', error);
            alert('Error resolving complaint: ' + error.message);
        });
    };
    
    return (
        <>
        <nav className="navbar navbar-expand-lg navbar-light bg-light">
            <div className="navbar-brand">
                <img src={logo} alt="Logo" style={{ width: "120px" }} /> 
            </div>
            <ul className="navbar-nav mr-auto">
                <li className="nav-item">
                    <Link className="nav-link" to="/department-dashboard">Department Dashboard</Link>
                </li>
                <li className="nav-item">
                    <Link className="nav-link" to="/view-complaints">View Complaints</Link>
                </li>
            </ul>
        </nav>
        <div className="container">
            <h1>Department Dashboard</h1>
            <div className="form-group">
                <label htmlFor="department">Filter by Department</label>
                <select id="department" className="form-control" value={selectedDepartment} onChange={handleDepartmentChange}>
                    <option value="">Select Department</option>
                    {departments.map(dept => (
                        <option key={dept} value={dept}>{dept}</option>
                    ))}
                </select>
            </div>
            <div className="row">
                {filteredComplaints.map(complaint => (
                    <div style={ {"marginTop":20}} key={complaint.id} className="col-md-6 mb-4">
                        <div className="card">
                            <div className="card-body">
                                <h5 className="card-title">{complaint.title}</h5>
                                <p className="card-text">{complaint.description}</p>
                                <p className="card-text">Department : {complaint.department}</p>
                                <p className="card-text">Status : {complaint.status}</p>
                                <p className="card-text">Priority : {complaint.priority}</p>
                                
                                <textarea
                                    className="form-control"
                                    value={comments[complaint.id] || ''}
                                    onChange={(e) => handleCommentChange(complaint.id, e.target.value)}
                                    placeholder="Enter resolution comment"
                                ></textarea>
                                <button className="btn btn-success mt-2" onClick={() => handleResolve(complaint.id)}>Mark as Resolved</button>
                            </div>
                        </div>
                    </div>
                ))}
            </div>
        </div></>
    );
};

export default DepartmentDashboard;
