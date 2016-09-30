/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package book.listener;

import book.DTO.CategoryDTOList;
import book.DTO.ProductDTO;
import book.DTO.ProductDTOList;
import book.dao.CategoryDAO;
import book.dao.ProductDAO;
import book.utils.XMLUtils;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;

/**
 * Web application lifecycle listener.
 *
 * @author Loc
 */
public class RequestListener implements ServletRequestListener {

    @Override
    public void requestDestroyed(ServletRequestEvent sre) {
        System.out.println("Destroyed");
    }

    @Override
    public void requestInitialized(ServletRequestEvent sre) {
//        ProductDAO dao = new ProductDAO();
//        CategoryDAO catDao = new CategoryDAO();
//        
//        ProductDTOList list = dao.getItems();
//        ProductDTOList randomList = dao.getRandomItems();
//        CategoryDTOList catList = catDao.getItems();
//        String productXML = XMLUtils.marshallProductToString(list);
//        String randomProductXML = XMLUtils.marshallProductToString(randomList);
//        String categoryXML = XMLUtils.marshallCategoryToString(catList);
        
        //sre.getServletRequest().setAttribute("LIST", productXML);
        //sre.getServletRequest().setAttribute("RANDOMLIST", randomProductXML);
        //sre.getServletRequest().setAttribute("CATLIST", categoryXML);
        ProductDAO dao = new ProductDAO();
        CategoryDAO catDao = new CategoryDAO();
        try {
            dao.getRandomProduct();
            dao.getAllProduct();
            catDao.getAllCategory();
            
            ProductDTOList list = dao.getRandomItems();
            ProductDTOList allProductList = dao.getItems();
            CategoryDTOList catList = catDao.getItems();
            
            String xmlAllProductList = XMLUtils.marshallProductToString(allProductList);
            String xmlRandomList = XMLUtils.marshallProductToString(list);
            String xmlCatList = XMLUtils.marshallCategoryToString(catList);
            
            sre.getServletRequest().setAttribute("LIST", xmlAllProductList);
            sre.getServletRequest().setAttribute("RANDOMLIST", xmlRandomList);
            sre.getServletRequest().setAttribute("CATLIST", xmlCatList);
       
        } catch (SQLException ex) {
            Logger.getLogger(RequestListener.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
