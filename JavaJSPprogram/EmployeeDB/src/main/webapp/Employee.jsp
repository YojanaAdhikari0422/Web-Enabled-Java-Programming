<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Employee Data Update</title>
    <style>
        body { font-family: 'Inter', sans-serif; display: flex; justify-content: center; align-items: center; min-height: 100vh; background-color: #f0f4f8; }
        .container { background: white; padding: 40px; border-radius: 12px; box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1); width: 100%; max-width: 400px; }
        h2 { color: #1e3a8a; margin-bottom: 25px; text-align: center; border-bottom: 2px solid #93c5fd; padding-bottom: 10px; }
        input[type="text"], input[type="number"], input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            box-sizing: border-box;
            transition: border-color 0.3s;
        }
        input:focus { border-color: #3b82f6; outline: none; box-shadow: 0 0 0 2px rgba(59, 130, 246, 0.2); }
        button {
            width: 100%;
            padding: 12px;
            background-color: #3b82f6;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s, transform 0.1s;
        }
        button:hover { background-color: #2563eb; }
        button:active { transform: scale(0.99); }
    </style>
</head>
<body>
    <div class="container">
        <h2>Update Employee Record</h2>
        <form action="EmployeeUpdate.jsp" method="post">
            <input name="empid" type="text" placeholder="Employee ID (Required for Update)" required />
            <input name="name" type="text" placeholder="New Name" required />
            <input name="age" type="number" placeholder="New Age" required />
            <input name="desg" type="text" placeholder="New Designation" required />
            <input name="salary" type="number" step="0.01" placeholder="New Salary" required />
            <button type="submit">Update Employee Data</button>
        </form>
    </div>
</body>
</html>