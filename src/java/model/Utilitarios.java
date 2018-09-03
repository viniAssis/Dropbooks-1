
package model;

import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class Utilitarios {
    public static Date toSqlDate(String data){
        Date res = null;
        DateFormat dateFormat1 = new SimpleDateFormat("dd/MM/yyyy");
        DateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
        try {
            String formatted = dateFormat2.format(dateFormat1.parse(data));
            java.util.Date parsed = dateFormat2.parse(formatted);
            res = new java.sql.Date(parsed.getTime());
        } catch (ParseException ex) {
            ex.printStackTrace();
        }

        return res;
    }
}
