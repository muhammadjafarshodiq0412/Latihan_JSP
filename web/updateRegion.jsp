<%-- 
    Document   : updateRegion
    Created on : 12 Des 19, 11:26:11
    Author     : ASUS
--%>

<%@page import="tools.HibernateUtil"%>
<%@page import="models.Region"%>
<%@page import="daos.GeneralDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body
        <h1>Edit Region</h1>
        <form action="regionServlet?action=update" method="post">
            <table border="0">
                <tbody>
                    <tr>
                        <td>ID</td>
                        <td>:</td>
                        <td>
                            <input type="text" name="idRegion" id="idRegion" value="<%= request.getAttribute("regionId") %>" readonly  />
                        </td>
                    </tr>
                    <tr>
                        <td>Name</td>
                        <td>:</td>
                        <td><input type="text" name="nameRegion" id="nameRegion" value="<%= request.getAttribute("regionName")  %>"required/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td>
                            <input type="submit" name="submit" value="update" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>
