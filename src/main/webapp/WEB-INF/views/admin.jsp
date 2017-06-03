<%@ include file="../fragments/head.jspf" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- Content Wrapper. Contains page content -->
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <%@ include file="../fragments/header.jspf" %>
    <c:if test="${rol eq 'Organizador'}">
        <%@ include file="../fragments/left-side-column-organizador.jspf" %>
    </c:if>
    <c:if test="${rol eq 'Proveedor'}">
        <%@ include file="../fragments/left-side-column-proveedor.jspf" %>
    </c:if>
    <c:if test="${rol eq 'Administrador'}">
        <%@ include file="../fragments/left-side-column-admin.jspf" %>
    </c:if>
    <c:if test="${rol eq 'Cliente'}">
        <%@ include file="../fragments/left-side-column-cliente.jspf" %>
    </c:if>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Administración
                <small>Proveedores</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">Dashboard</li>
            </ol>
        </section>
        <!-- Main content -->
        <section class="content">
            <!-- CONTADORES DE USUARIOS -->
            <!-- Small boxes (Stat box) -->
            <div class="row">
                <div class="col-lg-2 col-xs-6">
                    <!-- small box  PROVEEDORES-->
                    <div class="small-box bg-teal">
                        <div class="inner">
                            <h3>${fn:length(listaClinetes)}</h3>
                            <p>Num clientes</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-person"></i>
                        </div>
                    </div>
                </div>
                <!-- ./col -->
                <div class="col-lg-2 col-xs-6">
                    <!-- small box ORGANIZADORES-->
                    <div class="small-box bg-light-blue">
                        <div class="inner">
                            <h3>${fn:length(listaOrganizadores)}</h3>
                            <p>Num organizadores</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-person"></i>
                        </div>
                    </div>
                </div>
                <!-- ./col -->
                <div class="col-lg-2 col-xs-6">
                    <!-- small box USUARIOS-->
                    <div class="small-box bg-blue">
                        <div class="inner">
                            <h3>${fn:length(listaProveedores)}</h3>
                            <p>Num proveedores</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-person"></i>
                        </div>
                    </div>
                </div>

                <div class="col-lg-2 col-xs-6">
                    <!-- small box USUARIOS-->
                    <div class="small-box bg-lime">
                        <div class="inner">
                            <h3>${fn:length(listaServicios)}</h3>
                            <p>Servicios ofertados</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-stats-bars"></i>
                        </div>
                    </div>
                </div>
                <!-- ./col -->
                <div class="col-lg-2 col-xs-6">
                    <!-- small box ECENTOS ACTUALES-->
                    <div class="small-box bg-green">
                        <div class="inner">
                            <h3>${fn:length(listaEventos)}</h3>
                            <p>Eventos organizados</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-stats-bars"></i>
                        </div>
                    </div>
                </div>

                <!-- ./col -->
                <div class="col-lg-2 col-xs-6">
                    <!-- small box ECENTOS ACTUALES-->
                    <div class="small-box bg-gray">
                        <div class="inner">
                            <h3>${numTotalMensajes}</h3>
                            <p>Mensajes enviados</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-android-mail"></i>
                        </div>
                    </div>
                </div>
                <!-- ./col -->
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li id="tabClientes" class=""><a href="#Clientes" data-toggle="tab">Clientes</a></li>
                            <li><a href="#Proveedores" data-toggle="tab">Proveedores</a></li>
                            <li><a href="#Organizadores" data-toggle="tab">Organizadores</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane" id="Clientes">

                                <div class="table-responsive mailbox-messages">
                                    <table class="table table-hover table-striped">
                                        <thead>
                                        <tr>
                                            <th class="text-center">      </th>
                                            <th class="text-center">Email</th>
                                            <th class="text-center">Nombre</th>
                                            <th class="text-center">Provincia</th>
                                            <th class="text-center">Telefono</th>
                                            <th class="text-center">      </th>
                                        </tr>
                                        </thead>

                                        <tbody>

                                        <c:if test="${not empty listaClinetes}">

                                            <c:forEach var="cli" items="${listaClinetes}">
                                                <tr>
                                                    <!--<td><input type="checkbox"></td>-->
                                                    <td><a href="/servicios/buscarServicio/${cli.id}" type="button"
                                                           class="btn btn-default text-center"><i class="fa fa-search"></i> Ver</a>
                                                    </td>

                                                    <td class="mailbox-subject text-center">${cli.email}</td>
                                                    <td class="mailbox-subject text-center"><b>${cli.nombre}</b></td>
                                                    <td class="mailbox-subject text-center"><b>${cli.provincia}</b></td>
                                                    <td class="mailbox-subject text-center"><b>${cli.telefono}</b></td>

                                                    <td class="mailbox-subject">
                                                        <a type="button" class="btn btn-default text-center botonEliminarServicio" id="cliente-${cli.id}" data-id="${cli.id}"><i class="fa fa-trash-o"></i>Eliminar</a></td>
                                                </tr>
                                            </c:forEach>

                                        </c:if>

                                        </tbody>
                                    </table>
                                    <!-- /.table -->
                                </div>



                            </div>
                            <!-- /.tab-pane -->
                            <div class="tab-pane" id="Proveedores">

                                <div class="table-responsive mailbox-messages">
                                    <table class="table table-hover table-striped">
                                        <thead>
                                        <tr>
                                            <th class="text-center">      </th>
                                            <th class="text-center">Email</th>
                                            <th class="text-center">Empresa</th>
                                            <th class="text-center">Provincia</th>
                                            <th class="text-center">Telefono</th>
                                            <th class="text-center">      </th>
                                        </tr>
                                        </thead>

                                        <tbody>

                                        <c:if test="${not empty listaProveedores}">

                                            <c:forEach var="prov" items="${listaProveedores}">
                                                <tr>
                                                    <!--<td><input type="checkbox"></td>-->
                                                    <td><a href="/servicios/buscarServicio/${prov.id}" type="button"
                                                           class="btn btn-default text-center"><i class="fa fa-search"></i> Ver</a>
                                                    </td>

                                                    <td class="mailbox-subject text-center">${prov.email}</td>
                                                    <td class="mailbox-subject text-center"><b>${prov.empresa}</b></td>
                                                    <td class="mailbox-subject text-center"><b>${prov.provincia}</b></td>
                                                    <td class="mailbox-subject text-center"><b>${prov.telefono}</b></td>

                                                    <td class="mailbox-subject"><a type="button" class="btn btn-default text-center botonEliminarServicio" id="proveedor-${prov.id}" data-id="${prov.id}"><i class="fa fa-trash-o"></i>Eliminar</a></td>
                                                </tr>
                                            </c:forEach>

                                        </c:if>

                                        </tbody>
                                    </table>
                                    <!-- /.table -->
                                </div>



                            </div>
                            <!-- /.tab-pane -->
                            <div class="tab-pane" id="Organizadores">
                                <div class="table-responsive mailbox-messages">
                                    <table class="table table-hover table-striped">
                                        <thead>
                                        <tr>
                                            <th class="text-center">      </th>
                                            <th class="text-center">Email</th>
                                            <th class="text-center">Empresa</th>
                                            <th class="text-center">Provincia</th>
                                            <th class="text-center">Telefono</th>
                                            <th class="text-center">      </th>
                                        </tr>
                                        </thead>

                                        <tbody>

                                        <c:if test="${not empty listaOrganizadores}">

                                            <c:forEach var="orga" items="${listaOrganizadores}">
                                                <tr>
                                                    <!--<td><input type="checkbox"></td>-->
                                                    <td><a href="/servicios/buscarServicio/${orga.id}" type="button"
                                                           class="btn btn-default text-center"><i class="fa fa-search"></i> Ver</a>
                                                    </td>

                                                    <td class="mailbox-subject text-center">${orga.email}</td>
                                                    <td class="mailbox-subject text-center"><b>${orga.empresa}</b></td>
                                                    <td class="mailbox-subject text-center"><b>${orga.provincia}</b></td>
                                                    <td class="mailbox-subject text-center"><b>${orga.telefono}</b></td>

                                                    <td class="mailbox-subject">
                                                        <a type="button" class="btn btn-default text-center botonEliminarServicio" id="organizador-${prov.id}" data-id="${prov.id}"><i class="fa fa-trash-o"></i>Eliminar</a></td>
                                                </tr>
                                            </c:forEach>

                                        </c:if>

                                        </tbody>
                                    </table>
                                    <!-- /.table -->
                                </div>



                            </div>
                            <!-- /.tab-pane -->

                        </div>
                        <!-- /.tab-content -->
                    </div>
                    <!-- /.nav-tabs-custom -->
                </div>
                <!-- /.col -->

                <div class="col-md-6">
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class=""><a href="#Servicios" data-toggle="tab">Servicios</a></li>
                            <li><a href="#Eventos" data-toggle="tab">Eventos</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class=" tab-pane" id="Servicios">
                                <table class="table table-hover table-striped">
                                    <thead>
                                    <tr>
                                        <th class="text-center col-md-1">      </th>
                                        <th class="text-center col-md-1">Tipo servicio</th>
                                        <th class="text-center col-md-1">Nombre</th>
                                        <th class="text-center col-md-1">Descripción</th>
                                        <th class="text-center col-md-1">Fecha de Registro</th>
                                        <th class="text-center col-md-1">      </th>
                                    </tr>
                                    </thead>

                                    <tbody>

                                    <c:if test="${not empty listaServicios}">

                                        <c:set var="count" value="1" scope="page" />
                                        <c:forEach var="servicio" items="${listaServicios}">
                                            <tr>
                                                <!--<td><input type="checkbox"></td>-->
                                                <td class="col-md-1">
                                                    <a href="/servicios/buscarServicio/${servicio.id}" type="button"
                                                       class="btn btn-default text-center "><i class="fa fa-search"></i> Ver</a>

                                                </td>
                                                <!-- <p style="display:none;"><c:catch var="exception">${servicio.nombre}</c:catch></p>-->
                                                <td class="mailbox-subject text-center col-md-1">${servicio.tipo}</td>
                                                <td class="mailbox-subject text-center col-md-1"><b>${servicio.nombre}</b></td>
                                                <td class="mailbox-subject col-md-1">${fn:substring(servicio.descripcion, 0, 70)}...</td>
                                                <td class="mailbox-date text- col-md-1">
                                                    <fmt:formatDate type = "date" value = "${servicio.fechaRegistro}" />
                                                </td>
                                                <td class="mailbox-subject col-md-1"><a type="button" class="btn btn-default text-center botonEliminarServicio" id="servicio-${servicio.id}" data-id="${servicio.id}"><i class="fa fa-trash-o"></i>Eliminar</a></td>
                                            </tr>
                                        </c:forEach>

                                    </c:if>

                                    </tbody>
                                </table>


                            </div>
                            <div class="tab-pane" id="Eventos">
                                <div class="table-responsive mailbox-messages">
                                    <table class="table table-hover table-striped">
                                        <thead>
                                        <tr>
                                            <th class="text-center">      </th>
                                            <th class="text-center">Tipo evento</th>
                                            <th class="text-center">Nombre</th>
                                            <th class="text-center">Descripción</th>
                                            <th class="text-center">Fecha de Inicio</th>
                                            <th class="text-center">Fecha de Fin</th>
                                            <th class="text-center">      </th>
                                        </tr>
                                        </thead>

                                        <tbody>

                                        <c:if test="${not empty listaEventos}">

                                            <c:forEach var="evento" items="${listaEventos}">
                                                <tr>
                                                    <!--<td><input type="checkbox"></td>-->
                                                    <td>
                                                        <a href="/servicios/buscarServicio/${evento.id}" type="button"
                                                           class="btn btn-default text-center"><i class="fa fa-search"></i> Ver</a>

                                                    </td>
                                                    <td class="mailbox-subject text-center">${evento.categoria}</td>
                                                    <!-- <p style="display:none;"><c:catch var="exception">${evento.nombre}</c:catch></p>-->

                                                    <td class="mailbox-subject text-center"><b>${evento.nombre}</b></td>
                                                    <td class="mailbox-subject">${fn:substring(evento.descripcion, 0, 30)}...</td>
                                                    <td class="mailbox-date text-center">
                                                        <fmt:formatDate type = "date" value = "${evento.fechaInicio}" />
                                                    </td>
                                                    <td class="mailbox-date text-center">
                                                        <fmt:formatDate type = "date" value = "${evento.fechaFin}" />
                                                    </td>
                                                    <td class="mailbox-subject"><a type="button" class="btn btn-default text-center botonEliminarServicio" id="evento-${evento.id}" data-id="${evento.id}"><i class="fa fa-trash-o"></i>Eliminar</a></td>
                                                </tr>
                                            </c:forEach>

                                        </c:if>

                                        </tbody>
                                    </table>
                                    <!-- /.table -->
                                </div>

                            </div>
                        </div>

                    </div>
                    <!-- /.tab-content -->
                </div>
                <!-- /.nav-tabs-custom -->
            </div>
            <!-- /.row -->

</section>
<!-- /.box-body -->
</div>

<!-- footer -->
<%@ include file="../fragments/footer.jspf" %>
<!-- control-sidebar -->
<%@ include file="../fragments/control-sidebar.jspf" %>
<!-- Add the sidebar's background. This div must be placed
immediately after the control sidebar -->
<div class="control-sidebar-bg"></div>
</div>


<%@ include file="../fragments/plugins.jspf" %>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>

<<<<<<< HEAD
<script src="/dist/js/scriptChartsRodri.js"></script>
=======
<!-- dateRangePicker -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="/plugins/daterangepicker/daterangepicker.js"></script>
-->

<!-- datepicker -->
<!-- <script src="/plugins/datepicker/bootstrap-datepicker.js"></script> -->

<!-- Bootstrap WYSIHTML5 -->
<!-- <script src="/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script> -->

<!-- Script for Charts of Evolucion usuarios -->
<script src="<c:url value="/resources/dist/js/scriptChartsRodri.js" />"></script>
>>>>>>> 44622fcf781cea692be54249b86528cea6beb841


</body>
</html>