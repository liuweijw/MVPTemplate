package ${adapterPackageName};

import android.support.annotation.NonNull;
import android.view.View;

import com.app.frame.base.BaseHolder;
import com.app.frame.base.DefaultAdapter;
import ${packageName}.R;
import ${entityPackageName}.${pageName}Entity;
import ${holderPackageName}.${pageName}Holder;

import java.util.List;

public class ${pageName}Adapter extends DefaultAdapter<${pageName}Entity> {

    public ${pageName}Adapter(List<${pageName}Entity> mDataList) {
        super(mDataList);
    }

    @NonNull
    @Override
    public BaseHolder<${pageName}Entity> getHolder(@NonNull View v, int viewType) {
        return new ${pageName}Holder(v);
    }

    @Override
    public int getLayoutId(int viewType) {
        return 0;
    }
}
