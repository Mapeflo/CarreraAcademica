package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CRUDUsuario {

    private Usuario usuario;
    private ConexionBaseDatos baseDatos;

    public CRUDUsuario() {
        usuario = new Usuario();
        baseDatos = new ConexionBaseDatos();
    }

    // Agregar usuario
    public void agregarUsuario(Usuario u) throws Exception {
        try {
            baseDatos.conectar();
            String sql = "INSERT INTO usuario (clave, nombre, rol, email) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = baseDatos.crearSentencia(sql);
            ps.setString(1, u.getClave());
            ps.setString(2, u.getNombre());
            ps.setString(3, u.getRol());
            ps.setString(4, u.getEmail());
            baseDatos.actualizar(ps);
        } finally {
            baseDatos.desconectar();
        }
    }

    // Modificar usuario
    public void modificarUsuario(Usuario u) throws Exception {
        try {
            baseDatos.conectar();
            String sql = "UPDATE usuario SET clave=?, nombre=?, rol=?, email=? WHERE id=?";
            PreparedStatement ps = baseDatos.crearSentencia(sql);
            ps.setString(1, u.getClave());
            ps.setString(2, u.getNombre());
            ps.setString(3, u.getRol());
            ps.setString(4, u.getEmail());
            ps.setInt(5, u.getId());
            baseDatos.actualizar(ps);
        } finally {
            baseDatos.desconectar();
        }
    }

    // Eliminar usuario
    public void eliminarUsuario(int id) throws Exception {
        try {
            baseDatos.conectar();
            String sql = "DELETE FROM usuario WHERE id=?";
            PreparedStatement ps = baseDatos.crearSentencia(sql);
            ps.setInt(1, id);
            baseDatos.actualizar(ps);
        } finally {
            baseDatos.desconectar();
        }
    }

    // Buscar usuario por ID
    public Usuario consultarUsuario(int id) throws Exception {
        Usuario encontrado = null;
        try {
            baseDatos.conectar();
            String sql = "SELECT * FROM usuario WHERE id=?";
            PreparedStatement ps = baseDatos.crearSentencia(sql);
            ps.setInt(1, id);
            ResultSet rs = baseDatos.consultar(ps);

            if (rs.next()) {
                encontrado = new Usuario();
                encontrado.setId(rs.getInt("id"));
                encontrado.setClave(rs.getString("clave"));
                encontrado.setNombre(rs.getString("nombre"));
                encontrado.setRol(rs.getString("rol"));
                encontrado.setEmail(rs.getString("email"));
            }
        } finally {
            baseDatos.desconectar();
        }
        return encontrado;
    }

    // Listar todos los usuarios
    public List<Usuario> listarTodosLosUsuarios() throws Exception {
        List<Usuario> lista = new ArrayList<>();
        try {
            baseDatos.conectar();
            String sql = "SELECT * FROM usuario";
            PreparedStatement ps = baseDatos.crearSentencia(sql);
            ResultSet rs = baseDatos.consultar(ps);

            while (rs.next()) {
                Usuario u = new Usuario();
                u.setId(rs.getInt("id"));
                u.setClave(rs.getString("clave"));
                u.setNombre(rs.getString("nombre"));
                u.setRol(rs.getString("rol"));
                u.setEmail(rs.getString("email"));
                lista.add(u);
            }
        } finally {
            baseDatos.desconectar();
        }
        return lista;
    }

    // Iniciar sesión
    public Usuario iniciarSesion(String clave, String nombre) throws Exception {
        Usuario logueado = null;
        try {
            baseDatos.conectar();
            String sql = "SELECT * FROM usuario WHERE clave=? AND nombre=?";
            PreparedStatement ps = baseDatos.crearSentencia(sql);
            ps.setString(1, clave);
            ps.setString(2, nombre);
            ResultSet rs = baseDatos.consultar(ps);

            if (rs.next()) {
                logueado = new Usuario();
                logueado.setId(rs.getInt("id"));
                logueado.setClave(rs.getString("clave"));
                logueado.setNombre(rs.getString("nombre"));
                logueado.setRol(rs.getString("rol"));
                logueado.setEmail(rs.getString("email"));
            }
        } finally {
            baseDatos.desconectar();
        }
        return logueado;
    }
}