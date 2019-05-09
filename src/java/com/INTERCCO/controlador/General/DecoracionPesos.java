package com.INTERCCO.controlador.General;

public class DecoracionPesos {
    public String formatNumber(int numero){
        String nuevoNumero = resetNumber(String.valueOf(numero));
        
        String resultado = "";
        for (int j = 0, i = nuevoNumero.length() - 1; i >= 0; i--) {
            resultado = nuevoNumero.charAt(i) + ((j > 0) && (j % 3 == 0) ? "." : "") + resultado;
            j++;
        }
        return resultado;
    }
    public String formatNumber(String numero){
        String nuevoNumero = resetNumber(numero);
        
        String resultado = "";
        for (int j = 0, i = nuevoNumero.length() - 1; i >= 0; i--) {
            resultado = nuevoNumero.charAt(i) + ((j > 0) && (j % 3 == 0) ? "." : "") + resultado;
            j++;
        }
        return resultado;
    }
    
    public String resetNumber(int numero){
        String resultado = String.valueOf(numero).replace(".", "");
        return resultado;
    }
    public String resetNumber(String numero){
        String resultado = numero.replace(".", "");
        return resultado;
    }
}
