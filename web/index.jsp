<%-- 
    Document   : index
    Created on : Sep 27, 2016, 2:34:49 PM
    Author     : thiendn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--Css Declare-->
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/header.css">
        <link rel="stylesheet" type="text/css" href="css/menu_tab.css">
        <link rel="stylesheet" type="text/css" href="css/nagivation.css">
        <link rel="stylesheet" type="text/css" href="css/leftcontent.css">
        <link rel="stylesheet" type="text/css" href="css/centercontent.css">
        <link rel="stylesheet" type="text/css" href="css/rightcontent.css">
        <link rel="stylesheet" type="text/css" href="css/footer.css">
        <link rel="stylesheet" type="text/css" href="css/contact.css">
        <link rel="stylesheet" type="text/css" href="css/details.css">
        <link rel="stylesheet" type="text/css" href="css/blendjs.css">
        <link rel="stylesheet" type="text/css" href="css/screen.css">
        <!--Java Script Declare-->
        <script>
            var regObj = '${requestScope.LIST}';
//            alert("regObj: " + regObj);
            var count = 0;
            var cells = [];

            //SLIDER
//            alert('begin');
            window.setInterval(function() { // get source img tag and chang value source.1-2-3jpg
                var blend = document.getElementById("blendImg").getAttribute('src');
                if (blend.indexOf('1', 0) > -1) {
                    document.getElementById("blendImg").src = "img/cat3.jpg";
                } else if (blend.indexOf('2', 0) > -1) {
                    document.getElementById("blendImg").src = "img/cat1.jpg";
                } else if (blend.indexOf('3', 0) > -1) {
                    document.getElementById("blendImg").src = "img/cat2.jpg";
                }
            }, 3000);

            function addToCart(selectedItem) {
                if (typeof (sessionStorage) !==  "undifined") {
                    if (sessionStorage.cart === null) {
                        sessionStorage.cart = '';
                    }

                    sessionStorage.cart = sessionStorage.cart +
                            selectedItem + ";";
//                    alert("sessionStorage.cart: " + sessionStorage.cart);
                    var detail = selectedItem.split(',');
                    alert("Added: " + detail[1] + " - " + "Price: " + detail[0]);
                } else {
                    alert("Browser not support for Add to cart!");
                }
            }

            function searchXPath(strSearch) {

                var products = "<products></products>";
                var xmlDOM = new ActiveXObject("Microsoft.XMLDOM");
                var xmlDOMtmp = new ActiveXObject("Microsoft.XMLDOM");
                var rltDOM = new ActiveXObject("Microsoft.XMLDOM");

                document.getElementById("dataTable").style.display = "none";
                document.getElementById("output").style.display = "block";
//                alert("test");
                xmlDOMtmp.loadXML(products);

                xmlDOM.async = false;
                xmlDOM.loadXML(regObj);
//                alert("xmlDOM.loadXML(regObj): "+xmlDOM.loadXML(regObj));
                var xpathExp = "//product[contains(productName,'" + strSearch + "')]";

                xmlDOM.setProperty("SelectionLanguage", "XPath");//setting for processing FUNCTION Xpath

                var result = xmlDOM.selectNodes(xpathExp);
//                alert('results: ' + result.length);
                var childs = xmlDOMtmp.childNodes;
//                alert('childs: ');
                for (var i = 0; i < result.length; i++) {
//                    alert('1 ');
                    childs[0].appendChild(result.item(i).cloneNode(true));
                }
//                alert('2 ');
                xsltDOM.async = false;
                xsltDOM.load("product.xsl");
//                alert('xsltDOM. XSL : ' + xsltDOM.load("product.xsl"));

                var out = xmlDOMtmp.transformNode(xsltDOM);
//                alert("3");
                document.getElementById('output').innerHTML = out;

                xmlDOMtmp.loadXML(products);
            }

        </script>
    </head>
    <body>
        <div class="main">
            <!--TOP: START-->
            <div class="top">
                <div class="search">
                    <div class="search_text">
                        
                    </div>
                    <form name="myForm">
                        <input type="text" id="seach-box" class="search_input" name="txtSearch"
                               placeholder="Tìm sách, truyện, tác giả, nhà xuất bản..."/>
                        <input type="button" value="Search" class="search_bt" 
                               onclick="searchXPath(myForm.txtSearch.value);"/>
                    </form>
                </div>
            </div>
            <div class="clr"></div>
            <!--TOP: END-->
            <!--CONTENT: START-->
            <div class="content">

                <div style="clear:both"></div>
                <!-- ========= BLEND Java Script ========= -->
                <div class="blend_js">
                    <div class="book_new">
                        <div class="activity">
                            <h1 class="item-header">New Book</h1>
                            <div class="activity-list-update">                                
                                <p id="details"><strong title="">Title:CUON THEO CHIEU GIO CUON CUON ADADASDFASDF</strong><br /><a href="">View Detail</a></p>
                                <img src="" alt="Image">
                                <!--<div class="clear"></div>-->
                            </div>
                            <div class="activity-list-update">
                                <p id="details"><strong title="">Title:CUON THEO CHIEU GIO</strong><br /><a href="">View Detail</a></p>
                                <img src="" alt="Image">
                                <!--<div class="clear"></div>-->
                            </div>
                            <div class="activity-list-update">
                                <p id="details"><strong title="">Title:CUON THEO CHIEU GIO</strong><br /><a href="">View Detail</a></p>
                                <img src="" alt="Image">
                                <!--<div class="clear"></div>-->
                            </div>
                            <a href="#" class="item-footer green">
                                Newest Books
                            </a>
                        </div>

                    </div>
                    <div class="blend_slide">
                        <a href="#">
                            <img id="blendImg" src="img/cat1.jpg"/>
                        </a>
                    </div>
                </div>

                <!-- ========= Left Content ========= -->
                <div class="left_content">
                    <!-- Categories -->
                    <div class="title_box">Categories</div>
                    <ul class="left_menu">
                        <c:set var="listCategory" value="${requestScope.CATLIST}"/>
                        <c:if test="${not empty listCategory}">
                            <c:import var="xslt" url="WEB-INF/category.xsl"/>
                            <x:transform doc="${listCategory}" xslt="${xslt}"/>
                        </c:if>
                        <c:if test="${empty listCategory}">
                            <h2>Don't have data</h2>
                        </c:if>
                    </ul>
                </div>

                <!-- ========= Center Content ========= -->
                <div class="center_content">
                    <div id="main_page">
                        <c:set var="list" value="${requestScope.RANDOMLIST}"/>
                        <c:if test="${not empty list}">
                            <c:import var="xslt" url="WEB-INF/product.xsl"/>
                            <x:transform doc="${list}" xslt="${xslt}"/>
                        </c:if>
                        <c:if test="${empty list}">
                            <h2>Don't have data</h2>
                        </c:if>
                    </div>
                    <div id="output"></div>
                </div>

                <!-- ========= Right Content ========= -->
                <div class="right_content">
                    <!-- What's new? -->
                    <div class="title_box">CART DETAIL</div>
                    <div class="border_box">
                    </div>
                </div>
            </div>
            <!--CONTENT: END-->
            <div class="clr"></div>
            <!--FOOTER: START-->
            <div class="footer">
                <div class="left_footer">
                </div>
                <div class="center_footer">
                    XML Project. Coppyright 2016.<br/>
            </div>
            <!--FOOTER: END-->
        </div>

    </body>
</html>
