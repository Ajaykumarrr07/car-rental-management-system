package com.carrent;


import java.io.IOException;
import java.io.PrintWriter;

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
@WebServlet("/admin")
public class Admin extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("this is admin");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		EntityManagerFactory f = Persistence.createEntityManagerFactory("ajit");
		EntityManager em = f.createEntityManager();
		EntityTransaction et = em.getTransaction();
		
		 String name = req.getParameter("name");
	        String model = req.getParameter("model");
	        String owner = req.getParameter("owner");
	        String carno = req.getParameter("carno");

	        AdminEntity ad = new AdminEntity(name, model, owner, carno);

	        et.begin();
	        em.persist(ad);
	        et.commit();
	       
//           PrintWriter p=resp.getWriter();
//           p.print("Successfully added");
	        RequestDispatcher requestDispatcher=req.getRequestDispatcher("Successful.html");
			requestDispatcher.forward(req, resp);
	}

}