<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<layout:page-container title="LazyRecipes" activePage="admin">
    <div class="container">
        <a href="/editRecipe" class="btn btn-xs btn-success">Create Recipe</a>
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <table data-toggle="table" class="table table-striped">
                    <thead>
                        <tr>
                            <th data-sortable="true">Title</th>
                            <th data-sortable="true">PrepTime (min)</th>
                            <th data-sortable="true">Portion(s)</th>
                            <th data-sortable="true">Username</th>
                            <th data-sortable="true">Category</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!--  list all recipes ----------------------------------------------------------- -->
                        <c:forEach items="${recipe}" var="recipe">
                            <tr>
                                <td>${recipe.title}</td>
                                <td>${recipe.prepTime}</td>
                                <td>${recipe.portions}</td>
                                <td>@${recipe.user.username}</td>
                                <td>${recipe.category.name}</td>
                                <td>

                                    <form:form method="post" action="/deleteAdminRecipe?id=${recipe.id}">
                                        <a href="/recipeView?id=${recipe.id}" class="btn btn-xs btn-primary">View</a>
                                        <a href="/editRecipe?id=${recipe.id}" class="btn btn-xs btn-dark">Edit</a>
                                        <button type="submit" class="btn btn-xs btn-danger">Delete</button>
                                    </form:form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</layout:page-container>

