<%@page contentType="text/html;charset=ISO-8859-9" pageEncoding="ISO-8859-9" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="user" tagdir="/WEB-INF/tags/user" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<template:page>
    <!-- Right side column. Contains the navbar and content of the page -->
    <div class="content-wrapper">
        <template:message/>
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Kullanýcý Ekle
            </h1>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-primary">
                        <!-- form start -->
                        <user:form method="POST"/>
                    </div><!-- /.box -->
                </div><!-- /.col -->
            </div><!-- /.row -->
        </section><!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <!-- ./wrapper -->
</template:page>