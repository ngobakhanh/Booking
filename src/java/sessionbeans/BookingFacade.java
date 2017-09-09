/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sessionbeans;

import entities.Booking;
import entities.Route;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.*;

/**
 *
 * @author Khanh
 */
@Stateless
public class BookingFacade extends AbstractFacade<Booking> {

    @PersistenceContext(unitName = "BookTicketPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public BookingFacade() {
        super(Booking.class);
    }
    
    public List<Booking> getBookingByDate(Route route, Date date) {
        TypedQuery<Booking> query = em.createQuery(
                "SELECT b FROM Booking b WHERE b.idroute = :route and b.departuredate = :date", Booking.class);
        return query.setParameter("route", route).setParameter("date", date).getResultList();
    }
    
    public List<Booking> getListBooking(Route route, Date date) {
        TypedQuery<Booking> query = em.createQuery(
                "SELECT b FROM Booking b WHERE b.idroute = :route and b.departuredate = :date and (b.status = 'book' or b.status = 'booked')", Booking.class);
        return query.setParameter("route", route).setParameter("date", date).getResultList();
    }
    
    public void updateStatus(int id, String stt){
        Query query = em.createQuery("UPDATE Booking b SET b.status = " + stt+ " WHERE b.id = "+id+"");
        query.executeUpdate();
    }
}
