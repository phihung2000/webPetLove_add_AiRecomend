package util;

import domain.Item;
import domain.Row;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Utils<T> {

    private static double startTime;
    private static double endTime;

    public List<T> convertArrayToList(T[] arr) {
        List<T> temp = new ArrayList<>();
        for (T s : arr) {
            temp.add(s);
        }
        return temp;
    }

    /**
     * Blute-Force algorithm Find the pattern substring matching in parent string
     * (maybe optimization with KMP, Boyer-Moore algorithm)
     *
     * @param parent
     * @param child
     * @return
     */
    /*
     * public boolean checkSubArrayContain(String[] parent, String[] child) { for
     * (int i = 0; i < parent.length; i++) { int j = i; int s = 0; while (s <
     * child.length) { if (child[s].equalsIgnoreCase(parent[j])) { s++; j++; if (s
     * == child.length) { return true; } } else { break; } } } return false; }
     */
    public boolean checkSubArrayContain(T[] parent, T[] child) {
        List<T> parentList = convertArrayToList(parent);
        for (T s : child) {
            if (!parentList.contains(s)) {
                return false;
            }
        }
        return true;
    }

    public boolean checkSubArrayContain(List<T> parent, List<T> child) {
        for (T t : child) {
            if (!parent.contains(t)) {
                return false;
            }
        }
        return true;
    }

    public String[] convertListToArray(List<String> list) {
        String[] temp = new String[list.size()];
        list.toArray(temp);
        return temp;
    }

    public void setTimeStart() {
        startTime = System.nanoTime();
    }

    public void setTimeEnd() {
        endTime = System.nanoTime();
        System.out.println("Took " + (1.0 * endTime - 1.0 * startTime) / 1000000000 + " s");
    }

    public List<Item> pruneDuplicateItem(List<Item> items) {
        Set<Item> sets = new HashSet<>(items);
        return new ArrayList<>(sets);
    }

    public List<Row> pruneDuplicateRow(List<Row> items) {
        Set<Row> sets = new HashSet<>(items);
        return new ArrayList<>(sets);
    }

    public List<String> pruneDuplicateString(List<String> items) {
        Set<String> sets = new HashSet<>(items);
        return new ArrayList<>(sets);
    }

    public boolean isEmptyList(List<?> list) {
        if (null == list || list.size() == 0) {
            return true;
        }
        return false;
    }

    public boolean isEmpty(String string) {
        if (null == string || string.length() == 0) {
            return true;
        }
        return false;
    }
}
