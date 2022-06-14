package apriori;


import domain.Row;

import java.util.ArrayList;
import java.util.List;

public class AprioriFindItemsChild_Thread extends Thread {

    // Delegate Pattern
    interface AprioriItemsChild {
        void getItemsChild(List<Row> dataItemsParent);
    }

    AprioriItemsChild apriAction;

    private long id;
    private List<Row> dataItemsParent;
    public static int MULTI_THREAD = 1;

    public AprioriFindItemsChild_Thread(AprioriItemsChild apriAction, long id, List<Row> dataItemsParent) {
        super();
        this.apriAction = apriAction;
        this.id = id;

        List<Row> data = new ArrayList<>();
        int start = (int) id * (dataItemsParent.size() / MULTI_THREAD);
        int end = (int) (id + 1) * (dataItemsParent.size() / MULTI_THREAD);
        if (id == MULTI_THREAD - 1) {
            end = dataItemsParent.size();
        }
        for (int i = start; i < end; i++) {
            data.add(dataItemsParent.get(i));
        }

        this.dataItemsParent = data;
    }

    public long getId() {
        return id;
    }


    @Override
    public void run() {
        super.run();
        apriAction.getItemsChild(dataItemsParent);
    }
}
