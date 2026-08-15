
<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Java DevOps Application</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            min-height: 100vh;
            font-family: Arial, Helvetica, sans-serif;
            background: #0f172a;
            color: #e2e8f0;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            width: 90%;
            max-width: 900px;
            padding: 40px;
            background: #1e293b;
            border-radius: 16px;
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.4);
        }

        .badge {
            display: inline-block;
            padding: 8px 14px;
            border-radius: 20px;
            background: #166534;
            color: #bbf7d0;
            font-size: 14px;
            font-weight: bold;
        }

        h1 {
            margin-top: 20px;
            margin-bottom: 10px;
            font-size: 42px;
        }

        .subtitle {
            color: #94a3b8;
            font-size: 18px;
            margin-bottom: 30px;
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 16px;
        }

        .card {
            padding: 20px;
            background: #0f172a;
            border: 1px solid #334155;
            border-radius: 12px;
        }

        .card h3 {
            margin-top: 0;
            color: #38bdf8;
        }

        .card p {
            color: #cbd5e1;
        }

        .footer {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #334155;
            color: #64748b;
            font-size: 14px;
        }
    </style>
</head>

<body>

<div class="container">

    <span class="badge">APPLICATION RUNNING</span>

    <h1>Java DevOps Application</h1>

    <p class="subtitle">
        Continuous Integration and Continuous Deployment demonstration
    </p>

    <div class="grid">

        <div class="card">
            <h3>Application</h3>
            <p>Java WAR Application</p>
        </div>

        <div class="card">
            <h3>Build</h3>
            <p>Maven</p>
        </div>

        <div class="card">
            <h3>Container</h3>
            <p>Docker + Tomcat</p>
        </div>

        <div class="card">
            <h3>Registry</h3>
            <p>AWS ECR Public</p>
        </div>

        <div class="card">
            <h3>Orchestration</h3>
            <p>Kubernetes</p>
        </div>

        <div class="card">
            <h3>Deployment</h3>
            <p>Jenkins CI/CD</p>
        </div>

    </div>

    <div class="footer">
        DevOps Assignment • Java • Maven • Docker • Jenkins • AWS ECR • Kubernetes
    </div>

</div>

</body>
</html>
