
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>

<layout:page-container title="LazyRecipes" activePage="myRecipes">
    <div class="container">
            <%--@elvariable id="category" type="at.fhj.ima.lazyrecipes.entity"--%>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item"><a>My Recipes</a></li>
            </ol>
        </nav>
        <h1>My Recipes</h1>

                <!-- CARD RECIPE VIEW -->
                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                    <c:forEach items="${recipe}" var="recipe">
                        <div class="col">
                            <div class="card shadow-sm">
                                <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                                    <title>Placeholder</title>
                                    <rect width="100%" height="100%" fill="#55595c"></rect>
                                    <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                                </svg>
                                <div class="card-body">
                                    <strong class="d-inline-block mb-2 text-success">${recipe.category.name}</strong>
                                    <h5 class="card-title">${recipe.title}</h5>
                                    <h6 class="card-subtitle mb-2 text-muted">${recipe.subtitle}</h6>
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
                                            <a type="button" href="/editRecipe?id=${recipe.id}" class="btn btn-sm btn-outline-secondary">Edit</a>
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