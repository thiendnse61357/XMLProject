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
                <div class="language">
                    <div>Language: </div>
                    <a href="#"><img src="images/en.gif" alt="EN"></a>
                    <a href="#"><img src="images/de.gif" alt="DN"></a>
                    <!--<input class="view_cart" type="image" src="images/Cart1.png" alt="view cart" onclick="window.open('viewcart.html', null, null)"/><br/>-->
                    <a class="view_cart" href="viewcart.html" ><image src="images/Cart1.png" alt="view cart"/></a>

                </div>
                <div class="search">
                    <div class="search_text">
                        <a href="#">Advance Search</a>
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
                <!-- Menu tab -->
                <div id="menu_tab">
                    <!-- Vien boder cong -->
                    <!--<div class="left_menu_corner"></div>-->
                    <ul class="menu">
                        <li><a href="index.jsp" id="nav_home">Home</a></li>
                        <li><a href="#" id="nav_pro">Products</a></li>
                        <li><a href="#" id="nav_spec">Specials</a></li>
                        <li><a href="#" id="nav_acc">My account</a></li>
                        <li><a href="#" id="nav_sign">Sign up</a></li>
                        <li><a href="#" id="nav_ship">Shipping</a></li>
                        <li><a href="#" id="nav_cont">Contacs Us</a></li>
                        <li class="currencies">Currencies
                            <select>
                                <option>US Dollar</option>
                                <option>Euro</option>
                            </select>
                        </li>
                    </ul>
                    <!--<div class="right_menu_corner"></div>-->
                </div>

                <!-- Navigation -->
                <div class="navigation">
                    Navigation: <span class="current">Home</span>
                </div>

                <div style="clear:both"></div>
                <!-- ========= BLEND Java Script ========= -->
                <div class="blend_js">
                    <div class="book_new">
                        <div class="activity">
                            <h1 class="item-header">New Book</h1>
                            <div class="activity-list-update">
                                <img src="" alt="Image">
                                <p id="details"><strong title="">Title:</strong><br /><a href="">View Detail</a></p>
                                <!--<div class="clear"></div>-->
                            </div>
                            <div class="activity-list-update">
                                <img src="" alt="Image">
                                <p id="details"><strong title="">Title:</strong><br /><a href="">View Detail</a></p>
                                <!--<div class="clear"></div>-->
                            </div>
                            <div class="activity-list-update">
                                <img  src="" alt="Image">
                                <p id="details"><strong title="">Title:</strong><br /><a href="">View Detail</a></p>
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
                        <li class="odd"><a href="#">Processors</a></li>
                        <li class="even"><a href="#">Motherboards</a></li>
                        <li class="odd"><a href="#">Desktops</a></li>
                        <li class="even"><a href="#">Laptops</a></li>
                        <li class="odd"><a href="#">Processors</a></li>
                        <li class="even"><a href="#">Motherboards</a></li>
                        <li class="odd"><a href="#">Desktops</a></li>
                        <li class="even"><a href="#">Laptops</a></li>
                        <li class="odd"><a href="#">Processors</a></li>
                        <li class="even"><a href="#">Motherboards</a></li>
                        <li class="odd"><a href="#">Desktops</a></li>
                        <li class="even"><a href="#">Laptops</a></li>
                    </ul>

                    <!-- Special Product -->
                    <div class="title_box">Special Product</div>
                    <!-- tat ca thong tin san pham trong 1 khung -->
                    <div class="border_box">
                        <div class="product_title"><a href="#">Motorola 156 MK-VL</a></div>
                        <div class="product_image"><a href="#"><img src="images/laptop.png" alt="Laptop"></a></div>
                        <div class="product_price">
                            <span class="reduce">350$</span>
                            <span class="price">270$</span>
                        </div>
                    </div>

                    <!-- Newsletter -->
                    <div class="title_box">Newsletter</div>
                    <div class="border_box">
                        <input type="text" name="newsletter" class="newsletter_input" value="your email"/>
                        <a href="#" class="join">join</a>
                    </div>

                    <!-- BANER QUANG CAO -->
                    <div class="banner_adds">
                        <a href="#"><img src="images/bann2.jpg" alt="Banner"></a>
                    </div>
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
                    <div class="title_box">What's new?</div>
                    <div class="border_box">
                        <div class="product_title"><a href="#">Motorola 156 MK-VL</a></div>
                        <div class="product_image"><a href="#"><img src="images/p2.gif" alt="Laptop"></a></div>
                        <div class="product_title">
                            <span class="reduce">350$</span>
                            <span class="price">270$</span>
                        </div>
                    </div>

                    <!-- Manufacture -->
                    <div class="title_box">Manufacture</div>
                    <ul class="left_menu">
                        <li class="odd"><a href="#">Sony</a></li>
                        <li class="even"><a href="#">Dell</a></li>
                        <li class="odd"><a href="#">Apple</a></li>
                        <li class="even"><a href="#">Asus</a></li>
                        <li class="odd"><a href="#">LG</a></li>
                        <li class="even"><a href="#">Fujitsu</a></li>
                        <li class="odd"><a href="#">Blackbery</a></li>
                        <li class="odd"><a href="#">Motorola</a></li>
                    </ul>
                    <!-- BANER QUANG CAO -->
                    <div class="banner_adds">
                        <a href="#"><img src="images/bann1.jpg" alt="Banner"></a>
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
                    Company Meo Meo. Coppyright @Strawberry 2015.<br/>
                    <a href="#"><img src="images/csscreme.jpg" alt="Images"></a>
                    <a href="#"><img src="images/payment.gif" alt="Payment"></a>
                </div>
                <div class="right_footer">
                    <a href="#">Home</a>
                    <a href="#">About</a>
                    <a href="#">Sitemap</a>
                    <a href="#">Address</a>
                    <a href="#">Contact</a>
                </div>
            </div>
            <!--FOOTER: END-->
        </div>

    </body>
</html>
