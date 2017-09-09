/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entities.*;
import java.io.IOException;
import java.util.*;
import javax.ejb.EJB;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sessionbeans.BookingFacade;
import sessionbeans.PriceFacade;
import sessionbeans.RouteFacade;
import sessionbeans.UsersFacade;
import utils.Daos;

/**
 *
 * @author Khanh
 */
@WebServlet(name = "AdminController", urlPatterns = {"/AdminController"})
public class AdminController extends HttpServlet {

    @EJB(name = "pf")
    private PriceFacade pf;

    @EJB(name = "uf")
    private UsersFacade uf;

    @EJB(name = "rf")
    private RouteFacade rf;

    @EJB(name = "bf")
    private BookingFacade bf;

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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String admin = (String) session.getAttribute("admin");

        Booking book = new Booking();
        // Lay ra ngay, thang, nam, idroute hien tai
        String date = request.getParameter("date");
        String month = request.getParameter("month");
        String year = request.getParameter("year");
        String idroute = request.getParameter("idroute");
        String datenow = date + "-" + month + "-" + year;
        Calendar c = Calendar.getInstance();

        if (date == null) {
            idroute = "1";
            datenow = String.valueOf(c.get(Calendar.DATE)) + "-" + String.valueOf(c.get(Calendar.MONTH) + 1) + "-" + String.valueOf(c.get(Calendar.YEAR));
            request.setAttribute("date", c.get(Calendar.DATE));
            request.setAttribute("month", c.get(Calendar.MONTH) + 1);
            request.setAttribute("year", c.get(Calendar.YEAR));
            request.setAttribute("idroute", 1);
        } else {
            request.setAttribute("date", date);
            request.setAttribute("month", month);
            request.setAttribute("year", year);
            request.setAttribute("idroute", idroute);
        }

        // Lay ra keyword -> thuc hien cac thao tac
        String keyword = request.getParameter("keyword");

        if (keyword == null) {
            request.setAttribute("view", "index.jsp");
            request.setAttribute("title", "List Booking");
            //request.setAttribute("total", bf.count());
        } else if (keyword.equalsIgnoreCase("edit")) {
            book = bf.find(Integer.parseInt(request.getParameter("id")));
            request.setAttribute("view", "book/edit.jsp");
            request.setAttribute("title", "Edit Booking");
            request.setAttribute("book", book);
        } else if (keyword.equalsIgnoreCase("route")) {
            request.setAttribute("view", "route/index.jsp");
            request.setAttribute("title", "List Route");
        } else if (keyword.equalsIgnoreCase("profile")) {
            request.setAttribute("view", "profile.jsp");
            request.setAttribute("title", "Profile");
        } else if (keyword.equalsIgnoreCase("createroute")) {
            request.setAttribute("view", "route/create.jsp");
            request.setAttribute("title", "Create Route");
        } else if (keyword.equalsIgnoreCase("editroute")) {
            Route route = rf.find(Integer.parseInt(request.getParameter("id")));
            request.setAttribute("route", route);
            request.setAttribute("view", "route/edit.jsp");
            request.setAttribute("title", "Edit Route");
        } else if (keyword.equalsIgnoreCase("indexuser")) {
            request.setAttribute("listuser", uf.findAll());
            request.setAttribute("view", "user/index.jsp");
            request.setAttribute("title", "List User");
        } else if (keyword.equalsIgnoreCase("updateuser")) {
            Users user = uf.find(Integer.parseInt(request.getParameter("id")));
            request.setAttribute("user", user);
            request.setAttribute("view", "user/edit.jsp");
            request.setAttribute("title", "Edit User");
        } else if (keyword.equalsIgnoreCase("price")) {
            request.setAttribute("listprice", pf.findAll());
            request.setAttribute("view", "price/index.jsp");
            request.setAttribute("title", "List Price");
        } else if (keyword.equalsIgnoreCase("editprice")) {
            Price price = pf.find(Integer.parseInt(request.getParameter("id")));
            request.setAttribute("price", price);
            request.setAttribute("view", "price/edit.jsp");
            request.setAttribute("title", "Edit Price");
        } else if (keyword.equalsIgnoreCase("createprice")) {
            request.setAttribute("view", "price/create.jsp");
            request.setAttribute("title", "Add Price");
        } else if (keyword.equalsIgnoreCase("print")) {
            request.setAttribute("listbook", bf.getListBooking(rf.find(Integer.parseInt(idroute)), Daos.formatDate(datenow)));
            request.getRequestDispatcher("WEB-INF/admin/print.jsp").forward(request, response);
        } 
        try {
            request.setAttribute("listbook", bf.getListBooking(rf.find(Integer.parseInt(idroute)), Daos.formatDate(datenow)));
        } catch (NumberFormatException e) {
        }
        request.setAttribute("admin", admin);
        request.setAttribute("listroute", rf.findAll());
        request.getRequestDispatcher("WEB-INF/admin/layout.jsp").forward(request, response);
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
