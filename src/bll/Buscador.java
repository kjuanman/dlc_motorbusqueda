package bll;

import Soporte.ArchivoPalabras;
import Soporte.TSBArrayList;

import java.util.List;

public class Buscador {
    private TSBArrayList<Ranking> ArrayRanking = new TSBArrayList<>();

    public List<String[]> buscar(String terminos) {
        String[] terminosAux = terminos.split(" ");
        for (int i = 0; i < terminosAux.length; i++) {
            terminosAux[i] = ArchivoPalabras.limpiarPalabra(terminosAux[i]);
        }

        Gestor g = Gestor.getGestor();
        List<String[]> ranking = g.traerItemsPosteo(terminosAux);
        //ranking viene ordenado segun punaje de mayor a menor (pero no contiene el puntaje)
        //ranking[0]:Titulo del documento

        //ranking[1]:Nombre del archivo
        return ranking;
    }

    private class Ranking{
        private String documento;
        private int puntaje;
        private int cantDoc = Integer.parseInt(((Long)Gestor.cantDocumentos()).toString());

        public Ranking(){
        }

        public Ranking(String d, int p){
            documento=d;
            puntaje=p;
        }

        public void sumarPuntaje(int tf, int nr){
            puntaje+=(tf*Math.log(cantDoc/nr));
        }

        public int getPuntaje() {
            return puntaje;
        }

        public void setPuntaje(int puntaje) {
            this.puntaje = puntaje;
        }

        public String getDocumento() {

            return documento;
        }

        public void setDocumento(String documento) {
            this.documento = documento;
        }
    }


}
