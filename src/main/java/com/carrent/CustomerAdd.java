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
@WebServlet("/customer")
public class CustomerAdd extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		EntityManagerFactory f = Persistence.createEntityManagerFactory("ajit");
		EntityManager em = f.createEntityManager();
		EntityTransaction et = em.getTransaction();
		
		int carid=Integer.parseInt(req.getParameter("carid"));
		String custname=req.getParameter("custname");
		long phno=Long.parseLong(req.getParameter("phno"));
		String fromDate=req.getParameter("fromDate");
		String toDate=req.getParameter("toDate");
		CustomerEntity c=new CustomerEntity(carid,custname,phno,fromDate,toDate);
		
		et.begin();
//        em.persist(c);
		AdminEntity cp=em.find(AdminEntity.class, carid);
		if(cp!=null) {
			cp.setStatus("booked");
		}
		em.merge(cp);
		em.persist(c);
        
        et.commit();
        
        RequestDispatcher requestDispatcher=req.getRequestDispatcher("customerInfo.html");
		requestDispatcher.forward(req, resp);

				
	}

}