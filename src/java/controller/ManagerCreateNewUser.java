/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Customer;
import model.CustomerFacade;
import model.Staff;
import model.StaffFacade;

/**
 *
 * @author danen
 */
@WebServlet(name = "ManagerCreateNewUser", urlPatterns = {"/ManagerCreateNewUser"})
public class ManagerCreateNewUser extends HttpServlet {

    @EJB
    private StaffFacade staffFacade;

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
        HttpSession session = request.getSession(false);
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String department = request.getParameter("department");
        String icOrPassport = request.getParameter("icOrPassport");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        if (staffFacade.findStaff(username) == null) {
            Staff staff = new Staff(username, password, department, icOrPassport, phoneNumber, email, address);
            staffFacade.create(staff);
            try (PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                out.println("Staff registration successful " + username);
                request.getRequestDispatcher("Home.jsp").include(request, response);
            }
        } else {
            try (PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                out.print("Username not available !<br><br>");
                request.getRequestDispatcher("ManagerCreateNewUser.jsp").include(request, response);

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

}
