package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CRUDCarreraAcademica {

    private ConexionBaseDatos baseDatos;

    public CRUDCarreraAcademica() {
        baseDatos = new ConexionBaseDatos();
    }

    // Agregar
    public void agregar(CarreraAcademica c) throws Exception {
        try {
            baseDatos.conectar();
            String sql = "INSERT INTO carrera_academica (nombre, numCreditos, numAsignaturas, numSemestres, nivelFormacion, titulo, valorSemestre, universidad, esAcreditada, perfiles, areaConocimiento) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = baseDatos.crearSentencia(sql);
            ps.setString(1, c.getNombre());
            ps.setInt(2, c.getNumCreditos());
            ps.setInt(3, c.getNumAsignaturas());
            ps.setInt(4, c.getNumSemestres());
            ps.setString(5, c.getNivelFormacion());
            ps.setString(6, c.getTitulo());
            ps.setDouble(7, c.getValorSemestre());
            ps.setString(8, c.getUniversidad());
            ps.setBoolean(9, c.isEsAcreditada());
            ps.setString(10, c.getPerfiles());
            ps.setString(11, c.getAreaConocimiento());
            baseDatos.actualizar(ps);
        } finally {
            baseDatos.desconectar();
        }
    }

    // Modificar
    public void modificar(CarreraAcademica c) throws Exception {
        try {
            baseDatos.conectar();
            String sql = "UPDATE carrera_academica SET nombre=?, numCreditos=?, numAsignaturas=?, numSemestres=?, nivelFormacion=?, titulo=?, valorSemestre=?, universidad=?, esAcreditada=?, perfiles=?, areaConocimiento=? WHERE id=?";
            PreparedStatement ps = baseDatos.crearSentencia(sql);
            ps.setString(1, c.getNombre());
            ps.setInt(2, c.getNumCreditos());
            ps.setInt(3, c.getNumAsignaturas());
            ps.setInt(4, c.getNumSemestres());
            ps.setString(5, c.getNivelFormacion());
            ps.setString(6, c.getTitulo());
            ps.setDouble(7, c.getValorSemestre());
            ps.setString(8, c.getUniversidad());
            ps.setBoolean(9, c.isEsAcreditada());
            ps.setString(10, c.getPerfiles());
            ps.setString(11, c.getAreaConocimiento());
            ps.setInt(12, c.getId());
            baseDatos.actualizar(ps);
        } finally {
            baseDatos.desconectar();
        }
    }

    // Eliminar
    public void eliminar(int id) throws Exception {
        try {
            baseDatos.conectar();
            String sql = "DELETE FROM carrera_academica WHERE id=?";
            PreparedStatement ps = baseDatos.crearSentencia(sql);
            ps.setInt(1, id);
            baseDatos.actualizar(ps);
        } finally {
            baseDatos.desconectar();
        }
    }

    // Buscar por ID
    public CarreraAcademica consultar(int id) throws Exception {
        CarreraAcademica c = null;
        try {
            baseDatos.conectar();
            String sql = "SELECT * FROM carrera_academica WHERE id=?";
            PreparedStatement ps = baseDatos.crearSentencia(sql);
            ps.setInt(1, id);
            ResultSet rs = baseDatos.consultar(ps);

            if (rs.next()) {
                c = new CarreraAcademica();
                c.setId(rs.getInt("id"));
                c.setNombre(rs.getString("nombre"));
                c.setNumCreditos(rs.getInt("numCreditos"));
                c.setNumAsignaturas(rs.getInt("numAsignaturas"));
                c.setNumSemestres(rs.getInt("numSemestres"));
                c.setNivelFormacion(rs.getString("nivelFormacion"));
                c.setTitulo(rs.getString("titulo"));
                c.setValorSemestre(rs.getDouble("valorSemestre"));
                c.setUniversidad(rs.getString("universidad"));
                c.setEsAcreditada(rs.getBoolean("esAcreditada"));
                c.setPerfiles(rs.getString("perfiles"));
                c.setAreaConocimiento(rs.getString("areaConocimiento"));
            }
        } finally {
            baseDatos.desconectar();
        }
        return c;
    }

    // Listar todos
    public List<CarreraAcademica> listarTodos() throws Exception {
        List<CarreraAcademica> lista = new ArrayList<>();
        try {
            baseDatos.conectar();
            String sql = "SELECT * FROM carrera_academica";
            PreparedStatement ps = baseDatos.crearSentencia(sql);
            ResultSet rs = baseDatos.consultar(ps);

            while (rs.next()) {
                CarreraAcademica c = new CarreraAcademica();
                c.setId(rs.getInt("id"));
                c.setNombre(rs.getString("nombre"));
                c.setNumCreditos(rs.getInt("numCreditos"));
                c.setNumAsignaturas(rs.getInt("numAsignaturas"));
                c.setNumSemestres(rs.getInt("numSemestres"));
                c.setNivelFormacion(rs.getString("nivelFormacion"));
                c.setTitulo(rs.getString("titulo"));
                c.setValorSemestre(rs.getDouble("valorSemestre"));
                c.setUniversidad(rs.getString("universidad"));
                c.setEsAcreditada(rs.getBoolean("esAcreditada"));
                c.setPerfiles(rs.getString("perfiles"));
                c.setAreaConocimiento(rs.getString("areaConocimiento"));
                lista.add(c);
            }
        } finally {
            baseDatos.desconectar();
        }
        return lista;
    }
    // Reporte 1: Buscar por Universidad + Nivel de Formación
    public List<CarreraAcademica> buscarPorUniversidadYNivel(String universidad, String nivelFormacion) throws Exception {
        List<CarreraAcademica> lista = new ArrayList<>();
        try {
            baseDatos.conectar();
            String sql = "SELECT * FROM carrera_academica WHERE universidad LIKE ? AND nivelFormacion = ?";
            PreparedStatement ps = baseDatos.crearSentencia(sql);
            ps.setString(1, "%" + universidad + "%");
            ps.setString(2, nivelFormacion);
            ResultSet rs = baseDatos.consultar(ps);

            while (rs.next()) {
                CarreraAcademica c = new CarreraAcademica();
                c.setId(rs.getInt("id"));
                c.setNombre(rs.getString("nombre"));
                c.setNumCreditos(rs.getInt("numCreditos"));
                c.setNumAsignaturas(rs.getInt("numAsignaturas"));
                c.setNumSemestres(rs.getInt("numSemestres"));
                c.setNivelFormacion(rs.getString("nivelFormacion"));
                c.setTitulo(rs.getString("titulo"));
                c.setValorSemestre(rs.getDouble("valorSemestre"));
                c.setUniversidad(rs.getString("universidad"));
                c.setEsAcreditada(rs.getBoolean("esAcreditada"));
                c.setPerfiles(rs.getString("perfiles"));
                c.setAreaConocimiento(rs.getString("areaConocimiento"));
                lista.add(c);
            }
        } finally {
            baseDatos.desconectar();
        }
        return lista;
    }

    // Reporte 2: Carreras Acreditadas con valor de semestre entre un rango
    public List<CarreraAcademica> buscarAcreditadasPorRangoValor(double valorMin, double valorMax) throws Exception {
        List<CarreraAcademica> lista = new ArrayList<>();
        try {
            baseDatos.conectar();
            String sql = "SELECT * FROM carrera_academica WHERE esAcreditada = true AND valorSemestre BETWEEN ? AND ?";
            PreparedStatement ps = baseDatos.crearSentencia(sql);
            ps.setDouble(1, valorMin);
            ps.setDouble(2, valorMax);
            ResultSet rs = baseDatos.consultar(ps);

            while (rs.next()) {
                CarreraAcademica c = new CarreraAcademica();
                c.setId(rs.getInt("id"));
                c.setNombre(rs.getString("nombre"));
                c.setNumCreditos(rs.getInt("numCreditos"));
                c.setNumAsignaturas(rs.getInt("numAsignaturas"));
                c.setNumSemestres(rs.getInt("numSemestres"));
                c.setNivelFormacion(rs.getString("nivelFormacion"));
                c.setTitulo(rs.getString("titulo"));
                c.setValorSemestre(rs.getDouble("valorSemestre"));
                c.setUniversidad(rs.getString("universidad"));
                c.setEsAcreditada(rs.getBoolean("esAcreditada"));
                c.setPerfiles(rs.getString("perfiles"));
                c.setAreaConocimiento(rs.getString("areaConocimiento"));
                lista.add(c);
            }
        } finally {
            baseDatos.desconectar();
        }
        return lista;
    }
}