/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

/**
 *
 * @author MyPC
 */
public class ClassStudent {
    private String strMaLop;
    private String strTenLop;
    private  int MaNH;

    public String getStrMaLop() {
        return strMaLop;
    }

    public String getStrTenLop() {
        return strTenLop;
    }

    public void setStrMaLop(String strMaLop) {
        this.strMaLop = strMaLop;
    }

    public void setStrTenLop(String strTenLop) {
        this.strTenLop = strTenLop;
    }
    public int getNamHoc(){
        return MaNH;
    }
    public void setMaNH(int NH)
    {
        this.MaNH = NH;
    }
    
}
