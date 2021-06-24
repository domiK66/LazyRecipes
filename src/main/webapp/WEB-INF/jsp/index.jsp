<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<layout:page-container title="LazyRecipes" activePage="index">
    <div class="container">

        <div class="owl-carousel owl-theme">
            <div class="item"><a href="${pageContext.request.contextPath}/category/Pasta & Penne"><img src="/img/pasta-pene-carousel.jpg" class="mt-2 mb-2"></a><h4>Pasta & Penne</h4></div>
            <div class="item"><a href="${pageContext.request.contextPath}/category/Vegetarian"><img src="/img/vegetarian-carousel.jpg" class="mt-2 mb-2"></a><h4>Vegetarian</h4></div>
            <div class="item"><a href="${pageContext.request.contextPath}/category/Vegan"><img src="/img/vegan-carousel.jpg" class="mt-2 mb-2"></a><h4>Vegan</h4></div>
            <div class="item"><a href="${pageContext.request.contextPath}/category/Sandwiches"><img src="/img/sandwiches-carousel.jpg" class="mt-2 mb-2"></a><h4>Sandwiches</h4></div>
            <div class="item"><a href="${pageContext.request.contextPath}/category/Bowls"><img src="/img/bowls-carousel.jpg" class="mt-2 mb-2"></a><h4>Bowls</h4></div>
            <div class="item"><a href="${pageContext.request.contextPath}/category/Asian"><img src="/img/asian-carousel.jpg" class="mt-2 mb-2"></a><h4>Asian</h4></div>
            <div class="item"><a href="${pageContext.request.contextPath}/category/Dessert"><img src="/img/dessert-carousel.jpg" class="mt-2 mb-2"></a><h4>Dessert</h4></div>
            <div class="item"><a href="${pageContext.request.contextPath}/category/Salad"><img src="/img/salad-carousel.jpg" class="mt-2 mb-2"></a><h4>Salad</h4></div>
            <div class="item"><a href="${pageContext.request.contextPath}/category/Wraps"><img src="/img/wraps-carousel.jpg" class="mt-2 mb-2"></a><h4>Wraps</h4></div>
            <div class="item"><a href="${pageContext.request.contextPath}/category/Traditional"><img src="/img/traditional-carousel.jpg" class="mt-2 mb-2"></a><h4>Traditional</h4></div>
            <div class="item"><a href="${pageContext.request.contextPath}/category/Antipasti"><img src="/img/antipasti-carousel.jpg" class="mt-2 mb-2"></a><h4>Antipasti</h4></div>
            <div class="item"><a href="${pageContext.request.contextPath}/category/FastFood"><img src="/img/fastfood-carousel.jpg" class="mt-2 mb-2"></a><h4>FastFood</h4></div>
        </div>
        <h2>New recipes:</h2>
        <layout:card> </layout:card>

        <div class="px-4 py-5 my-5 text-center">
            <img src="/img/logo_black.png" width="400">
            <div class="col-lg-6 mx-auto">
                <h1 class="lead mb-4">Lazy Recipes</h1>
                <h2 class="lead mb-4">This website aims to be the place for people, who lack in time and enthusiasm and still want to have nice, cooked meals.</h2>
                <h3 class="lead mb-4">Lazy Recipes is a web application where members can share quick recipes and lazy cooks (i.e. students) can get new ideas for easy-made dishes.</h3>
                <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
                    <a href="/editRecipe"type="button" class="btn btn-primary btn-lg px-4 gap-3"><svg class="bi d-block mx-auto mb-1" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                        <path d="M8 0a1 1 0 0 1 1 1v6h6a1 1 0 1 1 0 2H9v6a1 1 0 1 1-2 0V9H1a1 1 0 0 1 0-2h6V1a1 1 0 0 1 1-1z"></path>
                    </svg>Create Recipe</a>
                    <a href="/aboutUs" type="button" class="btn btn-outline-secondary btn-lg px-4">About Us</a>
                </div>
            </div>
        </div>



    </div>
</layout:page-container>