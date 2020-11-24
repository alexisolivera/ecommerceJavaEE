/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cad;

import JavaBeans.Usuario;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Alexis
 */
public class IniciarSesionCad {
    public static boolean autentificarUsuario(Usuario usuario){
        try {
            String sql = "{call sp_iniciarSesion(?,?)}";
            Connection c = Conexion.conectar();
            CallableStatement sentencia = c.prepareCall(sql);
            sentencia.setString(1, usuario.getUsuario());
            sentencia.setString(2, usuario.getClave());
            ResultSet executeQuery = sentencia.executeQuery();
            if(executeQuery.absolute(1)){
                return true;
            }
        } catch (SQLException e) {
            
            System.out.println(e);
        }
        return false;
    }
}
