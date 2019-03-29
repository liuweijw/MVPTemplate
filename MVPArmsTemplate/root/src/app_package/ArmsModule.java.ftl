package ${moudlePackageName};
<#if needRecyclerView>
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
</#if>
import dagger.Binds;
import dagger.Module;
import dagger.Provides;

import com.app.commonres.dialog.WaitDialog;
import com.app.frame.di.scope.ActivityScope;
import ${contractPackageName}.${pageName}Contract;
import ${modelPackageName}.${pageName}Model;

<#import "root://activities/MVPArmsTemplate/globals.xml.ftl" as gb>
<@gb.fileHeader />
@Module
public abstract class ${pageName}Module {

    @Binds
    abstract ${pageName}Contract.Model bind${pageName}Model(${pageName}Model model);

    <#if needRecyclerView>
    @ActivityScope
    @Provides
    static RecyclerView.LayoutManager provideLayoutManager(${pageName}Contract.View view) {
        return new LinearLayoutManager(view.getActivity());
    }
    </#if>
    @ActivityScope
    @Provides
    static WaitDialog provideWaitDialog(${pageName}Contract.View view) {
        return new WaitDialog(view.getActivity());
    }
}