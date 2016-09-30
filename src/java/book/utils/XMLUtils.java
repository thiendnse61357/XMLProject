/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package book.utils;

import book.DTO.CategoryDTOList;
import book.DTO.ProductDTOList;
import java.io.Serializable;
import java.io.StringWriter;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;

/**
 *
 * @author Loc
 */
public class XMLUtils implements Serializable {

    public static String marshallProductToString(ProductDTOList items) {
        try {
            JAXBContext jaxb = JAXBContext.newInstance(ProductDTOList.class);
            Marshaller mar = jaxb.createMarshaller();
//            mar.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
//            mar.setProperty(Marshaller.JAXB_ENCODING, "UTF-8");

            StringWriter sw = new StringWriter();
            mar.marshal(items, sw);
            return sw.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public static String marshallCategoryToString(CategoryDTOList items) {
        try {
            JAXBContext jaxb = JAXBContext.newInstance(CategoryDTOList.class);
            Marshaller mar = jaxb.createMarshaller();
//            mar.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
//            mar.setProperty(Marshaller.JAXB_ENCODING, "UTF-8");

            StringWriter sw = new StringWriter();
            mar.marshal(items, sw);
            return sw.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    
}
