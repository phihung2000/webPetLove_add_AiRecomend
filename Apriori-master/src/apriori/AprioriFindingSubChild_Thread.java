package apriori;

import domain.Row;

import java.util.ArrayList;
import java.util.List;

public class AprioriFindingSubChild_Thread extends Thread {

    // Delegate Pattern
    interface AprioriFindingSubChild {
        void findSubChild(List<Row> dataItemsParent);
    }

    AprioriFindingSubChild apriAction;

    private long id;
    private List<Row> dataItemsParent;
    public static int MULTI_THREAD = 200;

    public AprioriFindingSubChild_Thread(AprioriFindingSubChild apriAction, long id, List<Row> dataItemsParent) {
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
        apriAction.findSubChild(dataItemsParent);
    }
}
