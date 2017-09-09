/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import controller.UserController;
import entities.Users;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

/**
 *
 * @author Khanh
 */
public class Daos {
    public static String hash(String value) throws NoSuchAlgorithmException{

        MessageDigest m = MessageDigest.getInstance("SHA-256");
        m.update(value.getBytes(),0,value.length());
        return new BigInteger(1, m.digest()).toString(16);
    }
    
    public static Date formatDate(String date) {
        DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
        Date fdate = null;
        try {
            fdate = df.parse(date);
        } catch (ParseException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return fdate;
    }   
}
