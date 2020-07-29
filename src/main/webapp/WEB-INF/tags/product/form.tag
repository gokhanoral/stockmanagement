<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ tag body-content="empty" trimDirectiveWhitespaces="true" pageEncoding="ISO-8859-9" %>
<%@ attribute name="method" required="true" rtexprvalue="true" %>
<form:form role="form" method="${method}" action="" modelAttribute="product" name="product">
    <div class="box-body">
        <div class="form-group">
            <label for="code">�r�n Kodu</label>
            <form:input type="text" class="form-control" id="code" path="code"
                   placeholder="�r�n� kodunu giriniz."/>
        </div>
        <div class="form-group">
            <label for="name">�r�n Ad�</label>
            <form:input type="text" class="form-control" id="name" path="name"
                   placeholder="�r�n� ad�n� giriniz."/>
        </div>
        <div class="form-group">
            <label for="unit">Birim</label>
            <form:input type="text" class="form-control" id="unit" path="unit"
                   placeholder="�r�n� birimini giriniz."/>
        </div>
        <div class="form-group">
            <label for="purchasePrice">Al�� Fiyat�</label>
            <form:input type="number" class="form-control" step="0.01" id="purchasePrice" path="purchasePrice"
                   placeholder="Al�� fiyat�n� giriniz."/>
        </div>
        <div class="form-group">
            <label for="salePrice">Sat�� Fiyat�</label>
            <form:input type="number" class="form-control" step="0.01" id="salePrice" path="salePrice"
                   placeholder="Sat�� fiyat�n� giriniz."/>
        </div>
        <div class="form-group">
            <label for="brand">Marka</label>
            <form:input type="text" class="form-control" id="brand" path="brand"
                   placeholder="Markay� giriniz."/>
        </div>
        <div class="form-group">
            <label for="description">A��klama</label>
            <form:textarea class="form-control" id="description" rows="3" path="description"
                      placeholder="A��klamay� girin"/>
        </div>
    </div><!-- /.box-body -->

    <div class="box-footer">
        <button type="submit" class="btn btn-primary">Kaydet</button>
    </div>
</form:form>