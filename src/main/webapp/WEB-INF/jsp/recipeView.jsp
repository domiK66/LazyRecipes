<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<layout:page-container title="LazyRecipes" activePage="recipeView">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item"><a>Explore Categories</a></li>
                <!-- TODO: link für kategorien -->
                <li class="breadcrumb-item"><a href="/category/${recipe.category.name}">${recipe.category.name}</a></li>
                <li class="breadcrumb-item active"><a>${recipe.title}</a></li>
            </ol>
        </nav>


        <div class="row">
            <div class="col-sm-4">
                <h1>${recipe.title}</h1>
                <h2>by User A</h2>
                <h2>${recipe.subtitle}</h2>
            </div>
            <div class="col-sm-8">

            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <title>Placeholder</title>
                    <rect width="100%" height="100%" fill="#55595c"></rect>
                    <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                </svg>
            </div>
            <div class="col-md-8">
                <p>Time: ${recipe.prepTime} min</p>
                <p>Portion(s): ${recipe.portions}</p>
                <p>Category: ${recipe.category.name}</p>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <p>Ingredients: ${recipe.ingredients}</p>
            </div>
            <div class="col-md-8">
                <p>Steps: ${recipe.steps}</p>
            </div>
        </div>



    </div>
</layout:page-container>