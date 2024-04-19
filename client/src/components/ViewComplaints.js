import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import logo from './logo.svg';

const ViewComplaints = () => {
    const [complaints, setComplaints] = useState([]);
    const [feedback, setFeedback] = useState({});
    const [reload, setReload] = useState(false);

    useEffect(() => {
        fetch('http://localhost/cms-php/api/fetch_complaints.php')
            .then(response => response.json())
            .then(data => setComplaints(data))
            .catch(error => console.error('Error fetching complaints:', error));
    }, [reload]);

    const handleFeedbackSubmit = (complaintId) => {
        const payload = {
            complaintId: complaintId,
            feedback: feedback[complaintId]
        };

        fetch('http://localhost/cms-php/api/submit_feedback.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(payload)
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                setReload(!reload); // trigger a reload of complaints
            } else {
                alert('Failed to submit feedback');
            }
        });
    };

    const handleReraiseComplaint = (complaintId) => {
        fetch(`http://localhost/cms-php/api/reraise_complaint.php`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ complaintId })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                setReload(!reload); // trigger a reload of complaints
            } else {
                alert('Failed to reraise complaint');
            }
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
                        <Link className="nav-link" to="/student-view-complaints">View Complaints</Link>
                    </li>
                </ul>
            </nav>
        <div className="container mt-4">
            {complaints.map(complaint => (
                <div key={complaint.id} className="card mb-3">
                    <div className="card-body">
                        <h5 className="card-title">{complaint.title}</h5>
                        <p className="card-text">{complaint.description}</p>
                        {complaint.image_path && <img src={`http://localhost/cms-php/uploads/${complaint.image_path}`} alt="Complaint" className="img-fluid"/>}
                        <p>Status: {complaint.status}</p>
                        <p className="card-text">Department : {complaint.department}</p>
                        <p className="card-text">Comments : {complaint.comment}</p>
                        <p className="card-text">Priority : {complaint.priority}</p>
                        <h5 className="card-title">Feedback</h5>
                        {complaint.feedback && complaint.feedback.split('\n').map((item, index) => (
                            <p key={index} className="text-muted">{item}</p>
                        ))}
                    </div>
                </div>
            ))}
            </div>
            </>
    );
};

export default ViewComplaints;
