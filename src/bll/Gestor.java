package bll;

import Soporte.ArchivoPalabras;
import dal.entities.DocumentoEntity;
import dal.entities.ItemPosteoEntity;
import dal.entities.TerminoEntity;

import javax.persistence.*;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Gestor {

    private static Gestor gestor;
    private static String pathArchivos = "src/libros";
    private static Map<String, TerminoEntity> vocabulario = new HashMap<String, TerminoEntity>();
    private static Integer cantidadDocumentos;

    private Gestor(){}
    private Gestor(String pathLibros){
        if (!pathLibros.isEmpty()) this.pathArchivos = pathLibros;
    }

    public static Gestor getGestor(){
        return getGestor(pathArchivos);
    }

    public static Gestor getGestor(String pathLibros) {
        if(gestor == null) {
            gestor = new Gestor(pathLibros);
        }
        else { if (!pathLibros.isEmpty()) pathArchivos = pathLibros;}
        return gestor;
    }

//    //funciona para item_posteo que guarda nombres en vez de ids
//    public static void procesar(){
//
//        ArchivoPalabras indexado = new ArchivoPalabras();
//        Set<String> llaves; //almacenara las palabras contenidas en un archivo
//
//        try {
//            File directorioTextos = new File(pathArchivos);
//            File[] archivosTexto = directorioTextos.listFiles();
//
//            EntityManagerFactory emf = Persistence.createEntityManagerFactory("NewPersistenceUnit");
//            EntityManager em = emf.createEntityManager();
//            EntityTransaction et = em.getTransaction();
//
//            String nombreArchivo;
//            String nombreLibro;
//            DocumentoEntity de = new DocumentoEntity();
//
//            int i = 0; //usado para calcular porcentaje de progreso
//            int n = archivosTexto.length;
//            for (File archivoTexto : archivosTexto) {
//                if (archivoTexto.isDirectory()) continue;
//
//                nombreArchivo = archivoTexto.getName();
//                nombreLibro = getNombreLibro(archivoTexto);
//
//                System.out.println("Indexando: " + nombreArchivo);
//                llaves = indexar(indexado, archivoTexto);
//                System.out.println("Indexado! Cant:" + llaves.size()   );// + "Iniciando transaccion");
//
//                et.begin();
//                System.out.println("Persistiendo archivo: " + nombreArchivo + ", libro: " + nombreLibro);
//                de = new DocumentoEntity();
//                de.setnDocumento(nombreLibro);
//                de.setnArchivo(nombreArchivo);
//                em.persist(de);
//
//                System.out.println("Persistiendo sus terminos...");
//
//                TerminoEntity te;
//                int cantDocs, frecMaxActual, frecNueva;
//                //GUARDANDO TERMINOS EN VOCABULARIO
//                for (String llave : llaves) {
//                    frecNueva = indexado.buscarCantPalabra(llave);
//                    if (vocabulario.containsKey(llave)){
//                        te = vocabulario.get(llave);
//                        cantDocs = te.getCantDocumentos();
//                        te.setCantDocumentos(cantDocs+1);
//                        frecMaxActual = te.getMaxFrecuencia();
//                        if(frecNueva>frecMaxActual) te.setMaxFrecuencia(frecNueva);
//                    }
//                    else {
//                        te  = new TerminoEntity();
//                        te.setnTermino(llave);
//                        te.setCantDocumentos(1);
//                        te.setMaxFrecuencia(indexado.buscarCantPalabra(llave));
//                        vocabulario.put(llave,te);
//                        em.persist(te);
//                    }
//                    ItemPosteoEntity ipe = new ItemPosteoEntity();
//                    ipe = new ItemPosteoEntity();
//                    ipe.setnTermino(llave);
//                    ipe.setnDocumento(nombreLibro);
//                    ipe.setFrecuencia(frecNueva);
//                    em.persist(ipe);
//                }
//                //GUARDANDO ITEMS DE POSTEO
////                TypedQuery<TerminoEntity> tq = em.createQuery("select t from TerminoEntity t", TerminoEntity.class);
////                for (TerminoEntity term: tq.getResultList()) {
////                    term.setCantDocumentos(0);}
//                et.commit();
//                em.clear();
//
//                i++;
//                System.out.println("Cant de docs: " + i + ", Progreso: "+(100.0*i)/n);
//            }
//            em.close();
//        }
//        catch (Exception e){
//            e.printStackTrace();
//        }
//    }

    //funciona para item_posteo que guarda nombres en vez de ids
    public void procesar(boolean clear){

        ArchivoPalabras indexado = new ArchivoPalabras();
        Set<String> llaves; //almacenara las palabras contenidas en un archivo

        try {
            File directorioTextos = new File(pathArchivos);
            File[] archivosTexto = directorioTextos.listFiles();

            System.out.println("Cantidad de archivos: " + archivosTexto.length);

            //usados para asignacion a item_posteo
            int proximoIdTermino=0;
            int proximoIdDocumento=0;

            EntityManagerFactory emf = Persistence.createEntityManagerFactory("NewPersistenceUnit");
            EntityManager em = emf.createEntityManager();
            EntityTransaction et = em.getTransaction();

            //CARGANDO VOCABULARIO COMO FIGURA EN BD HASTA AHORA
            List<TerminoEntity> vocabularioActual = em.createQuery("select t from  TerminoEntity  t").getResultList();
            for (TerminoEntity terAct: vocabularioActual ) {
                vocabulario.put(terAct.getnTermino(), terAct);
            }

            proximoIdTermino = vocabulario.size() + 1;
            proximoIdDocumento = em.createQuery("select max(u.idDocumento) from DocumentoEntity u", Integer.class).getSingleResult() + 1;

            String nombreArchivo;
            String nombreLibro;
            DocumentoEntity de = new DocumentoEntity();

            int i = 0; //usado para calcular porcentaje de progreso
            int n = archivosTexto.length;
            for (File archivoTexto : archivosTexto) {
                if (archivoTexto.isDirectory()) continue;

                em.clear();
                nombreArchivo = archivoTexto.getName();
                nombreLibro = getNombreLibro(archivoTexto);

//                System.out.println(++i + ": " + nombreArchivo + "-" + nombreLibro);
//                continue;
                //si ya estaba en la bd este documento lo omite
                if(!em.createQuery( "select count(d) from DocumentoEntity d where d.nArchivo = :nombre" )
                        .setParameter("nombre", nombreArchivo)
                        .getSingleResult().equals(0L)) continue;

                System.out.println("Indexando: " + nombreArchivo);
                llaves = indexar(indexado, archivoTexto);
                System.out.println("Indexado! Cant:" + llaves.size()   );// + "Iniciando transaccion");

                et.begin();
                System.out.println("Persistiendo archivo: " + nombreArchivo + ", libro: " + nombreLibro);
                de = new DocumentoEntity();
                de.setIdDocumento(proximoIdDocumento++);
                de.setnDocumento(nombreLibro);
                de.setnArchivo(nombreArchivo);
                em.persist(de);

                System.out.println("Persistiendo sus terminos...");

                TerminoEntity te;
                int cantDocs, frecMaxActual, frecNueva;
                //GUARDANDO TERMINOS EN VOCABULARIO
                for (String llave : llaves) {
                    frecNueva = indexado.buscarCantPalabra(llave);
                    if (vocabulario.containsKey(llave)){
                        te = vocabulario.get(llave);
                        cantDocs = te.getCantDocumentos();
                        te.setCantDocumentos(cantDocs+1);
                        frecMaxActual = te.getMaxFrecuencia();
                        if(frecNueva>frecMaxActual) te.setMaxFrecuencia(frecNueva);
                    }
                    else {
                        te  = new TerminoEntity();
                        te.setIdTermino(proximoIdTermino++);
                        te.setnTermino(llave);
                        te.setCantDocumentos(1);
                        te.setMaxFrecuencia(indexado.buscarCantPalabra(llave));
                        vocabulario.put(llave,te);
                        em.persist(te);

                    }
                    ItemPosteoEntity ipe = new ItemPosteoEntity();
                    ipe = new ItemPosteoEntity();
                    ipe.setIdTermino(te.getIdTermino());
                    ipe.setIdDocumento(proximoIdDocumento-1);
                    ipe.setFrecuencia(frecNueva);
                    em.persist(ipe);
                }
                //GUARDANDO ITEMS DE POSTEO
//                TypedQuery<TerminoEntity> tq = em.createQuery("select t from TerminoEntity t", TerminoEntity.class);
//                for (TerminoEntity term: tq.getResultList()) {
//                    term.setCantDocumentos(0);}
                et.commit();
                //em.clear();

                i++;
                System.out.println("Cant de docs: " + i + ", Progreso: "+(100.0*i)/n);
            }
            em.close();
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    public static int cantDocumentos(){
        if (cantidadDocumentos == null){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("NewPersistenceUnit");
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        et.begin();
        TypedQuery<Integer> cantidad = em.createQuery("SELECT COUNT(d) FROM DocumentoEntity d",Integer.class);
        et.commit();
        em.close();
        emf.close();
        cantidadDocumentos = cantidad.getSingleResult();
        }
        return cantidadDocumentos;
    }

    private static String getNombreLibro(File archivoTexto) {
        String res = "";
        String cadena;
        FileReader f = null;
        try {
            f = new FileReader(archivoTexto);
            BufferedReader b = new BufferedReader(f);
            while ((cadena = b.readLine()) != null) {
                if (cadena.contains("Project Gutenberg Etext")){
                    String aux = cadena.replace(("*"),"");
                    String aux2 = aux.replace(("of "),"");
                    String aux3 = aux2.replace(('"'),' ');
                    String aux4 = aux3.replace("The Project Gutenberg Etext", "").trim();
                    res = aux4.replace("Project Gutenberg Etext", "").trim();
                    break;
                }
                /*else if (cadena.contains("The Project Gutenberg Etext of")){
                    String aux = cadena.replace(("*"),"");
                    String aux2 = aux.replace(("of "),"");
                    String aux3 = aux.replace(('"'),' ');
                    String aux3 = aux3.replace("The Project Gutenberg Etext", "").trim();
                    res = aux3.trim();
                    break;
                }*/
            }
            b.close();
            f.close();
        } catch (java.io.IOException e) {
            e.printStackTrace();
        }
        return res;
    }

    public String replaceName(CharSequence htmlString) {
        Pattern patt = Pattern.compile("<b>[* ]+((Project Gutenberg's Etext of)|(Project Gutenberg's Etext))[ \"]+</b>");
        Matcher m = patt.matcher(htmlString);
        StringBuffer sb = new StringBuffer(htmlString.length());
        while (m.find()) {
            String text = m.group(1);
            // ... possibly process 'text' ...
            m.appendReplacement(sb, Matcher.quoteReplacement(text));
        }
        m.appendTail(sb);
        return sb.toString();
    }

    private static Set<String> indexar(ArchivoPalabras indexado, File archivoTexto) throws FileNotFoundException {
        indexado.clear();
        indexado.leerArchivo(archivoTexto);
        return indexado.cuentas.keySet();
    }

    /**
     * Devuelve una lista ordenada de arreglos donde el primer valor es el nombre del documento y el segundo valor el nombre
     * del archivo (link). Esta lista esta ordenada segun el puntaje de relevancia hacia la busqueda.
     * @param terminosAux vector de terminos de la consulta
     * @return
     */
    public List<String[]> traerItemsPosteo(String[] terminosAux) {
        List<Object[]> res = new ArrayList<>();

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("NewPersistenceUnit");
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        et.begin();
        res = em.createQuery("SELECT d.nDocumento, d.nArchivo, t.nTermino, t.cantDocumentos, ip.frecuencia FROM ItemPosteoEntity ip, TerminoEntity t, DocumentoEntity d WHERE ip.idDocumento = d.idDocumento AND ip.idTermino = t.idTermino order by d.nDocumento").getResultList();

        Map<String, Ranking> puntajes = new HashMap<>();
        Ranking auxRank;
        for(Object[] obj : res){
            auxRank = new Ranking();

            int frecuencia = (int)obj[4];
            int nR = (int)obj[3]; //cantidad de documentos en la que aparece este unico termino
            int cantTotalDocs = this.cantidadDocumentos; //cantidad total de documentos en BD

            double puntaje = (frecuencia * Math.log(cantTotalDocs/nR));

            auxRank.setnArchivo((String)obj[1]);
            auxRank.setPuntaje(puntaje);
            puntajes.put((String)obj[0],auxRank);
        }


        List<Ranking> auxListRanking = new ArrayList<>();

        puntajes.forEach((k,v)->{
            auxListRanking.add(v);
        });

        Collections.sort(auxListRanking);

        List<String []> resStringList = new ArrayList<>();
        String [] aux = new String[2];
        auxListRanking.forEach((v)->{
            aux[0]=v.getnDocumento();
            aux[1]=v.getnArchivo();
            resStringList.add(aux.clone());
        });

        return resStringList;


    }

    public class Ranking implements Comparable<Ranking>{
        private String nDocumento;
        private String nArchivo;
        private double puntaje;

        public String getnArchivo() {
            return nArchivo;
        }

        public void setnArchivo(String nArchivo) {
            this.nArchivo = nArchivo;
        }

        public double getPuntaje() {
            return puntaje;
        }

        public void setPuntaje(double puntaje) {
            this.puntaje = puntaje;
        }

        @Override
        public int compareTo(Ranking r) {
            return ((Double) getPuntaje()).compareTo(r.getPuntaje());
        }

        public String getnDocumento() {
            return nDocumento;
        }

        public void setnDocumento(String nDocumento) {
            this.nDocumento = nDocumento;
        }
    }
}