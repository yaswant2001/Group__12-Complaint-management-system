import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import logo from './logo.svg';

const StudentDashboard = () => {
    const [title, setTitle] = useState('');
    const [description, setDescription] = useState('');
    const [file, setFile] = useState(null);
    
    const handleSubmit = (event) => {
        event.preventDefault();

        const userId = localStorage.getItem('userId'); // Retrieve user ID from local storage
        const formData = new FormData();
        formData.append('title', title);
        formData.append('description', description);
        formData.append('file', file);
        formData.append('userId', userId); // Append user ID to form data

        fetch('http://localhost/cms-php/api/submit_complaint.php', {
            method: 'POST',
            body: formData,
        })
        .then(response => response.json())
        .then(data => {
            alert('Complaint submitted successfully!');
            setTitle('');
            setDescription('');
            setFile(null);
        })
        .catch(error => alert('Failed to submit complaint'));
    };
    return (
        <>
            <nav className="navbar navbar-expand-lg navbar-light bg-light">
            <div className="navbar-brand">
                <img src={logo} alt="Logo" style={{ width: "120px" }} /> 
            </div>
                <ul className="navbar-nav mr-auto">
                    <li className="nav-item">
                        <Link className="nav-link" to="/student-dashboard">Student Dashboard</Link>
                    </li>
                    <li className="nav-item">
                        <Link className="nav-link" to="/student-view-complaints">View Complaints</Link>
                    </li>
                </ul>
            </nav>
        <div className="container">
            <h1>Student Dashboard</h1>
            <form onSubmit={handleSubmit}>
                <div className="form-group">
                    <label htmlFor="title">Complaint Title</label>
                    <input type="text" className="form-control" id="title" value={title} onChange={e => setTitle(e.target.value)} required />
                </div>
                <div className="form-group">
                    <label htmlFor="description">Description</label>
                    <textarea className="form-control" id="description" value={description} onChange={e => setDescription(e.target.value)} required />
                </div>
                <div style ={{"marginTop" :20,"marginBottom" :20}} className="form-group">
                    <label htmlFor="file">Upload Picture</label>
                    <input type="file" className="form-control-file" id="file" onChange={e => setFile(e.target.files[0])} />
                </div>
                <button type="submit" className="btn btn-primary">Submit Complaint</button>
            </form>
            </div>
            </>
    );
};

export default StudentDashboard;
