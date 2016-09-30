/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package book.DTO;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

/**
 *
 * @author Loc
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
    "category"
})
@XmlRootElement(name = "categories")
public class CategoryDTOList {
    @XmlElement(required = true)
    private List<CategoryDTO> category;

    public List<CategoryDTO> getCategory() {
        if (category == null) {
            category = new ArrayList<CategoryDTO>();
        }
        return category;
    }
}
