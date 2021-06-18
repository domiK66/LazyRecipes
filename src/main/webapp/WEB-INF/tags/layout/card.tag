<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.css">
</head>

<!-- CARD RECIPE VIEW -->
<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
    <c:forEach items="${recipe}" var="recipe">
        <div class="col">
            <div class="card shadow-sm">
                <!-- TODO: IMAGE THUMBNAIL-->
                <img src="/file/${recipe.files[0].id}" width="100%" height="225" alt="">
                <div class="card-body">
                    <ul class="list-group list-group-flush">
                        <strong align = "center" class="d-inline-block mb-2 text-success list-group-item">${recipe.category.name}</strong>
                        <h5 class="card-title ">${recipe.title}</h5>
                        <h6 class="card-subtitle mb-2 text-muted">${recipe.subtitle}</h6>
                        <h6 class="card-subtitle mb-2 text-muted">${recipe.user.username}</h6>
                    </ul>
                    <ul class="list-group">
                        <div class="row">
                            <p align="left" class="card-text col-md-4">Portion(s): ${recipe.portions}</p>
                            <p align="center" class="card-text col-md-4">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                 class="bi bi-stopwatch" viewBox="0 0 16 16">
                                <path d="M8.5 5.6a.5.5 0 1 0-1 0v2.9h-3a.5.5 0 0 0 0 1H8a.5.5 0 0 0 .5-.5V5.6z"></path>
                                <path d="M6.5 1A.5.5 0 0 1 7 .5h2a.5.5 0 0 1 0 1v.57c1.36.196 2.594.78 3.584 1.64a.715.715 0 0 1 .012-.013l.354-.354-.354-.353a.5.5 0 0 1 .707-.708l1.414 1.415a.5.5 0 1 1-.707.707l-.353-.354-.354.354a.512.512 0 0 1-.013.012A7 7 0 1 1 7 2.071V1.5a.5.5 0 0 1-.5-.5zM8 3a6 6 0 1 0 .001 12A6 6 0 0 0 8 3z"></path>
                            </svg>
                                ${recipe.prepTime} Minutes
                            </p>
                            <p align= "right" class="card-text col-md-4">${recipe.date}</p>
                        </div>
                    </ul>
                    <div class="d-flex justify-content-between align-items-center !important">

                        <small class="text-muted"></small>

                        <div class=".col-4">
                            <c:if test="${recipe.ratingAVG >= 1}">
                                <span class="fa fa-star checked"></span>
                            </c:if>
                            <c:if test="${recipe.ratingAVG >= 2}">
                                <span class="fa fa-star checked"></span>
                            </c:if>
                            <c:if test="${recipe.ratingAVG >= 3}">
                                <span class="fa fa-star checked"></span>
                            </c:if>
                            <c:if test="${recipe.ratingAVG >= 4}">
                                <span class="fa fa-star checked"></span>
                            </c:if>
                            <c:if test="${recipe.ratingAVG >= 5}">
                                <span class="fa fa-star checked"></span>
                            </c:if>
                            <small class="text-muted">${recipe.ratingAVG}</small>
                        </div>

                        <c:if test="${recipe.likes != null}">
                            <small class="text-muted" style="color: #c80000 !important">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-suit-heart-fill" viewBox="0 0 16 16" style="margin-right: 3px;">
                                    <path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"/>
                                </svg>
                                    ${recipe.likes}
                            </small>
                        </c:if>
                    </div>
                </div>
                <a href="/recipeView?id=${recipe.id}">
                    <span class="link-spanner"></span>
                </a>
            </div>
        </div>
    </c:forEach>
</div>
<!-- CARD RECIPE VIEW END-->