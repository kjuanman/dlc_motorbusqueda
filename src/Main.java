import bll.Buscador;
import bll.Gestor;

import java.util.List;

public class Main {
    public static void main(String[] args) {
//DESDE ACA INDEXACION
//        String archivosPath="";
//        boolean clear = false;
//
//        if(args.length > 0 && !args[0].isEmpty()){
//            archivosPath = args[0];
//            System.out.println("args[0]: " + args[0] + ", archivosPath: " + archivosPath);
//        }
//
//
//        Gestor g = Gestor.getGestor((archivosPath));
//        g.procesar(clear);
//HASTA ACA INDEXACION

//DESDE ACA BUSQUEDA
        Buscador b = new Buscador();
        List<String[]> documentosRelevantes = b.buscar("sapo cola");
        for (int i = 0; i < documentosRelevantes.size();i++) {
            String [] doc = documentosRelevantes.get(i);
            System.out.println(i+": titulo: " + doc[0] + ", archivo: " + doc [1]);
        }
//HASTA ACA BUSQUEDA
    }
}
