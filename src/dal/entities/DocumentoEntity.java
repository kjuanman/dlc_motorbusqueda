package dal.entities;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "documento", schema = "sqlbuscador", catalog = "")
public class DocumentoEntity {
    private int idDocumento;
    private String nDocumento;
    private String nArchivo;

    @Id
    @Column(name = "id_documento")
//    @GeneratedValue(strategy=GenerationType.IDENTITY)
    public int getIdDocumento() {
        return idDocumento;
    }

    public void setIdDocumento(int idDocumento) {
        this.idDocumento = idDocumento;
    }

    @Basic
    @Column(name = "n_documento")
    public String getnDocumento() {
        return nDocumento;
    }

    public void setnDocumento(String nDocumento) {
        this.nDocumento = nDocumento;
    }

    @Basic
    @Column(name = "n_archivo")
    public String getnArchivo() {
        return nArchivo;
    }

    public void setnArchivo(String nArchivo) {
        this.nArchivo = nArchivo;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        DocumentoEntity that = (DocumentoEntity) o;
        return idDocumento == that.idDocumento &&
                Objects.equals(nDocumento, that.nDocumento) &&
                Objects.equals(nArchivo, that.nArchivo);
    }

    @Override
    public int hashCode() {

        return Objects.hash(idDocumento, nDocumento, nArchivo);
    }
}
