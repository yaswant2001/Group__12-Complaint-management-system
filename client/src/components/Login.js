import React from 'react';
import { useFormik } from 'formik';
import * as Yup from 'yup';
import { useNavigate } from 'react-router-dom';
import { Link } from 'react-router-dom';

const Login = () => {
    const navigate = useNavigate();
    const formik = useFormik({
        initialValues: {
            email: '',
            password: ''
        },
        validationSchema: Yup.object({
            email: Yup.string().email('Invalid email address').required('Required'),
            password: Yup.string().required('Required')
        }),
        onSubmit: values => {
            fetch('http://localhost/cms-php/api/login.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(values),
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    localStorage.setItem('userId', data.userId); // Store user ID in local storage
                    switch (data.role) {
                        case 'student':
                            navigate('/student-dashboard');
                            break;
                        case 'department':
                            navigate('/department-dashboard');
                            break;
                        case 'admin':
                            navigate('/admin-dashboard');
                            break;
                        default:
                            navigate('/'); // Or some other default page
                    }
                } else {
                    alert(data.message || 'Login failed');
                }
            })
            .catch(error => {
                console.error('Login error:', error);
                alert('Login failed');
            });
        },
    });

    return (
        <div className="container mt-5">
            <h2>Login</h2>
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

                <button type="submit" className="btn btn-primary mt-3">Login</button>
            </form>
            <p className="mt-3">
                    Need an account? <Link to="/register">Sign Up</Link>
            </p>
        </div>
    );
};

export default Login;
