/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Iterator;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author danen
 */
@Stateless
public class RoomFacade extends AbstractFacade<Room> {

    @PersistenceContext(unitName = "EPDA-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public RoomFacade() {
        super(Room.class);
    }

//    public List<Room> getAllRoom() {
//        List<Room> room = null;
//        Query query = em.createNamedQuery("Room.getAllRoom");
//        List<Room> result = query.getResultList();
//        for (Iterator it = result.listIterator(); it.hasNext();) {
//            room.add((Room) it.next());
//        }
//        return room;
//    }

    public Room search(String roomNo){
        
        Room r = null;
        Query query = em.createNamedQuery("Room.searchByRoomNumber");
        query.setParameter("roomNo", roomNo);
        List<Room> result = query.getResultList();
        for(Iterator it = result.listIterator(); it.hasNext();){
            r = (Room)it.next();
        }
        return r;
    }
}
