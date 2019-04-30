package com.INTERCCO.controlador.General;

public class EstructuraFYH {
    public String estFecha(String fecha, String whatNeed){
        String afdr = "";
        String mfdr = "";
        String dfdr = "";
        int yheq = 1;
        for (int n = 0; n < fecha.length(); n++) {
            char c = fecha.charAt(n);
            if (c != '-'){
                if (yheq == 1){
                    afdr = afdr + c;
                } else if (yheq == 2){
                    mfdr = mfdr + c;
                } else if (yheq == 3){
                    dfdr = dfdr + c;
                }
            } else {
                yheq = yheq + 1;
            }
        }
        yheq = 1;
        
        if (whatNeed.equals("dd")){
            return dfdr;
        } else if (whatNeed.equals("mm")){
            return mfdr;
        } else {
            return afdr;
        }
    }
    
    public String estHora(String hora, String whatNeed){
        String hhdr = "";
        String mhdr = "";
        String shdr = "";
        int yheq = 1;
        for (int n = 0; n < hora.length(); n++) {
            char c = hora.charAt(n);
            if (c != ':'){
                if (yheq == 1){
                    hhdr = hhdr + c;
                } else if (yheq == 2){
                    mhdr = mhdr+ c;
                } else if (yheq == 3){
                    shdr = shdr + c;
                }
            } else {
                yheq = yheq + 1;
            }
        }
        yheq = 1;
        
        if (whatNeed.equals("h")){
            return hhdr;
        } else if (whatNeed.equals("m")){
            return mhdr;
        } else {
            return shdr;
        }
    }
}
