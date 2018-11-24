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
import model.Staff;
import model.StaffFacade;

/**
 *
 * @author danen
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    @EJB
    private StaffFacade staffFacade;
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
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        List<Booking> allBooking = bookingFacade.findAll();
        List<String> roomFullDates = new ArrayList<String>();
        //Not done
        List<String> comparedDates = new ArrayList<String>();

        Staff staff = staffFacade.findStaff(username);
        try (PrintWriter out = response.getWriter()) {
            if (staff != null) {
                if (staff.getPassword().equalsIgnoreCase(password)) {
                    //Make Dates not available in calender
                    String tempDate = " ";
                    String justToMakeItNotNull = "justToMakeItNotNull";
                    boolean tempDeletedFlag = true;
                    comparedDates.add(justToMakeItNotNull);
                    for (int i = 0; i < allBooking.size(); i++) {
                        tempDate = allBooking.get(i).getBookingDate();

                        tempDeletedFlag = allBooking.get(i).isDeletedFlag();
                        boolean status = true;
                        int count = 0;
                        for (int j = 0; j < allBooking.size(); j++) {
                            if ((allBooking.get(j).getBookingDate()).equals(tempDate) && tempDeletedFlag == allBooking.get(i).isDeletedFlag()) {
                                count++;
                            }
                            if (count == 4) {
                                for (int k = 0; k < comparedDates.size(); k++) {
                                    if (comparedDates.get(k).toString().equals(tempDate)) {
                                        status = false;
                                    } else {

                                    }
                                }
                                if (status == true) {
                                    roomFullDates.add(tempDate);
                                    comparedDates.add(tempDate);
                                }
                            }
                        }

                    }

                    session.setAttribute("roomFullDates", roomFullDates);
                    session.setAttribute("staff", staff);
                    response.sendRedirect("/EPDA-war/Home.jsp");
                } else {
                    out.print("Wrong Password!<br><br>");
                    request.getRequestDispatcher("Login.jsp").include(request, response);

                }
            } else {
                out.print("Wrong Username !<br><br>");
                request.getRequestDispatcher("Login.jsp").include(request, response);

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
