<%@page import="java.util.List"%>
<%@page import="com.carrent.AdminEntity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Cars</title>

<style>

    /* 🌈 Modern Gradient Background */
    body {
        font-family: "Poppins", Arial, sans-serif;
        background: linear-gradient(135deg, #4facfe, #00f2fe);
        padding: 30px;
        margin: 0;
    }

    h2 {
        text-align: center;
        margin-bottom: 40px;
        font-size: 32px;
        font-weight: 700;
        color: white;
        text-shadow: 0 2px 5px rgba(0,0,0,0.4);
    }

    .container {
        display: flex;
        flex-wrap: wrap;
        gap: 25px;
        justify-content: center;
    }

    /* 🪟 Glass Card Look */
    .card {
        width: 260px;
        background: rgba(255, 255, 255, 0.25);
        backdrop-filter: blur(12px);
        border-radius: 18px;
        padding: 20px;
        box-shadow: 0 8px 25px rgba(0,0,0,0.2);
        border: 1px solid rgba(255,255,255,0.3);
        transition: 0.3s ease-in-out;
    }

    .card:hover {
        transform: translateY(-8px);
        box-shadow: 0 12px 35px rgba(0,0,0,0.25);
    }

    .title {
        font-size: 18px;
        font-weight: 600;
        margin-bottom: 10px;
        color: #002642;
    }

    .info {
        margin-bottom: 8px;
        font-size: 16px;
        color: #003049;
        font-weight: 500;
    }

    /* Status Color Based */
    .status {
        font-weight: bold;
        padding: 6px 12px;
        border-radius: 6px;
        display: inline-block;
        background: #e8ffea;
        color: #0d7a22;
        margin-top: 8px;
    }

    /* 🚗 Button styling */
    .btc {
        width: 100%;
        padding: 12px 0;
        margin-top: 15px;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        cursor: pointer;
        background: #ff7b00;
        color: white;
        font-weight: 600;
        transition: 0.3s ease;
        box-shadow: 0 4px 10px rgba(0,0,0,0.25);
    }

    .btc:hover {
        background: #ff9500;
        transform: scale(1.05);
    }

</style>

</head>
<body>

<h2>Car List</h2>

<div class="container">

<%
    List<AdminEntity> carList = (List<AdminEntity>) request.getAttribute("carList2");

    if (carList != null && !carList.isEmpty()) {
        for (AdminEntity c : carList) {
%>
 
    <div class="card">
        <div class="title">Car ID: <%= c.getId() %></div>
        <div class="info">Car Name: <%= c.getName() %></div>
        <div class="info">Model: <%= c.getModel() %></div>
        <div class="info">Car No: <%= c.getCarno() %></div>
        <div class="info">Owner: <%= c.getOwner() %></div>

        <div class="info status">Status: <%= c.getStatus() %></div>

        <a href="completebooking?id=<%= c.getId() %>">
            <button class="btc">Complete Booking</button>
        </a>
    </div>

<%
        }
    } else {
%>

    <p style="text-align:center; font-size:20px; color:white; font-weight:600;">
        No cars available.
    </p>

<%
    }
%>

</div>

</body>
</html>
