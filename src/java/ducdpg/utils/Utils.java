/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ducdpg.utils;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author giadu
 */
public class Utils {
    public static String formatNumber(long number) {
        DecimalFormat decimalFormat = new DecimalFormat("#,###");
        return decimalFormat.format(number);
    }
    
    public static String formatDate(String inputString) {
        String formattedDate = "";

        try {
            DateFormat inputFormat = new SimpleDateFormat("yyyyMMddHHmmss");
            DateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");

            Date date = inputFormat.parse(inputString);
            formattedDate = outputFormat.format(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return formattedDate;
    }
}
