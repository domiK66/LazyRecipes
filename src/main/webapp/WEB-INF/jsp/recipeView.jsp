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
            <div class="col-md-4">
                <p>Time: ${recipe.prepTime} min</p>
                <p>Portion(s): ${recipe.portions}</p>
                <p>Category: ${recipe.category.name}</p>
                <p>Average Rating: ${recipe.ratingAVG}</p>
            </div>
            <div class="col-md-4">
                <form:form method="post" id="rating_form" action="rateRecipe?id=${recipe.id}">
                    <fieldset class="rating">
                        <input type="radio" id="star5" name="value" value="5" />
                        <label class="full" for="star5" title="Awesome - 5 stars"></label>
                        <input type="radio" id="star4half" name="value" value="4.5" />
                        <label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
                        <input type="radio" id="star4" name="value" value="4" />
                        <label class="full" for="star4" title="Pretty good - 4 stars"></label>
                        <input type="radio" id="star3half" name="value" value="3.5" />
                        <label class="half" for="star3half" title="Meh - 3.5 stars"></label>
                        <input type="radio" id="star3" name="value" value="3" />
                        <label class="full" for="star3" title="Meh - 3 stars"></label>
                        <input type="radio" id="star2half" name="value" value="2.5" />
                        <label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
                        <input type="radio" id="star2" name="value" value="2" />
                        <label class="full" for="star2" title="Kinda bad - 2 stars"></label>
                        <input type="radio" id="star1half" name="value" value="1.5" />
                        <label class="half" for="star1half" title="Meh - 1.5 stars"></label>
                        <input type="radio" id="star1" name="value" value="1" />
                        <label class="full" for="star1" title="Sucks big time - 1 star"></label>
                        <input type="radio" id="starhalf" name="value" value="0.5" />
                        <label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
                        <button type="submit" class="btn btn-primary" hidden disabled>Submit</button>
                    </fieldset>
                </form:form>
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