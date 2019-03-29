package ${ativityPackageName};

import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
<#if needRecyclerView>
import android.support.v7.widget.RecyclerView;
</#if>
import com.alibaba.android.arouter.facade.annotation.Route;
import com.app.commonres.dialog.WaitDialog;
<#if needFragment>
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
</#if>
import com.app.commonsdk.wrapper.RouterHelper;
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
<#if needRecyclerView>
import ${adapterPackageName}.${pageName}Adapter;
import ${entityPackageName}.${pageName}Entity;

import java.util.ArrayList;
import java.util.List;
</#if>
import javax.inject.Inject;
<#if needRecyclerView>
import butterknife.BindView;
</#if>
import static com.app.frame.utils.Preconditions.checkNotNull;

<#import "root://activities/MVPArmsTemplate/globals.xml.ftl" as gb>
<@gb.fileHeader />
// @Route(path = "", name = "${pageName}")
public class ${pageName}Activity extends BaseActivity<${pageName}Presenter> implements ${pageName}Contract.View {
    <#if needRecyclerView>

    @BindView(R2.id.mRecyclerView)
    RecyclerView mRecyclerView;

    @Inject
    RecyclerView.LayoutManager mLayoutManager;

    </#if>
    @Inject
    WaitDialog waitDialog;

    <#if needRecyclerView>
    private List<${pageName}Entity> mDataList = new ArrayList<>();
    private ${pageName}Adapter mAdapter;
    </#if>
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
        RouterHelper.inject(this);
        <#if needRecyclerView>
        mAdapter = new ${pageName}Adapter(mDataList);
        ArmsUtils.configRecyclerView(mRecyclerView, mLayoutManager, mAdapter);
        </#if>
        <#if needFragment>
        FragmentManager fm = getSupportFragmentManager();
        FragmentTransaction transaction = fm.beginTransaction();
        transaction.add(R.id.${pageName}_framelayout, ${pageName}Fragment.newInstance());
        transaction.commitAllowingStateLoss();
        </#if>
    }

    @Override
    public void showLoading() {
        waitDialog.show();
    }

    @Override
    public void hideLoading() {
        waitDialog.dismiss();
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

    @Override
    public Activity getActivity() {
        return this;
    }

    @Override
    protected void onDestroy() {
        WaitDialog.release(waitDialog);
        <#if needRecyclerView>
        DefaultAdapter.releaseAllHolder(mRecyclerView);
        </#if>
        super.onDestroy();
    }
}
