import bll.Buscador;
import bll.Gestor;

public class Main {
    public static void main(String[] args) {
        /*String archivosPath="";
        boolean clear = false;

        if(args.length > 0 && !args[0].isEmpty()){
            archivosPath = args[0];
            System.out.println("args[0]: " + args[0] + ", archivosPath: " + archivosPath);
        }


        Gestor g = Gestor.getGestor((archivosPath));
        g.procesar(clear);
        */

        Buscador b = new Buscador();
        b.buscar("holA qUe, háce");
        System.out.println("nada");

    }
}
