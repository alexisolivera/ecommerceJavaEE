/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cad;

import JavaBeans.Producto;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Alexis
 */
public class ProductoCad {

    /*
    Esta clase nos ofrece los metodos necesarios para interactuar
    con la base de datos.
    */
    public static boolean registrarProducto(Producto producto) {
        try {
            String sql = "{call sp_registrarproducto(?,?,?,?,?,?,?,?,?,?,?)}";
            Connection c = Conexion.conectar();
            CallableStatement sentencia = c.prepareCall(sql);
            //La sentencia prepara el statement que sera ejecutado luego de reemplazar
            // cada ? por los atributos seteados a continuacion.
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
            // si la sentencia afecta al menos una tupla de la tabla, el statement nos va a devolver verdadero
            // y asi sabemos que fue exitosa.
            return sentencia.executeUpdate() > 0;

        } catch (SQLException ex) {
            return false;
        }

    }

    public static ArrayList<Producto> listarProductosRecomendados() {
        try {
            String sql = "{call sp_listarRecomendados()}";
            Connection c = Conexion.conectar();
            CallableStatement sentencia = c.prepareCall(sql);
            //sentencia.setString(1, moneda);

            ResultSet res = sentencia.executeQuery();
            ArrayList<Producto> lista = new ArrayList<>();
            while (res.next()) {
                Producto p = new Producto();
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

    public static ArrayList<Producto> listarProductoPorCategoria(int cat) {
        try {
            String sql = "{call sp_listarPorCategoria(?)}";
            Connection c = Conexion.conectar();
            CallableStatement sentencia = c.prepareCall(sql);
            sentencia.setInt(1, cat);

            ResultSet res = sentencia.executeQuery();
            ArrayList<Producto> lista = new ArrayList<>();
            while (res.next()) {
                Producto p = new Producto();
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

    public static ArrayList<Producto> listarProductoPorMarca(int marca) {
        try {
            String sql = "{call sp_listarPorMarca(?)}";
            Connection c = Conexion.conectar();
            CallableStatement sentencia = c.prepareCall(sql);
            sentencia.setInt(1, marca);

            ResultSet res = sentencia.executeQuery();
            ArrayList<Producto> lista = new ArrayList<>();
            while (res.next()) {
                Producto p = new Producto();
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

    public static Producto consultarProducto(int webId) {
        try {
            String sql = "{call sp_consultarProducto(?)}";
            Connection c = Conexion.conectar();
            CallableStatement sentencia = c.prepareCall(sql);
            sentencia.setInt(1, webId);
            ResultSet res = sentencia.executeQuery();
            Producto p = null;
            if (res.next()) {
                p = new Producto();
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
    public static ArrayList<Producto> listarTodosLosProductos() {
        try {
            String sql = "{call sp_ListarTodosLosProductos}";
            Connection connection = Conexion.conectar();
            CallableStatement sentencia = connection.prepareCall(sql);
            ResultSet result = sentencia.executeQuery();
            ArrayList<Producto> allProducts = new ArrayList<>();
            while (result.next()) {
                Producto p = new Producto();
                p.setWebId(result.getString("webId"));
                p.setNombre(result.getString("nombre"));
                p.setImg(result.getString("img"));
                p.setPrecio(result.getFloat("precio"));
                p.setPrecionuevo(result.getFloat("precionuevo"));
                p.setStock(result.getInt("stock"));
                p.setNuevo(result.getBoolean("nuevo"));
                allProducts.add(p);
            }
            return allProducts;
        } catch (SQLException ex) {
            return null;
        }
    }
}
