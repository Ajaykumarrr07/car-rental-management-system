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
        font-family: "Poppins", sans-serif;
        background: #eef2f3;
        margin: 0;
        padding: 30px;
    }

    h2 {
        text-align: center;
        font-size: 32px;
        margin-bottom: 30px;
        color: #333;
        letter-spacing: 1px;
    }

    .table-container {
        width: 90%;
        margin: auto;
        background: white;
        padding: 25px;
        border-radius: 12px;
        box-shadow: 0 8px 25px rgba(0,0,0,0.1);
        overflow-x: auto;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        font-size: 17px;
    }

    th {
        background: #4caf50;
        color: white;
        padding: 12px;
        text-align: left;
        font-weight: 600;
        letter-spacing: .5px;
    }

    td {
        padding: 12px;
        border-bottom: 1px solid #ddd;
        color: #333;
    }

    tr:hover {
        background: #f5f5f5;
        transition: 0.3s;
    }

    .status-available {
        color: green;
        font-weight: bold;
    }

    .status-booked {
        color: red;
        font-weight: bold;
    }

</style>

</head>
<body>

<h2>Available Cars List</h2>

<div class="table-container">

<table>

    <tr>
        <th>Name</th>
        <th>Model</th>
        <th>Car Number</th>
        <th>Owner</th>
        <th>Status</th>
    </tr>

<%
    List<AdminEntity> carList = (List<AdminEntity>) request.getAttribute("carList");

    if (carList != null && !carList.isEmpty()) {
        for (AdminEntity c : carList) {
%>

    <tr>
        <td><%= c.getName() %></td>
        <td><%= c.getModel() %></td>
        <td><%= c.getCarno() %></td>
        <td><%= c.getOwner() %></td>

        <td class="<%= c.getStatus().equalsIgnoreCase("available") ? "status-available" : "status-booked" %>">
            <%= c.getStatus() %>
        </td>
    </tr>

<%
        }
    } else {
%>

    <tr>
        <td colspan="5" style="text-align:center; padding:15px; font-size:18px; color:#666;">
            No cars available.
        </td>
    </tr>

<%
    }
%>

</table>

</div>

</body>
</html>
