<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>

<layout:page-container title="LazyRecipes" activePage="login">
    <head>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/signUp.css">
    </head>

    <div class="signup-form">
        <form:form class="form-signin" method="post" action="/login"
                   style="max-width: 330px;padding: 15px;margin: 0 auto;">
            <h2 class="form-signin-heading">Login</h2>
            <div class="mb-3">
                <label for="username" class="sr-only">Username</label>
                <input type="text" id="username" name="username" class="form-control" placeholder="Username" required
                       autofocus>
            </div>
            <div class="mb-3">
                <label for="password" class="sr-only">Password</label>
                <input type="password" id="password" name="password" class="form-control" placeholder="Password"
                       required>
            </div>
            <div class="mb-3 form-check">
                <input type='checkbox' id="remember-me" name='remember-me'/>
                <label for="remember-me">Remember me on this computer.</label>
            </div>
            <div class="col text-center p-1">
                <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
            </div>
            <div class="col text-center p-1">
                New to LazyRecipes?
                <a href="/signUp">Sign Up</a>
            </div>
            </div>
        </form:form>
    </div>

</layout:page-container>