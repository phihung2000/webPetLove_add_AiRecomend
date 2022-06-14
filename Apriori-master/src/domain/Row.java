package domain;

import java.util.List;

public interface Row<T> {

    void setItemList(List<T> values);

    List<T> getItemList();

    void setDeleteTag(boolean value);

    boolean isDeleteTag();
}
