/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package book.dao;

import book.DTO.ProductDTO;
import book.DTO.ProductDTOList;
import book.utils.DBUtils;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Loc
 */
public class ProductDAO implements Serializable {

    ProductDTOList items;
    ProductDTOList randomItems; 

    public ProductDAO() {
        items = new ProductDTOList();
        randomItems = new ProductDTOList();
    }
    
    
    
    public ProductDTOList getItems() {
        return items;
    }

    public ProductDTOList getRandomItems() {
        return randomItems;
    }

    public void getAllProduct() throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.makeConnection();
            String sql = "SELECT * FROM tblProduct";
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("productId");
                int catId = rs.getInt("categoryId");
                String pName = rs.getString("productName");
                String pImage = rs.getString("productImage");
                String pDescription = rs.getString("productDescription");
                double pPrice = rs.getDouble("productPrice");
                ProductDTO product = new ProductDTO(id, catId, pName, pImage, pDescription, pPrice);
                items.getProduct().add(product);
            }

        } finally {
            if (rs != null) {
                rs.close();
            }

            if (stm != null) {
                stm.close();
            }

            if (con != null) {
                con.close();
            }
        }
    }

    public void getRandomProduct() throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.makeConnection();
            String sql = "SELECT TOP 5 * FROM tblProduct ORDER BY NEWID()";
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("productId");
                int catId = rs.getInt("categoryId");
                String pName = rs.getString("productName");
                String pImage = rs.getString("productImage");
                String pDescription = rs.getString("productDescription");
                double pPrice = rs.getDouble("productPrice");
                ProductDTO randomProduct = new ProductDTO(id, catId, pName, pImage, pDescription, pPrice);
                randomItems.getProduct().add(randomProduct);
            }

        } finally {
            if (rs != null) {
                rs.close();
            }

            if (stm != null) {
                stm.close();
            }

            if (con != null) {
                con.close();
            }
        }
    }
    
//    public static void main(String[] args) {
//        ProductDAO dao = new ProductDAO();
//        try {
//            dao.getRandomProduct();
//            ProductDTOList list = dao.getRandomItems();
//            System.out.println(list);
//        } catch (SQLException ex) {
//            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
}
