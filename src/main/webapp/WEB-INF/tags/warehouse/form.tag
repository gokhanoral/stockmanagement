<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ tag body-content="empty" trimDirectiveWhitespaces="true" pageEncoding="ISO-8859-9" %>
<%@ attribute name="method" required="true" rtexprvalue="true" %>
<form:form role="form" method="${method}" action="" modelAttribute="warehouse" name="warehouse">
    <div class="box-body">
        <div class="form-group">
            <label for="code">Depo Kodu</label>
            <form:input type="text" class="form-control" id="code" path="code"
                   placeholder="Depo kodunu giriniz."/>
        </div>
        <div class="form-group">
            <label for="name">Depo Adý</label>
            <form:input type="text" class="form-control" id="name" path="name"
                   placeholder="Depo adýný giriniz."/>
        </div>
        <div class="form-group">
            <label for="address">Adres</label>
            <form:textarea type="text" class="form-control" id="address" path="address"
                   placeholder="Adres bilgisini giriniz."/>
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