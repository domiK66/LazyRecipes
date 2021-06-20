<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>

<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<layout:page-container title="LazyRecipes" activePage="recipeView">
    <head>
        <link href="/css/rating.css" rel="stylesheet" />
        <!-- jQuery 1.8 or later, 33 KB -->


        <!-- Fotorama from CDNJS, 19 KB -->
        <link  href="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet">

    </head>

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
            <div class="col-md-auto">
                <h1>${recipe.title}</h1>

            </div>
            <div class="col-md-6">



            </div>
        </div>
        <div class="row">
            <div class="col-sm-auto">
                <h2>${recipe.subtitle}</h2>
            </div>
        </div>


        <div class="row">
            <div class="col-sm-6">
                <h3>
                    by @${recipe.user.username}
                    <img src="/file/${recipe.user.files[0].id}" alt="mdo" class="rounded-circle" width="32" height="32">
                </h3>
            </div>
            <div class="col-sm-6">
            <c:choose>

                <c:when test="${favourite == true}">
                    <%--@elvariable id="favourite" type="java.lang.Boolean"--%>
                    <form:form method="post" action="/deleteFromFavourites?id=${recipe.id}">
                        <fieldset>
                            <button type="submit" class="btn btn-outline-danger active">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-suit-heart-fill" viewBox="0 0 16 16" style="margin-right: 3px;">
                                    <path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"/>
                                </svg>
                                Remove Favourite
                            </button>
                        </fieldset>
                    </form:form>
                </c:when>
                <c:otherwise>
                    <%--@elvariable id="favourite" type="java.lang.Boolean"--%>
                    <form:form method="post" action="/saveToFavourites?id=${recipe.id}">
                        <fieldset>

                            <button type="submit" class="btn btn-outline-danger" style="color: #c80000 !important">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-suit-heart-fill" viewBox="0 0 16 16" style="margin-right: 3px;">
                                    <path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"/>
                                </svg>
                                Add to Favourites
                            </button>
                        </fieldset>
                    </form:form>
                </c:otherwise>
            </c:choose>
            </div>
        </div>



        <div class="row mt-4">
            <div class="col-md-auto">
                <c:choose>
                    <c:when test="${recipe.files.size() != 0}">
                        <div class="fotorama" data-nav="thumbs">
                    <c:forEach var="i" begin="0" end="${recipe.files.size() - 1}">
                        <img src="/file/${recipe.files[i].id}" width="100%" height="225">
                    </c:forEach>
                         </div>
                    </c:when>
                    <c:otherwise>
                        <img src="https://th.bing.com/th/id/R2246dc72219bef9c17ed4e5678036e0d?rik=BCZbKmDoEVZpDA&riu=http%3a%2f%2fupload.wikimedia.org%2fwikipedia%2fcommons%2ff%2ffc%2fNo_picture_available.png&ehk=NpGv2G6CN9oKTqXri5h4zqIfeJcxyquxs3MxRT3n9ek%3d&risl=&pid=ImgRaw" width="100%" height="225">
                    </c:otherwise>
                </c:choose>

            </div>
            <div class="col-md-6">

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
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">Time: ${recipe.prepTime} min</li>
                    <li class="list-group-item">Portion(s): ${recipe.portions}</li>
                    <li class="list-group-item">Category: ${recipe.category.name}</li>
                    <li class="list-group-item">Average Rating: ${recipe.ratingAVG} Star(s)</li>
                    <li class="list-group-item">Likes: ${recipe.likes}</li>
                </ul>
            </div>

        </div>

        <div class="row mt-4">
            <div class="col-md-6">
                <h3>Ingredients: </h3>
                <p>${recipe.ingredients}</p>
            </div>
            <div class="col-md-6">
                <h3>Steps: </h3>
                <p>${recipe.steps}</p>
            </div>
        </div>


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>


    </div>
</layout:page-container>