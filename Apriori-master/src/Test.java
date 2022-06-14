import apriori.AprioriBase;
import domain.Item;
import domain.MyItem;
import domain.Record;
import domain.Row;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class Test {

    public static void main(String[] args) {

        double support_min = 0.0;
        double confidence_min = 0.0;

        List<Row> rawData = new ArrayList<>();
        try {
//            FileReader fileReader = new FileReader(new File("data"));
        	FileReader fileReader = new FileReader(new File("G:\\DoAnTotNghiep\\WebPetLove\\src\\main\\resources\\out.txt"));
            BufferedReader bufferedReader = new BufferedReader(fileReader);

            String line;
            int count = 0;
            while ((line = bufferedReader.readLine()) != null) {
                String[] values = line.split(" ");


                // Line 1 get support_min & confidence_min
                if (count == 0) {
                    support_min = Double.parseDouble(values[0]);
                    confidence_min = Double.parseDouble(values[1]);
                } else {
                    // Read data
                    List<Item> l = new ArrayList<>();
                    for (String s : values) {
                        MyItem m = new MyItem(s);
                        l.add(m);
                    }
                    Row r = new Record(l);
                    rawData.add(r);
                }

                count++;
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        new AprioriBase(support_min, confidence_min, rawData);
    }

}
