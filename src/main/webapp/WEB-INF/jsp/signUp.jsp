<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<layout:page-container title="LazyRecipes" activePage="login">

    <!-- ------------- First Name ---------------- -->
    <form class="row g-3">
        <div class="col-md-4">
            <label for="validationServer01" class="form-label">First name</label>
            <input type="text" class="form-control is-valid" id="validationServer01" name= "firstName" value="<c:out value="${account.firstName}"/>" required>
            <!-- <div class="valid-feedback">
                 Looks good!
             </div>-->
         </div>
         <!-- ------------- Last Name ---------------- -->
        <div class="col-md-4">
            <label for="validationServer02" class="form-label">Last name</label>
            <input type="text" class="form-control is-valid" id="validationServer02" name= "lastName" value="<c:out value="${account.lastName}"/>" required>
            <!-- <div class="valid-feedback">
                 Looks good!
             </div>-->
        </div>
        <!-- ------------- Username ---------------- -->
        <div class="col-md-4">
            <label for="validationServerUsername" class="form-label">Username</label>
            <div class="input-group has-validation">
                <span class="input-group-text" id="inputGroupPrepend3">@</span>
                <input type="text" class="form-control is-invalid" id="validationServerUsername" aria-describedby="inputGroupPrepend3 validationServerUsernameFeedback" name="username" value="<c:out value="${account.username}"/>" required/>
                <!--<div id="validationServerUsernameFeedback" class="invalid-feedback">
                    Please choose a username.
                </div> -->
            </div>
            <!-- ------------- City ---------------- -->
        </div>
        <div class="col-md-6">
            <label for="validationServer03" class="form-label">City</label>
            <input type="text" class="form-control is-invalid" id="validationServer03" aria-describedby="validationServer03Feedback" value="<c:out value="${account.city}"/>" required/>
            <!-- <div id="validationServer03Feedback" class="invalid-feedback">
                 Please provide a valid city.
             </div> -->
         </div>
         <!-- ------------- State---------------- -->
        <!-- -->  <div class="col-md-3">
              <label for="validationServer04" class="form-label">State</label>
               <select class="form-select is-invalid" id="validationServer04" aria-describedby="validationServer04Feedback" required/>
                   <option selected disabled value="">Choose...</option>
                    <c:forEach var="country" items="${country}">
                       <option value="${country.id}" <c:if test="${account.country.id == country.id}">selected</c:if>>${country.country}</option>
                   </c:forEach>
              </select>

            <!-- <div id="validationServer04Feedback" class="invalid-feedback">
                 Please select a valid state.
             </div> -->
         </div>

       <!-- ------------- ZipCode ---------------- -->
        <div class="col-md-3">
            <label for="validationServer05" class="form-label">Zip</label>
            <input type="text" class="form-control is-invalid" id="validationServer05" aria-describedby="validationServer05Feedback" value="<c:out value="${account.firstName}"/>" required/>
            <!-- <div id="validationServer05Feedback" class="invalid-feedback">
                 Please provide a valid zip.
             </div> -->
         </div>
         <!-- ------------- Terms and Conditions ---------------- -->
            <!-- <div class="col-12">
                 <div class="form-check">
                     <input class="form-check-input is-invalid" type="checkbox" value="" id="invalidCheck3" aria-describedby="invalidCheck3Feedback" required>
                     <label class="form-check-label" for="invalidCheck3">
                         Agree to terms and conditions
                     </label>
                     <div id="invalidCheck3Feedback" class="invalid-feedback">
                         You must agree before submitting.
                     </div>
                 </div>
             </div> -->
             <!-- ------------- Buttons---------------- -->
        <div class="col-12">
            <button class="btn btn-primary" type="submit">Submit form</button>
            <a href="/login" class="btn btn-secondary">Login instead</a>
        </div>
    </form>




</layout:page-container>