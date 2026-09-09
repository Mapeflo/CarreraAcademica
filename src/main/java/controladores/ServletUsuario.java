package controladores;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modelo.CRUDUsuario;
import modelo.Usuario;

@WebServlet(name = "ServletUsuario", urlPatterns = {"/usuario"})
public class ServletUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");

        CRUDUsuario crud = new CRUDUsuario();
        HttpSession sesion = request.getSession();

        try {
            if (accion == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            switch (accion) {
                case "login":
                    String nombre = request.getParameter("nombre");
                    String clave = request.getParameter("clave");
                    Usuario logueado = crud.iniciarSesion(clave, nombre);

                    if (logueado != null) {
                        sesion.setAttribute("usuario.login", logueado);
                        response.sendRedirect("index.jsp");
                    } else {
                        response.sendRedirect("login.jsp?error=Credenciales incorrectas");
                    }
                    break;

                case "salir":
                    sesion.invalidate();
                    response.sendRedirect("login.jsp");
                    break;

                case "listartodo":
                    List<Usuario> lista = crud.listarTodosLosUsuarios();
                    sesion.setAttribute("usuario.listar", lista);
                    response.sendRedirect("usuario/listar.jsp");
                    break;

                case "agregar":
                    Usuario nuevo = new Usuario();
                    nuevo.setClave(request.getParameter("clave"));
                    nuevo.setNombre(request.getParameter("nombre"));
                    nuevo.setRol(request.getParameter("rol"));
                    nuevo.setEmail(request.getParameter("email"));
                    crud.agregarUsuario(nuevo);
                    response.sendRedirect("usuario?accion=listartodo");
                    break;

                case "buscar":
                    int idBuscar = Integer.parseInt(request.getParameter("id"));
                    Usuario encontrado = crud.consultarUsuario(idBuscar);
                    sesion.setAttribute("usuario.buscar", encontrado);
                    String redir = request.getParameter("redir");
                    if (redir != null && redir.equals("modificar")) {
                        response.sendRedirect("usuario/modificar.jsp");
                    } else if (redir != null && redir.equals("eliminar")) {
                        response.sendRedirect("usuario/eliminar.jsp");
                    } else {
                        response.sendRedirect("usuario/ver.jsp");
                    }
                    break;

                case "modificar":
                    Usuario mod = new Usuario();
                    mod.setId(Integer.parseInt(request.getParameter("id")));
                    mod.setClave(request.getParameter("clave"));
                    mod.setNombre(request.getParameter("nombre"));
                    mod.setRol(request.getParameter("rol"));
                    mod.setEmail(request.getParameter("email"));
                    crud.modificarUsuario(mod);
                    response.sendRedirect("usuario?accion=listartodo");
                    break;

                case "borrar":
                    int idBorrar = Integer.parseInt(request.getParameter("id"));
                    crud.eliminarUsuario(idBorrar);
                    response.sendRedirect("usuario?accion=listartodo");
                    break;

                case "reporteRol":
                    String rol = request.getParameter("rol");
                    List<Usuario> listaRol = crud.buscarPorRol(rol);
                    sesion.setAttribute("usuario.reporte", listaRol);
                    sesion.setAttribute("titulo.reporte", "Usuarios con rol: " + rol);
                    response.sendRedirect("usuario/reporte.jsp");
                    break;

                case "reporteNombre":
                    String nombreBuscar = request.getParameter("nombre");
                    List<Usuario> listaNombre = crud.buscarPorNombre(nombreBuscar);
                    sesion.setAttribute("usuario.reporte", listaNombre);
                    sesion.setAttribute("titulo.reporte", "Usuarios que contienen: " + nombreBuscar);
                    response.sendRedirect("usuario/reporte.jsp");
                    break;
                default:
                    response.sendRedirect("index.jsp");
            }

        } catch (Exception e) {
            response.sendRedirect("mensaje.jsp?mensaje=Error: " + e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}