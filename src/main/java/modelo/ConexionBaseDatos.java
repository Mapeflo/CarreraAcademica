package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConexionBaseDatos {

    private String driver = "com.mysql.cj.jdbc.Driver";
    private String nombreIPServidorBD = "localhost";
    private String url = "jdbc:mysql://";
    private String puertoServidorBD = "3306";
    private String usuarioBD = "root";
    private String passwordUsuarioBD = "";
    private String nombreBD = "academica_db";

    private Connection conexion;
    private PreparedStatement sentencia;
    private ResultSet resultado;

    public ConexionBaseDatos() {
    }

    public void conectar() throws Exception {
        try {
            Class.forName(driver);
            String cadenaConexion = url + nombreIPServidorBD + ":" + puertoServidorBD + "/" + nombreBD + "?useSSL=false&serverTimezone=UTC";
            conexion = DriverManager.getConnection(cadenaConexion, usuarioBD, passwordUsuarioBD);
            System.out.println("Conexión exitosa a la base de datos");
        } catch (ClassNotFoundException e) {
            throw new Exception("Error al cargar el driver: " + e.getMessage());
        } catch (SQLException e) {
            throw new Exception("Error al conectar a la base de datos: " + e.getMessage());
        }
    }

    public PreparedStatement crearSentencia(String sql) throws Exception {
        try {
            sentencia = conexion.prepareStatement(sql);
            return sentencia;
        } catch (SQLException e) {
            throw new Exception("Error al crear la sentencia: " + e.getMessage());
        }
    }

    public int actualizar(PreparedStatement ps) throws Exception {
        try {
            return ps.executeUpdate();
        } catch (SQLException e) {
            throw new Exception("Error al ejecutar actualización: " + e.getMessage());
        }
    }

    public ResultSet consultar(PreparedStatement ps) throws Exception {
        try {
            resultado = ps.executeQuery();
            return resultado;
        } catch (SQLException e) {
            throw new Exception("Error al ejecutar consulta: " + e.getMessage());
        }
    }

    public void desconectar() {
        try {
            if (resultado != null) resultado.close();
            if (sentencia != null) sentencia.close();
            if (conexion != null) conexion.close();
            System.out.println("Conexión cerrada");
        } catch (SQLException e) {
            System.out.println("Error al cerrar la conexión: " + e.getMessage());
        }
    }
}
