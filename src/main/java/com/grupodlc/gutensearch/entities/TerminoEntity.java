package com.grupodlc.gutensearch.entities;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "termino", schema = "sqlbuscador", catalog = "")
public class TerminoEntity {
    private int idTermino;
    private String nTermino;
    private Integer cantDocumentos;
    //private Integer maxFrecuencia;

    @Id
    @Column(name = "id_termino")
//    @GeneratedValue(strategy=GenerationType.IDENTITY)
    public int getIdTermino() {
        return idTermino;
    }

    public void setIdTermino(int idTermino) {
        this.idTermino = idTermino;
    }

    @Basic
    @Column(name = "n_termino")
    public String getnTermino() {
        return nTermino;
    }

    public void setnTermino(String nTermino) {
        this.nTermino = nTermino;
    }

    @Basic
    @Column(name = "cant_documentos")
    public Integer getCantDocumentos() {
        return cantDocumentos;
    }

    public void setCantDocumentos(Integer cantDocumentos) {
        this.cantDocumentos = cantDocumentos;
    }

//    @Basic
//    @Column(name = "max_frecuencia")
//    public Integer getMaxFrecuencia() {
//        return maxFrecuencia;
//    }
//
//    public void setMaxFrecuencia(Integer maxFrecuencia) {
//        this.maxFrecuencia = maxFrecuencia;
//    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TerminoEntity that = (TerminoEntity) o;
        return idTermino == that.idTermino &&
                Objects.equals(nTermino, that.nTermino) &&
                Objects.equals(cantDocumentos, that.cantDocumentos); //&&
                //Objects.equals(maxFrecuencia, that.maxFrecuencia);
    }

    @Override
    public int hashCode() {

        return Objects.hash(idTermino, nTermino, cantDocumentos);
    }
}
