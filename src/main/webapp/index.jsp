<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.example.Calculator" %>

<%
    String result = "";
    String error = "";

    String number1 = request.getParameter("number1");
    String number2 = request.getParameter("number2");
    String operation = request.getParameter("operation");

    if (number1 != null && number2 != null && operation != null) {

        try {

            double a = Double.parseDouble(number1);
            double b = Double.parseDouble(number2);

            Calculator calculator = new Calculator();

            switch (operation) {

                case "add":
                    result = String.valueOf(calculator.add(a, b));
                    break;

                case "subtract":
                    result = String.valueOf(calculator.subtract(a, b));
                    break;

                case "multiply":
                    result = String.valueOf(calculator.multiply(a, b));
                    break;

                case "divide":
                    result = String.valueOf(calculator.divide(a, b));
                    break;

                default:
                    error = "Invalid operation";
            }

        } catch (IllegalArgumentException e) {

            error = e.getMessage();

        } catch (Exception e) {

            error = "Please enter valid numbers";
        }
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>DevOps Calculator </title>

    <style>

        * {
            box-sizing: border-box;
        }

        html {
            scroll-behavior: smooth;
        }

        body {

            margin: 0;

            min-height: 100vh;

            font-family:
                Inter,
                Arial,
                Helvetica,
                sans-serif;

            background:
                radial-gradient(
                    circle at top left,
                    #1e3a5f 0%,
                    #0f172a 38%,
                    #020617 100%
                );

            color: #e2e8f0;

            padding: 40px 20px;
        }

        .page {

            width: 100%;

            max-width: 1100px;

            margin: auto;
        }

        /* HEADER */

        .header {

            display: flex;

            align-items: center;

            justify-content: space-between;

            margin-bottom: 30px;

            gap: 20px;
        }

        .brand {

            display: flex;

            align-items: center;

            gap: 14px;
        }

        .brand-icon {

            width: 48px;

            height: 48px;

            display: flex;

            align-items: center;

            justify-content: center;

            border-radius: 12px;

            background:
                linear-gradient(
                    135deg,
                    #0ea5e9,
                    #2563eb
                );

            font-size: 22px;

            font-weight: bold;

            color: white;

            box-shadow:
                0 8px 25px rgba(14, 165, 233, 0.25);
        }

        .brand h1 {

            margin: 0;

            font-size: 22px;

            color: #f8fafc;
        }

        .brand p {

            margin: 4px 0 0;

            color: #64748b;

            font-size: 13px;
        }

        .status {

            display: flex;

            align-items: center;

            gap: 8px;

            padding: 8px 14px;

            border-radius: 20px;

            background: rgba(22, 101, 52, 0.25);

            border: 1px solid rgba(74, 222, 128, 0.25);

            color: #86efac;

            font-size: 13px;

            font-weight: 600;
        }

        .status-dot {

            width: 8px;

            height: 8px;

            border-radius: 50%;

            background: #22c55e;

            box-shadow:
                0 0 10px #22c55e;
        }


        /* MAIN GRID */

        .main-grid {

            display: grid;

            grid-template-columns:
                minmax(320px, 1.1fr)
                minmax(280px, 0.9fr);

            gap: 24px;

            align-items: stretch;
        }


        /* CALCULATOR */

        .calculator-card {

            background:
                rgba(15, 23, 42, 0.88);

            border: 1px solid #1e293b;

            border-radius: 20px;

            padding: 28px;

            box-shadow:
                0 25px 60px rgba(0, 0, 0, 0.35);

            backdrop-filter: blur(10px);
        }

        .calculator-header {

            margin-bottom: 22px;
        }

        .calculator-header h2 {

            margin: 0;

            font-size: 25px;

            color: #f8fafc;
        }

        .calculator-header p {

            margin: 7px 0 0;

            color: #64748b;

            font-size: 14px;
        }


        /* DISPLAY */

        .display {

            min-height: 115px;

            display: flex;

            flex-direction: column;

            justify-content: flex-end;

            align-items: flex-end;

            padding: 20px;

            margin-bottom: 18px;

            border-radius: 14px;

            background: #020617;

            border: 1px solid #1e293b;

            overflow: hidden;
        }

        .expression {

            min-height: 22px;

            color: #64748b;

            font-size: 14px;

            margin-bottom: 6px;
        }

        .display-result {

            width: 100%;

            text-align: right;

            font-size: 36px;

            font-weight: 600;

            color: #f8fafc;

            overflow-x: auto;

            white-space: nowrap;
        }


        /* FORM */

        .calculator-form {

            display: flex;

            flex-direction: column;

            gap: 14px;
        }

        .input-row {

            display: grid;

            grid-template-columns:
                1fr 1fr;

            gap: 12px;
        }

        .field {

            display: flex;

            flex-direction: column;

            gap: 7px;
        }

        .field label {

            color: #64748b;

            font-size: 12px;

            font-weight: 600;

            text-transform: uppercase;

            letter-spacing: 0.6px;
        }

        input,
        select {

            width: 100%;

            height: 50px;

            padding: 0 14px;

            border-radius: 10px;

            border: 1px solid #334155;

            outline: none;

            background: #0f172a;

            color: #e2e8f0;

            font-size: 16px;

            transition:
                border-color 0.2s,
                box-shadow 0.2s;
        }

        input:focus,
        select:focus {

            border-color: #0ea5e9;

            box-shadow:
                0 0 0 3px rgba(14, 165, 233, 0.1);
        }

        select {

            cursor: pointer;
        }

        .calculate-button {

            height: 52px;

            border: none;

            border-radius: 10px;

            background:
                linear-gradient(
                    135deg,
                    #0284c7,
                    #2563eb
                );

            color: white;

            font-size: 15px;

            font-weight: 700;

            cursor: pointer;

            transition:
                transform 0.15s,
                box-shadow 0.15s;
        }

        .calculate-button:hover {

            transform: translateY(-1px);

            box-shadow:
                0 10px 25px rgba(37, 99, 235, 0.25);
        }

        .calculate-button:active {

            transform: translateY(0);
        }


        /* RESULT */

        .result {

            margin-top: 16px;

            padding: 14px 16px;

            border-radius: 10px;

            background:
                rgba(22, 101, 52, 0.18);

            border: 1px solid
                rgba(74, 222, 128, 0.2);

            color: #86efac;

            text-align: center;

            font-size: 18px;

            font-weight: 700;
        }

        .error {

            margin-top: 16px;

            padding: 14px 16px;

            border-radius: 10px;

            background:
                rgba(127, 29, 29, 0.2);

            border: 1px solid
                rgba(248, 113, 113, 0.2);

            color: #fca5a5;

            text-align: center;

            font-size: 14px;

            font-weight: 600;
        }


        /* DEVOPS PANEL */

        .devops-card {

            background:
                rgba(15, 23, 42, 0.88);

            border: 1px solid #1e293b;

            border-radius: 20px;

            padding: 28px;

            box-shadow:
                0 25px 60px rgba(0, 0, 0, 0.35);

            backdrop-filter: blur(10px);
        }

        .devops-card h2 {

            margin: 0;

            font-size: 21px;

            color: #f8fafc;
        }

        .devops-card > p {

            margin: 8px 0 25px;

            color: #64748b;

            font-size: 14px;
        }

        .pipeline {

            display: flex;

            flex-direction: column;

            gap: 14px;
        }

        .pipeline-item {

            display: flex;

            align-items: center;

            gap: 13px;

            padding: 13px;

            border-radius: 10px;

            background: #0b1220;

            border: 1px solid #1e293b;
        }

        .pipeline-icon {

            width: 36px;

            height: 36px;

            flex-shrink: 0;

            display: flex;

            align-items: center;

            justify-content: center;

            border-radius: 9px;

            background: #1e293b;

            color: #38bdf8;

            font-size: 12px;

            font-weight: 800;
        }

        .pipeline-info {

            flex: 1;
        }

        .pipeline-info strong {

            display: block;

            color: #e2e8f0;

            font-size: 14px;

        }

        .pipeline-info span {

            display: block;

            margin-top: 3px;

            color: #64748b;

            font-size: 12px;

        }

        .pipeline-check {

            color: #4ade80;

            font-size: 16px;

            font-weight: bold;
        }


        /* TECHNOLOGY TAGS */

        .technologies {

            display: flex;

            flex-wrap: wrap;

            gap: 8px;

            margin-top: 24px;

            padding-top: 20px;

            border-top: 1px solid #1e293b;
        }

        .tag {

            padding: 6px 10px;

            border-radius: 6px;

            background: #0f172a;

            border: 1px solid #334155;

            color: #94a3b8;

            font-size: 11px;

            font-weight: 600;
        }


        /* FOOTER */

        .footer {

            margin-top: 24px;

            padding: 18px 4px;

            color: #475569;

            font-size: 12px;

            text-align: center;
        }


        /* RESPONSIVE */

        @media (max-width: 800px) {

            .main-grid {

                grid-template-columns: 1fr;
            }

        }

        @media (max-width: 520px) {

            body {

                padding: 20px 12px;
            }

            .header {

                align-items: flex-start;

                flex-direction: column;
            }

            .calculator-card,
            .devops-card {

                padding: 20px;
            }

            .input-row {

                grid-template-columns: 1fr;
            }

            .display-result {

                font-size: 30px;
            }

        }

    </style>

</head>


<body>

<div class="page">


    <!-- HEADER -->

    <header class="header">

        <div class="brand">

            <div class="brand-icon">
                +
            </div>

            <div>

                <h1>
                    DevOps Calculator v1
                </h1>

                <p>
                    Java Web Application
                </p>

            </div>

        </div>


        <div class="status">

            <span class="status-dot"></span>

            Application Running

        </div>

    </header>


    <!-- MAIN -->

    <main class="main-grid">


        <!-- CALCULATOR -->

        <section class="calculator-card">

            <div class="calculator-header">

                <h2>
                    Calculator
                </h2>

                <p>
                    Perform basic arithmetic operations
                </p>

            </div>


            <div class="display">

                <div class="expression">

                    Java Calculator Engine

                </div>

                <div class="display-result">

                    <%
                        if (!result.isEmpty()) {
                    %>

                        <%= result %>

                    <%
                        } else {
                    %>

                        0

                    <%
                        }
                    %>

                </div>

            </div>


            <form
                class="calculator-form"
                method="post">


                <div class="input-row">


                    <div class="field">

                        <label>
                            First Number
                        </label>

                        <input
                            type="number"
                            step="any"
                            name="number1"
                            placeholder="0"
                            required>

                    </div>


                    <div class="field">

                        <label>
                            Second Number
                        </label>

                        <input
                            type="number"
                            step="any"
                            name="number2"
                            placeholder="0"
                            required>

                    </div>


                </div>


                <div class="field">

                    <label>
                        Operation
                    </label>

                    <select
                        name="operation"
                        required>

                        <option value="add">
                            Addition (+)
                        </option>

                        <option value="subtract">
                            Subtraction (−)
                        </option>

                        <option value="multiply">
                            Multiplication (×)
                        </option>

                        <option value="divide">
                            Division (÷)
                        </option>

                    </select>

                </div>


                <button
                    class="calculate-button"
                    type="submit">

                    Calculate Result

                </button>


            </form>


            <%
                if (!result.isEmpty()) {
            %>

                <div class="result">

                    Result: <%= result %>

                </div>

            <%
                }
            %>


            <%
                if (!error.isEmpty()) {
            %>

                <div class="error">

                    <%= error %>

                </div>

            <%
                }
            %>


        </section>


        <!-- DEVOPS INFORMATION -->

        <aside class="devops-card">

            <h2>
                Deployment Pipeline
            </h2>

            <p>
                Application technology stack
            </p>


            <div class="pipeline">


                <div class="pipeline-item">

                    <div class="pipeline-icon">
                        JAVA
                    </div>

                    <div class="pipeline-info">

                        <strong>
                            Java
                        </strong>

                        <span>
                            Application Logic
                        </span>

                    </div>

                    <div class="pipeline-check">
                        ✓
                    </div>

                </div>


                <div class="pipeline-item">

                    <div class="pipeline-icon">
                        MVN
                    </div>

                    <div class="pipeline-info">

                        <strong>
                            Maven
                        </strong>

                        <span>
                            Build & Package
                        </span>

                    </div>

                    <div class="pipeline-check">
                        ✓
                    </div>

                </div>


                <div class="pipeline-item">

                    <div class="pipeline-icon">
                        J5
                    </div>

                    <div class="pipeline-info">

                        <strong>
                            JUnit 5
                        </strong>

                        <span>
                            Unit Testing
                        </span>

                    </div>

                    <div class="pipeline-check">
                        ✓
                    </div>

                </div>


                <div class="pipeline-item">

                    <div class="pipeline-icon">
                        DOC
                    </div>

                    <div class="pipeline-info">

                        <strong>
                            Docker
                        </strong>

                        <span>
                            Containerization
                        </span>

                    </div>

                    <div class="pipeline-check">
                        ✓
                    </div>

                </div>


                <div class="pipeline-item">

                    <div class="pipeline-icon">
                        ECR
                    </div>

                    <div class="pipeline-info">

                        <strong>
                            AWS ECR
                        </strong>

                        <span>
                            Container Registry
                        </span>

                    </div>

                    <div class="pipeline-check">
                        ✓
                    </div>

                </div>


                <div class="pipeline-item">

                    <div class="pipeline-icon">
                        K8S
                    </div>

                    <div class="pipeline-info">

                        <strong>
                            Kubernetes
                        </strong>

                        <span>
                            Container Orchestration
                        </span>

                    </div>

                    <div class="pipeline-check">
                        ✓
                    </div>

                </div>


            </div>


            <div class="technologies">

                <span class="tag">Java 8</span>

                <span class="tag">JSP</span>

                <span class="tag">JUnit 5</span>

                <span class="tag">Maven</span>

                <span class="tag">Tomcat</span>

                <span class="tag">Docker</span>

                <span class="tag">Jenkins</span>

                <span class="tag">AWS</span>

                <span class="tag">Kubernetes</span>

            </div>


        </aside>


    </main>


    <footer class="footer">

        Java DevOps Demonstration •
        CI/CD •
        Containerization •
        Kubernetes

    </footer>


</div>

</body>

</html>