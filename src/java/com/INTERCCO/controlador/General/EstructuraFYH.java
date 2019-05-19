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
    
    public String estFechaMeses(String fecha, String whatNeed){
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
        
        switch(mfdr){
            case "01":
                mfdr = "Enero";
                break;
            case "02":
                mfdr = "Febrero";
                break;
            case "03":
                mfdr = "Marzo";
                break;
            case "04":
                mfdr = "Abril";
                break;
            case "05":
                mfdr = "Mayo";
                break;
            case "06":
                mfdr = "Junio";
                break;
            case "07":
                mfdr = "Julio";
                break;
            case "08":
                mfdr = "Agosto";
                break;
            case "09":
                mfdr = "Septiembre";
                break;
            case "10":
                mfdr = "Octubre";
                break;
            case "11":
                mfdr = "Noviembre";
                break;
            case "12":
                mfdr = "Diciembre";
                break;
        }
        
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
    
    public String horaMilitarANormal(String hora){
        String horaLimpia = hora.replace(":", "");
        int milTime = Integer.parseInt(horaLimpia);
        boolean pm;

        /* Se determina si es AM o PM y se convierte de hora militar a normal */
        if (milTime > 1159) {
            pm = true;
            milTime = (milTime - 1200);
        } else {
            pm = false;
        }

        /* Estructuración de la hora normal */
        int fourthDigit = milTime % 10;
        milTime = milTime / 10;
        int thirdDigit = milTime % 10;
        milTime = milTime / 10;
        int secondDigit = milTime % 10;
        milTime = milTime / 10;
        int firstDigit = milTime % 10;

        String minutesString = thirdDigit + "" + fourthDigit;
        String hoursString = firstDigit + "" + secondDigit;

        /* Se determina si es 00 para modificarlo por 12 en hor */
        if (firstDigit == 0 && secondDigit == 0) {
            hoursString = "12";
        }

        /* Fin */
        if (pm == true) {
            return hoursString + ":" + minutesString + " p.m.";
        } else {
            return hoursString + ":" + minutesString + " a.m.";
        }
    }
}
