/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import JavaBeans.Producto;
import cad.ProductoCad;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Alexis
 */
//@WebServlet(name = "ControlmandaDatosParaEditar", urlPatterns = {"/ControlmandaDatosParaEditar"})
public class ControlmandaDatosParaEditar extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String codigo = request.getParameter("codigo");
        String nombre = request.getParameter("nombre");
        float precio = Float.parseFloat(request.getParameter("precio"));
        float precion = Float.parseFloat(request.getParameter("precionuevo"));
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        int marca = Integer.parseInt(request.getParameter("marca"));
        int categoria = Integer.parseInt(request.getParameter("categoria"));
        String descripcion = request.getParameter("descripcion");
        boolean nuevo, recomendado, visible;
        
        try{
        nuevo = request.getParameter("nuevo").equalsIgnoreCase("on");
        }catch(Exception e){
        nuevo = false;
        }
            
        try{
        recomendado = request.getParameter("recomendado").equalsIgnoreCase("on");
        }catch(Exception e){
        recomendado = false;
        }
        
        try{
        visible = request.getParameter("visible").equalsIgnoreCase("on");
        }catch(Exception e){
        visible = false;
        }
        
        Producto producto = new Producto();
        producto.setWebId(codigo);
        producto.setNombre(nombre);
        producto.setPrecio(precio);
        producto.setPrecionuevo(precion);
        producto.setStock(cantidad);
        producto.setCodigo_marca(marca);
        producto.setCodigo_categoria(categoria);
        producto.setDescripcion(descripcion);
        producto.setRecomendado(recomendado);
        producto.setNuevo(nuevo);
        producto.setVisible(visible);
        if(ProductoCad.editarProducto(producto)){
            request.getRequestDispatcher("WEB-INF/admin/editProduct.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
