<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : category.xsl
    Created on : September 29, 2016, 3:31 PM
    Author     : thiendn
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>category.xsl</title>
            </head>
            <body>
                <ul class="left_menu">
                    <xsl:apply-templates select="categories"/>
                </ul>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="category">
        <l>
            <li class="odd"><a href="#"><xsl:value-of select="categoryName"/></a></li>
        </l>
    </xsl:template>

</xsl:stylesheet>
