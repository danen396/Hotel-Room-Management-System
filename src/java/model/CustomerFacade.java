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
public class CustomerFacade extends AbstractFacade<Customer> {

    @PersistenceContext(unitName = "EPDA-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CustomerFacade() {
        super(Customer.class);
    }
    
    public Customer findCustomer(String username){
        Customer customer = null;
        Query query = em.createNamedQuery("Customer.findCustomer");
        query.setParameter("username", username);
        List<Customer> result = query.getResultList();
        for(Iterator it = result.listIterator(); it.hasNext();){
            customer = (Customer)it.next();
        }
        return customer;
    }
}
