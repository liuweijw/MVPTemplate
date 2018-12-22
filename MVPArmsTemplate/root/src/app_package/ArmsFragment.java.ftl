package ${fragmentPackageName};

import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;

import com.app.frame.base.BaseFragment;
import com.app.frame.di.component.AppComponent;
import com.app.frame.utils.ArmsUtils;

import ${componentPackageName}.Dagger${pageName}Component;
import ${contractPackageName}.${pageName}Contract;
import ${presenterPackageName}.${pageName}Presenter;

import ${packageName}.R;

import static com.app.frame.utils.Preconditions.checkNotNull;

<#import "root://activities/MVPArmsTemplate/globals.xml.ftl" as gb>
<@gb.fileHeader />
public class ${pageName}Fragment extends BaseFragment<${pageName}Presenter> implements ${pageName}Contract.View{

    public static ${pageName}Fragment newInstance() {
        ${pageName}Fragment fragment = new ${pageName}Fragment();
        return fragment;
    }

    @Override
    public void setupFragmentComponent(@NonNull AppComponent appComponent) {
        Dagger${pageName}Component
                .builder()
                .appComponent(appComponent)
                .view(this)
                .build()
                .inject(this);
    }

    @Override
    public int getLayoutId() {
        return R.layout.${fragmentLayoutName};
    }

    @Override
    public void initData(@Nullable Bundle savedInstanceState) {

    }

    @Override
    public void setData(@Nullable Object data) {

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

    }
}
