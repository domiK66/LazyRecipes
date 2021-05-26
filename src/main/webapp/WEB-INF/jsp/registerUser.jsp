<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<layout:page-container title="LazyRecipes" activePage="registerUser">
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <form:form modelAttribute="user" id="editForm" method="post" action="changeUser">
                    <input type="hidden" name="id" value="<c:out value="${user.id}"/>">
                    <fieldset>
                        <legend>Create User Account ${user.id}</legend>

                        <!-- ------------- FirstName ---------------- -->

                        <div class="mb-3">
                            <label for="inputFirstname" class="form-label">First name</label>
                            <input class="form-control" id="inputFirstname" >
                        </div>

                        <!-- ------------- dayOfBirth ---------------- -->

                        <div class="mb-3">
                         <label for="inputDate" class="form-label">Birthdate</label>
                            <c:set var = "dayOfBirthInvalide"><form :errors path="dayOfBirth" cssClass="invalid-feedback"> </c:set>
                            <form:input path = "dayOfBirth" class="form-control ${not empty dayOfBrithInvalide ? 'is-invalide':' '}" id="inputDate" placeholder="Date" type="date"/>
                            ${dayOfBirthInvalide}
                        </div>

                        <!-- ------------- Recipe Title ---------------- -->



                        <!-- -------------- Buttons ---------------- -->
                        <div class="mb-3">
                            <!-- submit -->
                            <button type="submit" class="btn btn-primary">Submit</button>
                            <!-- cancel -->
                            <a href="/" class="btn btn-default">Cancel</a>
                        </div>
                    </fieldset>
                </form:form>
            </div>
        </div>



    <!--------------------------dayOfBirth-------- -->


    </div>
</layout:page-container>