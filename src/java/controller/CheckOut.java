/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Booking;
import model.BookingFacade;
import model.Customer;
import model.CustomerFacade;
import model.Staff;

/**
 *
 * @author danen
 */
@WebServlet(name = "CheckOut", urlPatterns = {"/CheckOut"})
public class CheckOut extends HttpServlet {

    @EJB
    private CustomerFacade customerFacade;
    @EJB
    private BookingFacade bookingFacade;

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
        Staff staff = (Staff) session.getAttribute("staff");
        String username = request.getParameter("username");
        List<Booking> allBooking = bookingFacade.findAll();
        List<Booking> customerBookingFound = new ArrayList<Booking>();
        Customer customerForCheckOut = customerFacade.findCustomer(username);
        String tempDate = null;
        int tempNumberOfDays = 0;

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            if (customerForCheckOut != null) {
                for (int i = 0; i < allBooking.size(); i++) {
                    if (allBooking.get(i).getCustomer().equals(customerForCheckOut)) {
                        customerBookingFound.add(allBooking.get(i));
                    }
                }
                if (customerBookingFound.size() == 0) {
                    out.print("<br><br>");
                    out.print("User Not Found");
                    request.getRequestDispatcher("CheckOut.jsp").include(request, response);
                } else {
                    if ((customerBookingFound.get(0).isCheckIn()) == true && (customerBookingFound.get(0).isDeletedFlag()) == true) {
                        tempNumberOfDays = customerBookingFound.size();
                        tempDate = customerBookingFound.get(0).getBookingDate();
                    } else {
                        out.print("User have not checked in");
                        request.getRequestDispatcher("Home.jsp").include(request, response);
                    }

                }
                session.setAttribute("customerBookingFound", customerBookingFound);
                session.setAttribute("customerForCheckOut", customerForCheckOut);
                response.sendRedirect("/EPDA-war/CheckOutProcess.jsp");

            } else {
                out.print("<br><br>");
                out.print("User Not Found");
                request.getRequestDispatcher("Home.jsp").include(request, response);

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
