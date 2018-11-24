package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Customer;
import model.Room;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-09-25T17:10:12")
@StaticMetamodel(Booking.class)
public class Booking_ { 

    public static volatile SingularAttribute<Booking, Boolean> checkIn;
    public static volatile SingularAttribute<Booking, Boolean> deletedFlag;
    public static volatile SingularAttribute<Booking, String> bookingDate;
    public static volatile SingularAttribute<Booking, Long> id;
    public static volatile SingularAttribute<Booking, Room> room;
    public static volatile SingularAttribute<Booking, Boolean> paymentStatus;
    public static volatile SingularAttribute<Booking, Customer> customer;

}