<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="warehouse" tagdir="/WEB-INF/tags/warehouse" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<template:page>
    <!-- Right side column. Contains the navbar and content of the page -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Depo Düzenle
            </h1>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-primary">
                        <!-- form start -->
                        <warehouse:form method="PUT"/>
                    </div><!-- /.box -->
                </div><!-- /.col -->
            </div><!-- /.row -->
        </section><!-- /.content -->
    </div><!-- /.content-wrapper -->
    <!-- ./wrapper -->
</template:page>