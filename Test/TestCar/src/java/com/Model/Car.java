/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Model;

import javax.servlet.http.Part;

/**
 *
 * @author fauzanzairimi
 */
public class Car implements java.io.Serializable {

    public int carid;
    public String cartype;
    public String carname;
    public int carprice;
    private Part carimage;

    public Car() {
    }

    public Car(int carid, String cartype, String carname, int carprice) {
        this.carid = carid;
        this.cartype = cartype;
        this.carname = carname;
        this.carprice = carprice;
    }

    public Car(int carid, String carname, int carprice) {
        this.carid = carid;
        this.carname = carname;
        this.carprice = carprice;
    }

    public int getCarid() {
        return carid;
    }

    public void setCarid(int carid) {
        this.carid = carid;
    }

    public String getCartype() {
        return cartype;
    }

    public void setCartype(String cartype) {
        this.cartype = cartype;
    }

    public String getCarname() {
        return carname;
    }

    public void setCarname(String carname) {
        this.carname = carname;
    }

    public int getCarprice() {
        return carprice;
    }

    public void setCarprice(int carprice) {
        this.carprice = carprice;
    }

    public Part getCarimage() {
        return carimage;
    }

    public void setCarimage(Part carimage) {
        this.carimage = carimage;
    }

}
