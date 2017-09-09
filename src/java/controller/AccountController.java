/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entities.*;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.ejb.EJB;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sessionbeans.*;
import utils.Daos;

/**
 *
 * @author Khanh
 */
@WebServlet(name = "AccountController", urlPatterns = {"/AccountController"})
public class AccountController extends HttpServlet {

    @EJB(name = "gf")
    private GroupsFacade gf;
    @PersistenceContext(unitName = "BookTicketPU")
    private EntityManager em;
    @Resource
    private javax.transaction.UserTransaction utx;

    @EJB(name = "uf")
    private UsersFacade uf;

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
            throws ServletException, IOException, NoSuchAlgorithmException {
        response.setContentType("text/html;charset=UTF-8");
        Groups group = new Groups();
        Users user = new Users();
        HttpSession session;
        String op = request.getParameter("op");
        if (op.equalsIgnoreCase("register")) {
            createUser(request, response, user, group);
        } else if (op.equalsIgnoreCase("login")) {
            String username = request.getParameter("username");
            String password = Daos.hash(request.getParameter("password"));
            try {
                user = getUser(username, password);
                if (user != null) {
                    session = request.getSession();
                    String g = getGroup(username).getGroupname();
                    if (g.equalsIgnoreCase("user")) {
                        session.setAttribute("session", user.getUsername());
                        request.getRequestDispatcher("/UserController").forward(request, response);
                    } else if (g.equalsIgnoreCase("admin")) {
                        session.setAttribute("admin", user.getUsername());
                        request.getRequestDispatcher("/AdminController").forward(request, response);
                    }
                }
            } catch (Exception ex) {
                request.setAttribute("username", request.getParameter("username"));
                request.setAttribute("result", "Tên đăng nhập hoặc mật khẩu không đúng");
                request.getRequestDispatcher("/UserController?page=login").forward(request, response);
            }
        } else if (op.equalsIgnoreCase("logout")) {
            logOut(request);
            request.getRequestDispatcher("/UserController").forward(request, response);
        } else if (op.equalsIgnoreCase("changepassword")) {
            changePassword(request, response, user);
        }else if (op.equalsIgnoreCase("edit")) {
            updateUser(request, user);
            request.getRequestDispatcher("/AdminController?keyword=indexuser").forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
        }
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

    private void createUser(HttpServletRequest request, HttpServletResponse response, Users user, Groups group) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String confirmpassword = request.getParameter("confirmpassword");
        String address = request.getParameter("address");

        request.setAttribute("username", username);
        request.setAttribute("password", password);
        request.setAttribute("email", email);
        request.setAttribute("phone", phone);
        request.setAttribute("confirmpassword", confirmpassword);
        request.setAttribute("address", address);

        try {
            if (!password.equalsIgnoreCase(confirmpassword)) {
                request.setAttribute("result", "mật khẩu không khớp");
                request.getRequestDispatcher("/UserController?page=register").forward(request, response);
            } else if (checkUser(username)) {
                request.setAttribute("rs", "Tài khoản đã tồn tại");
                request.getRequestDispatcher("/UserController?page=register").forward(request, response);
            } else {
                user.setUsername(username);
                user.setEmail(email);
                user.setPhone(phone);
                user.setPassword(Daos.hash(password));
                user.setAddress(address);
                uf.create(user);

                group.setGroupname("user");
                group.setUsername(username);
                gf.create(group);
                request.getRequestDispatcher("/UserController?page=login").forward(request, response);
            }
        } catch (NoSuchAlgorithmException noSuchAlgorithmException) {
            request.setAttribute("rs", "Đăng ký không thành công!");
            request.getRequestDispatcher("/UserController?page=register").forward(request, response);
        }
    }

    private void updateUser(HttpServletRequest request, Users user){
        String id = request.getParameter("id");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        user = uf.find(Integer.parseInt(id));
        user.setEmail(email);
        user.setPhone(phone);
        user.setUsername(username);
        user.setAddress(address);
        uf.edit(user);
    }
    
    private Users getUser(String username, String password) {
        TypedQuery<Users> query = em.createQuery("SELECT u FROM Users u WHERE u.username = :username and u.password = :password ", Users.class);
        return query.setParameter("username", username).setParameter("password", password.trim()).getSingleResult();
    }

    private boolean checkUser(String username) {
        try {
            return username.equalsIgnoreCase(getUserByName(username).getUsername());
        } catch (Exception e) {
            return false;
        }
    }

    private Users getUserByName(String username) {
        TypedQuery<Users> query = em.createQuery("SELECT u FROM Users u WHERE u.username = :username", Users.class);
        return query.setParameter("username", username).getSingleResult();
    }

    private Groups getGroup(String username) {
        TypedQuery<Groups> query = em.createQuery("SELECT g FROM Groups g WHERE g.username = :username", Groups.class);
        return query.setParameter("username", username).getSingleResult();
    }

    private void logOut(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate();
    }

    private void changePassword(HttpServletRequest request, HttpServletResponse response, Users user) throws NoSuchAlgorithmException, ServletException, IOException {
        String id = request.getParameter("id");
        String oldpass = request.getParameter("password");
        String newpass = request.getParameter("newpassword");
        String cofirmpass = request.getParameter("confirmnewpassword");
        user = uf.find(Integer.parseInt(id));
        if (Daos.hash(oldpass).equals(getPasswordById(id).getPassword()) && newpass.equals(cofirmpass)) {
            user.setPassword(Daos.hash(newpass));
            uf.edit(user);
            request.setAttribute("result", "success");
        } else if (!Daos.hash(oldpass).equals(getPasswordById(id).getPassword())) {
            request.setAttribute("result", "Mật khẩu không đúng");
        } else {
            request.setAttribute("password", oldpass);
            request.setAttribute("result", "Mật khẩu không khớp");
        }
        request.getRequestDispatcher("/UserController?page=changepassword").forward(request, response);
    }

    private Users getPasswordById(String id) {
        TypedQuery<Users> query = em.createQuery("SELECT u FROM Users u WHERE u.id = :id", Users.class);
        return query.setParameter("id", Integer.parseInt(id)).getSingleResult();
    }

}
