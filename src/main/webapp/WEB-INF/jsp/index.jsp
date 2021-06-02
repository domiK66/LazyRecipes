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

        <!-- CARD RECIPE VIEW -->
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <c:forEach items="${recipe}" var="recipe">
                <div class="col">
                    <div class="card shadow-sm">

                        <!-- TODO: IMAGE THUMBNAIL-->
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                            <title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#55595c"></rect>
                            <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                        </svg>

                        <div class="card-body">
                            <strong class="d-inline-block mb-2 text-success">${recipe.category.name}</strong>
                            <h5 class="card-title">${recipe.title}</h5>
                            <h6 class="card-subtitle mb-2 text-muted">${recipe.subtitle}</h6>
                            <h6 class="card-subtitle mb-2 text-muted">${recipe.user.username}</h6>
                            <p class="card-text">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-stopwatch" viewBox="0 0 16 16">
                                    <path d="M8.5 5.6a.5.5 0 1 0-1 0v2.9h-3a.5.5 0 0 0 0 1H8a.5.5 0 0 0 .5-.5V5.6z"></path>
                                    <path d="M6.5 1A.5.5 0 0 1 7 .5h2a.5.5 0 0 1 0 1v.57c1.36.196 2.594.78 3.584 1.64a.715.715 0 0 1 .012-.013l.354-.354-.354-.353a.5.5 0 0 1 .707-.708l1.414 1.415a.5.5 0 1 1-.707.707l-.353-.354-.354.354a.512.512 0 0 1-.013.012A7 7 0 1 1 7 2.071V1.5a.5.5 0 0 1-.5-.5zM8 3a6 6 0 1 0 .001 12A6 6 0 0 0 8 3z"></path>
                                </svg>
                                ${recipe.prepTime} Minutes
                            </p>
                            <p class="card-text">Portion(s): ${recipe.portions}</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                   <a type="button" href="/recipeView?id=${recipe.id}" class="btn btn-sm btn-outline-secondary">View</a>
                                </div>
                                <small class="text-muted">${recipe.date}</small>

                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <!-- CARD RECIPE VIEW END-->

    </div>
</layout:page-container>