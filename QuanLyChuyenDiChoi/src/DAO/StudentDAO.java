/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javax.naming.spi.DirStateFactory;

/**
 *
 * @author MyPC
 */
public class StudentDAO {

    private Student createStudent(ResultSet rs) {
        Student hs = new Student();
        try {
            hs.setMaHS(rs.getInt("MaHS"));
            hs.setTenHS(rs.getString("TenHS"));
            hs.setNgaySinh(rs.getDate("NgaySinh"));
            hs.setDiaChi(rs.getString("DiaChi"));
            hs.setTenCha(rs.getString("TenCha"));
            hs.setTenMe(rs.getString("TenMe"));
            hs.setTenNguoiGiamHo(rs.getString("TenNguoiGiamHo"));
            hs.setSDT(rs.getString("SDT"));
            hs.setMaLop(rs.getString("MaLop"));

        } catch (Exception e) {
            e.printStackTrace();
            System.out.print("Can't load HocSinh");
        }
        return hs;
    }

    public ObservableList<Student> getlistStudents(String MaLop) throws SQLException {
        String sql = "SELECT * FROM dbo.HocSinh INNER JOIN dbo.CTLop ON CTLop.MaHS = HocSinh.MaHS WHERE MaLop = '" + MaLop + "'";
        ObservableList<Student> list = FXCollections.observableArrayList();
        try {
            ResultSet rs = DBConnect.dbExcute(sql);
            while (rs.next()) {
                Student hs = createStudent(rs);
                list.add(hs);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.print("Can't load HocSinh");
        }

        return list;
    }

    private ClassStudent createClass(ResultSet rs) {
        ClassStudent c = new ClassStudent();
        try {
            c.setStrMaLop(rs.getString("MaLop"));
            c.setStrTenLop(rs.getString("TenLop"));
            c.setMaNH(rs.getInt("MaNH"));

        } catch (Exception e) {
            e.printStackTrace();
            System.out.print("Can't load HocSinh");
        }
        return c;
    }

    public ObservableList<ClassStudent> getListClass() throws SQLException {
        String sql = "select * from  LopHoc";
        ObservableList<ClassStudent> list = FXCollections.observableArrayList();
        try {
            ResultSet rs = DBConnect.dbExcute(sql);
            while (rs.next()) {
                ClassStudent hs = createClass(rs);
                list.add(hs);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.print("Can't load lop hoc");
        }
        return list;
    }
    private Scholastic createScholastic(ResultSet rs) {
        Scholastic scholastic = new Scholastic();
        try {
            
            scholastic.setMaNH(rs.getInt("MaNH"));
            scholastic.setTenNH(rs.getString("TenNH"));

        } catch (Exception e) {
            e.printStackTrace();
            System.out.print("Can't load Nam hoc");
        }
        return scholastic;
    }

    public ObservableList<Scholastic> getListScholastics() throws SQLException {
        String sql = "select * from  NamHoc";
        ObservableList<Scholastic> list = FXCollections.observableArrayList();
        try {
            ResultSet rs = DBConnect.dbExcute(sql);
            while (rs.next()) {
                Scholastic scholastic = createScholastic(rs);
                list.add(scholastic);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.print("Can't load HocSinh");
        }
        return list;
    }
}
