package dal.entities;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "item_posteo", schema = "sqlbuscador", catalog = "")
@IdClass(ItemPosteoEntityPK.class)
public class ItemPosteoEntity {
    private int idTermino;
    private int idDocumento;
    private int frecuencia;

    @Id
    @Column(name = "id_termino")
    public int getIdTermino() {
        return idTermino;
    }

    public void setIdTermino(int idTermino) {
        this.idTermino = idTermino;
    }

    @Id
    @Column(name = "id_documento")
    public int getIdDocumento() {
        return idDocumento;
    }

    public void setIdDocumento(int idDocumento) {
        this.idDocumento = idDocumento;
    }

    @Basic
    @Column(name = "frecuencia")
    public int getFrecuencia() {
        return frecuencia;
    }

    public void setFrecuencia(int frecuencia) {
        this.frecuencia = frecuencia;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ItemPosteoEntity that = (ItemPosteoEntity) o;
        return idTermino == that.idTermino &&
                idDocumento == that.idDocumento &&
                frecuencia == that.frecuencia;
    }

    @Override
    public int hashCode() {

        return Objects.hash(idTermino, idDocumento, frecuencia);
    }
}
