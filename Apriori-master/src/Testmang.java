import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Scanner;

public class Testmang {
		public static void main(String[] arg)
		{
			try (BufferedReader bufferedReader =
		            new BufferedReader(new FileReader("G:\\DoAnTotNghiep\\WebPetLove\\src\\main\\resources\\resultAI.txt"))) {
				   String line = bufferedReader.readLine();
				   int i=0,sodongResultAI=0;
				   while (line != null) 
				   {
					   
					   sodongResultAI++;
				       line = bufferedReader.readLine();
				   }  
				// Đọc dữ liệu từ File với File và FileReader
				   String url = "G:\\DoAnTotNghiep\\WebPetLove\\src\\main\\resources\\resultAI.txt";
			        File file = new File(url);
			        BufferedReader reader = new BufferedReader(new FileReader(file));
			        String LineResultAI = reader.readLine();
			       //end
				   System.out.print("so dong trong file la : "+ sodongResultAI +"\n");
				   Integer[] nbs = new Integer[sodongResultAI]; 
				   while (LineResultAI != null) 
				   {
					   
					   String [] array = LineResultAI.split(" ");
					   nbs[i]= array.length;
					   i++;
					   LineResultAI = reader.readLine();
				   }
				   int minResultAI =nbs[0] ;
				   int maxResultAI = nbs[0];
				   for( int s =0 ; s< nbs.length; s++)
				   {
					   if( nbs[s] < minResultAI)
					   {
						   minResultAI = nbs[s];
					   }
					   if( nbs[s]> maxResultAI)
					   {
						   maxResultAI = nbs[s];
					   }
				   }
				// đọc file và ghi vào mảng 2 chiều
				String[][] arrResultAI = new String [sodongResultAI][maxResultAI];
				String[] arr2_ResultAI = new String[maxResultAI];
				ArrayList<String> listResultAI = new ArrayList<String>();
				BufferedReader readersResultAI = new BufferedReader(new FileReader(file));
		        String LineResultAIs = readersResultAI.readLine();
		        while (LineResultAIs != null) 
				   {
		        	String [] array = LineResultAIs.split(" ");
		        	int L = array.length;
					   for( int s =0 ; s< L; s++)
					   {
						   listResultAI.add(array[s]);
						   if( s == L-1)
						   {
							   for(int k=L+1 ; k<=maxResultAI ; k++)
							   {
								   listResultAI.add("0");
							   }
						   }
					   }
					   LineResultAIs = readersResultAI.readLine();
				   }
		        int j=0;
		        for( int a =0 ; a< sodongResultAI ; a++)
		        {
		        		for( int b =0 ; b<maxResultAI ; b++)
			        	{
		        				
		        				arrResultAI[a][b] = listResultAI.get(j);
		        				System.out.print(arrResultAI[a][b]);
		        				j++;
			        	}
		        	System.out.println();
		        }
			} catch (IOException e) {
				   e.printStackTrace();
			}
			
		}
}
