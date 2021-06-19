<%@ tag pageEncoding="UTF-8" %>

<%@ attribute name="title" required="true" %>
<%@ attribute name="activePage" required="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="owlcarousel" tagdir="/WEB-INF/tags/owlcarousel"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>

<!-- HTML HEAD -->
<head>
    <bootstrap:bootstrap-metadata/>
    <title>${title}</title>
    <bootstrap:bootstrap-css/>
    <owlcarousel:owlcarousel-css/>
    <link href="/css/custom.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.9.2/dropzone.css" />
</head>
<!-- HTML HEAD -->


<body>
<!-- NAVBAR STICKY TOP -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
    <div class="container-xl">
        <!-- LOGO -->
        <a class="navbar-brand" href="${pageContext.request.contextPath}/"><img src="/img/logo_white.png" width="120"></a>
        <!-- LOGO -->

        <!-- RESPONSIVE BURGER MENU -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample07XL" aria-controls="navbarsExample07XL">
            <span class="navbar-toggler-icon"></span>
        </button>
        <!-- RESPONSIVE BURGER MENU -->

        <!-- NAV MENU ITEMS -->
        <div class="collapse navbar-collapse" id="navbarsExample07XL">


            <!-- LEFT SIDED ELEMENTS -->
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <!-- HOME LINK -->
                <li class="nav-item"><a class="nav-link" aria-current="page" href="${pageContext.request.contextPath}/">Home</a></li>

                <!-- DROPDOWN MENU CATEGORIES -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="dropdown07XL" data-bs-toggle="dropdown" aria-expanded="false">Explore Categories</a>
                    <ul class="dropdown-menu" data-bs-popper="none" aria-labelledby="dropdown07XL">
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/category/Traditional">Traditional</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/category/Vegetarian">Vegetarian</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/category/Vegan">Vegan</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/category/Antipasti">Antipasti</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/category/Pasta">Pasta</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/category/Sandwiches">Sandwiches</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/category/Wraps">Wraps</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/category/FastFood">Fast Food</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/category/Bowls">Bowls</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/category/Asian">Asian</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/category/Dessert">Dessert</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/category/Salad">Salad</a></li>
                    </ul>
                </li>
                <!-- DROPDOWN MENU CATEGORIES -->
            </ul>
            <!-- LEFT SIDED ELEMENTS -->


            <!-- RIGHT SIDED ELEMENTS -->


            <!-- SEARCH BAR -->
            <form id="searchId" action="${pageContext.request.contextPath}/searchRecipe" class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
                <input name="search" id="inputSearch" type="search" class="form-control form-control-dark" placeholder="Search..." aria-label="Search" value="${param.search}">
            </form>
            <!-- SEARCH BAR -->

            <!-- GUEST USER -->
            <sec:authorize access="!isAuthenticated()">
                <div class="text-end d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                    <a href="${pageContext.request.contextPath}/login" class="btn btn-outline-light me-2">Login</a>
                    <a href="${pageContext.request.contextPath}/signUp" class="btn btn-warning">Register</a>
                </div>
            </sec:authorize>
            <!-- GUEST USER -->

            <!-- LOGGED IN USER -->
            <sec:authorize access="isAuthenticated()">
                <!-- CREATE RECIPE -->
                <ul class="nav col-12 col-lg-auto my-2 justify-content-center my-md-0 text-small">
                    <a href="${pageContext.request.contextPath}/editRecipe" class="nav-link text-white" style="padding-bottom: 0px;padding-top: 0px;">
                        <svg class="bi d-block mx-auto mb-1" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                            <path d="M8 0a1 1 0 0 1 1 1v6h6a1 1 0 1 1 0 2H9v6a1 1 0 1 1-2 0V9H1a1 1 0 0 1 0-2h6V1a1 1 0 0 1 1-1z"></path>
                        </svg>
                        Create Recipe
                    </a>
                </ul>
                <!-- CREATE RECIPE -->
                <!-- USER DROPDOWN -->
                <ul class="nav col-12 col-lg-auto my-2 justify-content-center my-md-0 text-small">
                    <div class="dropdown">
                        <a class="nav-link dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false" style="color:#fff">
                            <!-- TODO: USER PICTURE --> <img src="https://github.com/mdo.png" alt="mdo" class="rounded-circle" width="32" height="32">
                        </a>
                        <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/accountSettings">Signed in as <strong style="font-weight: 600;">${currentUser.username}</strong></a></li>
                            <sec:authorize access="hasAuthority('ROLE_ADMIN')">
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/admin">Admin Dashboard</a></li>
                            </sec:authorize>

                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/editRecipe">Create recipe</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/myRecipes">My recipes</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/viewFavourites">Favourite recipes</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/accountSettings">Account Settings</a></li>

                            <li><hr class="dropdown-divider"></li>
                            <form:form method="post" action="/logout">
                                <button class="dropdown-item" type="submit">Log Out</button>
                            </form:form>
                        </ul>
                    </div>
                </ul>
                <!-- USER DROPDOWN -->

            </sec:authorize>
            <!-- LOGGED IN USER -->


            <!-- RIGHT SIDED ELEMENTS -->
            </div>

        <!-- NAV MENU ITEMS -->
    </div>
</nav>
<!-- NAVBAR STICKY TOP -->



<!-- PAGE CONTAINER -->
<div class="container mb-4 mt-3" role="main">

    <!-- Messages ----------------------------------------------------------- -->

        <!-- Error message ----------------------------------------------------------- -->
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger" role="alert">${errorMessage}</div>
        </c:if>
        <!-- Error message ----------------------------------------------------------- -->

        <!-- Warning message ----------------------------------------------------------- -->
        <c:if test="${not empty warningMessage}">
            <div class="alert alert-warning" role="warning">${warningMessage}</div>
        </c:if>
        <!-- Warning message ----------------------------------------------------------- -->

        <!-- successful message ----------------------------------------------------------- -->
        <c:if test="${not empty message}">
            <div class="alert alert-success" role="warning">${message}</div>
        </c:if>
        <!-- successful message ----------------------------------------------------------- -->

    <!-- Messages ----------------------------------------------------------- -->



    <!-- JSP's -->
    <jsp:doBody/>
    <!-- JSP's -->


</div>
<!-- PAGE CONTAINER -->


<!-- FOOTER -->
<footer class="bg-dark text-center text-white footer">

    <!-- Grid container -->
    <div class="container p-4 mt-4">

        <!-- Section: Links -->
        <section class="">
            <!--Grid row-->
            <div class="row">
                <!--Grid column-->
                <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                    <a href="${pageContext.request.contextPath}/"><img src="/img/logo_white.png" width="120"></a>

                    <p>
                        <cite title="Source Title">Skip FastFood, use <a href="/">LazyRecipes.at</a></cite>
                    </p>
                </div>
                <!--Grid column-->

                <!--Grid column-->
                <div class="col-lg-3 col-md-6 mb-4 mb-md-0">

                    <ul class="list-unstyled mb-0">
                        <li>
                            <a href="" class="text-white" data-bs-toggle="modal" data-bs-target="#exampleModal">Contact</a>
                        </li>
                        <li>
                            <a href="#!" class="text-white">Customer Service</a>
                        </li>

                    </ul>
                </div>
                <!--Grid column-->

                <!--Grid column-->
                <div class="col-lg-3 col-md-6 mb-4 mb-md-0">

                    <ul class="list-unstyled mb-0">
                        <li>
                            <a href="#!" class="text-white">Privacy Policy</a>
                        </li>
                        <li>
                            <a href="#!" class="text-white">Terms of Use</a>
                        </li>
                        <li>
                            <a href="#!" class="text-white">Imprint</a>
                        </li>
                    </ul>
                </div>
                <!--Grid column-->

                <!--Grid column-->
                <div class="col-lg-3 col-md-6 mb-4 mb-md-0">

                    <ul class="list-unstyled mb-0">
                        <li>
                            <a href="${pageContext.request.contextPath}/signUp" class="text-white">Register</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/editRecipe" class="text-white">Create recipe</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/myRecipes" class="text-white">My Recipes</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/viewFavourites" class="text-white">Favourite recipes</a>
                        </li>
                        <li>
                            <a href="/accountSettings" class="text-white">Account Settings</a>
                        </li>
                    </ul>
                </div>
                <!--Grid column-->
            </div>
            <!--Grid row-->
        </section>
        <!-- Section: Links -->
    </div>
    <!-- Grid container -->

    <!-- Copyright -->
    <div class="text-center p-3 copyright">
        ©Copyright 2021 by <a href="https://www.fh-joanneum.at">fh-joanneum.at</a>
    </div>
    <!-- Copyright -->
</footer>
<!-- FOOTER -->

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Need help? Contact us!</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="mb-3">
                        <label for="recipient-name" class="col-form-label">Your email:</label>
                        <input type="text" class="form-control" id="recipient-name">
                    </div>
                    <div class="mb-3">
                        <label for="message-text" class="col-form-label">Message:</label>
                        <textarea class="form-control" id="message-text"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Send message</button>
            </div>
        </div>
    </div>
</div>

<!-- JAVASCRIPT -->

<bootstrap:bootstrap-js/>
<owlcarousel:owlcarousel-js/>


<script src="/js/custom.js"></script>
<script src="/js/owlcarousel.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.9.2/dropzone.js"></script>
<script src="/js/custom-dropzone.js"></script>

<!-- JAVASCRIPT -->
</body>







</html>