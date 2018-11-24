/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import model.Room;
import model.RoomFacade;

/**
 *
 * @author danen
 */
@WebServlet(name = "SearchAvailableRoom", urlPatterns = {"/SearchAvailableRoom"})
public class SearchAvailableRoom extends HttpServlet {
    
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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession(false);
        int numberOfDays = Integer.parseInt(request.getParameter("numberOfDays"));
        String checkInDate = request.getParameter("checkInDate");
        List<Room> allRoom = roomFacade.findAll();
        List<Room> availableRoom = roomFacade.findAll();
        List<Booking> allBooking = bookingFacade.findAll();
        
        for(int i = 0; i < allBooking.size(); i++){
            if((allBooking.get(i).getBookingDate()).equals(checkInDate)){
                allRoom.remove(allBooking.get(i).getRoom());
            }
        }
        
        availableRoom = allRoom;
        
        try (PrintWriter out = response.getWriter()) {
            request.getSession().setAttribute("checkInDate", checkInDate);
            request.getSession().setAttribute("numberOfDays", numberOfDays);
            request.getSession().setAttribute("allRoom", allRoom);
            request.getSession().setAttribute("availableRoom", availableRoom);
            response.sendRedirect("/EPDA-war/MakeBooking.jsp");
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
