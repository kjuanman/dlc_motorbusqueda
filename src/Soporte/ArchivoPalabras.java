/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Soporte;

import java.io.*;
import java.text.Normalizer;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Guarda en un hashtable las palabras en un archivo, junto a su frecuencia de
 * repeticion. Se pueden ir agregando mas archivos
 */
public class ArchivoPalabras implements Serializable{

    //public TSB_OAHashtable<String, Integer> cuentas; //lleva la cuenta de las palabras
    public TSBHashtable<String, Integer> cuentas; //lleva la cuenta de las palabras
    private int cantTotalPalabras = 0;

    public ArchivoPalabras() {
        cuentas = new TSBHashtable<>();
        //cuentas = new TSB_OAHashtable<>();
    }

    public void leerArchivo(File file) throws FileNotFoundException {
        String contenido ="";
        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String unaLinea;
            StringBuilder sb = new StringBuilder();
            while ((unaLinea = br.readLine()) != null) {
                sb.append(unaLinea+"\n"); 
           }
            contenido = sb.toString();
        } catch (FileNotFoundException ex) {
            throw ex;
        } catch (IOException ex) {
            Logger.getLogger(ArchivoPalabras.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        //Usamos split para separar las palabras. -{2} es para guiones dobles
        String[] palabras = contenido.split(" |\t|\n|\r|\f|-{2}");//
        for (String palabra : palabras){
            this.agregarPalabra(limpiarPalabra(palabra));
        }
    }

    /**
     * Devuelve la cantidad de veces que figura la palabra
     *
     * @param palabra la palabra a buscar (removiendole acentos)
     * @return frecuencia de aparicion de palabras
     */
    public int buscarCantPalabra(String palabra) {
        String palabraLimpia = limpiarPalabra(palabra);
        Integer cantRepes = cuentas.get(palabraLimpia);
        return (cantRepes != null) ? cantRepes : 0;
    }

    /**
     * Devuelve la palabra libre de mayusculas y signos diacriticos
     *
     * @param palabra palabra a limpiar
     * @return String de la misma palabra sin mayusculas ni acentos
     */
    public static String limpiarPalabra(String palabra) {
        //si el token tiene signos diacriticos (por ej. tilde) lo normaliza
        if (!Normalizer.isNormalized(palabra, Normalizer.Form.NFD)) {
            //al normalizarlo, queda separada la letra del signo
            palabra = Normalizer.normalize(palabra, Normalizer.Form.NFD);
        }
        /*la metodolgia consiste en analizar el token de a caracter por vez,
        y si es letra lo agrega a un vector de characteres. Al terminar el
        analizis del token, agrega la palabra a "cuentas"*/

        //declaro e instancio un array de chars para ir guardando las letras
        char[] out = new char[palabra.length()];
        //j se va a usar para ir guardando el index en donde poner las letrs
        int j = 0;
        //se recorre el token buscando las letras y agregandolas a out[j]
        for (int i = 0, n = palabra.length(); i < n; ++i) {
            char c = palabra.charAt(i);
            if ((c >= '\u0061' && c <= '\u007A') //si c es una letra minuscula
                    || (c >= '\u0041' && c <= '\u005A')) {//o letra mayuscula
                out[j++] = c;
            } else if (c == '\u002D' //si es guion, y no esta al pcio ni fin
                    && (i != 0 && i != (n - 1))) {
                out[j++] = c;
            }
        }
        return new String(out).toLowerCase().trim();
    }

    /**
     * Agrega una palabra a la coleccion, o aumenta su frecuencia si ya existe
     *
     * @param string Palabra a agregar
     */
    private void agregarPalabra(String string) {
        if (string != null && !string.isEmpty()) {
            Integer cant = cuentas.get(string);//puede ser null si la palabra es nva
            //si cant es null, es la primera palabra y pone 1, sino el valor dado +1
            cuentas.put(string, (cant == null) ? 1 : cant + 1);
            cantTotalPalabras++;
        }
    }

    /**
     * Devuelve la cantidad de palabras distintas contenidas
     */
    public int getCantPalabrasDistintas() {
        return cuentas.size();
    }

    /**
     * Devuelve la cantidad total de palabras contenidas (incluye repetidas)
     */
    public int getCantTotalPalabras() {
        return this.cantTotalPalabras;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder("");
        sb.append("Cantidad total de palabras: " + cantTotalPalabras + '\n');
        sb.append("Cantidad de palabras diferentes: " + cuentas.size() + '\n');
        Set<Map.Entry<String, Integer>> entrySet = cuentas.entrySet();
        for (Map.Entry<String, Integer> entry : entrySet) {
            sb.append(entry.getKey() + ": " + entry.getValue() + '\n');
        }
        return sb.toString();
    }

    public void clear(){
        cuentas.clear();
        this.cantTotalPalabras = 0;
    }
}
