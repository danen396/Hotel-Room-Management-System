/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
import model.Room;
import model.RoomFacade;

/**
 *
 * @author danen
 */
@WebServlet(name = "MakeBooking", urlPatterns = {"/MakeBooking"})
public class MakeBooking extends HttpServlet {

    @EJB
    private CustomerFacade customerFacade;
    @EJB
    private RoomFacade roomFacade;
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
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession(false);
        String checkInDateString = (String) session.getAttribute("checkInDate");
        SimpleDateFormat format = new SimpleDateFormat("yyyy-dd-MM");
        Date checkInDate = format.parse(checkInDateString);
        int numberOfDays = (int) session.getAttribute("numberOfDays");
        String customerName = request.getParameter("customerUsername");
        String roomNo = request.getParameter("roomNumber");
        List<Room> allRoom = (List<Room>) session.getAttribute("allRoom");
        List<Booking> allBooking = bookingFacade.findAll();
        Customer customer = customerFacade.findCustomer(customerName);

        //Find Room Object
        Room room = null;
        for (int i = 0; i < allRoom.size(); i++) {
            if (roomNo.equals(allRoom.get(i).getRoomNo())) {
                room = allRoom.get(i);
            }
        }

        try (PrintWriter out = response.getWriter()) {
            //Validate Room Availability For 1 Date
            boolean availability = true;
            String tempErrorDate = null;
            String tempErrorRoomNo = null;
            for (int i = 0; i < numberOfDays; i++) {
                Calendar c = Calendar.getInstance();
                c.setTime(checkInDate);
                c.add(Calendar.DATE, i);
                Date tempDate = c.getTime();
                String tempDateString = format.format(tempDate);
                for (int j = 0; j < allBooking.size(); j++) {
                    if ((allBooking.get(j).getBookingDate()).equals(tempDateString) && ((allBooking.get(j).getRoom().getRoomNo()).equals(roomNo))) {
                        availability = false;
                        tempErrorDate = tempDateString;
                        tempErrorRoomNo = roomNo;
                    }
                }
            }

            if (customer == null) {
                out.println("<h2><font color=\"black\">Customer Not Found</font></h2>");
                request.getRequestDispatcher("MakeBooking.jsp").include(request, response);
            } else if (availability == false) {
                out.println("<h2><font color=\"black\">Booking not available on: " + tempErrorDate + " for Room Number " + tempErrorRoomNo + "</font></h2>");
                request.getRequestDispatcher("SearchAvailableRoom.jsp").include(request, response);
            } else {
                //response.sendRedirect("/EPDA-war/SearchAvailableRoom.jsp");
//            request.getSession().setAttribute("checkInDate", null);
//            request.getSession().setAttribute("numberOfDays", null);
//            request.getSession().setAttribute("allRoom", null);

                for (int i = 0; i < numberOfDays; i++) {
                    Calendar c = Calendar.getInstance();
                    c.setTime(checkInDate);
                    c.add(Calendar.DATE, i);
                    Date tempDate = c.getTime();
                    String tempDateString = format.format(tempDate);
                    Booking booking = new Booking(room, tempDateString, customer, true, false, false);
                    bookingFacade.create(booking);
                    customerFacade.edit(customer);
                    roomFacade.edit(room);
                }
                out.println("Booking Completed");
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
        try {
            processRequest(request, response);

        } catch (ParseException ex) {
            Logger.getLogger(MakeBooking.class
                    .getName()).log(Level.SEVERE, null, ex);
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

        } catch (ParseException ex) {
            Logger.getLogger(MakeBooking.class
                    .getName()).log(Level.SEVERE, null, ex);
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

}
