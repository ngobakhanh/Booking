package entities;

import entities.Booking;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-01-16T06:36:22")
@StaticMetamodel(Route.class)
public class Route_ { 

    public static volatile ListAttribute<Route, Booking> bookingList;
    public static volatile SingularAttribute<Route, String> name;
    public static volatile SingularAttribute<Route, Integer> id;
    public static volatile SingularAttribute<Route, String> status;

}