<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<layout:page-container title="LazyRecipes" activePage="submitComplete">
    <div class="text-center">
        <i class="icon-box"><span class="glyphicon glyphicon-ok"></span></i>
        <h1> ‎</h1> <! ---------------- empty Line ---------------- -->
        <h1>User has been saved successfully!</h1>
        <a href="/login" class="btn btn-primary btn-lg btn-block">Login</a>
        <a href="/index" class="btn btn-secondary btn-lg btn-block">Return</a>
    </div>

</layout:page-container>