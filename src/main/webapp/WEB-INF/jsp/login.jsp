<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>

<layout:page-container title="LazyRecipes" activePage="login">

    <head>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/signUp.css">
    </head>

<div class="container">
    <div class="signup-form">
    <form:form class="form-signin" method="post" action="/login" style="max-width: 330px;padding: 15px;margin: 0 auto;">
        <h2 class="form-signin-heading">Login</h2>
        <div class="mb-3">
            <label for="username" class="sr-only">Username</label>
            <input type="text" id="username" name="username" class="form-control" placeholder="Username" required autofocus>
        </div>
        <div class="mb-3">
            <label for="password" class="sr-only">Password</label>
            <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
        </div>
        <div class="mb-3 form-check">
            <input type='checkbox' name='remember-me'/> Remember me on this computer.
        </div>
        <div class="col text-center p-1">
            <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
        </div>
        <div class="col text-center p-1">
            <div class="text-center">New to LazyRecipes? <a href="/signUp">Sign Up</a></div>
        </div>
    </form:form>
    </div>
</div>

</layout:page-container>
<!--


<!%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>


<!layout:page-container title="LazyRecipes" activePage="login">

    <form>
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Email address</label>
            <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
            <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
        </div>
        <div class="mb-3">
            <label for="exampleInputPassword1" class="form-label">Password</label>
            <input type="password" class="form-control" id="exampleInputPassword1">
        </div>
        <div class="mb-3 form-check">
            <input type="checkbox" class="form-check-input" id="exampleCheck1">
            <label class="form-check-label" for="exampleCheck1">Accept Terms of Use</label>
        </div>
        <button type="submit" class="btn btn-primary">Login</button>
        <a href="/signUp" class="btn btn-secondary">No account? Sign Up</a>
    </form>




<!/layout:page-container>