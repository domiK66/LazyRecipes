<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<layout:page-container title="LazyRecipes" activePage="accountSettings">
    <div class="container">

        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                    <%--@elvariable id="user" type="at.fhj.ima.lazyrecipes"--%>
                <form:form modelAttribute="user" method="post" action="changeAccountSettings">
                    <input type="hidden" name="id" value="<c:out value="${user.id}"/>">

                    <fieldset>
                        <legend>Change Your Account Settings:</legend>


                        <!-- ------------- username ---------------- -->
                        <div class="mb-3">
                            <label for="inputUsername" class="form-label">Username</label>
                            <c:set var="usernameInvalid">
                                <form:errors path="username" cssClass="invalid-feedback"/>
                            </c:set>
                            <form:input path="username"
                                        class="form-control ${not empty usernameInvalid ? 'is-invalid' : ''}"
                                        id="inputusername"
                                        type="text" value="${user.username}"/>
                                ${usernameInvalid}
                        </div>

                        <!-- ------------- password ---------------- -->
                        <div class="mb-3">
                            <label for="inputPassword" class="form-label">Password</label>
                            <c:set var="passwordInvalid">
                                <form:errors path="password" cssClass="invalid-feedback"/>
                            </c:set>
                            <form:input path="password"
                                        class="form-control ${not empty passwordInvalid ? 'is-invalid' : ''}"
                                        id="inputpassword"
                                        type="text" value="${user.password}" readonly="true"/>
                                ${passwordInvalid}
                        </div>

                        <!-- ------------- User-Role (invisible, default value: id of current user) ---------------- -->
                        <div class="mb-3">
                            <label for="role" class="form-label"></label>
                            <form:input path="role"
                                        class="form-control ${not empty roleInvalid ? 'is-invalid' : ''}"
                                        id="inputRole"
                                        type="hidden" readonly="true" value="${user.role}" />
                                ${roleInvalid}
                        </div>

                        <!-- -------------- Buttons ---------------- -->
                        <div class="mb-3">
                            <!-- submit -->
                            <button type="submit" class="btn btn-primary">Submit</button>
                            <!-- cancel -->
                            <a href="/" class="btn btn-default">Cancel</a>

                            <!-- delete button: only if id-param exists, button is enabled -->
                            <sec:authorize access="!hasAuthority('ROLE_ADMIN')">
                            <button type="button" class="btn btn-xs btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal">
                                        Delete
                            </button>
                            </sec:authorize>




                            <!-- Modal (warning) -->
                            <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="deleteModalLabel">Delete your Account?</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <h10>You will be signed out and can't post nor favourize recipes anymore.</h10>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                                Close
                                            </button>
                                            <a href="/deleteAccount" class="btn btn-xs btn-danger">Delete</a>
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