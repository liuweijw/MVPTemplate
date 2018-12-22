package ${moudlePackageName};

import dagger.Binds;
import dagger.Module;

import ${contractPackageName}.${pageName}Contract;
import ${modelPackageName}.${pageName}Model;

<#import "root://activities/MVPArmsTemplate/globals.xml.ftl" as gb>
<@gb.fileHeader />
@Module
public abstract class ${pageName}Module {

    @Binds
    abstract ${pageName}Contract.Model bind${pageName}Model(${pageName}Model model);
}