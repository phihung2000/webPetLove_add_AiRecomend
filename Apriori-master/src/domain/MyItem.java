package domain;

public class MyItem implements Item {

    private String nameItem;
    private int HASH_CONST = 17;

    public MyItem(String nameItem) {
        this.nameItem = nameItem;
    }

    public String getNameItem() {
        return nameItem;
    }

    @Override
    public int hashCode() {

        int hash_code = HASH_CONST;
        int nameHash = nameItem == null ? 1 : 0;
        hash_code = hash_code + 31 * nameHash;

        return hash_code;
    }

    @Override
    public boolean equals(Object o) {

        if (o == this) {
            return true;
        }
        if (!(o instanceof Item)) {
            return false;
        }

        MyItem i = (MyItem) o;
        if (!i.nameItem.equals(nameItem)) {
            return false;
        }

        return true;
    }
}
