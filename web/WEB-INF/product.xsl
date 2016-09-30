<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : category.xsl
    Created on : September 29, 2016, 3:31 PM
    Author     : thiendn
    Description:
        Purpose of transformation follows.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>product</title>
               
            </head>
            <body>
                <table id="dataTable">
                    <xsl:apply-templates select="products"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="product">
        <tr>
            <td style="display: none;">
                <xsl:value-of select="id"/>
            </td>
            
            <td style="width: 150px;">
                <img style="">
                    <xsl:attribute name="src">
                        <xsl:value-of select="productImage"/>
                    </xsl:attribute>    
                </img>
            </td>
            <td>
                <div class="tb_product">
                    <!--name + link-->
                    <p class="title" style="">
                        <xsl:element name="a">
                            <xsl:attribute name="href">
                                <xsl:value-of select="productLink"/>
                            </xsl:attribute>
                            <xsl:value-of select="productName"/>
                        </xsl:element>
                        <br/>
                    </p>
                    <p class="p_title">Author:
                        <p class="author">
                            <xsl:value-of select="author"/>
                        </p>
                    </p>
                    <p class="p_title">Type:
                        <p class="cover">
                            <xsl:value-of select="type"/>
                        </p>
                    </p>
                    <p class="p_title">New Price: <p class="price">
                            <xsl:value-of select="price"/>000
                        </p>
                    </p>
                    <p class="p_title">Old Price: 
                        <p class="p_old-price">
                            <xsl:value-of select="oldPrice"/>000
                        </p>
                    </p>
                </div>
            </td>
            <td>
                <!--<input type="button" value="Add to cart">-->
                <input class="add_to_cart" type="image" src="images/add-to-cart.png" alt="Add to cart">
                    <xsl:attribute name="onclick">
                        addToCart('<xsl:value-of select="price"/>000,<xsl:value-of select="productName"/>')
                    </xsl:attribute>
                </input>
            </td>
            <td style="display: none;">
                <xsl:value-of select="categoryId"/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
