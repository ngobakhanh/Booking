package entities;

import entities.Customer;
import entities.Route;
import entities.Seat;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-01-16T06:36:22")
@StaticMetamodel(Booking.class)
public class Booking_ { 

    public static volatile SingularAttribute<Booking, Route> idroute;
    public static volatile SingularAttribute<Booking, Seat> idseat;
    public static volatile SingularAttribute<Booking, Customer> idcustomer;
    public static volatile SingularAttribute<Booking, String> origin;
    public static volatile SingularAttribute<Booking, String> destination;
    public static volatile SingularAttribute<Booking, Date> departuredate;
    public static volatile SingularAttribute<Booking, Integer> id;
    public static volatile SingularAttribute<Booking, String> status;

}