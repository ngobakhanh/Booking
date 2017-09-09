/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entities.Booking;
import entities.Customer;
import entities.Route;
import entities.Seat;
import java.io.IOException;
import java.io.PrintWriter;
import javax.annotation.Resource;
import javax.ejb.EJB;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sessionbeans.BookingFacade;
import sessionbeans.CustomerFacade;
import sessionbeans.RouteFacade;
import sessionbeans.SeatFacade;
import utils.Daos;

/**
 *
 * @author Khanh
 */
@WebServlet(name = "ProcessorController", urlPatterns = {"/ProcessorController"})
public class ProcessorController extends HttpServlet {

    @EJB(name = "bf")
    private BookingFacade bf;

    @EJB(name = "sf")
    private SeatFacade sf;

    @EJB(name = "cf")
    private CustomerFacade cf;

    @EJB(name = "rf")
    private RouteFacade rf;

    @PersistenceContext(unitName = "BookTicketPU")
    private EntityManager em;
    @Resource
    private javax.transaction.UserTransaction utx;

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
        response.setContentType("text/html;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter out = response.getWriter();
        try {
            utx.begin();
            cus.setName(request.getParameter("name"));
            cus.setPhone(request.getParameter("phone"));
            cf.create(cus);

            Route route = rf.find(Integer.parseInt(request.getParameter("route")));
            Seat seat = sf.find(Integer.parseInt(request.getParameter("seat")));
            book.setIdcustomer(cus);
            book.setIdseat(seat);
            book.setIdroute(route);
            book.setOrigin(request.getParameter("origin"));
            book.setDestination(request.getParameter("destination"));
            book.setDeparturedate(Daos.formatDate(request.getParameter("departuredate")));
            book.setStatus("book");
            // Luu vao csdl
            bf.create(book);
            out.write("success");
            utx.commit();
            
        } catch (Exception e) {
                try {
                e.getStackTrace();
                out.write("fail");
                utx.rollback();
            } catch (Exception ex) {}
        }
        
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
