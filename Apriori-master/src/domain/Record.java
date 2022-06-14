package domain;

import util.Utils;

import java.util.ArrayList;
import java.util.List;

public class Record implements Row<Item>, Cloneable {

    private int HASH_CONST = 17;

    private int position;
    private boolean deleteTag;
    private int quantity;

    private List<Item> itemList;
    private List<Item> parent;

    private Utils utils = new Utils();

    public Record(List<Item> itemList) {
        super();
        this.itemList = itemList;
        deleteTag = false;
        quantity = 0;
    }

    public Record(int position, List<Item> itemList) {
        super();
        this.position = position;
        this.itemList = itemList;
        deleteTag = false;
    }

    public Record(List<Item> parent, List<Item> child) {
        super();
        this.parent = parent;
        this.itemList = child;
        deleteTag = false;
        quantity = 0;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setItemsParent(List<Item> parent) {
        this.parent = parent;

        if (utils.checkSubArrayContain(parent, itemList)) {
            quantity++;
        }
    }

    @Override
    public void setItemList(List<Item> values) {
        this.itemList = values;
    }

    @Override
    public List<Item> getItemList() {
        return itemList;
    }

    @Override
    public void setDeleteTag(boolean value) {

    }

    @Override
    public boolean isDeleteTag() {
        return false;
    }

    public int getPosition() {
        return position;
    }

    @Override
    public int hashCode() {

        int hash_code = HASH_CONST;
        hash_code = hash_code + 31 * position;

        return hash_code;
    }

    @Override
    public boolean equals(Object o) {

        if (o == this) {
            return true;
        }
        if (!(o instanceof Record)) {
            return false;
        }

        Record i = (Record) o;
        if (i.getItemList().size() != getItemList().size()) {
            return false;
        }

        for (Item s : i.getItemList()) {
            if (!getItemList().contains(s)) {
                return false;
            }
        }
        return true;
    }

    @Override
    public Record clone() {

        // Deep clone
        List<Item> list = new ArrayList<>();
        for (Item s : this.getItemList()) {
            list.add(s);
        }

        Record record = null;
        try {
            record = (Record) super.clone();
            record.setItemList(list);
            record.position = getPosition();
            record.setDeleteTag(isDeleteTag());

            return record;
        } catch (CloneNotSupportedException e) {
            new AssertionError();
        }
        return record;
    }
}
