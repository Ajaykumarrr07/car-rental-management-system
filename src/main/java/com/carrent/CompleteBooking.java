package com.carrent;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/completebooking")
public class CompleteBooking extends HttpServlet{
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	 int id = Integer.parseInt(req.getParameter("id")); 
	EntityManagerFactory f = Persistence.createEntityManagerFactory("ajit");
	EntityManager em = f.createEntityManager();
	EntityTransaction et = em.getTransaction();

	

	et.begin();
	AdminEntity cp=em.find(AdminEntity.class,id);
	
	if(cp!=null) {
		cp.setStatus("available");
	}
	em.merge(cp);
	
	
	
	et.commit();
	RequestDispatcher requestDispatcher=req.getRequestDispatcher("customerInfo.html");
	requestDispatcher.forward(req,resp);
}
	
}