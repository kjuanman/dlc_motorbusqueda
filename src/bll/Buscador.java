package bll;

import Soporte.TSBArrayList;

public class Buscador {
    private TSBArrayList<Ranking> ArrayRanking = new TSBArrayList<>();

    public TSBArrayList<Ranking> buscar(String terminos){
        String[] terminosAux = terminos.split(Todo lo que no sea alfanumerico);

    }

    private class Ranking{
        private String documento;
        private int puntaje;
        private int cantDoc = Gestor.cantDocumentos();

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
