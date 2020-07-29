<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ tag body-content="empty" trimDirectiveWhitespaces="true" pageEncoding="ISO-8859-9" %>
<%@ attribute name="method" required="true" rtexprvalue="true" %>
<form:form role="form" method="${method}" action="" modelAttribute="user" name="user">
    <div class="box-body">
        <div class="form-group">
            <label for="name">Ad Soyad</label>
            <form:input type="text" class="form-control" required="required" id="name" path="name"
                   placeholder="Ad Soyad giriniz."/>
        </div>
        <div class="form-group">
            <label for="name">Mail Adresi</label>
            <form:input type="email" class="form-control" required="required" id="email" path="email"
                   placeholder="E-posta adresini giriniz."/>
        </div>
        <div class="form-group">
            <label for="userName">Kullan�c� Ad�</label>
            <form:input type="text" class="form-control" required="required" id="userName" path="userName"
                   placeholder="Kullan�c� ad� giriniz."/>
        </div>
        <div class="form-group">
            <label for="password">�ifre</label>
            <form:input type="password" class="form-control" required="required" id="password" path="password"
                   placeholder="�ifreyi giriniz."/>
        </div>
    </div><!-- /.box-body -->

    <div class="box-footer">
        <button type="submit" class="btn btn-primary">Kaydet</button>
    </div>
</form:form>