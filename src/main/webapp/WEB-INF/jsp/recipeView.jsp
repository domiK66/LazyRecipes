<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>

<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<layout:page-container title="LazyRecipes" activePage="recipeView">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item"><a>Explore Categories</a></li>
                <li class="breadcrumb-item"><a href="/category/${recipe.category.name}">${recipe.category.name}</a></li>
                <li class="breadcrumb-item active"><a>${recipe.title}</a></li>
            </ol>
        </nav>


        <div class="row">
            <div class="col-sm-4">
                <h1>${recipe.title}</h1>
                <h2>by ${recipe.user.username}</h2>
                <h2>${recipe.subtitle}</h2>
            </div>
            <div class="col-sm-8">

            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <img src="/file/${recipe.files[0].id}" width="100%" height="225">
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
            <div class="col-md-8">
                <p>Average Rating: ${recipe.ratingAVG}</p>
            </div>
        </div>

            <%--@elvariable id="rating" type="at.fhj.ima.lazyrecipes.entity"--%>
        <form:form method="post" action="rateRecipe?id=${recipe.id}">
            <fieldset>
                <!-- -------------- Value ---------------- -->
                <div class="mb-3">
                    <label for="inputValue" class="form-label">value</label>
                    <input name="value"
                                class="form-control"
                                id="inputValue"
                                type="text"
                                />
                </div>

                <button type="submit" class="btn btn-primary">Submit</button>
            </fieldset>
        </form:form>




        <c:choose>

            <c:when test="${favourite == true}">
                <%--@elvariable id="favourite" type="java.lang.Boolean"--%>
                <form:form method="post" action="/deleteFromFavourites?id=${recipe.id}">
                    <fieldset>
                            <button type="submit" class="btn btn-outline-secondary active">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
                                    <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"></path>
                                </svg>
                            </button>
                    </fieldset>
                </form:form>
            </c:when>
            <c:otherwise>
                <%--@elvariable id="favourite" type="java.lang.Boolean"--%>
                <form:form method="post" action="/saveToFavourites?id=${recipe.id}">
                    <fieldset>

                    <button type="submit" class="btn btn-outline-secondary">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
                            <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"></path>
                        </svg>
                    </button>
                    </fieldset>
                </form:form>
            </c:otherwise>
        </c:choose>
    </div>
</layout:page-container>