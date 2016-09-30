/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package book.DTO;

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
@XmlType(name = "product", propOrder = {
    "productId",
    "categoryId",
    "productName",
    "productImage",
    "productDescription",
    "productPrice"
})
public class ProductDTO {
    @XmlElement(required = true)
    private int productId;
    @XmlElement(required = true)
    private int categoryId;
    @XmlElement(required = true)
    private String productName;
    @XmlElement(required = true)
    private String productImage;
    @XmlElement(required = true)
    private String productDescription;
    @XmlElement(required = true)
    private double productPrice;

    public ProductDTO() {
    }

    public ProductDTO(int productId, int categoryId, String productName, String productImage, String productDescription, double productPrice) {
        this.productId = productId;
        this.categoryId = categoryId;
        this.productName = productName;
        this.productImage = productImage;
        this.productDescription = productDescription;
        this.productPrice = productPrice;
    }

    /**
     * @return the productId
     */
    public int getProductId() {
        return productId;
    }

    /**
     * @param productId the productId to set
     */
    public void setProductId(int productId) {
        this.productId = productId;
    }

    /**
     * @return the categoryId
     */
    public int getCategoryId() {
        return categoryId;
    }

    /**
     * @param categoryId the categoryId to set
     */
    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    /**
     * @return the productName
     */
    public String getProductName() {
        return productName;
    }

    /**
     * @param productName the productName to set
     */
    public void setProductName(String productName) {
        this.productName = productName;
    }

    /**
     * @return the productImage
     */
    public String getProductImage() {
        return productImage;
    }

    /**
     * @param productImage the productImage to set
     */
    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    /**
     * @return the productDescription
     */
    public String getProductDescription() {
        return productDescription;
    }

    /**
     * @param productDescription the productDescription to set
     */
    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    /**
     * @return the productPrice
     */
    public double getProductPrice() {
        return productPrice;
    }

    /**
     * @param productPrice the productPrice to set
     */
    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }
    
    
}
