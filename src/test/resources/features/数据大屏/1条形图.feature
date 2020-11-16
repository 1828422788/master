@1.6  @galaxee @galaxee0
Feature: 数据大屏-f条形图

#  Background:
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible

  Scenario: 条形图-样式搜索 RZY-1907,RZY-4381
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "条形图-样式搜索"
    And I click the "Ensure" button
    #条形图
    And I click the "Chart" button
    And I wait for "BarHorizontal" will be visible
    And I click the "BarHorizontal" button
    #样式
    And I wait for "Style" will be visible
    And I click the "Style" button
    #标签
    And I wait for "Tag" will be visible
    And I click the "Tag" button
    And I set the parameter "TagWordSize" with value "20"
#    And I click the "TagWordColor" button
    And I wait for "TagWordColor" will be visible
    And I set the parameter "TagWordColor" with value "#DFFE19"
    And I click the "EnsureColor" button
#    And I wait for "EnsureColor" will be invisible
    And I choose the "lighter" from the "TagBold"
    #布局
    And I click the "Layout" button
    And I wait for "LayoutBottom" will be visible
    And I set the parameter "LayoutBottom" with value "20"
    And I set the parameter "LayoutLeft" with value "20"
    And I set the parameter "LayoutRight" with value "20"
    #尺寸
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "703"
    And I set the parameter "height" with value "567"
    And I set the parameter "ChartXaxis" with value "516"
    And I set the parameter "ChartYaxis" with value "2"
     #4 全局样式修改名成
    And I click the "globalStyle" button
    And I set the parameter "globalStyleName" with value "条形图-样式搜索"
     #开启背景动画
    And I click the "backgroundAuto" button
    #数据
    And I click the "Data" button
    And I wait for "SplInput" will be visible
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count() by apache.clientip,apache.method | limit 10"
#    And I click the "DateEditor" button
#    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"

    And I choose the "count()" from the "DataField"
    And I wait for "1000" millsecond
    And I choose the "count()" from the "DataField"
    And I wait for "2000" millsecond
    And I choose the "apache.clientip" from the "DivideField"

      #保存
    And I wait for "Save" will be visible
    And I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"

#  Scenario Outline: 条形图-样式搜索发布并截图
#    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
#    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
#    And switch to window "<name>"
#    And I close all tabs except main tab
#    And I wait for loading invisible
#    Then take a screenshot with name "galaxee/<name>"
#    #删除
#    Then open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
#    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
#    Then I click the "Ensure" button
#
#    Examples:
#      |name              |
#      |条形图-样式搜索    |
##################################无耻的分割线###############################

  Scenario: 条形图-静态数据
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "条形图-静态数据"
    And I click the "Ensure" button
   #条形图
    And I click the "Chart" button
    And I wait for "BarHorizontal" will be visible
    And I click the "BarHorizontal" button
    And I wait for "Style" will be visible
    And I click the "Style" button
    #尺寸
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "703"
    And I set the parameter "height" with value "567"
    And I set the parameter "ChartXaxis" with value "516"
    And I set the parameter "ChartYaxis" with value "2"
    #数据设置（数据源类型默认：搜索）
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count() by apache.clientip,apache.method"
#    And I click the "DateEditor" button
#    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"
      #选择静态数据
    And I click the "dataSourceType" button
    And I click the "statisticsData" button
    And I click the "Ensure" button

    And I wait for "tipsText" will be invisible

    And I choose the "count()" from the "DataField"
    And I wait for "2000" millsecond
    And I choose the "apache.clientip" from the "DivideField"

      #保存
    And I wait for "Save" will be visible
    And I wait for "2000" millsecond
    And I click the "Save" button under some element
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"


#  Scenario Outline: 条形图-静态数据发布并截图
#    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
#    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
#    And switch to window "<name>"
#    And I close all tabs except main tab
#    And I wait for loading invisible
#    Then take a screenshot with name "galaxee/<name>"
#    #删除
#    Then open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
#    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
#    Then I click the "Ensure" button
#
#    Examples:
#      |name            |
#      |条形图-静态数据  |


##################################无耻的分割线###############################

  Scenario: 条形图-绑定搜索 RZY-4382
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "条形图-绑定搜索"
    And I click the "Ensure" button
      #在【其他】中添加一个【搜索】控件
    And I click the "Other" button
    And I click the "otherSearch" button under some element
    And I hide the element "otherDropdown"
     And I wait for "SplInput" will be visible
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count() by apache.clientip,apache.method"
#    And I click the "DateEditor" button
#    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"
    #条形图
    And I click the "Chart" button
    And I wait for "BarHorizontal" will be visible
    And I click the "BarHorizontal" button
    And I wait for "Style" will be visible
    And I click the "Style" button
    #尺寸
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "703"
    And I set the parameter "height" with value "567"
    And I set the parameter "ChartXaxis" with value "516"
    And I set the parameter "ChartYaxis" with value "2"
      #在数据源类型中选择绑定搜索
    And I click the "Data" button
    And I click the "dataSourceType" button
    And I click the "bindingSearch" button
      #选择上步添加的搜索
    And I click the "bindingSearchChoose" button
    And I click the "search_widget" button
      #再次点击搜索控件中的【搜索按钮】
    And I click the "pictureTwo" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
     #对滚动条形图的参数进行设置
    And I click the "pictureOne" button
    And I click the "Data" button


    And I choose the "count()" from the "DataField"
    And I wait for "2000" millsecond
    And I choose the "apache.clientip" from the "DivideField"
    #切分字段
    And I click the "Add" button
    And I choose the "apache.method" from the "LastDivideField"

        #保存
    And I wait for "Save" will be visible
    And I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"

#
#  Scenario Outline: 条形图-绑定搜索发布并截图
#    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
#    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
#    And switch to window "<name>"
#    And I close all tabs except main tab
#    And I wait for loading invisible
#    Then take a screenshot with name "galaxee/<name>"
#    #删除
#    Then open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
#    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
#    Then I click the "Ensure" button
#
#    Examples:
#      |name              |
#      |条形图-绑定搜索 |

