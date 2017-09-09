/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entities.*;
import java.io.IOException;
import javax.annotation.Resource;
import javax.ejb.EJB;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sessionbeans.*;
import utils.Daos;

/**
 *
 * @author Khanh
 */
@WebServlet(name = "BookController", urlPatterns = {"/BookController"})
public class BookController extends HttpServlet {

    @EJB(name = "sf")
    private SeatFacade sf;

    @EJB(name = "bf")
    private BookingFacade bf;

    @EJB(name = "rf")
    private RouteFacade rf;
    @Resource
    private javax.transaction.UserTransaction utx;

    @EJB(name = "cf")
    private CustomerFacade cf;

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
        Customer cus = new Customer();
        Booking book = new Booking();

        //Lấy ra ngày, tháng, năm, id tuyến đường
        String date = request.getParameter("date");
        String month = request.getParameter("month");
        String year = request.getParameter("year");
        String idroute = request.getParameter("idroute");
        String datenow = date + "-" + month + "-" + year;
        // Lay ra keyword -> thuc hien cac thao tac
        String keyword = request.getParameter("keyword");
        
        if (keyword.equalsIgnoreCase("update")) {
            updateTicket(request, book, cus);
        } else if (keyword.equalsIgnoreCase("confirm")) {
            String id = request.getParameter("id");
            confirmTicket(id, book);
        } else if (keyword.equalsIgnoreCase("remove")) {
            String id = request.getParameter("id");
            removeTicket(id, book);
        }

        request.setAttribute("date", date);
        request.setAttribute("month", month);
        request.setAttribute("year", year);
        request.setAttribute("idroute", idroute);
        request.setAttribute("listbook", bf.getListBooking(rf.find(Integer.parseInt(idroute)), Daos.formatDate(datenow)));
        request.setAttribute("listroute", rf.getListRoute());
        request.getRequestDispatcher("WEB-INF/admin/layout.jsp").forward(request, response);
    }

    private void updateTicket(HttpServletRequest request, Booking book, Customer cus) {
        book = bf.find(Integer.parseInt(request.getParameter("id")));
        cus = cf.find(Integer.parseInt(request.getParameter("idcus")));
        cus.setName(request.getParameter("name"));
        cus.setPhone(request.getParameter("phone"));
        cf.edit(cus);

        Route route = rf.find(Integer.parseInt(request.getParameter("idroute")));
        Seat seat = sf.find(Integer.parseInt(request.getParameter("idseat")));
        book.setIdcustomer(cus);
        book.setIdseat(seat);
        book.setIdroute(route);
        book.setOrigin(request.getParameter("origin"));
        book.setDestination(request.getParameter("destination"));
        book.setStatus(request.getParameter("status"));
        // Luu vao csdl
        bf.edit(book);
    }

    private void confirmTicket(String id, Booking book) {
        book = bf.find(Integer.parseInt(id));
        book.setStatus("booked");
        bf.edit(book);
    }

    private void removeTicket(String id, Booking book) {
        book = bf.find(Integer.parseInt(id));
        book.setStatus("empty");
        bf.edit(book);
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
