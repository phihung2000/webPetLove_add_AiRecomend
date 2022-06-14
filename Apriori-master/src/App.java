

import apriori.Hung;

/**
 * Hello world!
 *
 */
public class App {
    public static void main(String[] args) {
    	 int[][] array1 = {
    		{5 ,2, 3 },
			{2 ,1, 3 },
			{21, 20 ,22 },
			{7 ,8 ,9 },
			{10 ,8, 9}};
    	 int[][] array2 = {	
			{21 ,22 ,23},
			{2, 3 ,1},
			{10, 8 ,9},
			{8 ,7, 9},
			{21 ,22, 20},
			{21 ,22 ,23},
			};
    	 Hung.main(array2, array1);
    };
}
