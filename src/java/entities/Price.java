/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import javax.annotation.Generated;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Khanh
 */
@Entity
@Table(name = "Price")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Price.findAll", query = "SELECT p FROM Price p")
    , @NamedQuery(name = "Price.findById", query = "SELECT p FROM Price p WHERE p.id = :id")
    , @NamedQuery(name = "Price.findByOrigin", query = "SELECT p FROM Price p WHERE p.origin = :origin")
    , @NamedQuery(name = "Price.findByDestination", query = "SELECT p FROM Price p WHERE p.destination = :destination")
    , @NamedQuery(name = "Price.findByType", query = "SELECT p FROM Price p WHERE p.type = :type")
    , @NamedQuery(name = "Price.findByDistance", query = "SELECT p FROM Price p WHERE p.distance = :distance")
    , @NamedQuery(name = "Price.findByDuration", query = "SELECT p FROM Price p WHERE p.duration = :duration")
    , @NamedQuery(name = "Price.findBySchedule", query = "SELECT p FROM Price p WHERE p.schedule = :schedule")
    , @NamedQuery(name = "Price.findByPrice", query = "SELECT p FROM Price p WHERE p.price = :price")
    , @NamedQuery(name = "Price.findByTime", query = "SELECT p FROM Price p WHERE p.time = :time")})
public class Price implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "Origin")
    private String origin;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "Destination")
    private String destination;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "Type")
    private String type;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Distance")
    private double distance;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "Duration")
    private String duration;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Schedule")
    private int schedule;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Price")
    private int price;
    @Size(max = 10)
    @Column(name = "Time")
    private String time;

    public Price() {
    }

    public Price(Integer id) {
        this.id = id;
    }

    public Price(Integer id, String origin, String destination, String type, double distance, String duration, int schedule, int price) {
        this.id = id;
        this.origin = origin;
        this.destination = destination;
        this.type = type;
        this.distance = distance;
        this.duration = duration;
        this.schedule = schedule;
        this.price = price;
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getDistance() {
        return distance;
    }

    public void setDistance(double distance) {
        this.distance = distance;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public int getSchedule() {
        return schedule;
    }

    public void setSchedule(int schedule) {
        this.schedule = schedule;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
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
        if (!(object instanceof Price)) {
            return false;
        }
        Price other = (Price) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Price[ id=" + id + " ]";
    }
    
}
