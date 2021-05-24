<%@tag pageEncoding="UTF-8" %>

<%@ attribute name="title" required="true" %>
<%@ attribute name="activePage" required="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>

<!DOCTYPE html>
<html>

<head>
    <bootstrap:bootstrap-metadata/>
    <title>${title}</title>
    <bootstrap:bootstrap-css/>
    <link href="/css/custom.css" rel="stylesheet" />
</head>
<body>

<!-- Navbar -->

<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top" aria-label="Ninth navbar example" style="width: 100%">
    <div class="container-xl">
        <a class="navbar-brand" href="/">Lazy Recipes</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample07XL" aria-controls="navbarsExample07XL" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarsExample07XL">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="/">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/editRecipe">create new Recipe</a>
                </li>

                <!-- DROPDOWN MENU CATGORIES -->
                <li class="nav-item dropdown dropdown-large">
                    <a class="nav-link dropdown-toggle" id="dropdown07XL" data-bs-toggle="dropdown" aria-expanded="false">Explore Categories</a>
                    <ul class="dropdown-menu mega-area" data-bs-popper="none" aria-labelledby="dropdown07XL">
                        <div class="row g-3">
                            <div class="col-sm-4 col-lg-3">
                                <ul class="list-unstyled">
                                    <li><a href="#">Pasta/Penne</a></li>
                                    <li><a href="#">Vegetarian</a></li>
                                    <li><a href="#">Vegan</a></li>
                                    <li><a href="#">Sandwiches</a></li>
                                </ul>
                            </div>
                            <div class="col-sm-4 col-lg-3">
                                <ul class="list-unstyled">
                                    <li><a href="#">Bowls</a></li>
                                    <li><a href="#">Asian</a></li>
                                    <li><a href="#">Dessert</a></li>
                                    <li><a href="#">Salad</a></li>
                                </ul>
                            </div>
                            <div class="col-sm-4 col-lg-3">
                                <ul class="list-unstyled">
                                    <li><a href="#">Wraps</a></li>
                                    <li><a href="#">Traditional</a></li>
                                    <li><a href="#">Antipasti</a></li>
                                    <li><a href="#">Fast Food</a></li>
                                </ul>
                            </div>
                        </div>
                    </ul>
                </li>


            </ul>
            <form id="searchId" action="/searchRecipe" class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
                <input name="search" id="inputSearch" type="search" class="form-control form-control-dark" placeholder="Search..." aria-label="Search" value="${param.search}">
            </form>

            <div class="text-end">
                <button type="button" class="btn btn-outline-light me-2">Login</button>
                <button type="button" class="btn btn-warning">Sign-up</button>
            </div>

        </div>

    </div>
</nav>

<div class="container mb-4 mt-3" role="main">


    <div class="page-header">
        <h1></h1>
    </div>

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
    <jsp:doBody/>
</div>

<!-- Footer -->
<footer class="bg-dark text-center text-white footer">
    <!-- Grid container -->
    <div class="container p-4 mt-4">

        <!-- Section: Links -->
        <section class="">
            <!--Grid row-->
            <div class="row">
                <!--Grid column-->
                <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                    <h5 class="text-uppercase">Logo</h5>

                    <p>
                        Skip FastFood, use <a href="/">LazyRecipes.at</a>
                    </p>
                </div>
                <!--Grid column-->

                <!--Grid column-->
                <div class="col-lg-3 col-md-6 mb-4 mb-md-0">

                    <ul class="list-unstyled mb-0">
                        <li>
                            <a href="#!" class="text-white">Contact</a>
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
                            <a href="#!" class="text-white">Register</a>
                        </li>
                        <li>
                            <a href="#!" class="text-white">Account</a>
                        </li>
                        <li>
                            <a href="#!" class="text-white">My Recipes</a>
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
<!-- Footer -->





<bootstrap:bootstrap-js/>
<script src="/js/custom.js"></script>
</body>
</html>