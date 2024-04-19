import React from 'react';
import { useFormik } from 'formik';
import * as Yup from 'yup';
import { useNavigate, Link } from 'react-router-dom';

const Registration = () => {
    const navigate = useNavigate();
    const formik = useFormik({
        initialValues: {
            email: '',
            password: '',
            role: 'student'
        },
        validationSchema: Yup.object({
            email: Yup.string().email('Invalid email address').required('Required'),
            password: Yup.string().required('Required'),
            role: Yup.string().oneOf(['student', 'department', 'admin']).required('Required')
        }),
        onSubmit: values => {
            fetch('http://localhost/cms-php/api/register.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(values),
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert('Registration Successful');
                    navigate('/');
                } else {
                    alert(data.message || 'Error during registration');
                }
            })
            .catch(error => alert('Error during registration'));
        },
    });

    return (
        <div className="container mt-5">
            <h2>Registration</h2>
            <form onSubmit={formik.handleSubmit} className="form-group">
                <label htmlFor="email">Email Address</label>
                <input
                    id="email"
                    name="email"
                    type="email"
                    onChange={formik.handleChange}
                    value={formik.values.email}
                    className="form-control"
                />
                {formik.touched.email && formik.errors.email ? <div className="text-danger">{formik.errors.email}</div> : null}

                <label htmlFor="password">Password</label>
                <input
                    id="password"
                    name="password"
                    type="password"
                    onChange={formik.handleChange}
                    value={formik.values.password}
                    className="form-control"
                />
                {formik.touched.password && formik.errors.password ? <div className="text-danger">{formik.errors.password}</div> : null}

                <label htmlFor="role">Role</label>
                <select
                    id="role"
                    name="role"
                    onChange={formik.handleChange}
                    value={formik.values.role}
                    className="form-control"
                >
                    <option value="student">Student</option>
                    <option value="department">Department</option>
                    <option value="admin">Admin</option>
                </select>
                <button type="submit" className="btn btn-primary mt-3">Register</button>
                <p className="mt-3">
                    Already have an account? <Link to="/login">Log in</Link>
                </p>
            </form>
        </div>
    );
};

export default Registration;
