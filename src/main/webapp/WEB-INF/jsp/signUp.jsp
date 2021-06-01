<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<layout:page-container title="LazyRecipes" activePage="signUp">

    <%--@elvariable id="user" type="at.fhj.ima.lazyrecipes"--%>
    <form:form modelAttribute="user" method="post" action="changeUser">
        <legend>Create User Account</legend>
        <fieldset>
                <%-- div class="col-md-4">
                    <label for="validationServer01" class="form-label">First name</label>
                    <input type="text" class="form-control is-valid" id="validationServer01" value="Mark" required>
                    <div class="valid-feedback">
                        Looks good!
                    </div>
                </div --%>
                <%-- div class="col-md-4">
                    <label for="validationServer02" class="form-label">Last name</label>
                    <input type="text" class="form-control is-valid" id="validationServer02" value="Otto" required>
                    <div class="valid-feedback">
                        Looks good!
                    </div>
                </div --%>

            <!-- ------------- username ---------------- -->
            <div class="col-md-4">
                <label for="validationServerUsername" class="form-label">Username</label>
                <c:set var="usernameInvalid">
                    <form:errors path="username" cssClass="invalid-feedback"/>
                </c:set>
                <form:input path="username"
                            class="form-control ${not empty usernameInvalid ? 'is-invalid' : ''}"
                            id="validationServerUsername"
                            type="text" value="${user.username}"/>
                    ${usernameInvalid}
            </div>
                <%--div class="col-md-6">
                    <label for="validationServer03" class="form-label">City</label>
                    <input type="text" class="form-control is-invalid" id="validationServer03" aria-describedby="validationServer03Feedback" required>
                    <div id="validationServer03Feedback" class="invalid-feedback">
                        Please provide a valid city.
                    </div>
                </div--%>
                <%--div class="col-md-3">
                    <label for="validationServer04" class="form-label">State</label>
                    <select class="form-select is-invalid" id="validationServer04" aria-describedby="validationServer04Feedback" required>
                        <option selected disabled value="">Choose...</option>
                        <option>...</option>
                    </select>
                    <div id="validationServer04Feedback" class="invalid-feedback">
                        Please select a valid state.
                    </div>
                </div--%>

            <!-- ------------- password ---------------- -->
            <div class="col-md-3">
                <label for="validationPassword" class="form-label">Password</label>
                <input type="text" class="form-control is-invalid" id="validationPassword"
                       aria-describedby="validationServer05Feedback" required>
                <div id="validationPasswordFeedback" class="invalid-feedback">
                    Passwords needs to contain at least 8 characters, one lowercase, one Uppercase and one special
                    character
                    (!?.%,...).
                </div>
            </div>
            <div class="col-md-3">
                <label for="validationPassword2" class="form-label">Confim Password</label>
                <input type="text" class="form-control is-invalid" id="validationPassword2"
                       aria-describedby="validationServer05Feedback" required>
                <div id="validationPassword2Feedback" class="invalid-feedback">
                    Passwords need to match.
                </div>
            </div>

            <!-- ------------- Terms and conditions ---------------- -->
            <div class="col-12">
                <div class="form-check">
                    <input class="form-check-input is-invalid" type="checkbox" value="" id="invalidCheck3"
                           aria-describedby="invalidCheck3Feedback" required>
                    <label class="form-check-label" for="invalidCheck3">
                        Agree to terms and conditions
                    </label>
                    <div id="invalidCheck3Feedback" class="invalid-feedback">
                        You must agree before submitting.
                    </div>
                </div>
            </div>
            <div class="col-12">
                <button class="btn btn-primary" type="submit">Create new account</button>
                <a href="/login" class="btn btn-secondary">Login instead</a>
            </div>
        </fieldset>
    </form:form>


</layout:page-container>