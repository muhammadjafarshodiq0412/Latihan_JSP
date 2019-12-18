<%-- 
    Document   : RegisterView
    Created on : 13 Des 19, 14:02:15
    Author     : ASUS
--%>
<jsp:include page="templates/header.jsp"></jsp:include>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="page-wrapper">
    <div class="page-content--bge5">
        <div class="container">
            <div class="login-wrap">
                <div class="login-content">
                    <div class="login-logo">
                        <a href="#">
                            <img src="assets/images/logoLogin.png" alt="Metrodata">
                        </a>
                    </div>
                    <div class="flash-data" data-flashdata="<%= request.getAttribute("flash")%>"> 
                    <div class="message-data" data-message="<%= request.getAttribute("message")%>"> 
                        <script>
                            const flashdata = $('.flash-data').data('flashdata');
                            const message = $('.message-data').data('message');
                            if (flashdata) {
                                   if (message=="username") {
                                swal({
                                    title: flashdata + ' Register',
                                    text: 'Username has been use by other people',
                                    type: 'warning'
                                    });
                                }else if (message=="password") {
                                swal({
                                    title: flashdata + ' Register',
                                    text: 'Password not same, please retype your password',
                                    type: 'warning'
                                    });  
                                    } 
                                };
                        </script>
                    </div>
                    <div class="login-form">
                        <form action="userAccountServlet?action=insert" method="post">
                            <div class="form-group">
                                <label>Username</label>
                                 <% String name;
                                String cekname = request.getParameter("username");
                                    if (cekname==null) {
                                            name = "";
                                        }else{
                                        name = cekname ;
                                    }
                                 %>
                                 <input class="au-input au-input--full" type="text" id="username" name="username" value="<%= name %>" placeholder="Username">
                            </div>
                            <div class="form-group">
                                <label>Email Address</label>
                                 <% String mail;
                                String cekMail = request.getParameter("email");
                                    if (cekMail==null) {
                                            mail = "";
                                        }else{
                                        mail = cekMail ;
                                    }
                                 %>
                                <input class="au-input au-input--full" type="email" id="email" name="email" value="<%= mail %>" placeholder="Example@gmail.com">
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input class="au-input au-input--full" type="password" id="password" name="password" placeholder="Password">
                            </div>
                            <div class="form-group">
                                <label>Retype Password</label>
                                <input class="au-input au-input--full" type="password" id="password1" name="password1" placeholder="Retype Password">
                            </div>
                            <div class="login-checkbox">
                                <label>
                                    <input type="checkbox" name="aggree">Agree the terms and policy
                                </label>
                            </div>
                            <button class="au-btn au-btn--block au-btn--green m-b-20" type="submit">register</button>
                            <!--                            <div class="social-login-content">
                                                            <div class="social-button">
                                                                <button class="au-btn au-btn--block au-btn--blue m-b-20">register with facebook</button>
                                                                <button class="au-btn au-btn--block au-btn--blue2">register with twitter</button>
                                                            </div>
                                                        </div>-->
                        </form>
                             
                        <div class="register-link">
                            <p>
                                Already have account?
                                <a href="loginView.jsp">Sign In</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<jsp:include page="templates/footer.jsp"></jsp:include>