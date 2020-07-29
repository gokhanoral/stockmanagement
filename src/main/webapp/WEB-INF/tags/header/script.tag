<script src="../../../templates/plugins/jQuery/jQuery-2.1.3.min.js"></script>
<!-- Bootstrap 3.3.2 JS -->
<script src="../../../templates/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<!-- DATA TABES SCRIPT -->
<script src="../../../templates/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
<script src="../../../templates/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
<!-- SlimScroll -->
<script src="../../../templates/plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<!-- FastClick -->
<script src='../../../templates/plugins/fastclick/fastclick.min.js'></script>
<!-- AdminLTE App -->
<script src="../../../templates/dist/js/app.min.js" type="text/javascript"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../../templates/dist/js/demo.js" type="text/javascript"></script>
<!-- page script -->
<script type="text/javascript">
    $(function () {
        $("#example1").dataTable();
        $('#example2').dataTable({
            "bPaginate": true,
            "bLengthChange": false,
            "bFilter": false,
            "bSort": true,
            "bInfo": true,
            "bAutoWidth": false
        });
    });
</script>