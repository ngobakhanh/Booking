/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entities.*;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sessionbeans.RouteFacade;

/**
 *
 * @author Khanh
 */
@WebServlet(name = "RouteController", urlPatterns = {"/RouteController"})
public class RouteController extends HttpServlet {

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
        //response.setContentType("text/html;charset=UTF-8");
        //PrintWriter out = response.getWriter();
        String op = request.getParameter("op");
        if (op != null) {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            Route route = new Route();
            if (op.equalsIgnoreCase("create")) {
                route.setStatus("Enable");
                route.setName(name);
                rf.create(route);
            } else if (op.equalsIgnoreCase("edit")) {
                String stt = request.getParameter("status");
                route.setId(Integer.parseInt(id));
                route.setName(name);
                route.setStatus(stt);
                rf.edit(route);
            } else if (op.equalsIgnoreCase("remove")) {
                route = rf.find(Integer.parseInt(request.getParameter("id")));
                rf.remove(route);
            }
        }
        request.setAttribute("listroute", rf.findAll());
        request.setAttribute("view", "route/index.jsp");
        request.setAttribute("title", "List Route");
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
