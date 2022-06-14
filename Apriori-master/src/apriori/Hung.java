package apriori;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import domain.MyItem;
import domain.Row;

public class Hung {
	
	
	public static boolean sosanh(int[] a, int[] b) {
		ArrayList<Integer> tempA = new ArrayList<Integer>();
		for(int temp: a) tempA.add(temp);
		ArrayList<Integer> tempB = new ArrayList<Integer>();
		for(int temp: b) tempB.add(temp);
		int k = a.length;
		int dem = 0;
		for(int i=0;i<tempA.size();i++) {
			for(int j=0;j<tempB.size();j++) {
				if(tempA.get(i)==tempB.get(j)) {
					tempB.remove(j);
					dem++;
					break;
				}
			}
		}
		return dem==k;
	}
	
	public static ArrayList<int[]> test(int[][] a, int[][] b) {
		ArrayList<int[]> temp = new ArrayList<int[]>();
		for(int i=0;i<a.length;i++) {
			boolean check = false;
			for(int j=0;j<b.length;j++) {
				if(sosanh(a[i], b[j])) {
					check = true;
					break;
				}
			}
			if(check == false)
				temp.add(a[i]);
		}
		return temp;
	}
	
	public static void main(int [][]array1,int[][] array2) {
		//mở file resultAI để ghi kết quả vào
				File file = new File("G:\\DoAnTotNghiep\\WebPetLove\\src\\main\\resources\\resultAI.txt");
				FileWriter fw;
				PrintWriter pw = null;
				ArrayList<String> list2 = new ArrayList<String>();
				int soCollum = 0;
				int soRow = 0;
				try {
					fw = new FileWriter(file, true);
					pw = new PrintWriter(fw);
		// ghi dữ liệu vào file outResultTest và vào list2
					
					
					System.out.print("cacs phan tu sau khi loc ");
					ArrayList<int[]> a = test(array1, array2);
					for (int i = 0; i < a.size(); i++) {
				        for (int j = 0; j < a.get(0).length; j++) {
				            System.out.print(a.get(i)[j] + "\t");
				            pw.print(a.get(i)[j]+ " ");
				        }
				        pw.println();
				        System.out.println("\n");   
				    };
					// end
				    
				    
				    
					pw.close();
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
		
	}
	
	
	
}
