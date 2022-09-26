<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 26/9/2022
  Time: 1:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="/display" method="post">
    <div>
      Product Description
      <input type="text" name="product_description">
    </div>
    <div>
      List Price
      <input type="text" name="list_price">
    </div>
    <div>
      Discount Percent
      <input type="text"name="discount_percent">
    </div>
    <div>
      <button type="submit">
        Calculate Discount
      </button>
    </div>
  </form>
  </body>
</html>
