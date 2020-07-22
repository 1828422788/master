@1.1   @galaxee  @galaxee2
Feature: 数据大屏-a折线图

#  Background:
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible

  Scenario: 折线图-搜索
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "折线图-搜索"
    And I click the "Ensure" button
    #折线图
    And I click the "Chart" button
    And I wait for "Line" will be visible
    And I click the "Line" button
    And I click the "Style" button
 # x轴
    And I wait for "XaxisHeader" will be visible
    And I click the "XaxisHeader" button
      #文本
    And I wait for "XaxisWordSize" will be visible
    And I set the parameter "XaxisWordSize" with value "20"
#    And I click the "XaxisWordColor" button
    And I wait for "XColorInput" will be visible
    And I set the parameter "XColorInput" with value "#CF3131"
    And I wait for "EnsureColor" will be visible
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "bolder" from the "XaxisWordBold"
     #轴标签
    And I set the parameter "XaxisShift" with value "5"
    And I choose the "倾斜" from the "XaxisAngle"
     #显示分割线this.colorPicker("x轴", "文本")
    And I switch the "XaxisSeparator" button to "enable"
       #分割线的设置
    And I set the parameter "XDividingLineBold" with value "3"

#    And I click the "XDividingLineColor" button
    And I wait for "XDividingLineColor" will be visible
    And I set the parameter "XDividingLineColor" with value "#CD9080"
#    And I let element "ColorInput" lose focus
    And I wait for "EnsureColor" will be visible
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible

    And I choose the "dotted" from the "XDividingLineType"
     # 轴线
#    And I click the "xLineColor" button
    And I wait for "xLineColor" will be visible
    And I set the parameter "xLineColor" with value "#26CC55"
    And I wait for "EnsureColor" will be visible
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I set the parameter "XLineBold" with value "4"
#Y轴
    And I click the "YaxisHeader" button
     #文本
    And I set the parameter "YaxisWordSize" with value "20"
#    And I click the "YaxisWordColor" button
    And I wait for "YColorInput" will be visible
    And I set the parameter "YColorInput" with value "#19B535"
    And I wait for "EnsureColor" will be visible
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "bold" from the "YaxisWordBold"
     # 轴标签
    And I set the parameter "YaxisShift" with value "10"
    And I choose the "倾斜" from the "YaxisAngle"
     #分割线
    #分割线的设置
    And I set the parameter "YDividingLineBold" with value "2"
#    And I click the "YDividingLineColor" button
    And I wait for "YDividingLineColor" will be visible
    And I set the parameter "YDividingLineColor" with value "#BBB80B"
    And I wait for "EnsureColor" will be visible
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "dashed" from the "YDividingLineType"
    # 轴线
#    And I click the "YLineColor" button
    And I wait for "YLineColor" will be visible
    And I set the parameter "YLineColor" with value "#CBD50D"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I set the parameter "YLineBold" with value "4"
#布局
    And I click the "Layout" button
    And I wait for "LayoutBottom" will be visible
    And I set the parameter "LayoutBottom" with value "20"
    And I set the parameter "LayoutLeft" with value "20"
    And I set the parameter "LayoutRight" with value "20"

    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "1200"
    And I set the parameter "Height" with value "636"
    And I set the parameter "ChartXaxis" with value "300"
    And I set the parameter "ChartYaxis" with value "240"
    #数据
    And I click the "Data" button
    And I set the parameter "SplInput" with value "starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart | bucket timestamp span=2000s as ts| stats count() by ts | sort by +ts"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible


    And I choose the "ts" from the "Xaxis"
    And I wait for "1000" millsecond
    And I choose the "count()" from the "Yaxis"

    And I wait for "Save" will be visible
    And I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"


#  Scenario Outline: 折线图-搜索发布页截图
#    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
#    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
#    And switch to window "<name>"
#    And I close all tabs except main tab
#    And I wait for "Loading" will be invisible
#    And I wait for "1000" millsecond
#    Then take a screenshot with name "galaxee/<name>"
#    #删除
#    Then open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
#    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
#    Then I click the "Ensure" button
#
#    Examples:
#      | name |
#      | 折线图-搜索 |

##################################无耻的分割线##############################

  Scenario: 折线图-静态数据
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "折线图-静态数据"
    And I click the "Ensure" button
    #折线图
    And I click the "Chart" button
    And I wait for "Line" will be visible
    And I click the "Line" button
    And I click the "Style" button
    #图例
    And I click the "Example" button
    And I set the parameter "ExampleWordSize" with value "20"
#    And I click the "ExampleColor" button
    And I wait for "ExampleColor" will be visible
    And I set the parameter "ExampleColor" with value "#D73535"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "bolder" from the "ExampleWordBold"
    And I choose the "居中" from the "ExampleHorizontal"
    And I choose the "顶部" from the "ExampleVertical"
    #尺寸
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "1637"
    And I set the parameter "Height" with value "739"
    And I set the parameter "ChartXaxis" with value "300"
    And I set the parameter "ChartYaxis" with value "142"
    #数据
    And I click the "Data" button
    And I set the parameter "SplInput" with value "starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart | bucket timestamp span=2000s as ts| stats count() by ts | sort by +ts"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
      #选择静态数据
    And I click the "dataSourceType" button
    And I click the "statisticsData" button
    And I click the "Ensure" button

    And I wait for "tipsText" will be invisible

    And I choose the "ts" from the "Xaxis"
    And I wait for "1000" millsecond
    And I choose the "count()" from the "Yaxis"
    And I wait for "1000" millsecond
    And I click the "AddGroup" button
    And I choose the "count()" from the "Group"
    #保存
    And I wait for "Save" will be visible
    And I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"

#
#  Scenario Outline: 折线图-静态数据发布并截图
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
#
#    Examples:
#      |name            |
#      |折线图-静态数据|

##################################无耻的分割线###############################

  Scenario: 折线图-绑定搜索
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And  I wait for "Create" will be visible
    When I click the "Create" button
    And I set the parameter "Name" with value "折线图-绑定搜索"
    And I click the "Ensure" button
      #在【其他】中添加一个【搜索】控件
    And I click the "Other" button
    And I click the "otherSearch" button
    And I hide the element "otherDropdown"
    And I wait for "SplInput" will be visible
    And I set the parameter "SplInput" with value "starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart | bucket timestamp span=2000s as ts| stats count() by ts | sort by +ts"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"
   #折线图
    And I click the "Chart" button
    And I wait for "Line" will be visible
    And I click the "Line" button
    And I click the "Style" button
    #尺寸
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "1637"
    And I set the parameter "Height" with value "739"
    And I set the parameter "ChartXaxis" with value "300"
    And I set the parameter "ChartYaxis" with value "142"
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

    And I choose the "ts" from the "Xaxis"
    And I wait for "1000" millsecond
    And I choose the "count()" from the "Yaxis"
      #保存
    And I wait for "Save" will be visible
    And I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"

#
#  Scenario Outline: 折线图-绑定搜索发布并截图
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
#      |name       |
#      |折线图-绑定搜索|


