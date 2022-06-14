package apriori;


import apriori.Hung;

/**
 * Hello world!
 *
 */
public class App {
    public static void main() {
    	 int[][] array1 = {
    		{5 ,2, 3 },
			{2 ,1, 3 },
			{21, 20 ,22 },
			{7 ,8 ,9 },
			{10 ,8, 9}};
    	 int[][] array2 = {	
			{5 ,2 ,3},
			{2, 3 ,1},
			{10, 8 ,9},
			{8 ,7, 9},
			{21 ,22, 20},
			{22 ,23 ,34},
			};
    	 Hung.main(array1, array2);
    };
}
