
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>

<layout:page-container title="LazyRecipes" activePage="editRecipe">
  <div class="container">
    <h1>Search Results for "${param.search}"</h1>

  <!-- TODO: link View-Action to Recipe-View and add image-->

    <div class="row">
      <div class="col-md-10 col-md-offset-1">

        <table data-toggle="table" class="table table-striped">
          <thead>
          <tr>
            <th data-sortable="true">Title</th>
            <th data-sortable="true">Subtitle</th>
            <th data-sortable="true">Prep Time (min)</th>
            <th data-sortable="true">Portion(s)</th>
            <th data-sortable="true">Category</th>

            <th>Actions</th>
          </tr>
          </thead>

          <tbody>
          <!--  list all employees ----------------------------------------------------------- -->
          <c:forEach items="${recipe}" var="recipe">
            <tr>
              <td>${recipe.title}</td>
              <td>${recipe.subtitle}</td>
              <td>${recipe.prepTime}</td>
              <td>${recipe.portions}</td>
              <td>${recipe.category.name}</td>

              <td>
                <a href="editRecipe?id=${recipe.id}" class="btn btn-xs btn-success">View</a>
              </td>
            </tr>
          </c:forEach>
          <!--  list all recipes ----------------------------------------------------------- -->
          </tbody>

        </table>
      </div>
    </div>




  </div>
</layout:page-container>