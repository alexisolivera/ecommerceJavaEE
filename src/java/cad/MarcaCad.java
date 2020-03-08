/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cad;

import JavaBeans.Marca;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Alexis
 */
public class MarcaCad {
    public static ArrayList<Marca> listarTodoDeMarcas(){
        try {
            String sql= "{call sp_listartododeMarca()}";
            Connection c=Conexion.conectar();
            CallableStatement sentencia=c.prepareCall(sql);
            //sentencia.setInt(1, catSuperior);
            ResultSet resultado = sentencia.executeQuery();
            ArrayList<Marca> lista=new ArrayList<>();
            while (resultado.next()) {                
                Marca m=new Marca();
                m.setCodigo(resultado.getInt("codigo"));
                m.setNombre(resultado.getString("nombre"));
                lista.add(m);
            }
            return lista;
        } catch (SQLException ex) {
            return null;
        }
    }
}
