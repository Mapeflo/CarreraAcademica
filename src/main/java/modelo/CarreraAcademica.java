package modelo;

public class CarreraAcademica {

    private int id;
    private String nombre;
    private int numCreditos;
    private int numAsignaturas;
    private int numSemestres;
    private String nivelFormacion;
    private String titulo;
    private double valorSemestre;
    private String universidad;
    private boolean esAcreditada;
    private String perfiles;
    private String areaConocimiento;

    public CarreraAcademica() {
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public int getNumCreditos() { return numCreditos; }
    public void setNumCreditos(int numCreditos) { this.numCreditos = numCreditos; }

    public int getNumAsignaturas() { return numAsignaturas; }
    public void setNumAsignaturas(int numAsignaturas) { this.numAsignaturas = numAsignaturas; }

    public int getNumSemestres() { return numSemestres; }
    public void setNumSemestres(int numSemestres) { this.numSemestres = numSemestres; }

    public String getNivelFormacion() { return nivelFormacion; }
    public void setNivelFormacion(String nivelFormacion) { this.nivelFormacion = nivelFormacion; }

    public String getTitulo() { return titulo; }
    public void setTitulo(String titulo) { this.titulo = titulo; }

    public double getValorSemestre() { return valorSemestre; }
    public void setValorSemestre(double valorSemestre) { this.valorSemestre = valorSemestre; }

    public String getUniversidad() { return universidad; }
    public void setUniversidad(String universidad) { this.universidad = universidad; }

    public boolean isEsAcreditada() { return esAcreditada; }
    public void setEsAcreditada(boolean esAcreditada) { this.esAcreditada = esAcreditada; }

    public String getPerfiles() { return perfiles; }
    public void setPerfiles(String perfiles) { this.perfiles = perfiles; }

    public String getAreaConocimiento() { return areaConocimiento; }
    public void setAreaConocimiento(String areaConocimiento) { this.areaConocimiento = areaConocimiento; }
}