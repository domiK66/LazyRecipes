<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@taglib prefix="file" tagdir="/WEB-INF/tags/file" %>

<layout:page-container title="LazyRecipes" activePage="editRecipe">
    <div class="container">

        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <%--@elvariable id="recipe" type="at.fhj.ima.lazyrecipes"--%>
                <form:form modelAttribute="recipe" id="editForm" method="post" action="changeRecipe">
                    <input type="hidden" name="id" value="<c:out value="${recipe.id}"/>">

                    <fieldset>
                        <!-- TODO: create/change -->
                        <legend>Change Recipe: ${recipe.title}</legend>


                        <!-- ------------- Recipe Title ---------------- -->
                        <div class="mb-3">
                            <label for="inputTitle" class="form-label">Title</label>
                            <c:set var="titleInvalid">
                                <form:errors path="title" cssClass="invalid-feedback"/>
                            </c:set>
                            <form:input path="title"
                                        class="form-control ${not empty titleInvalid ? 'is-invalid' : ''}"
                                        id="inputTitle"
                                        type="text"/>
                                ${titleInvalid}
                        </div>

                        <!-- ------------- Recipe Subtitle ---------------- -->
                        <div class="mb-3">
                            <label for="inputSubtitle" class="form-label">Subtitle</label>
                            <c:set var="subtitleInvalid">
                                <form:errors path="subtitle" cssClass="invalid-feedback"/>
                            </c:set>
                            <form:input path="subtitle"
                                        class="form-control ${not empty subtitleInvalid ? 'is-invalid' : ''}"
                                        id="inputSubtitle"
                                        type="text"/>
                                ${subtitleInvalid}
                        </div>

                        <!-- -------------- Ingredients ---------------- -->
                        <div class="mb-3">
                            <label for="inputIngredients" class="form-label">Ingredients</label>
                            <c:set var="ingredientsInvalid">
                                <form:errors path="ingredients" cssClass="invalid-feedback"/>
                            </c:set>
                            <form:input path="ingredients"
                                        class="form-control ${not empty ingredientsInvalid ? 'is-invalid' : ''}"
                                        id="inputIngredients"
                                        type="text"/>
                                ${ingredientsInvalid}
                        </div>

                        <!-- -------------- Category ------------------>
                        <div class="mb-3">
                            <label for="category" class="form-label">Category</label>
                            <c:set var="categoryInvalid">
                                <form:errors path="category" cssClass="invalid-feedback"/>
                            </c:set>
                            <form:select id="category"
                                         path="category"
                                         class="form-control ${not empty categoryInvalid ? 'is-invalid' : ''}">
                                <form:option value=""> </form:option>
                                <form:options items="${category}" itemValue="id" itemLabel="name"/>
                            </form:select>
                                ${categoryInvalid}
                        </div>

                        <!-- -------------- Prep Time ---------------- -->
                        <!-- TODO: beschriftung minutes -->
                        <div class="mb-3">
                            <label for="inputprepTime" class="form-label">prepTime</label>
                            <c:set var="prepTimeInvalid">
                                <form:errors path="prepTime" cssClass="invalid-feedback"/>
                            </c:set>
                            <form:input path="prepTime"
                                        class="form-control ${not empty prepTimeInvalid ? 'is-invalid' : ''}"
                                        id="inputprepTime"
                                        type="text"/>
                                ${prepTimeInvalid}
                        </div>

                        <!-- -------------- Portions ---------------- -->
                        <div class="mb-3">
                            <label for="inputportions" class="form-label">portions</label>
                            <c:set var="portionsInvalid">
                                <form:errors path="portions" cssClass="invalid-feedback"/>
                            </c:set>
                            <form:input path="portions"
                                        class="form-control ${not empty portionsInvalid ? 'is-invalid' : ''}"
                                        id="inputportions"
                                        type="text"/>
                                ${portionsInvalid}
                        </div>

                        <!-- -------------- Steps ---------------- -->
                        <div class="mb-3">
                            <label for="inputsteps" class="form-label">steps</label>
                            <c:set var="stepsInvalid">
                                <form:errors path="steps" cssClass="invalid-feedback"/>
                            </c:set>
                            <form:input path="steps"
                                        class="form-control ${not empty stepsInvalid ? 'is-invalid' : ''}"
                                        id="inputsteps"
                                        type="text"/>
                                ${stepsInvalid}
                        </div>

                        <!-- ---------------- Files ------------------>
                        <div class="mb-3">
                            <label class="form-label">Files</label>
                            <file:file value="${recipe.files}" />
                        </div>

                        <!-- ------------- User-ID (invisible, default value: id of current user) ---------------- -->
                        <div class="mb-3">
                            <label for="user" class="form-label"></label>
                            <form:input path="user"
                                        class="form-control ${not empty userInvalid ? 'is-invalid' : ''}"
                                        id="inputUser"
                                        type="hidden" readonly="true" value="${currentUser.id}" />
                                ${userInvalid}
                        </div>

                        <!-- ------------- ratingAVG (invisible, default value: recipe rating AVG) ---------------- -->
                        <div class="mb-3">
                            <label for="ratingAVG" class="form-label"></label>
                            <form:input path="ratingAVG"
                                        class="form-control ${not empty ratingAVGInvalid ? 'is-invalid' : ''}"
                                        id="inputUser"
                                        type="hidden" readonly="true" value="${recipe.ratingAVG}" />
                                ${ratingAVGInvalid}
                        </div>



                        <!-- -------------- Buttons ---------------- -->
                        <div class="mb-3">
                            <!-- submit -->
                            <button type="submit" class="btn btn-primary">Submit</button>
                            <!-- cancel -->
                            <a href="/" class="btn btn-default">Cancel</a>


                            <!-- delete button: only if id-param exists, button is enabled -->
                            <c:choose>
                                <c:when test="${empty param}">
                                    <button type="button" class="btn btn-xs btn-danger" data-bs-toggle="modal"
                                            data-bs-target="#deleteModal" disabled>
                                        Delete
                                    </button>
                                </c:when>
                                <c:otherwise>
                                        <button type="button" class="btn btn-xs btn-danger" data-bs-toggle="modal"
                                                data-bs-target="#deleteModal" enabled>
                                            Delete
                                        </button>
                                        </c:otherwise>
                            </c:choose>




                            <!-- Modal (warning) -->
                            <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="deleteModalLabel">Delete Recipe ${recipe.title}?</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                                Close
                                            </button>
                                            <a href="deleteRecipe?id=${recipe.id}" class="btn btn-xs btn-danger">Delete</a>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </fieldset>
                </form:form>
            </div>
        </div>


    </div>
</layout:page-container>