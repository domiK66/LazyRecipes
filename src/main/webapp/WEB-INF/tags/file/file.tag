<%@ attribute name="value" required="true" type="java.lang.Object" rtexprvalue="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:set var="jsvalue" value="["/>
<c:forEach var="file" items="${value}" varStatus="status">
    <c:if test="${status.index != 0}">
        <c:set var="jsvalue" value="${jsvalue},"/>
    </c:if>
    <c:set var="jsvalue" value='${jsvalue}{"id": ${file.id}, "originalFileName": "${file.originalFileName}"}'/>
</c:forEach>
<c:set var="jsvalue" value="${jsvalue}]"/>

<div class="dropzone" csrf="${_csrf.token}" data-jsvalue='${jsvalue}'>
    <div class="dz-default dz-message"></div>
    <table class="files-container table table-striped"></table>
</div>
