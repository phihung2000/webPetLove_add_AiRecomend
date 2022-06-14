package apriori;

import apriori.Hung;
import domain.Item;
import domain.MyItem;
import domain.Record;
import domain.Row;
import util.Utils;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class AprioriBase implements Apriori<Row>, AprioriFindingSubChild_Thread.AprioriFindingSubChild,
		AprioriFindItemsChild_Thread.AprioriItemsChild {

	private List<Row> rows;
	private double supportMin;
	private double confidenceMin;
	private int size;

	private List<Row> dataResultItems, resultFilter;
	private List<Row> dataOriginalItems;
	private volatile List<Record> itemsRule;
	private volatile List<Row> dataItemsChild;
	private Utils utils = new Utils();

	public AprioriBase(double supportMin, double confidenceMin, List<Row> rawData) {
		this.supportMin = supportMin;
		this.confidenceMin = confidenceMin;
		this.dataOriginalItems = rawData;
		this.resultFilter = rawData;
		dataResultItems = new ArrayList<>();

		execute();
	}

	@Override
	public void execute() {

		itemsRule = new ArrayList<>();

		for (int i = 0;; i++) {
			if (i == 0) {
				resultFilter = filterFirstTime(resultFilter);
			} else {
				size = dataOriginalItems.size();

				// Run with multi thread
				for (int j = 0; j < AprioriFindingSubChild_Thread.MULTI_THREAD; j++) {
					AprioriFindingSubChild_Thread thread = new AprioriFindingSubChild_Thread(this, j, resultFilter);
					thread.start();
					try {
						thread.join();
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
				}

				int count = 0;

				// make clone from result data
				List<Row> dataResultItemsClone = cloneArray(dataResultItems);
				dataResultItems.clear();

				for (Record h : itemsRule) {
					double percent = 1.0 * h.getQuantity();
					List<Item> subList;
					if (percent >= supportMin) {
						subList = h.getItemList();
						Record com = new Record(count, subList);
						dataResultItems.add(com);
						count++;
					}
				}

				if (dataResultItems.size() > 0) {
					dataResultItemsClone = cloneArray(dataResultItems);
				}

				dataItemsChild = new ArrayList<>();

				// Run with multi thread
				for (int k = 0; k < AprioriFindItemsChild_Thread.MULTI_THREAD; k++) {
					AprioriFindItemsChild_Thread thread = new AprioriFindItemsChild_Thread(this, k, dataResultItems);
					thread.start();
					try {
						thread.join();
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
				}

				resultFilter = cloneArray(dataItemsChild);

				if (dataItemsChild.size() > 1) {
					// show(dataItemsChild);
					System.out.println("Support min = " + supportMin);
					System.out.println("Count : " + dataItemsChild.size() + " items \n");
					show(dataItemsChild);
					System.out.println("----------------------------------------");
					System.out.println("----------------------------------------");
					System.out.println("----------------------------------------");
					System.out.println("----------------------------------------");
					System.out.println("----------------------------------------");
				} else {
					System.out.println("Count : " + dataResultItemsClone.size() + " items\n");
					show(dataResultItemsClone);

					System.out.print("------------------THE END----------------------");
					break;
				}
			}
		}

	}

	private void show(List<Row> results) {
//mở file resultAI để ghi kết quả vào
		File file = new File("G:\\DoAnTotNghiep\\WebPetLove\\src\\main\\resources\\outResultTest.txt");
		FileWriter fw;
		PrintWriter pw = null;
		ArrayList<String> list2 = new ArrayList<String>();
		int soCollum = 0;
		int soRow = 0;
		try {
			fw = new FileWriter(file, true);
			pw = new PrintWriter(fw);
// ghi dữ liệu vào file outResultTest và vào list2
			for (Row r : results) {
				int i = 0;
				for (Object o : r.getItemList()) {
					i++;
					System.out.print("\t" + ((MyItem) o).getNameItem());
					if (dataItemsChild.size() <= 1) {
						pw.print(((MyItem) o).getNameItem() + " ");
//		                	list2.add(((MyItem) o).getNameItem());
						if (i == r.getItemList().size()) {
							pw.println();
							soRow = soRow + 1;
						}
					}
				}
				System.out.println("\n");
			}
			// end
			pw.close();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
//đọc dữ liệu từ file  outResultTest
		try (BufferedReader bufferedReader = new BufferedReader(
				new FileReader("G:\\DoAnTotNghiep\\WebPetLove\\src\\main\\resources\\outResultTest.txt"))) {
			String line = bufferedReader.readLine();
			int i = 0, sodong = 0;
			// tìm số dòng của file outResultTest
			while (line != null) {

				sodong++;
				line = bufferedReader.readLine();
			}
// Đọc dữ liệu từ File outResultTest lần 2
			String url = "G:\\DoAnTotNghiep\\WebPetLove\\src\\main\\resources\\outResultTest.txt";
			File files = new File(url);
			BufferedReader reader = new BufferedReader(new FileReader(files));
			String Line = reader.readLine();
			System.out.print("so dong trong fileoutResultTest la : " + sodong + "\n");
			Integer[] numbers = new Integer[sodong];
			// tìm số cột nhiều nhất của file outResultTest
			while (Line != null) {

				String[] array = Line.split(" ");
				numbers[i] = array.length;
				i++;
				Line = reader.readLine();
			}
			int min = numbers[0];
			int max = numbers[0];
			for (int s = 0; s < numbers.length; s++) {
				if (numbers[s] < min) {
					min = numbers[s];
				}
				if (numbers[s] > max) {
					max = numbers[s];
				}
			}
			System.out.println("Max number: " + max);
			// end
			// end--------------------------------------------------------------------------------------------
// Đọc dữ liệu từ File resultAI
			String urlResultAI = "G:\\DoAnTotNghiep\\WebPetLove\\src\\main\\resources\\resultAI.txt";
			File filesResultAI = new File(urlResultAI);
			BufferedReader readerResultAI = new BufferedReader(new FileReader(filesResultAI));
			String LineResultAI = readerResultAI.readLine();
			int iResultAI = 0, sodongResultAI = 0;
			while (LineResultAI != null) {

				sodongResultAI++;
				LineResultAI = readerResultAI.readLine();
			}
			// end--------------------------------------------------------------------------------------------
// Đọc dữ liệu từ File resultAI lan 2
			String urlResultAI2 = "G:\\DoAnTotNghiep\\WebPetLove\\src\\main\\resources\\resultAI.txt";
			File filesResultAI2 = new File(urlResultAI2);
			BufferedReader readerResultAI2 = new BufferedReader(new FileReader(filesResultAI2));
			String LineResultAI2 = readerResultAI2.readLine();
			// ghi du lieu file resultAI lan 2 vào mảng
			System.out.print("so dong trong fileresultAI la : " + sodongResultAI + "\n");
			Integer[] nbs = new Integer[sodongResultAI];
			while (LineResultAI2 != null) {
				String[] array = LineResultAI2.split(" ");
				nbs[iResultAI] = array.length;
				iResultAI++;
				LineResultAI2 = readerResultAI2.readLine();
			}
			int minResultAI = nbs[0];
			int maxResultAI = nbs[0];
			for (int s = 0; s < nbs.length; s++) {
				if (nbs[s] > maxResultAI) {
					maxResultAI = nbs[s];
				}

			}
			if (max > maxResultAI) {
				maxResultAI = max;
			} else {
				max = maxResultAI;
			}
			System.out.println("max number: " + max);
			System.out.println("maxResultAI number: " + maxResultAI);
			// đọc file và ghi vào mảng 2 chiều
			int[][] arrResultAI = new int[sodongResultAI][maxResultAI];
			String[] arr2_ResultAI = new String[maxResultAI];
			ArrayList<String> listResultAI = new ArrayList<String>();
			BufferedReader readersResultAI = new BufferedReader(new FileReader(filesResultAI2));
			String LineResultAIs = readersResultAI.readLine();
			while (LineResultAIs != null) {
				String[] array = LineResultAIs.split(" ");
				int L = array.length;
				for (int s = 0; s < L; s++) {
					listResultAI.add(array[s]);
					if (s == L - 1) {
						for (int k = L + 1; k <= maxResultAI; k++) {
							listResultAI.add("0");
						}
					}
				}
				LineResultAIs = readersResultAI.readLine();
			}
			int jResultAI = 0;
			for (int a = 0; a < sodongResultAI; a++) {
				for (int b = 0; b < maxResultAI; b++) {

					arrResultAI[a][b] = Integer.parseInt(listResultAI.get(jResultAI));
					jResultAI++;
				}
			}
			// end-----------------------------------------------------------------------------------------

			// đọc file outResultTest và ghi vào list sau đó từ list qua mảng 2 chiều
			int[][] array1 = new int[sodong][max];
			String[] array2 = new String[max];
			ArrayList<String> list = new ArrayList<String>();
			BufferedReader readers = new BufferedReader(new FileReader(file));
			String Lines = readers.readLine();
			while (Lines != null) {
				String[] array = Lines.split(" ");
				int L = array.length;
				for (int s = 0; s < L; s++) {
					list.add(array[s]);
					if (s == L - 1) {
						for (int k = L + 1; k <= max; k++) {
							list.add("0");
						}
					}
				}
				Lines = readers.readLine();
			}
			int j = 0;
			for (int a = 0; a < sodong; a++) {
				for (int b = 0; b < max; b++) {

					array1[a][b] = Integer.parseInt(list.get(j));
					j++;
				}
			}
			// end
			// duyệt xóa các dòng có phần tử giống nhau
			// in ra mang trong file outResultTest
			System.out.println("mang sau khi doc file outResultTest");
			for (int a = 0; a < sodong; a++) {
				for (int b = 0; b < max; b++) {
					System.out.print(array1[a][b]);
				}
				System.out.println();
			}
			
			// in ra mang trong file ResultAI
			System.out.println("mang sau khi doc file ResultAI");
			for (int a = 0; a < sodongResultAI; a++) {
				for (int b = 0; b < maxResultAI; b++) {
					System.out.print(arrResultAI[a][b]);
				}
				System.out.println();
			}
//			App.main(array1, arrResultAI);
			Hung.main(array1, arrResultAI);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private List<Row> filterFirstTime(List<Row> dataItemsParent) {
		List<Row> itemsFirst = new ArrayList<>();
		List<Item> atomItems = getChildItem(dataItemsParent);
		for (Item i : atomItems) {
			List<Item> lRow = new ArrayList<>();
			lRow.add(i);
			Row row = new Record(lRow);
			itemsFirst.add(row);
		}
		return itemsFirst;
	}

	private List<Item> getChildItem(List<Row> dataItemsParent) {
		List<Item> itemList = new ArrayList<>();
		for (Row row : dataItemsParent) {
			List<Item> itemValues = row.getItemList();
			itemList.addAll(utils.pruneDuplicateItem(itemValues));
		}
		return utils.pruneDuplicateItem(itemList);
	}

	private Record getRecord(List<Item> child, List<Record> records) {
		for (Record i : records) {
			Record temp = new Record(child);
			if (i.equals(temp)) {
				return i;
			}
		}
		return null;
	}

	private List<Row> cloneArray(List<Row> resultItems) {
		List<Row> dataResultItemsClone = new ArrayList<>();
		for (Row c : resultItems) {
			dataResultItemsClone.add(((Record) c).clone());
		}
		return dataResultItemsClone;
	}

	@Override
	public void findSubChild(List<Row> dataItemsParent) {

		List<Record> itemsRuleLocal = new ArrayList<>();
		itemsRule.clear();

		for (Row parent : dataOriginalItems) {
			for (Row child : dataItemsParent) {

				int count = 0; // if count equal size of transaction, delete tag
				if (parent.isDeleteTag()) {
					break;
				}

				Record i = new Record(parent.getItemList(), child.getItemList());
				if (!itemsRuleLocal.contains(i)) {
					i.setItemsParent(parent.getItemList());
					itemsRuleLocal.add(i);
					count++;
				} else {
					Record clone = getRecord(child.getItemList(), itemsRuleLocal);
					if (null != clone) {
						clone.setItemsParent(parent.getItemList());
					}
				}

				if (count == parent.getItemList().size()) {
					parent.setDeleteTag(true);
				}
			}
		}

		itemsRule.addAll(itemsRuleLocal);
	}

	@Override
	public void getItemsChild(List<Row> items) {
		List<Row> dataItemsChildLocal = new ArrayList<>();
		List<Item> itemAtom = getChildItem(items);
		for (Row s : items) {
			for (Item a : itemAtom) {

				List<Item> temp = new ArrayList<>();
				temp.addAll(s.getItemList());
				if (temp.contains(a)) {
					continue;
				}

				temp.add(a);
				Row complex = new Record(temp);

				if (!dataItemsChildLocal.contains(complex)) {
					dataItemsChildLocal.add(complex);
				}
			}
		}
		dataItemsChild.addAll(dataItemsChildLocal);
	}
}
