/*
//package dal.entities;
// */
//
//import javax.persistence.*;
//import java.util.ArrayList;
//import java.util.List;
//import java.util.Objects;
//
//@Entity
////@Table(name = "termino", schema = "sqlbuscador", catalog = "")
//public class Ranking {
//    private String nDocumento;
//    private String nArchivo;
//    private Integer frecuencia;
//    private Integer cantDocumentos;
//
//    @Basic
//    @Column(name = "frecuencia")
//    public int getFrecuencia() {
//        return frecuencia;
//    }
//
//    public void setFrecuencia(int frecuencia) {
//        this.frecuencia = frecuencia;
//    }
//
//    @Basic
//    @Column(name = "cant_documentos")
//    public Integer getCantDocumentos() {
//        return cantDocumentos;
//    }
//
//    public void setCantDocumentos(Integer cantDocumentos) {
//        this.cantDocumentos = cantDocumentos;
//    }
//
//    @Basic
//    @Column(name = "n_documento")
//    public String getnDocumento() {
//        return nDocumento;
//    }
//
//    public void setnDocumento(String nDocumento) {
//        this.nDocumento = nDocumento;
//    }
//
//    @Basic
//    @Column(name = "n_archivo")
//    public String getnArchivo() {
//        return nArchivo;
//    }
//
//    public void setnArchivo(String nArchivo) {
//        this.nArchivo = nArchivo;
//    }
//
//    @Override
//    public boolean equals(Object o) {
//        if (this == o) return true;
//        if (o == null || getClass() != o.getClass()) return false;
//        TerminoEntity that = (TerminoEntity) o;
//        return idTermino == that.idTermino &&
//                Objects.equals(nTermino, that.nTermino) &&
//                Objects.equals(cantDocumentos, that.cantDocumentos) &&
//                Objects.equals(maxFrecuencia, that.maxFrecuencia);
//    }
//
//    @Override
//    public int hashCode() {
//
//        return Objects.hash(idTermino, nTermino, cantDocumentos, maxFrecuencia);
//    }
//}