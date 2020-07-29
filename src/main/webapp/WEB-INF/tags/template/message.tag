<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${not empty message}">
<div class="alert alert-danger alert-dismissable">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×
    </button>
    <h4><i class="icon fa fa-ban"></i> Hata</h4>
    ${message}
</div>
</c:if>