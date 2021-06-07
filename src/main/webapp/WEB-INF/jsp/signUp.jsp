<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<layout:page-container title="LazyRecipes" activePage="signUp">
    <html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
        <title>Bootstrap Simple Registration Form</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/signUp.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    </head>

    <body data-new-gr-c-s-check-loaded="14.1014.0" data-gr-ext-installed="">
    <div class="signup-form">
        <form:form modelAttribute="user" id="editForm" method="post" action="changeUser">
        <! ---------------- UserId & UserRole ---------------- -->
            <form:hidden path="id"/>
            <form:hidden path="role"/>

        <h2>Register</h2>
        <p class="hint-text">Create your account. It's free and only takes a minute.</p>
        <!-- ------------- First Name ---------------- -->
        <div class="form-group">
            <div class="row">
                <div class="col-md-6">
                    <label for="validationServerfName" class="form-label">First name</label>
                    <c:set var="FirstNameInvalid">
                        <form:errors var="FirstNameInvalid" path="firstName" cssClass="invalid-feedback"
                                     class="form-control is-valid"/>
                    </c:set>
                    <form:input path="firstName"
                                class="form-control ${not empty FirstNameInvalid ? 'is-invalid': ''}"
                                id="validationServerfName" type="text"/>
                        ${FirstNameInvalid}
                    <!-- <div class="valid-feedback">
                         Looks good!
                     </div>-->
                </div>

            <!-- ------------- Last Name ---------------- -->
                    <div class="col-md-6">
                        <label for="validationServerlName" class="form-label">Last name</label>
                        <c:set var="LastNameInvalid"><form:errors var="LastNameInvalid" path="lastName"
                                                                  cssClass="invalid-feedback"
                                                                  class="form-control is-valid"/> </c:set>
                        <form:input path="lastName"
                                    class="form-control ${not empty LastNameInvalid ? 'is-invalid': ''}"
                                    id="validationServerlName" type="text"/>
                            ${LastNameInvalid}
                        <!--<div class="valid-feedback">
                             Looks good!
                         </div> -->
                    </div>
            </div>

            <!-- ------------- Username ---------------- -->
            <div class="form-group">
                <label for="validationServerUsername" class="form-label">Username</label>
                <div class="input-group has-validation">
                    <span class="input-group-text" id="inputGroupPrepend3">@</span>
                    <c:set var="UsernameInvalid"><form:errors var="UsernameInvalid" path="username"
                                                              cssClass="invalid-feedback"
                                                              class="form-control is-valid"/>
                    </c:set>
                    <form:input path="username"
                                class="form-control ${not empty UsernameInvalid ? 'is-invalid': ''}"
                                id="validationServerUsername" type="text"/>
                        ${UsernameInvalid}
                    <!--<div id="validationServerUsernameFeedback" class="invalid-feedback">
                        Please choose a username.
                    </div> -->
                </div>
            </div>

            <!-- ------------- Email ---------------- -->
            <div class="form-group">
                <label for="validationServerEmail" class="form-label">E-mail</label>

                <c:set var="EmailInvalid"><form:errors var="EmailInvalid" path="email"
                                                       cssClass="invalid-feedback"
                                                       class="form-control is-valid"/>
                </c:set>
                <form:input path="email"
                            class="form-control ${not empty EmailInvalid ? 'is-invalid': ''}"
                            id="validationServerEmail" type="email"/>
                    ${UsernameInvalid}


            </div>
            <!-- -------------- birthDate ---------------- -->
                <%--div class="col-mb-4">
                    <label for="inputDate" class="form-label">Birthdate</label>
                    %-- <c:set var="BirthdateInvalid"><form:errors path="birthdate" cssClass="invalid-feedback"
                                                               class="form-control is-valid"/></c:set>
                    <form:input path="birthdate"
                                class="form-control ${not empty BirthdateInvalid ? 'is-invalid' : ''}"
                                id="inputDate" placeholder="Birthdate" type="date"/>
                        ${BirthdateInvalid}
                </div>

                <!-- ------------- State ---------------- -->
                <div class="col-md-3">
                    <label for="validationServerState" class="form-label">State</label>
                    <c:set var="CountryInvalid"><form:errors path="country" cssClass="invalid-feedback"
                                                             class="form-control is-valid"/></c:set>
                    <form:select id="validationServerState" path="country"
                                 cssClass="form-control ${not empty CountryInvalid ? 'is-invalid' : ''}">
                        <form:option value="">&nbsp;</form:option>
                        <form:options items="${country}" itemValue="id" itemLabel="country"/>
                    </form:select>
                        ${CountryInvalid}

                    <!-- <div id="validationServer04Feedback" class="invalid-feedback">
                         Please select a valid state.
                     </div> -->
                </div>

                <!-- ------------- City ---------------- -->
                <div class="col-md-3">
                    <label for="validationServerCity" class="form-label">City</label>
                    <c:set var="CityInvalid"><form:errors var="CityInvalid" path="city"
                                                          cssClass="invalid-feedback"
                                                          class="form-control is-valid"/> </c:set>
                    <form:input path="city" class="form-control ${not empty CityInvalid ? 'is-invalid': ''}"
                                id="validationServerCity" type="text"/>
                        ${CityInvalid}
                    <!-- <div id="validationServer03Feedback" class="invalid-feedback">
                         Please provide a valid city.
                     </div> -->
                </div>


                <!-- ------------- ZipCode ---------------- -->
                <div class="col-md-2">
                    <label for="validationServerZip" class="form-label">Zip</label>
                    <c:set var="ZipCodeInvalid"><form:errors var="ZipCodeInvalid" path="zip"
                                                             cssClass="invalid-feedback"
                                                             class="form-control is-valid"/> </c:set>
                    <form:input path="zip" class="form-control ${not empty ZipCodeInvalid ? 'is-invalid': ''}"
                                id="validationServerZip" type="text"/>
                        ${ZipCodeInvalid}
                    <!-- <div id="validationServer05Feedback" class="invalid-feedback">
                         Please provide a valid zip.
                     </div> -->
                </div--%>


            <!-- ------------- Password---------------- -->

            <div class="form-group">
                <label for="validationServerPassword" class="form-label">Password</label>
                <c:set var="PasswordInvalid"><form:errors var="PasswordInvalid" path="password"
                                                          cssClass="invalid-feedback"
                                                          class="form-control is-valid"/> </c:set>
                <form:input path="password"
                            class="form-control ${not empty PasswordInvalid ? 'is-invalid': ''}"
                            id="validationServerPassword" type="password"/>
                    ${PasswordInvalid}
                <!--<div class="valid-feedback">
                     Looks good!
                 </div> -->
            </div>

            <!-- ------------- Confirm Password ---------------- -->
            <div class="form-group">
                <label for="validationServerConfirmP" class="form-label">Confirm Password</label>
                <input type="password" class="form-control" id="validationServerConfirmP"
                       name="Confirm Password" required/>

                <!-- <div class="valid-feedback">
                Looks good!
                </div>-->
            </div>

            <!-- ------------- Terms and Conditions ---------------- -->
            <div class="col text-center">
                <label for="validationServerToS" class="col-form-label">Accept ToS</label>
            </div>
            <div class="form-group">
                <div class="col text-center">
                    <div class="form-checkbox">
                        <c:set var="CheckBoxInvalid"><form:errors var="CheckBoxInvalid" path="acceptTerms"
                                                                  class="form-check-input "
                        /> </c:set>
                        <form:checkbox path="acceptTerms"
                                    id="validationServerToS"
                        />
                            ${CheckBoxInvalid}
                    </div>
                </div>
            </div>
            <!-- ------------- Buttons---------------- -->
            <div class="form-group">
                <div class="col text-center">
                    <button type="submit" class="btn btn-success btn-lg-center btn-block">Register Now</button>
                </div>
            </div>
            </form>
            <div class="text-center">Already have an account? <a href="/login">Sign in</a></div>


            </form:form>
        </div>
    </div>


</layout:page-container>