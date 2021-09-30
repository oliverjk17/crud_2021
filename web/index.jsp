<%-- 
    Document   : index
    Created on : 27/09/2021, 22:43:26
    Author     : OLIVER
--%>
<%@page import="modelo.Puesto" %>
<%@page import="modelo.Empleado" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page import="java.util.HashMap" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empleados</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <h1 align="center">Formulario empleados</h1>
        <br>
        <h3 ><a   href="clientes.jsp" > Clientes.</a></h3>
        <br>
        <br>
        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal_empleado" onclick="limpiar()">Nuevo</button>
        <br>
        <div class="container">
        <div class="modal" id="modal_empleado">
        <div class="modal-dialog">
        <div class="modal-content">
      
        
        <!-- Modal body -->
        <div class="modal-body">
              <form action="sr_empleado" method="post" class="form-group">
                <label for="lbl_id">Id:</label>
                <input type="text" id="txt_id" name="txt_id" class="form-control" value="0" readonly="">
                <label for="lbl_codigo">Codigo:</label>
                <input type="text" id="txt_codigo" name="txt_codigo" class="form-control" placeholder="Ejemplo: J000" required="" pattern="[J]{1}[0-9]{3}">
                <label for="lbl_nombres">Nombres:</label>
                <input type="text" id="txt_nombres" name="txt_nombres" class="form-control" placeholder="Nombre1 Nombre2" required="" pattern="[A-Z]{1}[a-z]{2,9}([ ][A-Z]{1}[a-z]{2,9})?">
                <label for="lbl_apellidos">Apellidos:</label>
                <input type="text" id="txt_apellidos" name="txt_apellidos" class="form-control" placeholder="Apellido1 Apellido2" required="" pattern="[A-Z]{1}[a-z]{2,9}([ ][A-Z]{1}[a-z]{2,9})?">
                <label for="lbl_direccion">Dirección:</label>
                <input type="text" id="txt_direccion" name="txt_direccion" class="form-control" placeholder="1av 1Calle Zona1" required="">
                <label for="lbl_telefono">Telefono:</label>
                <input type="number" id="txt_telefono" name="txt_telefono" class="form-control" placeholder="11110000" required="" pattern="[0-9]{8}">
                <label for="lbl_fn">Fecha de nacimiento:</label>
                <input type="date" id="txt_fn" name="txt_fn" class="form-control" required="">
                <label for="lbl_puesto">Puesto:</label>
                <select name="drop_puesto" id="drop_puesto" class="form-control">
                    <%
                        Puesto puesto = new Puesto();
                        HashMap<String,String> drop = puesto.drop_puesto();
                        for(String i: drop.keySet()){
                            out.println("<option value='"+i+"'>"+ drop.get(i) +"</option>");
                        }
                    %>
                </select>
                <br>
                <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-outline-success btn-lg">Agregar</button>
                <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-outline-secondary btn-lg">Modificar</button>
                <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-outline-danger btn-lg" onclick="javascript:if(!confirm('¿Desea eliminar?'))return false">Eliminar</button>
                <button class="btn btn-outline-warning btn-lg" data-dismiss="modal">Cerrar</button>
            </form>
        </div>
        
        
        </div>
        </div>
        </div>
        
                
    <table class="table table-striped">
    <thead>
      <tr>
        <th>Codigo</th>
        <th>Nombres</th>
        <th>Apellidos</th>
        <th>Direccion</th>
        <th>Telefono</th>
        <th>Nacimiento</th>
        <th>Puesto</th>
      </tr>
    </thead>
    <tbody id="tbl_empleados">
      <%
          Empleado empleado = new Empleado();
          DefaultTableModel tabla = new DefaultTableModel();
          tabla = empleado.leer();
          for(int t=0;t<tabla.getRowCount();t++){
              out.println("<tr data-id="+ tabla.getValueAt(t,0) +" data-id_p="+ tabla.getValueAt(t,8) +">");
              out.println("<td>"+ tabla.getValueAt(t,1) +"</td>");
              out.println("<td>"+ tabla.getValueAt(t,2) +"</td>");
              out.println("<td>"+ tabla.getValueAt(t,3) +"</td>");
              out.println("<td>"+ tabla.getValueAt(t,4) +"</td>");
              out.println("<td>"+ tabla.getValueAt(t,5) +"</td>");
              out.println("<td>"+ tabla.getValueAt(t,6) +"</td>");
              out.println("<td>"+ tabla.getValueAt(t,7) +"</td>");
              out.println("</tr>");
          }
      %>
    </tbody>
  </table>    
        </div>
        
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script type="text/javascript">
            function limpiar(){
               $("#txt_id").val(0);
               $("#txt_codigo").val('');
               $("#txt_nombres").val('');
               $("#txt_apellidos").val('');
               $("#txt_direccion").val('');
               $("#txt_telefono").val('');
               $("#txt_fn").val('');
               $("#drop_puesto").val(1);
            }
            
            $('#tbl_empleados').on('click','tr td',function(evt){
               var target,id,id_p,codigo,nombres,apellidos,direccion,telefono,nacimiento;
               target = $(event.target);
               id = target.parent().data('id');
               id_p = target.parent().data('id_p');
               codigo = target.parent("tr").find("td").eq(0).html();
               nombres = target.parent("tr").find("td").eq(1).html();
               apellidos = target.parent("tr").find("td").eq(2).html();
               direccion = target.parent("tr").find("td").eq(3).html();
               telefono = target.parent("tr").find("td").eq(4).html();
               nacimiento = target.parent("tr").find("td").eq(5).html();
               $("#txt_id").val(id);
               $("#txt_codigo").val(codigo);
               $("#txt_nombres").val(nombres);
               $("#txt_apellidos").val(apellidos);
               $("#txt_direccion").val(direccion);
               $("#txt_telefono").val(telefono);
               $("#txt_fn").val(nacimiento);
               $("#drop_puesto").val(id_p);
               $("#modal_empleado").modal('show');
            });
        </script>
    </body>
</html>
