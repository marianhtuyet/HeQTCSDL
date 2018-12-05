/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXComboBox;
import java.net.URL;
import java.sql.SQLException;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.beans.property.SimpleBooleanProperty;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.geometry.Pos;
import javafx.scene.control.Alert;
import javafx.scene.control.TableCell;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.CheckBoxTableCell;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.util.Callback;
import model.*;

/**
 * FXML Controller class
 *
 * @author Tung
 */
public class ThamGiaController implements Initializable {

    @FXML
    private JFXComboBox<LopHoc> cmbLop;
    @FXML
    private JFXButton btnLuu;
    @FXML
    private TableView<HocSinhThamGia> tbHocSinh;
    @FXML
    private TableColumn<HocSinhThamGia, Integer> colMaHS;
    @FXML
    private TableColumn<HocSinhThamGia, Boolean> colDaThuPhi;
    @FXML
    private TableView<GiaoVienThamGia> tbGiaoVien;
    @FXML
    private TableColumn<GiaoVienThamGia, Integer> colMaGV;
    @FXML
    private TableColumn<GiaoVienThamGia, String> colTaGV;
    @FXML
    private TableColumn<GiaoVienThamGia, Boolean> colGVThamGia;
    ThamGiaDAO thamGiaDAO;
    StudentDAO HocSinhDAO;

    ObservableList<HocSinhThamGia> listHocSinh = FXCollections.observableArrayList();
    ObservableList<GiaoVienThamGia> listGiaoVien = FXCollections.observableArrayList();
    ObservableList<LopHoc> listLopHoc = FXCollections.observableArrayList();
    @FXML
    private TableColumn<HocSinhThamGia, String> colTenHS;
    @FXML
    private TableColumn<HocSinhThamGia, Boolean> colHSThamGia;
    String MaChuyenDi;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }

    void loadCombobox() throws SQLException {
        HocSinhDAO = new StudentDAO();
        listLopHoc = HocSinhDAO.getListClass();
        cmbLop.setItems(listLopHoc);
    }

    public void initdata(String MaChuyenDi) {
        this.MaChuyenDi = MaChuyenDi;
        try {
            loadCombobox();
        } catch (SQLException ex) {
            Logger.getLogger(ThamGiaController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    void SetCellValueFactory() {
        colMaHS.setCellValueFactory(new PropertyValueFactory<HocSinhThamGia, Integer>("MaHS"));
        colTenHS.setCellValueFactory(new PropertyValueFactory<HocSinhThamGia, String>("TenHS"));
        colDaThuPhi.setCellValueFactory(new PropertyValueFactory<HocSinhThamGia, Boolean>("IsDongTien"));
        colMaGV.setCellValueFactory(new PropertyValueFactory<GiaoVienThamGia, Integer>("MaGV"));
        colTaGV.setCellValueFactory(new PropertyValueFactory<GiaoVienThamGia, String>("TenGV"));
        colGVThamGia.setCellValueFactory(new PropertyValueFactory<GiaoVienThamGia, Boolean>("ThamGia"));
        colHSThamGia.setCellValueFactory(new Callback<TableColumn.CellDataFeatures<HocSinhThamGia, Boolean>, ObservableValue<Boolean>>() {
            @Override
            public ObservableValue<Boolean> call(TableColumn.CellDataFeatures<HocSinhThamGia, Boolean> param) {
                HocSinhThamGia hs = param.getValue();
                SimpleBooleanProperty booleanHSThamGia = new SimpleBooleanProperty(hs.isThamGia());
                booleanHSThamGia.addListener(new ChangeListener<Boolean>() {
                    @Override
                    public void changed(ObservableValue<? extends Boolean> observable, Boolean oldValue, Boolean newValue) {
                        hs.setThamGia(newValue);
                        ChangeHocSinh(hs, listHocSinh);
                    }
                });
                return booleanHSThamGia;
            }
        });
        colDaThuPhi.setCellValueFactory(new Callback<TableColumn.CellDataFeatures<HocSinhThamGia, Boolean>, ObservableValue<Boolean>>() {
            @Override
            public ObservableValue<Boolean> call(TableColumn.CellDataFeatures<HocSinhThamGia, Boolean> param) {
                HocSinhThamGia hs = param.getValue();
                SimpleBooleanProperty booleanThuPhi = new SimpleBooleanProperty(hs.isDaThuPhi());
                booleanThuPhi.addListener(new ChangeListener<Boolean>() {
                    @Override
                    public void changed(ObservableValue<? extends Boolean> observable, Boolean oldValue, Boolean newValue) {
                        hs.setDaThuPhi(newValue);
                        ChangeHocSinh(hs, listHocSinh);
                    }
                });
                return booleanThuPhi;
            }
        });
        colGVThamGia.setCellValueFactory(new Callback<TableColumn.CellDataFeatures<GiaoVienThamGia, Boolean>, ObservableValue<Boolean>>() {
            @Override
            public ObservableValue<Boolean> call(TableColumn.CellDataFeatures<GiaoVienThamGia, Boolean> param) {
                GiaoVienThamGia gv = param.getValue();
                SimpleBooleanProperty booleanGVThamGia = new SimpleBooleanProperty(gv.isThamGia());
                booleanGVThamGia.addListener(new ChangeListener<Boolean>() {
                    @Override
                    public void changed(ObservableValue<? extends Boolean> observable, Boolean oldValue, Boolean newValue) {
                        gv.setThamGia(newValue);
                        ChangeGiaoVien(gv, listGiaoVien);
                    }
                });
                return booleanGVThamGia;
            }
        });
        setCellFactory();
    }

    void setCellFactory() {
        colGVThamGia.setCellFactory(new Callback<TableColumn<GiaoVienThamGia, Boolean>, TableCell<GiaoVienThamGia, Boolean>>() {
            @Override
            public TableCell<GiaoVienThamGia, Boolean> call(TableColumn<GiaoVienThamGia, Boolean> param) {
                CheckBoxTableCell<GiaoVienThamGia, Boolean> cell = new CheckBoxTableCell<GiaoVienThamGia, Boolean>();
                cell.setAlignment(Pos.CENTER);
                return cell;
            }
        });
        colHSThamGia.setCellFactory(new Callback<TableColumn<HocSinhThamGia, Boolean>, TableCell<HocSinhThamGia, Boolean>>() {
            @Override
            public TableCell<HocSinhThamGia, Boolean> call(TableColumn<HocSinhThamGia, Boolean> param) {
                CheckBoxTableCell<HocSinhThamGia, Boolean> cell = new CheckBoxTableCell<HocSinhThamGia, Boolean>();
                cell.setAlignment(Pos.CENTER);
                return cell;
            }
        });
        colDaThuPhi.setCellFactory(new Callback<TableColumn<HocSinhThamGia, Boolean>, TableCell<HocSinhThamGia, Boolean>>() {
            @Override
            public TableCell<HocSinhThamGia, Boolean> call(TableColumn<HocSinhThamGia, Boolean> param) {
                CheckBoxTableCell<HocSinhThamGia, Boolean> cell = new CheckBoxTableCell<HocSinhThamGia, Boolean>();
                cell.setAlignment(Pos.CENTER);
                return cell;
            }
        });

    }

    @FXML
    private void ComboboxSelectValue(ActionEvent event) {
        String MaLop = cmbLop.getValue().getStrMaLop();
        thamGiaDAO = new ThamGiaDAO();
        listHocSinh = thamGiaDAO.getlistHocSinh(MaLop, MaChuyenDi);
        listGiaoVien = thamGiaDAO.getlistGiaoVien(MaLop, MaChuyenDi);
        SetCellValueFactory();
        tbHocSinh.setItems(listHocSinh);
        tbGiaoVien.setItems(listGiaoVien);
        tbHocSinh.setEditable(true);
        tbGiaoVien.setEditable(true);

    }

    void ChangeHocSinh(HocSinhThamGia hstg, ObservableList<HocSinhThamGia> list) {
        for (HocSinhThamGia hs : list) {
            if (hs.getMaHS() == hstg.getMaHS()) {
                hs = hstg;
            }
        }
    }

    void ChangeGiaoVien(GiaoVienThamGia gvtg, ObservableList<GiaoVienThamGia> list) {
        for (GiaoVienThamGia gv : list) {
            if (gv.getMaGV() == gvtg.getMaGV()) {
                gv = gvtg;
            }
        }
    }

    @FXML
    private void btnLuuClick(ActionEvent event) {
        try {
            for (HocSinhThamGia hs : listHocSinh) {
                thamGiaDAO.UpdateHocSinhThamGia(hs);
            }
            for (GiaoVienThamGia gv : listGiaoVien) {
                thamGiaDAO.UpdateGiaoVienThamGia(gv);
            }
            Alert alert = new Alert(Alert.AlertType.INFORMATION);
            alert.setHeaderText("Congratulation!");
            alert.setContentText("Đã lưu thay đổi");
            alert.show();
            String MaLop = cmbLop.getValue().getStrMaLop();
            thamGiaDAO = new ThamGiaDAO();
            listHocSinh = thamGiaDAO.getlistHocSinh(MaLop, MaChuyenDi);
            listGiaoVien = thamGiaDAO.getlistGiaoVien(MaLop, MaChuyenDi);
            SetCellValueFactory();
            tbHocSinh.setItems(listHocSinh);
            tbGiaoVien.setItems(listGiaoVien);
            tbHocSinh.setEditable(true);
            tbGiaoVien.setEditable(true);
        } catch (Exception e) {
            Alert alert = new Alert(Alert.AlertType.INFORMATION);
            alert.setHeaderText("Sorry!");
            alert.setContentText("Không thể lưu thay đổi");
            alert.show();

        }
    }
}
