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
public class StaffFacade extends AbstractFacade<Staff> {

    @PersistenceContext(unitName = "EPDA-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public StaffFacade() {
        super(Staff.class);
    }
    
    public Staff findStaff(String username){
        Staff s = null;
        Query query = em.createNamedQuery("Staff.loginByName");
        query.setParameter("username", username);
        List<Staff> result = query.getResultList();
        for(Iterator it = result.listIterator(); it.hasNext();){
            s = (Staff)it.next();
        }
        return s;
    }
    
}
