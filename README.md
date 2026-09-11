# Carrera Académica

Aplicación web desarrollada en **Java Servlet/JSP** para la gestión de usuarios y carreras académicas.

**URL de la aplicación desplegada:**  
https://carreraacademica-production.up.railway.app

---

## Tecnologías utilizadas

- Java 17
- Servlet / JSP
- Maven
- MySQL
- Apache Tomcat
- Railway (despliegue)

---

## Estructura del proyecto

- `src/main/java` → Clases Java (Modelo, CRUD, Servlets, Conexión)
- `src/main/webapp` → Páginas JSP e interfaz
- `sql/academica_db.sql` → Script de creación de base de datos y datos iniciales

---

## Base de datos

El script de creación se encuentra en:

sql/academica_db.sql

### Datos de prueba

**Usuario Administrador:**
- Usuario: `Administrador`
- Clave: `admin123`
- Email: `maryaale1506@gmail.com`

**Usuario Demo:**
- Usuario: `Usuario Demo`
- Clave: `user123`

---

## Configuración de la conexión (Railway)

En la clase `ConexionBaseDatos.java` se utilizan los siguientes valores para el entorno de producción:

```java
nombreIPServidorBD = "mysql.railway.internal"
puertoServidorBD = "3306"
usuarioBD = "root"
passwordUsuarioBD = "PvjklvFyUEQRFTpuQxZFzoxrsnwiUUNH"
nombreBD = "railway"

Cómo ejecutar la aplicación localmente:

1. Clonar el repositorio: https://github.com/Mapeflo/CarreraAcademica.git
2.Importar el proyecto en IntelliJ IDEA o NetBeans como proyecto Maven.
3.Configurar la base de datos MySQL local y ejecutar el script sql/academica_db.sql.
4.Ajustar los datos de conexión en ConexionBaseDatos.java.
5.Ejecutar la aplicación en un servidor Tomcat (o usar el plugin de Maven).

Funcionalidades implementadas:

-Autenticación de usuarios (Login / Logout).
-Recuperación de clave por correo electrónico.
-CRUD completo de Usuario.
-CRUD completo de Carrera Académica.
-Reportes parametrizados:Usuarios por Rol.
-Usuarios por Nombre (parcial).
-Carreras por Universidad + Nivel de Formación.
-Carreras Acreditadas por rango de valor de semestre.

Autor:
Mapeflo



