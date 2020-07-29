<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tag body-content="empty" trimDirectiveWhitespaces="true" pageEncoding="ISO-8859-9" %>
<%@ attribute name="method" required="true" rtexprvalue="true" %>
<form:form role="form" method="${method}" action="" modelAttribute="stockForm" name="stockForm">
    <div class="box-body">
        <div class="form-group">
            <label for="code">Stok Kodu</label>
            <form:input type="text" class="form-control" id="code" path="code"
                   placeholder="Stok kodunu giriniz." required="required"/>
        </div>
        <div class="form-group">
            <label>Ürün</label>
            <form:select path="productId" class="form-control" required="required">
                <option>Ürün Seçiniz</option>
                <c:forEach items="${productList}" var="product">
                    <form:option value="${product.id}">${product.name}</form:option>
                </c:forEach>
            </form:select>
        </div>
        <div class="form-group">
            <label>Depo</label>
            <form:select path="warehouseId" class="form-control" required="required">
                <option>Depo Seçiniz</option>
                <c:forEach items="${warehouseList}" var="warehouse">
                    <form:option value="${warehouse.id}">${warehouse.name}</form:option>
                </c:forEach>
            </form:select>
        </div>

        <div class="form-group">
            <label for="quantity">Adet</label>
            <form:input type="number" class="form-control" id="quantity" path="quantity"
                   placeholder="Stok adeti giriniz." min="1" required="required"/>
        </div>
    </div><!-- /.box-body -->

    <div class="box-footer">
        <button type="submit" class="btn btn-primary">Kaydet</button>
    </div>
</form:form>