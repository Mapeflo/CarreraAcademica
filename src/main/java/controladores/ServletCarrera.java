package controladores;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modelo.CRUDCarreraAcademica;
import modelo.CarreraAcademica;
import modelo.Usuario;

@WebServlet(name = "ServletCarrera", urlPatterns = {"/carrera"})
public class ServletCarrera extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");


        HttpSession sesion = request.getSession();
        Usuario usuarioLogueado = (Usuario) sesion.getAttribute("usuario.login");
        if (usuarioLogueado == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        CRUDCarreraAcademica crud = new CRUDCarreraAcademica();

        try {
            if (accion == null) {
                response.sendRedirect("index.jsp");
                return;
            }

            switch (accion) {
                case "listartodo":
                    List<CarreraAcademica> lista = crud.listarTodos();
                    sesion.setAttribute("carrera.listar", lista);
                    response.sendRedirect("carrera/listar.jsp");
                    break;

                case "agregar":
                    CarreraAcademica nueva = new CarreraAcademica();
                    nueva.setNombre(request.getParameter("nombre"));
                    nueva.setNumCreditos(Integer.parseInt(request.getParameter("numCreditos")));
                    nueva.setNumAsignaturas(Integer.parseInt(request.getParameter("numAsignaturas")));
                    nueva.setNumSemestres(Integer.parseInt(request.getParameter("numSemestres")));
                    nueva.setNivelFormacion(request.getParameter("nivelFormacion"));
                    nueva.setTitulo(request.getParameter("titulo"));
                    nueva.setValorSemestre(Double.parseDouble(request.getParameter("valorSemestre")));
                    nueva.setUniversidad(request.getParameter("universidad"));
                    nueva.setEsAcreditada(request.getParameter("esAcreditada") != null);
                    nueva.setPerfiles(request.getParameter("perfiles"));
                    nueva.setAreaConocimiento(request.getParameter("areaConocimiento"));
                    crud.agregar(nueva);
                    response.sendRedirect("carrera?accion=listartodo");
                    break;

                case "buscar":
                    int idBuscar = Integer.parseInt(request.getParameter("id"));
                    CarreraAcademica encontrada = crud.consultar(idBuscar);
                    sesion.setAttribute("carrera.buscar", encontrada);
                    String redir = request.getParameter("redir");
                    if ("modificar".equals(redir)) {
                        response.sendRedirect("carrera/modificar.jsp");
                    } else if ("eliminar".equals(redir)) {
                        response.sendRedirect("carrera/eliminar.jsp");
                    } else {
                        response.sendRedirect("carrera/buscar.jsp");
                    }
                    break;

                case "modificar":
                    CarreraAcademica mod = new CarreraAcademica();
                    mod.setId(Integer.parseInt(request.getParameter("id")));
                    mod.setNombre(request.getParameter("nombre"));
                    mod.setNumCreditos(Integer.parseInt(request.getParameter("numCreditos")));
                    mod.setNumAsignaturas(Integer.parseInt(request.getParameter("numAsignaturas")));
                    mod.setNumSemestres(Integer.parseInt(request.getParameter("numSemestres")));
                    mod.setNivelFormacion(request.getParameter("nivelFormacion"));
                    mod.setTitulo(request.getParameter("titulo"));
                    mod.setValorSemestre(Double.parseDouble(request.getParameter("valorSemestre")));
                    mod.setUniversidad(request.getParameter("universidad"));
                    mod.setEsAcreditada(request.getParameter("esAcreditada") != null);
                    mod.setPerfiles(request.getParameter("perfiles"));
                    mod.setAreaConocimiento(request.getParameter("areaConocimiento"));
                    crud.modificar(mod);
                    response.sendRedirect("carrera?accion=listartodo");
                    break;

                case "borrar":
                    int idBorrar = Integer.parseInt(request.getParameter("id"));
                    crud.eliminar(idBorrar);
                    response.sendRedirect("carrera?accion=listartodo");
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