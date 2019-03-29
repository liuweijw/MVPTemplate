package ${contractPackageName};

import android.app.Activity;

import com.app.frame.mvp.IView;
import com.app.frame.mvp.IModel;

<#import "root://activities/MVPArmsTemplate/globals.xml.ftl" as gb>
<@gb.fileHeader />
public interface ${pageName}Contract {

    interface View extends IView {

        Activity getActivity();

    }

    interface Model extends IModel{

    }
}
