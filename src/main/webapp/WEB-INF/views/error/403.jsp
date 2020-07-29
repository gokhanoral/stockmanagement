<%@page contentType="text/html;charset=ISO-8859-9" pageEncoding="ISO-8859-9" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="stock" tagdir="/WEB-INF/tags/stock" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<template:page>

    <div class="content-wrapper" style="min-height: 1068px;">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                403 Hata Sayfasý
            </h1>
        </section>

        <!-- Main content -->
        <section class="content">

            <div class="error-page">
                <h2 class="headline text-red">403</h2>
                <div class="error-content">
                    <h3><i class="fa fa-warning text-red"></i> Hata! Bu sayfaya giriþ yetkiniz bulunmamaktadýr.</h3>
                </div>
            </div><!-- /.error-page -->

        </section><!-- /.content -->
    </div>
</template:page>