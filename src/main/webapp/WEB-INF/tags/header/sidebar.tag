<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ tag body-content="empty" trimDirectiveWhitespaces="true" pageEncoding="ISO-8859-9" %>
<sec:authentication var="principal" property="principal" />
<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="../../../templates/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image"/>
            </div>
            <div class="pull-left info">
                <p>${principal.name} - ${principal.userName}</p>
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu box">
            <li class="header">MENÜ</li>
            <li><a href="<c:url value="/products"/>"><i class="fa fa-circle-o"></i>Ürün Listesi</a></li>
            <li><a href="<c:url value="/warehouses"/>"><i class="fa fa-circle-o"></i>Depo Listesi</a></li>
            <li><a href="<c:url value="/stocks"/>"><i class="fa fa-circle-o"></i>Stok Listesi</a></li>
            <security:authorize access="hasRole('ROLE_ADMIN')">
                <li><a href="<c:url value="/users"/>"><i class="fa fa-circle-o"></i>Kullanýcý Listesi</a></li>
            </security:authorize>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>