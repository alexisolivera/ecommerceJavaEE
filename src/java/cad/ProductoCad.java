/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cad;

import JavaBeans.Categoria;
import JavaBeans.ProductoTerminar;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Alexis
 */
public class ProductoCad {
    
    public static boolean registrarProducto(ProductoTerminar producto){
        try {
            String sql= "{call sp_registrarproducto(?,?,?,?,?,?,?,?,?,?,?)}";
            Connection c=Conexion.conectar();
            CallableStatement sentencia=c.prepareCall(sql);
            sentencia.setString(1, producto.getNombre());
            sentencia.setFloat(2, producto.getPrecio());
            sentencia.setFloat(3, producto.getPrecionuevo());
            sentencia.setInt(4, producto.getStock());
            sentencia.setString(1, producto.getNombre());
            ResultSet resultado = sentencia.executeQuery();
            ArrayList<Categoria> lista=new ArrayList<>();
            while (resultado.next()) {                
                Categoria cat=new Categoria();
                cat.setCodigo(resultado.getInt("codigo"));
                cat.setNombre(resultado.getString("nombre"));
                lista.add(cat);
            }
            return true; //lista;
        } catch (SQLException ex) {
            //TODO
        }
        return false;
    }
}
