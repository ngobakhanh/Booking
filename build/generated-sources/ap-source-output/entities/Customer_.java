package entities;

import entities.Booking;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-01-16T06:36:22")
@StaticMetamodel(Customer.class)
public class Customer_ { 

    public static volatile SingularAttribute<Customer, String> phone;
    public static volatile ListAttribute<Customer, Booking> bookingList;
    public static volatile SingularAttribute<Customer, String> name;
    public static volatile SingularAttribute<Customer, Integer> id;

}