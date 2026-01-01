package com.carrent;

import java.io.IOException;
import java.util.List;

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
@WebServlet("/seeallbooking")
public class SeeAllBookings extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		EntityManagerFactory f = Persistence.createEntityManagerFactory("ajit");
		EntityManager em = f.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		String query="select  c from AdminEntity c where c.status='booked'";
		List<AdminEntity> allcars=em.createQuery(query).getResultList();

		
		req.setAttribute("carList2",allcars);
		RequestDispatcher rd=req.getRequestDispatcher("seeAllBooking.jsp");
		rd.forward(req,resp);
		et.commit();
		



	}
}