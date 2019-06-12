package com.INTERCCO.controlador.General;

public class CifradoASCII {

    public String CifrarASCII(String texto){
        if (texto == null){
            return "";
        } else {
            if (texto.length() > 0){
                String cifrado = "";
                int ascii;
//                if (texto.contains("\n")){
//                    texto = texto.replace("\n", "Ø");
//                }
                for(int i = 0; i < texto.length() ; i++){
                    char character = texto.charAt(i);
//                    if (character == 'Ø'){
//                        cifrado = cifrado + "13"+"S";
//                    } else {
//                        ascii = (int) character;
//                        cifrado = cifrado + ascii+"S";
//                    }
                    ascii = (int) character;
                    cifrado = cifrado + ascii+"S";
                }
                cifrado = cifrado.substring(0, cifrado.length() - 1);
                return cifrado;
            } else {
                return "";
            }
        }  
    }
    
    public String DescifrarASCII(String texto){
        if (texto == null){
            return "";
        } else {
            if (texto.length() > 0){
                String descifrado = "";
                String[] vect;
                vect = texto.split("S");
                int ascii;
                for(int i = 0; i < vect.length ; i++){
                    ascii = Integer.parseInt(vect[i]);
//                    if (ascii == 13){
//                        descifrado = descifrado+"\n";
//                    } else {
//                        descifrado = descifrado + new Character((char) ascii).toString();
//                    }
                    descifrado = descifrado + new Character((char) ascii).toString();
                }
                return descifrado;
            } else {
                return "";
            }
        }
    }
}
