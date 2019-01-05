package ${ativityPackageName};

import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
<#if needFragment>
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
</#if>
import com.app.frame.base.BaseActivity;
import com.app.frame.di.component.AppComponent;
import com.app.frame.utils.ArmsUtils;

import ${componentPackageName}.Dagger${pageName}Component;
import ${contractPackageName}.${pageName}Contract;
import ${presenterPackageName}.${pageName}Presenter;

import ${packageName}.R;
<#if needFragment>
import ${packageName}.mvp.ui.fragment.${pageName}Fragment;
</#if>
import static com.app.frame.utils.Preconditions.checkNotNull;

<#import "root://activities/MVPArmsTemplate/globals.xml.ftl" as gb>
<@gb.fileHeader />
public class ${pageName}Activity extends BaseActivity<${pageName}Presenter> implements ${pageName}Contract.View {

    @Override
    public void setupActivityComponent(@NonNull AppComponent appComponent) {
        Dagger${pageName}Component
                .builder()
                .appComponent(appComponent)
                .view(this)
                .build()
                .inject(this);
    }

    @Override
    public int initView(@Nullable Bundle savedInstanceState) {
        return R.layout.${activityLayoutName};
    }

    @Override
    public void initData(@Nullable Bundle savedInstanceState) {
        <#if needFragment>
        FragmentManager fm = getSupportFragmentManager();
        FragmentTransaction transaction = fm.beginTransaction();
        transaction.add(R.id.${pageName}_framelayout, ${pageName}Fragment.newInstance());
        transaction.commitAllowingStateLoss();
        </#if>
    }

    @Override
    public void showLoading() {

    }

    @Override
    public void hideLoading() {

    }

    @Override
    public void showMessage(@NonNull String message) {
        checkNotNull(message);
        ArmsUtils.snackbarText(message);
    }

    @Override
    public void launchActivity(@NonNull Intent intent) {
        checkNotNull(intent);
        ArmsUtils.startActivity(intent);
    }

    @Override
    public void killMyself() {
        finish();
    }
}
