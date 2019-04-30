package com.INTERCCO.modelo.Beans;

public class Proveedores {

    private Integer idProveedores;
    private String nombreCoe;
    private String tipoIf;
    private String numIt;
    private String telefonoCoe;
    private String extensionTelCoe;
    private String movilCoe;
    private String faxCoe;
    private String extensionFaxCoe;
    private String direccion;
    private String nombrePc;
    private String cargoPc;
    private String tipoI;
    private String numI;
    private String email;
    private String faxPc;
    private String extensionFaxPc;
    private String telefonoPc;
    private String movilPc;
    private String existencia;
    private String idCiudad;
    private String NombreCiudad;

    public Proveedores() {
    }

    public Proveedores(Integer idProveedores) {
        this.idProveedores = idProveedores;
    }

    public Proveedores(Integer idProveedores, String nombreCoe, String tipoIf, String numIt, String telefonoCoe, String extensionTelCoe, String movilCoe, String faxCoe, String extensionFaxCoe, String direccion, String nombrePc, String cargoPc, String tipoI, String numI, String email, String faxPc, String extensionFaxPc, String telefonoPc, String movilPc, String existencia) {
        this.idProveedores = idProveedores;
        this.nombreCoe = nombreCoe;
        this.tipoIf = tipoIf;
        this.numIt = numIt;
        this.telefonoCoe = telefonoCoe;
        this.extensionTelCoe = extensionTelCoe;
        this.movilCoe = movilCoe;
        this.faxCoe = faxCoe;
        this.extensionFaxCoe = extensionFaxCoe;
        this.direccion = direccion;
        this.nombrePc = nombrePc;
        this.cargoPc = cargoPc;
        this.tipoI = tipoI;
        this.numI = numI;
        this.email = email;
        this.faxPc = faxPc;
        this.extensionFaxPc = extensionFaxPc;
        this.telefonoPc = telefonoPc;
        this.movilPc = movilPc;
        this.existencia = existencia;
    }

    /* Metodos de la Tabla en la Base de datos */
    
    public Integer getIdProveedores() {
        return idProveedores;
    }

    public void setIdProveedores(Integer idProveedores) {
        this.idProveedores = idProveedores;
    }

    public String getNombreCoe() {
        return nombreCoe;
    }

    public void setNombreCoe(String nombreCoe) {
        this.nombreCoe = nombreCoe;
    }

    public String getTipoIf() {
        return tipoIf;
    }

    public void setTipoIf(String tipoIf) {
        this.tipoIf = tipoIf;
    }

    public String getNumIt() {
        return numIt;
    }

    public void setNumIt(String numIt) {
        this.numIt = numIt;
    }

    public String getTelefonoCoe() {
        return telefonoCoe;
    }

    public void setTelefonoCoe(String telefonoCoe) {
        this.telefonoCoe = telefonoCoe;
    }

    public String getExtensionTelCoe() {
        return extensionTelCoe;
    }

    public void setExtensionTelCoe(String extensionTelCoe) {
        this.extensionTelCoe = extensionTelCoe;
    }

    public String getMovilCoe() {
        return movilCoe;
    }

    public void setMovilCoe(String movilCoe) {
        this.movilCoe = movilCoe;
    }

    public String getFaxCoe() {
        return faxCoe;
    }

    public void setFaxCoe(String faxCoe) {
        this.faxCoe = faxCoe;
    }

    public String getExtensionFaxCoe() {
        return extensionFaxCoe;
    }

    public void setExtensionFaxCoe(String extensionFaxCoe) {
        this.extensionFaxCoe = extensionFaxCoe;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getNombrePc() {
        return nombrePc;
    }

    public void setNombrePc(String nombrePc) {
        this.nombrePc = nombrePc;
    }

    public String getCargoPc() {
        return cargoPc;
    }

    public void setCargoPc(String cargoPc) {
        this.cargoPc = cargoPc;
    }

    public String getTipoI() {
        return tipoI;
    }

    public void setTipoI(String tipoI) {
        this.tipoI = tipoI;
    }

    public String getNumI() {
        return numI;
    }

    public void setNumI(String numI) {
        this.numI = numI;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFaxPc() {
        return faxPc;
    }

    public void setFaxPc(String faxPc) {
        this.faxPc = faxPc;
    }

    public String getExtensionFaxPc() {
        return extensionFaxPc;
    }

    public void setExtensionFaxPc(String extensionFaxPc) {
        this.extensionFaxPc = extensionFaxPc;
    }

    public String getTelefonoPc() {
        return telefonoPc;
    }

    public void setTelefonoPc(String telefonoPc) {
        this.telefonoPc = telefonoPc;
    }

    public String getMovilPc() {
        return movilPc;
    }

    public void setMovilPc(String movilPc) {
        this.movilPc = movilPc;
    }

    public String getExistencia() {
        return existencia;
    }

    public void setExistencia(String existencia) {
        this.existencia = existencia;
    }

    public String getIdCiudad() {
        return idCiudad;
    }

    public void setIdCiudad(String idCiudad) {
        this.idCiudad = idCiudad;
    }

    /* Metodos Adicionales para la Vista */
    
    public String getNombreCiudad() {
        return NombreCiudad;
    }

    public void setNombreCiudad(String NombreCiudad) {
        this.NombreCiudad = NombreCiudad;
    }
    
    /* Metodos de Apoyo */
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idProveedores != null ? idProveedores.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Proveedores)) {
            return false;
        }
        Proveedores other = (Proveedores) object;
        if ((this.idProveedores == null && other.idProveedores != null) || (this.idProveedores != null && !this.idProveedores.equals(other.idProveedores))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.INTERCCO.modelo.Beans.Proveedores[ idProveedores=" + idProveedores + " ]";
    }
    
}
