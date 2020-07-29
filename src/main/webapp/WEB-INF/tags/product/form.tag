<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ tag body-content="empty" trimDirectiveWhitespaces="true" pageEncoding="ISO-8859-9" %>
<%@ attribute name="method" required="true" rtexprvalue="true" %>
<form:form role="form" method="${method}" action="" modelAttribute="product" name="product">
    <div class="box-body">
        <div class="form-group">
            <label for="code">Ürün Kodu</label>
            <form:input type="text" class="form-control" id="code" path="code"
                   placeholder="Ürünü kodunu giriniz."/>
        </div>
        <div class="form-group">
            <label for="name">Ürün Adý</label>
            <form:input type="text" class="form-control" id="name" path="name"
                   placeholder="Ürünü adýný giriniz."/>
        </div>
        <div class="form-group">
            <label for="unit">Birim</label>
            <form:input type="text" class="form-control" id="unit" path="unit"
                   placeholder="Ürünü birimini giriniz."/>
        </div>
        <div class="form-group">
            <label for="purchasePrice">Alýþ Fiyatý</label>
            <form:input type="number" class="form-control" step="0.01" id="purchasePrice" path="purchasePrice"
                   placeholder="Alýþ fiyatýný giriniz."/>
        </div>
        <div class="form-group">
            <label for="salePrice">Satýþ Fiyatý</label>
            <form:input type="number" class="form-control" step="0.01" id="salePrice" path="salePrice"
                   placeholder="Satýþ fiyatýný giriniz."/>
        </div>
        <div class="form-group">
            <label for="brand">Marka</label>
            <form:input type="text" class="form-control" id="brand" path="brand"
                   placeholder="Markayý giriniz."/>
        </div>
        <div class="form-group">
            <label for="description">Açýklama</label>
            <form:textarea class="form-control" id="description" rows="3" path="description"
                      placeholder="Açýklamayý girin"/>
        </div>
    </div><!-- /.box-body -->

    <div class="box-footer">
        <button type="submit" class="btn btn-primary">Kaydet</button>
    </div>
</form:form>