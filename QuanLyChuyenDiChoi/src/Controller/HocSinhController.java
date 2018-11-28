/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.*;
import com.jfoenix.controls.JFXComboBox;
import com.jfoenix.controls.JFXDatePicker;
import com.jfoenix.controls.JFXTextField;
import java.net.URL;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.TableColumn;

/**
 *
 * @author MyPC
 */
public class HocSinhController implements Initializable{

    @FXML
    private JFXTextField tfMaHocSinh;
    @FXML
    private JFXTextField tfTenHS;
    @FXML
    private JFXTextField tfDiaChi;
    @FXML
    private JFXTextField tfTenCha;
    @FXML
    private JFXTextField tfTenMe;
    @FXML
    private JFXTextField tfTenNguoiGiamHo;
    @FXML
    private JFXTextField tfSDT;
    @FXML
    private JFXDatePicker dpNgaySinh;
    @FXML
    private TableColumn<Student, Integer> colMaHS;
    @FXML
    private TableColumn<Student, String> colTen;
    @FXML
    private TableColumn<Student, Date> colNgaySinh;
    @FXML
    private TableColumn<Student, String> colDiaChi;
    @FXML
    private TableColumn<Student, String> colTenCha;
    @FXML
    private TableColumn<Student, String> colTenMe;
    @FXML
    private TableColumn<Student, String> colNguoiGiamHo;
    @FXML
    private TableColumn<Student, String> colSDT;
    @FXML
    private JFXComboBox<ClassStudent> cmbLopHoc;
    @FXML
    private JFXComboBox<Scholastic> cmbNamHoc;

    private ObservableList<ClassStudent> listClassStudents = FXCollections.observableArrayList();
    private ObservableList<Scholastic> listScholastics = FXCollections.observableArrayList();
    private StudentDAO hocsinhDAO;
    private ObservableList<Student> listStudents = FXCollections.observableArrayList();
    @Override
    public void initialize(URL location, ResourceBundle resources) {
        try {
            Loaddata();
            loadcombobox(listClassStudents, listScholastics);
        } catch (SQLException ex) {
            System.out.println("Can't load data in initialize");
        }
        
        
        
    }
    void Loaddata() throws SQLException{
        //load combobox lop hoc, nam hoc, 
        hocsinhDAO = new StudentDAO();
        listClassStudents = hocsinhDAO.getListClass();
        listScholastics = hocsinhDAO.getListScholastics();
    }
    void loadcombobox(ObservableList<ClassStudent> listLopHoc, ObservableList<Scholastic> listNamHoc){
        cmbLopHoc.setItems(listClassStudents);
        cmbNamHoc.setItems(listScholastics);
    }
    
    
}
