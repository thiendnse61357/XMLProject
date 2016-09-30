/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package book.dao;

import book.DTO.CategoryDTO;
import book.DTO.CategoryDTOList;
import book.utils.DBUtils;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Loc
 */
public class CategoryDAO implements Serializable{
    CategoryDTOList items = new CategoryDTOList();
    
    public CategoryDTOList getItems(){
        return items;
    }
    
    public void getAllCategory() throws SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.makeConnection();
            String sql = "SELECT * FROM tblCategory";
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int catId = rs.getInt("categoryId");
                String catName = rs.getString("categoryName");
                CategoryDTO category = new CategoryDTO(catId, catName);
                items.getCategory().add(category);
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
}
