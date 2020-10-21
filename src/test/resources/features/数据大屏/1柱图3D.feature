@1.10  @galaxee @galaxee0
Feature: 数据大屏-g3D柱图
#  Background:
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible


  Scenario: 3D柱图样式-搜索 RZY-4820
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button

    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "3D柱图-搜索"
    And I click the "Ensure" button
    #选择3D柱图
    And I click the "Chart" button
    And I wait for "Column3D" will be visible
    And I click the "Column3D" button

    #数据设置（数据源类型默认：搜索）
    And I wait for "Data" will be visible
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | bucket timestamp span=2h as ts |stats count(apache.status),dc(apache.status) by apache.status"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible

    And I choose the "apache.status" from the "ColumnName"
    And I wait for "1000" millsecond
    And I choose the "apache.status" from the "ColumnName"
    And I wait for "1000" millsecond
    And I choose the "count(apache.status)" from the "ColumnValue1"
    And I wait for "1000" millsecond
    And I choose the "dc(apache.status)" from the "ColumnValue2"

    #修改样式
    # 1 设置图表尺寸位置
    And I click the "Style" button
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "800"
    And I set the parameter "Height" with value "490"
    And I set the parameter "ChartXaxis" with value "455"
    And I set the parameter "ChartYaxis" with value "275"
    #2 设置外观
    And I click the "StyleColumn3D" button
    #字体大小
    And I set the parameter "ColumnWordSize" with value "18"
    #字体颜色
    And I wait for "ColumnFontColor" will be visible
    And I set the parameter "ColumnFontColor" with value "#C23535"
    And I click the "EnsureColor" button
#    And I wait for "EnsureColor" will be invisible
    #轴颜色
    And I wait for "AxisColor" will be visible
    And I set the parameter "AxisColor" with value "#14c4c4"
    And I click the "EnsureColor" button
#    And I wait for "EnsureColor" will be invisible
    #柱1颜色
    And I wait for "ColumnOneColor" will be visible
    And I set the parameter "ColumnOneColor" with value "#2a76e4"
    And I click the "EnsureColor" button
#    And I wait for "EnsureColor" will be invisible
    #柱2颜色
    And I wait for "ColumnTwoColor" will be visible
    And I set the parameter "ColumnTwoColor" with value "#9401f1"
    And I click the "EnsureColor" button
#    And I wait for "EnsureColor" will be invisible
    #3 全局样式修改名成
    And I click the "globalStyle" button
    And I set the parameter "globalStyleName" with value "3D柱图样式"
     #开启背景动画
    And I click the "backgroundAuto" button

    #保存
    And I wait for "Save" will be visible
    And I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"


######################################无耻的分割线################################

  Scenario: 3D柱图样式-搜索之静态数据
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button

    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "3D柱图之静态数据"
    And I click the "Ensure" button
    #选择3D柱图
    And I click the "Chart" button
    And I wait for "Column3D" will be visible
    And I click the "Column3D" button

    And I wait for "Style" will be visible
    And I click the "Style" button
    #数据设置（数据源类型默认：搜索）
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | bucket timestamp span=2h as ts |stats count(apache.status),dc(apache.status) by apache.status"
#    And I click the "DateEditor" button
#    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
      #选择静态数据
    And I click the "dataSourceType" button
    And I click the "statisticsData" button
    And I click the "Ensure" button

    And I wait for "tipsText" will be invisible

    And I choose the "apache.status" from the "ColumnName"
    And I wait for "1000" millsecond
    And I choose the "apache.status" from the "ColumnName"
    And I wait for "1000" millsecond
    And I choose the "count(apache.status)" from the "ColumnValue1"
    And I wait for "1000" millsecond
    And I choose the "dc(apache.status)" from the "ColumnValue2"

       #保存
    And I wait for "Save" will be visible
    And I wait for "2000" millsecond
    And I click the "Save" button under some element
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"


##################################无耻的分割线###############################



