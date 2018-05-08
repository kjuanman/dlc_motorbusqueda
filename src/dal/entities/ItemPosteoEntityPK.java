package dal.entities;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Objects;

public class ItemPosteoEntityPK implements Serializable {
    private int idTermino;
    private int idDocumento;

    @Column(name = "id_termino")
    @Id
    public int getIdTermino() {
        return idTermino;
    }

    public void setIdTermino(int idTermino) {
        this.idTermino = idTermino;
    }

    @Column(name = "id_documento")
    @Id
    public int getIdDocumento() {
        return idDocumento;
    }

    public void setIdDocumento(int idDocumento) {
        this.idDocumento = idDocumento;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ItemPosteoEntityPK that = (ItemPosteoEntityPK) o;
        return idTermino == that.idTermino &&
                idDocumento == that.idDocumento;
    }

    @Override
    public int hashCode() {

        return Objects.hash(idTermino, idDocumento);
    }
}
