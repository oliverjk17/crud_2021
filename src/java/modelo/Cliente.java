/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author OLIVER
 */
public class Cliente extends Persona {
    private int nit;
    private Conexion cn;
    
    public Cliente(){}

    public Cliente(int nit, int id, String nombres, String apellidos, String direccion, String telefono, String fecha_nacimiento) {
        super(id, nombres, apellidos, direccion, telefono, fecha_nacimiento);
        this.nit = nit;
    }

    public int getNit() {
        return nit;
    }

    public void setNit(int nit) {
        this.nit = nit;
    }
    
    public DefaultTableModel leer(){
        DefaultTableModel tabla = new DefaultTableModel();
        try {
            cn = new Conexion();
            cn.abrir_conexion();
            String query = "SELECT id_clientes as id,nit,nombres,apellidos,direccion,telefono,fecha_nacimiento FROM clientes;";
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            String encabezado[] = {"id","nit","nombres","apellidos","direccion","telefono","fecha_nacimiento"};
            tabla.setColumnIdentifiers(encabezado);
            String datos[] = new String[7];
            while(consulta.next()){
                datos[0] = consulta.getString("id");
                datos[1] = consulta.getString("nit");
                datos[2] = consulta.getString("nombres");
                datos[3] = consulta.getString("apellidos");
                datos[4] = consulta.getString("direccion");
                datos[5] = consulta.getString("telefono");
                datos[6] = consulta.getString("fecha_nacimiento");
                tabla.addRow(datos);
            }
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            cn.cerrar_conexion();
            System.out.println("Error..."+ex.getMessage());
        }
        return tabla;
    }
    
     @Override
    public int agregar(){
        int retorno = 0;
         try {
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "INSERT INTO clientes(nit,nombres,apellidos,direccion,telefono,fecha_nacimiento) VALUES(?,?,?,?,?,?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getNit());
            parametro.setString(2,getNombres());
            parametro.setString(3,getApellidos());
            parametro.setString(4,getDireccion());
            parametro.setString(5,getTelefono());
            parametro.setString(6,getFecha_nacimiento());
            retorno=parametro.executeUpdate();
            cn.cerrar_conexion();
         } catch (SQLException ex) {
            cn.cerrar_conexion();
            System.out.println("Error..."+ex.getMessage());
            retorno = 0;
         }
        return retorno;
    }
    
    @Override
    public int modificar(){
        int retorno = 0;
        try {
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "UPDATE clientes set nit=?,nombres=?,apellidos=?,direccion=?,telefono=?,fecha_nacimiento=? where id_clientes=?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getNit());
            parametro.setString(2, getNombres());
            parametro.setString(3, getApellidos());
            parametro.setString(4, getDireccion());
            parametro.setString(5, getTelefono());
            parametro.setString(6, getFecha_nacimiento());
            parametro.setInt(7, getId());
            retorno=parametro.executeUpdate();
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            cn.cerrar_conexion();
            System.out.println("Error..."+ex.getMessage());
            retorno = 0;
        }
        return retorno;
    }

    @Override
    public int eliminar(){
        int retorno = 0;
        try {
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "DELETE FROM clientes where id_clientes=?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getId());
            retorno=parametro.executeUpdate();
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            cn.cerrar_conexion();
            System.out.println("Error..."+ex.getMessage());
            retorno = 0;
        }
        return retorno;
    }
}
