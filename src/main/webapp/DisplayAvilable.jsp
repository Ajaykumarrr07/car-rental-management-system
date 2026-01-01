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

    body {
        font-family: "Poppins", Arial, sans-serif;
        background: linear-gradient(135deg, #e3f2fd, #fce4ec);
        padding: 30px;
        margin: 0;
    }

    h2 {
        text-align: center;
        font-size: 32px;
        margin-bottom: 30px;
        color: #333;
        font-weight: 600;
    }

    .container {
        display: flex;
        flex-wrap: wrap;
        gap: 25px;
        justify-content: center;
    }

    .card {
        width: 270px;
        background: #ffffff;
        padding: 20px;
        border-radius: 15px;
        box-shadow: 0px 8px 20px rgba(0,0,0,0.15);
        transition: all 0.3s ease-in-out;
        border-top: 5px solid #2196f3;
    }

    .card:hover {
        transform: translateY(-8px);
        box-shadow: 0px 12px 30px rgba(0,0,0,0.25);
    }

    .title {
        font-size: 18px;
        font-weight: bold;
        margin-bottom: 8px;
        color: #1a237e;
    }

    .info {
        font-size: 15px;
        margin-bottom: 6px;
        color: #424242;
    }

    .status {
        font-weight: bold;
        font-size: 16px;
        margin-top: 10px;
        padding: 8px 12px;
        background: #e8f5e9;
        color: #2e7d32;
        border-radius: 6px;
        display: inline-block;
    }

</style>
</head>
<body>

<h2>Available Car List</h2>

<div class="container">

<%
    List<AdminEntity> carList = (List<AdminEntity>) request.getAttribute("carList2");

    if (carList != null && !carList.isEmpty()) {
        for (AdminEntity c : carList) {
%>

    <div class="card">
        <div class="title">Car ID: <%= c.getId() %></div>
        <div class="title">Name: <%= c.getName() %></div>

        <div class="info">Model: <%= c.getModel() %></div>
        <div class="info">Car No: <%= c.getCarno() %></div>
        <div class="info">Owner: <%= c.getOwner() %></div>

        <div class="status">Status: <%= c.getStatus() %></div>
    </div>

<%
        }
    } else {
%>

    <p style="text-align:center; font-size:18px;">No cars available.</p>

<%
    }
%>

</div>

</body>
</html>
