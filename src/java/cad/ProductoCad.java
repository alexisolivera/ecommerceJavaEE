/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cad;

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
            sentencia.setBoolean(5, producto.isNuevo());
            sentencia.setBoolean(6, producto.isRecomendado());
            sentencia.setString(7, producto.getDescripcion());
            sentencia.setBoolean(8, producto.isVisible());
            sentencia.setInt(9, producto.getCodigo_marca());
            sentencia.setInt(10, producto.getCodigo_categoria());
            sentencia.setString(11, producto.getImg());
            
            return sentencia.executeUpdate()>0;
            
        } catch (SQLException ex) {
            return false;
        }
        
    }
    
    public static ArrayList<ProductoTerminar> listarProductosRecomendados(String moneda){
        try {
            String sql= "{call sp_listarRecomendado(?)}";
            Connection c=Conexion.conectar();
            CallableStatement sentencia=c.prepareCall(sql);
            sentencia.setString(1, moneda);
            
            
            ResultSet res = sentencia.executeQuery();
            ArrayList<ProductoTerminar> lista = new ArrayList<>();
            while (res.next()) {
                ProductoTerminar p = new ProductoTerminar();
                p.setNombre(res.getString("nombre"));
                p.setImg(res.getString("img"));
                p.setPrecio(res.getFloat("precio"));
                p.setPrecionuevo(res.getFloat("precionuevo"));
                lista.add(p);
            }
            return lista;
        } catch (SQLException ex) {
            return null;
        }
        
    }
    
    /*
 
p_visible boolean,
p_codigo_marca int,
p_codigo_categoria int,
p_img varchar(100)
    */
}
