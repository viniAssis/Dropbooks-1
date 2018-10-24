
package model;

import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class Utilitarios {
    public static Date toSqlDate(String data){
        Date res = null;
        DateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
        try {
            java.util.Date parsed = dateFormat2.parse(data);
            res = new java.sql.Date(parsed.getTime());
        } catch (ParseException ex) {
            ex.printStackTrace();
        }

        return res;
    }
    
    public static Date toDataBR(String data){
        Date res = null;
        DateFormat dateFormat2 = new SimpleDateFormat("dd/MM/yyyy");
        try {
            java.util.Date parsed = dateFormat2.parse(data);
            res = new java.sql.Date(parsed.getTime());
        } catch (ParseException ex) {
            ex.printStackTrace();
        }

        return res;
    }
    
    public static String trimDesc(String desc){
        String fin = desc;
        if(fin.length() > 200){
            fin = fin.substring(0, 201);
            fin = fin + "(...)";
        }
        return fin;
    }
}
