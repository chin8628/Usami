<%-- 
    Document   : testcookie
    Created on : Apr 13, 2017, 10:20:59 PM
    Author     : Chiib_000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
	<%
            String username, email ,signature;
            
            Cookie[] cookies;
            
            cookies = request.getCookies();
            if(cookies != null){
                out.println("<h2> Found Cookies Name and Value</h2>");
                for(Cookie coki : cookies){
                    out.println("Value : "+ coki.getValue() + "<br>");
                    out.println("EXP : "+ coki.getMaxAge() + "<br><br>");
                }
                
            }
            else{
                out.println("<h2> NOT Found Cookies</h2>");
            }
	%>           
	
	<br><br>
    </body>
</html>
