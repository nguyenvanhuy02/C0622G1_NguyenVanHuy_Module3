<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 29/9/2022
  Time: 7:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <h2>Simple Calculator</h2>
  <form action="/calculator">
    <fieldset>
      <legend><h3>Calculator</h3></legend>
      <div>
        <label for="first">First operand:</label>
        <input type="text" name="first" placeholder="Số hạng thứ nhất:" id="first" required>
      </div>
      <div>
        <label for="operator">Operator:</label>
        <select id="operator" name="select" >
          <option value="+" name="sum">Cộng</option>
          <option value="-" name="subtraction" selected>Trừ</option>
          <option value="x" name="multiplication">Nhân</option>
          <option value="/" name="division">Chia</option>
        </select>
      </div>
      <div>
        <label for="second">Second operand:</label>
        <input type="text" name="second" placeholder="Số hạng thứ hai:" id="second" required>
      </div>
      <div>
        <input type="submit" value="Calculator">
      </div>
    </fieldset>
  </form>
  <h3>${result}</h3>
  </body>
</html>
