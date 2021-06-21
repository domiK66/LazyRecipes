<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="file" tagdir="/WEB-INF/tags/file" %>

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

                        <!-- ------------- firstName ---------------- -->
                        <div class="mb-3">
                            <label for="inputFirstName" class="form-label">Firstname</label>
                            <c:set var="firstNameInvalid">
                                <form:errors path="firstName" cssClass="invalid-feedback"/>
                            </c:set>
                            <form:input path="firstName"
                                        class="form-control ${not empty firstNameInvalid ? 'is-invalid' : ''}"
                                        id="inputFirstName"
                                        type="text" value="${user.firstName}"/>
                                ${firstNameInvalid}
                        </div>

                        <!-- ------------- lastName ---------------- -->
                        <div class="mb-3">
                            <label for="inputLastName" class="form-label">Lastname</label>
                            <c:set var="lastNameInvalid">
                                <form:errors path="lastName" cssClass="invalid-feedback"/>
                            </c:set>
                            <form:input path="lastName"
                                        class="form-control ${not empty lastNameInvalid ? 'is-invalid' : ''}"
                                        id="inputLastName"
                                        type="text" value="${user.lastName}"/>
                                ${lastNameInvalid}
                        </div>

                        <!-- ------------- Email ---------------- -->
                        <div class="mb-3">
                            <label for="inputEmail" class="form-label">Email</label>
                            <c:set var="emailInvalid">
                                <form:errors path="email" cssClass="invalid-feedback"/>
                            </c:set>
                            <form:input path="email"
                                        class="form-control ${not empty lastNameInvalid ? 'is-invalid' : ''}"
                                        id="inputEmail"
                                        type="text" value="${user.email}"/>
                                ${emailInvalid}
                        </div>

                        <!-- TODO: only one picture ---------------- Files ------------------>
                        <div class="mb-3">
                            <label class="form-label">Files</label>
                            <file:file value="${user.files}"/>
                        </div>


                        <!-- ------------- Password---------------- -->

                        <div class="form-group">
                            <label for="validationServerPassword" class="form-label">Password</label>
                            <c:set var="PasswordInvalid"><form:errors var="PasswordInvalid" path="password"
                                                                      cssClass="invalid-feedback"
                                                                      class="form-control is-valid"/> </c:set>
                            <form:input path="password"
                                        class="form-control ${not empty PasswordInvalid ? 'is-invalid': ''}"
                                        id="validationServerPassword" type="password" value="${currentUser.password}"/>
                                ${PasswordInvalid}
                        </div>

                        <!-- ------------- Confirm Password ---------------- -->
                        <div class="form-group">
                            <label for="validationServerConfirmPw" class="form-label">Confirm Password</label>
                            <c:set var="ConfirmPwInvalid">
                                <form:errors var="ConfirmPwInvalid"
                                             path="confirmPw"
                                             cssClass="invalid-feedback"
                                             class="form-control is-valid"/>
                            </c:set>
                            <form:input path="confirmPw"
                                        class="form-control ${not empty ConfirmPwInvalid ? 'is-invalid': ''}"
                                        id="validationServerConfirmPw" type="password" value="${currentUser.password}"/>
                                ${ConfirmPwInvalid}
                        </div>

                        <!-- ------------- Confirm Email ---------------- -->
                        <div class="form-group">
                            <label for="inputEmailcorrect" class="form-label"></label>
                            <c:set var="emailcorrectInvalid"><form:errors var="emailcorrectInvalid" path="emailcorrect"
                                                                       cssClass="invalid-feedback"
                                                                       class="form-control is-valid"/> </c:set>
                            <form:input path="emailcorrect"
                                        class="form-control ${not empty emailcorrectInvalid ? 'is-invalid': ''}"
                                        id="inputEmailcorrect" type="hidden" readonly="true"/>
                                ${emailcorrectInvalid}
                        </div>




                        <!-- ------------- Terms and Conditions ---------------- -->
                        <div class="mb-3">
                            <label for="validationServerToS" class="col-form-label"></label>
                            <c:set var="CheckBoxInvalid"><form:errors var="CheckBoxInvalid" path="acceptTerms" class="form-check-input"/></c:set>
                            <form:input path="acceptTerms"
                                           id="validationServerToS"
                                           type="hidden" readonly="true"
                                           value="${user.acceptTerms}" />
                                ${CheckBoxInvalid}
                        </div>


                        <!-- ------------- User-Role (invisible, default value: id of current user) ---------------- -->
                        <div class="mb-3">
                            <label for="inputRole" class="form-label"></label>
                            <form:input path="role"
                                        class="form-control ${not empty roleInvalid ? 'is-invalid' : ''}"
                                        id="inputRole"
                                        type="hidden"
                                        readonly="true"
                                        value="${user.role}" />
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






                        </div>
                    </fieldset>
                </form:form>

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
                                        <form:form method="post" action="/deleteAccount">
                                            <button type="submit" class="btn btn-xs btn-danger">Delete</button>
                                        </form:form>
                                    </div>
                                </div>
                            </div>
                        </div>

            </div>
        </div>


    </div>
</layout:page-container>