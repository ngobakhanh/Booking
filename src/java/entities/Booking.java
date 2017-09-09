/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Khanh
 */
@Entity
@Table(name = "Booking")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Booking.findAll", query = "SELECT b FROM Booking b")
    , @NamedQuery(name = "Booking.findById", query = "SELECT b FROM Booking b WHERE b.id = :id")
    , @NamedQuery(name = "Booking.findByOrigin", query = "SELECT b FROM Booking b WHERE b.origin = :origin")
    , @NamedQuery(name = "Booking.findByDestination", query = "SELECT b FROM Booking b WHERE b.destination = :destination")
    , @NamedQuery(name = "Booking.findByDeparturedate", query = "SELECT b FROM Booking b WHERE b.departuredate = :departuredate")
    , @NamedQuery(name = "Booking.findByStatus", query = "SELECT b FROM Booking b WHERE b.status = :status")})
public class Booking implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    @Basic(optional = false)
//    @NotNull
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "Origin")
    private String origin;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "Destination")
    private String destination;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Departure_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date departuredate;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "Status")
    private String status;
//    @Basic(optional = false)
//    @NotNull
//    @Column(name = "Idcustomer")
//    private Integer idcustomer;
//    @Basic(optional = false)
//    @NotNull
//    @Column(name = "Idroute")
//    private Integer idroute;
//    @Basic(optional = false)
//    @NotNull
//    @Column(name = "Idseat")
//    private Integer idseat;
    @JoinColumn(name = "Idcustomer", referencedColumnName = "ID")
    @ManyToOne
    private Customer idcustomer;
    @JoinColumn(name = "Idroute", referencedColumnName = "ID")
    @ManyToOne
    private Route idroute;
    @JoinColumn(name = "Idseat", referencedColumnName = "ID")
    @ManyToOne
    private Seat idseat;

    public Booking() {
    }

    public Booking(Integer id) {
        this.id = id;
    }

    //,Integer idseat,Integer idroute, Integer idcustomer
    
    public Booking(Integer id, String origin, String destination, Date departuredate, String status) {
        this.id = id;
        this.origin = origin;
        this.destination = destination;
        this.departuredate = departuredate;
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public Date getDeparturedate() {
        return departuredate;
    }

    public void setDeparturedate(Date departuredate) {
        this.departuredate = departuredate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Customer getIdcustomer() {
        return idcustomer;
    }

    public void setIdcustomer(Customer idcustomer) {
        this.idcustomer = idcustomer;
    }

    public Route getIdroute() {
        return idroute;
    }

    public void setIdroute(Route idroute) {
        this.idroute = idroute;
    }

    public Seat getIdseat() {
        return idseat;
    }

    public void setIdseat(Seat idseat) {
        this.idseat = idseat;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Booking)) {
            return false;
        }
        Booking other = (Booking) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Booking[ id=" + id + " ]";
    }
    
}
