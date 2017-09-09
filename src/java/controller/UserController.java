/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entities.*;
import java.io.IOException;
import java.util.*;
import javax.annotation.Resource;
import javax.ejb.EJB;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import sessionbeans.*;
import utils.Daos;

/**
 *
 * @author Khanh
 */
@WebServlet(name = "UserController", urlPatterns = {"/UserController"})
public class UserController extends HttpServlet {

    @EJB(name = "pf")
    private PriceFacade pf;

    @EJB(name = "bf")
    private BookingFacade bf;

    @EJB(name = "sf")
    private SeatFacade sf;
    @PersistenceContext(unitName = "BookTicketPU")
    private EntityManager em;
    @Resource
    private javax.transaction.UserTransaction utx;

    @EJB(name = "rf")
    private RouteFacade rf;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String user = (String) session.getAttribute("session");

        String view = request.getParameter("page");
        if (view == null) {
            request.setAttribute("title", "Home Page");
            request.setAttribute("view", "home.jsp");

        } else if (view.equalsIgnoreCase("find")) {
            String idroute = request.getParameter("idroute");
            String date = request.getParameter("date");
            String month = request.getParameter("month");
            String year = request.getParameter("year");
            Route route = rf.find(Integer.parseInt(idroute));
            List<Booking> list_book = bf.getBookingByDate(route, Daos.formatDate(date + "-" + month + "-" + year));
            List<Seat> list_seatd = sf.getSeatByRange(1, sf.count()/2);
            List<Seat> list_seatt = sf.getSeatByRange(sf.count()/2+1, sf.count());
            
            if(user != null) request.setAttribute("inforuser", getUserByName(user));
            request.setAttribute("title", "Home Page");
            request.setAttribute("view", "seat.jsp");
            request.setAttribute("list_seatd", list_seatd);
            request.setAttribute("list_seatt", list_seatt);
            request.setAttribute("list_book", list_book);
            request.setAttribute("idroute", idroute);
            request.setAttribute("date", date);
            request.setAttribute("month", month);
            request.setAttribute("year", year);
        } else if (view.equalsIgnoreCase("register")) {
            request.setAttribute("title", "Register");
            request.setAttribute("view", "register.jsp");
        } else if (view.equalsIgnoreCase("contact")) {
            request.setAttribute("title", "Contact");
            request.setAttribute("view", "contact.jsp");
        } else if (view.equalsIgnoreCase("login")) {
            request.setAttribute("title", "Login");
            request.setAttribute("view", "login.jsp");
        } else if (view.equalsIgnoreCase("price")) {
            request.setAttribute("title", "Giá vé");
            request.setAttribute("view", "price.jsp");
            request.setAttribute("listprice", pf.findAll());
        } else if (view.equalsIgnoreCase("infouser")) {
            request.setAttribute("title", "Thông tin");
            request.setAttribute("view", "infouser.jsp");
            request.setAttribute("infouser", getUserByName(user));
        }else if (view.equalsIgnoreCase("changepassword")) {
            request.setAttribute("title", "Đổi mật khẩu");
            request.setAttribute("view", "changepassword.jsp");
            request.setAttribute("infouser", getUserByName(user));
        }

        List<Route> list_route = rf.getListRoute();
        request.setAttribute("user", user);
        request.setAttribute("list_route", list_route);
        request.getRequestDispatcher("/user/layout.jsp").forward(request, response);
    }

    public Users getUserByName(String username) {
        TypedQuery<Users> query = em.createQuery("SELECT u FROM Users u WHERE u.username = :username", Users.class);
        return query.setParameter("username", username).getSingleResult();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
