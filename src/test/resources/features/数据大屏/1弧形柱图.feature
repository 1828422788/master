 @galaxee @galaxee1   @1.20
Feature: 数据大屏-a弧形柱图

#  Background:
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible

  Scenario: 弧形柱图-样式搜索 RZY-2555,RZY-2613,RZY-2614,RZY-2615,RZY-2616
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "弧形柱图-样式搜索"
    And I click the "Ensure" button
    #弧形柱图
    And I click the "Chart" button

    And I wait for "ArcBar" will be visible
    And I click the "ArcBar" button
    And I click the "Style" button
    #半径轴
    And I wait for "RadiusAxis" will be visible
    And I click the "RadiusAxis" button
    And I set the parameter "RadiusAxisSize" with value "20"

#    And I click the "RadiusAxisColor" button
    And  I wait for "RadiusAxisColor" will be visible
    And I set the parameter "RadiusAxisColor" with value "#41F1F1"
    And I click the button "EnsureColor" if exist
#    And I wait for "EnsureColor" will be invisible
    And I choose the "bold" from the "RadiusAxisBold"
    And I choose the "倾斜" from the "RadiusAxisAngle"
    #角度轴
    And I click the "AngleAxisHeader" button
    And I wait for "1000" millsecond
    And I set the parameter "AngleAxisSize" with value "20"
#    And I click the "AngleAxisColor" button
    And I wait for "AngleAxisColor" will be visible
    And I set the parameter "AngleAxisColor" with value "#E3A6F2"
    And I click the button "EnsureColor" if exist
#    And I click the "EnsureColor" button
#    And I wait for "EnsureColor" will be invisible
    And I choose the "lighter" from the "AngleAxisBold"
    #极坐标系
    And I click the "PolarCoordinates" button
    And I wait for "PolarXaxis" will be visible
    And I set the parameter "PolarXaxis" with value "40%"
    And I set the parameter "PolarYaxis" with value "60%"
    And I set the parameter "PolarRadius" with value "70%"
    #图例
    And I click the "Example" button
    And I set the parameter "ExampleWordSize" with value "20"
#    And I click the "ExampleColor" button
    And  I wait for "ExampleColor" will be visible
    And I set the parameter "ExampleColor" with value "#D73535"
    And I click the button "EnsureColor" if exist
#    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "lighter" from the "ExampleWordBold"
    And I choose the "居中" from the "ExampleHorizontal"
    And I choose the "顶部" from the "ExampleVertical"
    #尺寸
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "510"
    And I set the parameter "Height" with value "378"
    And I set the parameter "ChartXaxis" with value "527"
    And I set the parameter "ChartYaxis" with value "208"
    #数据
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count() by apache.clientip,apache.method"
#    And I click the "DateEditor" button
#    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"

    And I choose the "count()" from the "AngleAxis"
    And I wait for "2000" millsecond
    And I choose the "apache.clientip" from the "RadialAxis"

   #保存
    And I wait for "Save" will be visible
    And I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"

#  Scenario Outline: 弧形柱图-样式搜索发布页截图
#    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
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
#      | 弧形柱图-样式搜索 |

##################################无耻的分割线###################################

  Scenario: 弧形柱图-静态数据
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "弧形柱图-静态数据"
    And I click the "Ensure" button
    #弧形柱图
    And I click the "Chart" button
    And I wait for "ArcBar" will be visible
    And I click the "ArcBar" button
    And I click the "Style" button

    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "510"
    And I set the parameter "Height" with value "378"
    And I set the parameter "ChartXaxis" with value "527"
    And I set the parameter "ChartYaxis" with value "208"
     #数据设置
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count() by apache.clientip,apache.method"
#    And I click the "DateEditor" button
#    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"
      #选择静态数据
    And I click the "dataSourceType" button
    And I wait for "1000" millsecond
    And I click the "statisticsData" button
    And I click the "Ensure" button
    And I wait for "tipsText" will be invisible

    And I choose the "count()" from the "AngleAxis"
    And I wait for "2000" millsecond
    And I choose the "apache.clientip" from the "RadialAxis"
   #保存
    And I wait for "Save" will be visible
    And I wait for "2000" millsecond
    And I click the "Save" button under some element
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"


#  Scenario Outline: 弧形柱图-静态数据发布并截图
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
#      |弧形柱图-静态数据   |

#################################无耻的分割线###############################

  Scenario: 弧形柱图-绑定搜索
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value " 弧形柱图-绑定搜索"
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
      #弧形柱图
     #弧形柱图
    And I click the "Chart" button
    And I wait for "ArcBar" will be visible
    And I click the "ArcBar" button
    And I click the "Style" button

    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "510"
    And I set the parameter "Height" with value "378"
    And I set the parameter "ChartXaxis" with value "527"
    And I set the parameter "ChartYaxis" with value "208"
      #在数据源类型中选择绑定搜索
    And I click the "Data" button
    And I click the "dataSourceType" button
    And I wait for "1000" millsecond
    And I click the "bindingSearch" button
      #选择上步添加的搜索
    And I click the "bindingSearchChoose" button
    And I click the "search_widget" button
      #再次点击搜索控件中的【搜索按钮】
    And I click the "pictureTwo" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
     #对参数进行设置
    And I click the "pictureOne" button
    And I click the "Data" button

    And I choose the "count()" from the "AngleAxis"
    And I wait for "2000" millsecond
    And I choose the "apache.clientip" from the "RadialAxis"
    #添加分组
    And I click the "AddGroup" button
    And I wait for "Group" will be visible
    And I choose the "apache.method" from the "Group"
    And I click the "Pile" button
#    And I switch the "Pile" button to "enable"
      #保存
    And I wait for "Save" will be visible
    And I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"

#  Scenario Outline: 弧形柱图-绑定搜索发布页截图
#    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
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
#      | name  |
#      | 弧形柱图-绑定搜索|

