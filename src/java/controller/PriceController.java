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
import sessionbeans.PriceFacade;

/**
 *
 * @author Khanh
 */
@WebServlet(name = "PriceController", urlPatterns = {"/PriceController"})
public class PriceController extends HttpServlet {

    @EJB(name = "pf")
    private PriceFacade pf;

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
        String op = request.getParameter("op");
        Price price = new Price();
        if (op != null) {
            if (op.equalsIgnoreCase("create")) {
                createPrice(request, response, price);
            } else if (op.equalsIgnoreCase("edit")) {
                updatePrice(request, response, price);
            } else if (op.equalsIgnoreCase("remove")) {
                removePrice(request, response, price);
            }
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

    private void createPrice(HttpServletRequest request, HttpServletResponse respone, Price price) throws ServletException, IOException {
        String origin = request.getParameter("origin");
        String destination = request.getParameter("destination");
        String type = request.getParameter("type");
        String distance = request.getParameter("distance");
        String duration = request.getParameter("duration");
        String schedule = request.getParameter("schedule");
        String p = request.getParameter("price");
        String time = request.getParameter("time");

        try {
            price.setOrigin(origin);
            price.setDestination(destination);
            price.setType(type);
            price.setDistance(Double.parseDouble(distance));
            price.setDuration(duration);
            price.setSchedule(Integer.parseInt(schedule));
            price.setPrice(Integer.parseInt(p));
            price.setTime(time);

            pf.create(price);
            request.getRequestDispatcher("/AdminController?keyword=price").forward(request, respone);
        } catch (NumberFormatException numberFormatException) {
            request.setAttribute("result", "Create new price unsuccessfully. Please try again!");
            request.getRequestDispatcher("/AdminController?keyword=createprice").forward(request, respone);
        }
    }

    private void updatePrice(HttpServletRequest request, HttpServletResponse respone, Price price) throws ServletException, IOException {
        String id = request.getParameter("id");
        String origin = request.getParameter("origin");
        String destination = request.getParameter("destination");
        String type = request.getParameter("type");
        String distance = request.getParameter("distance");
        String duration = request.getParameter("duration");
        String schedule = request.getParameter("schedule");
        String p = request.getParameter("price");
        String time = request.getParameter("time");

        price = pf.find(Integer.parseInt(id));

            price.setOrigin(origin);
            price.setDestination(destination);
            price.setType(type);
            price.setDistance(Double.parseDouble(distance));
            price.setDuration(duration);
            price.setSchedule(Integer.parseInt(schedule));
            price.setPrice(Integer.parseInt(p));
            price.setTime(time);
            pf.edit(price);
            request.getRequestDispatcher("/AdminController?keyword=price").forward(request, respone);

    }
    
    private void removePrice(HttpServletRequest request, HttpServletResponse respone, Price price) throws ServletException, IOException{
        String id = request.getParameter("id");
        price = pf.find(Integer.parseInt(id));
        pf.remove(price);
        request.getRequestDispatcher("/AdminController?keyword=price").forward(request, respone);
    }
}
