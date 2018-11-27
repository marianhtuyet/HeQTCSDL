/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.User;
import DAO.UserDAO;
import com.jfoenix.controls.JFXButton;
import java.net.URL;
import java.sql.SQLException;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;

/**
 * FXML Controller class
 *
 * @author MyPC
 */
public class MainController implements Initializable {

    @FXML
    private JFXButton btnChuyenDi;
    @FXML
    private JFXButton btnCTyDuLich;
    @FXML
    private JFXButton btnDiaDiem;
    @FXML
    private JFXButton btnNhanSu;

    UserDAO userDAO;
    
    
    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }    

    @FXML
    private void btnChuyenDiClick(ActionEvent event) throws SQLException {
       userDAO = new UserDAO();
       userDAO.getUser();
    }

    @FXML
    private void btnCTyDuLichClick(ActionEvent event) {
    }

    @FXML
    private void btnDiaDiemClick(ActionEvent event) {
    }

    @FXML
    private void btnNhanSuClick(ActionEvent event) {
    }
    
}
