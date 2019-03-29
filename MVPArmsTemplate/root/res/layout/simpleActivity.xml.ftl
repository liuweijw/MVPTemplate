<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="@color/public_color_EDEDED"
    android:orientation="vertical">

    <include layout="@layout/public_include_toolbar" />

    <#if needRecyclerView>
    <android.support.v7.widget.RecyclerView
        android:id="@+id/mRecyclerView"
        android:layout_width="match_parent"
        android:layout_height="match_parent" />
    </#if>
    <#if !needRecyclerView>
    <FrameLayout
        android:id="@+id/${pageName}_framelayout"
        android:layout_width="match_parent"
        android:layout_height="match_parent" />
    </#if>
</LinearLayout>