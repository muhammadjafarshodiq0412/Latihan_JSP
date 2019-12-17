<%-- 
    Document   : loginView
    Created on : 13 Des 19, 9:55:56
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
                        <div class="login-form">
                            <form action="userAccountServlet?action=login" method="post">
                                <div class="form-group">
                                    <label>Username</label>
                                    <input class="au-input au-input--full" type="text" id="username" name="username" placeholder="Username">
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input class="au-input au-input--full" type="password" name="password" placeholder="Password">
                                </div>
                                <div class="login-checkbox">
                                    <label>
                                        <input type="checkbox" name="remember">Remember Me
                                    </label>
                                    <label>
                                        <a href="#">Forgotten Password?</a>
                                    </label>
                                </div>
                                <button class="au-btn au-btn--block au-btn--green m-b-20" type="submit">sign in</button>
                                <div class="social-login-content">
<!--                                    <div class="social-button">
                                        <button class="au-btn au-btn--block au-btn--blue m-b-20">sign in with facebook</button>
                                        <button class="au-btn au-btn--block au-btn--blue2">sign in with twitter</button>
                                    </div>-->
                                </div>
                            </form>
                            <div class="register-link">
                                <p>
                                    Don't you have account?
                                    <a href="registerView.jsp">Sign Up Here</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
<jsp:include page="templates/footer.jsp"></jsp:include>
