/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import JavaBeans.ProductoTerminar;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Alexis
 */
public class ControlProducto extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControlProducto</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControlProducto at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        
        String url = subirImagen(request);
        String nombre = request.getParameter("nombre");
        float precio = Float.parseFloat(request.getParameter("precio"));
        float precion = Float.parseFloat(request.getParameter("precionuevo"));
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        int marca = Integer.parseInt(request.getParameter("marca"));
        int categoria = Integer.parseInt(request.getParameter("categoria"));
        String descripcion = request.getParameter("descripcion");
        boolean nuevo= request.getParameter("nuevo").equalsIgnoreCase("on");
        boolean recomendado= request.getParameter("recomendado").equalsIgnoreCase("on");
        boolean visible= request.getParameter("visible").equalsIgnoreCase("on");
        
        String accion = request.getParameter("descripcion");
        
        ProductoTerminar producto = new ProductoTerminar();
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
        
        //response.sendRedirect("foto/"+url);
        
    }

    private String subirImagen(HttpServletRequest request){
        try {
            FileItemFactory fileFactory = new DiskFileItemFactory();
            
            ServletFileUpload servletUpload = new ServletFileUpload(fileFactory);
            String nombre = "";
            List items = servletUpload.parseRequest(request);
            for(int i=0;i<items.size();i++){
                FileItem item = (FileItem) items.get(i);
                if(!item.isFormField()){
                   String ruta = request.getServletContext().getRealPath("/")+"foto/";
                    SimpleDateFormat sdf = new SimpleDateFormat("ddMyyyyhhmmss");
                    String fecha = sdf.format(new Date());
                    nombre = fecha+new Random().nextLong()+item.getName();
                    String nuevoNombre = ruta+nombre;
                    File folder = new File(ruta);
                    if(!folder.exists()){
                        folder.mkdirs();
                    }
                    File imagen = new File(nuevoNombre);
                    if(item.getContentType().contains("image")){
                        item.write(imagen);
                        request.setAttribute("subida", true);
                        return nombre;
                    }
                }
            }
        } catch (FileUploadException ex) {
            request.setAttribute("subida", false);
        } catch (Exception ex) {
            request.setAttribute("subida", false);
        }
        return "";
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
