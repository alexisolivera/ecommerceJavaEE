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
    
    
    
    public static ArrayList<ProductoTerminar> listarProductosRecomendados(){
        try {
            String sql= "{call sp_listarRecomendados()}";
            Connection c=Conexion.conectar();
            CallableStatement sentencia=c.prepareCall(sql);
            //sentencia.setString(1, moneda);
         
            
            ResultSet res = sentencia.executeQuery();
            ArrayList<ProductoTerminar> lista = new ArrayList<>();
            while (res.next()) {
                ProductoTerminar p = new ProductoTerminar();
                p.setWebId(res.getString("webId"));
                p.setNombre(res.getString("nombre"));
                p.setImg(res.getString("img"));
                p.setPrecio(res.getFloat("precio"));
                p.setPrecionuevo(res.getFloat("precionuevo"));
                p.setStock(res.getInt("stock"));
                p.setNuevo(res.getBoolean("nuevo"));
                lista.add(p);
            }
            return lista;
        } catch (SQLException ex) {
            return null;
        }
        
    }
    
    
    public static ArrayList<ProductoTerminar> listarProductoPorCategoria(int cat){
        try {
            String sql= "{call sp_listarPorCategoria(?)}";
            Connection c=Conexion.conectar();
            CallableStatement sentencia=c.prepareCall(sql);
            sentencia.setInt(1, cat);
         
            
            ResultSet res = sentencia.executeQuery();
            ArrayList<ProductoTerminar> lista = new ArrayList<>();
            while (res.next()) {
                ProductoTerminar p = new ProductoTerminar();
                p.setWebId(res.getString("webId"));
                p.setNombre(res.getString("nombre"));
                p.setImg(res.getString("img"));
                p.setPrecio(res.getFloat("precio"));
                p.setPrecionuevo(res.getFloat("precionuevo"));
                p.setStock(res.getInt("stock"));
                p.setNuevo(res.getBoolean("nuevo"));
                lista.add(p);
            }
            return lista;
        } catch (SQLException ex) {
            return null;
        }
        
    }
    
    public static ArrayList<ProductoTerminar> listarProductoPorMarca(int marca){
        try {
            String sql= "{call sp_listarPorMarca(?)}";
            Connection c=Conexion.conectar();
            CallableStatement sentencia=c.prepareCall(sql);
            sentencia.setInt(1, marca);
            
            
            ResultSet res = sentencia.executeQuery();
            ArrayList<ProductoTerminar> lista = new ArrayList<>();
            while (res.next()) {
                ProductoTerminar p = new ProductoTerminar();
                p.setWebId(res.getString("webId"));
                p.setNombre(res.getString("nombre"));
                p.setImg(res.getString("img"));
                p.setPrecio(res.getFloat("precio"));
                p.setPrecionuevo(res.getFloat("precionuevo"));
                p.setStock(res.getInt("stock"));
                p.setNuevo(res.getBoolean("nuevo"));
                lista.add(p);
            }
            return lista;
        } catch (SQLException ex) {
            return null;
        }
        
    }
    
        public static ProductoTerminar consultarProducto(int webId){
        try {
            String sql= "{call sp_consultarProducto(?)}";
            Connection c=Conexion.conectar();
            CallableStatement sentencia=c.prepareCall(sql);
            sentencia.setInt(1, webId);
            
            
            ResultSet res = sentencia.executeQuery();
            ProductoTerminar p = null;
            if (res.next()) {
                p = new ProductoTerminar();
                p.setWebId(res.getString("webId"));
                p.setNombre(res.getString("nombre"));
                p.setImg(res.getString("img"));
                p.setPrecio(res.getFloat("precio"));
                p.setPrecionuevo(res.getFloat("precionuevo"));
                p.setStock(res.getInt("stock"));
                p.setNuevo(res.getBoolean("nuevo"));                
            }
            return p;
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
