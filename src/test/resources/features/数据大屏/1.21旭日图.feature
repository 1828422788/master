@galaxeeChart
Feature: 数据大屏-旭日图

  Scenario: 旭日图-样式搜索
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "旭日图-样式搜索"
    And I click the "Ensure" button
    #旭日图
    And I click the "Chart" button
    And I drag the scroll bar to the element "Sunburst"
    And I click the "Sunburst" button
    #样式
    And I click the "Style" button
    And I wait for "ChartTag" will be visible
    And I click the "ChartTag" button
    And I click the "ColorSelector" button
    And I click the "Green" button
    And I set the parameter "ChartWordSize" with value "20"
    And I click the "Radius" button
    And I set the parameter "InnerRadius" with value "20%"
    And I set the parameter "OuterRadius" with value "80%"
    #尺寸
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "1000"
    And I set the parameter "Height" with value "375"
    And I set the parameter "ChartXaxis" with value "393"
    And I set the parameter "ChartYaxis" with value "30"
    #3 全局样式修改名称
    And I click the "globalStyle" button
    And I set the parameter "globalStyleName" with value "旭日图-样式搜索"
    #开启背景动画
    And I click the "backgroundAuto" button
    #数据
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count() by apache.status,apache.geo.province, apache.geo.city"
    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"

    And I choose the "count()" from the "DataField"
    And I choose the "apache.geo.city" from the "DivideField"

    And I wait for "Save" will be visible
    And I click the "Save" button
#    Then I will see the success message "保存成功"

  Scenario Outline: 旭日图-样式搜索发布页截图
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"
    And I close all tabs except main tab
    And I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      | name  |
      | 旭日图-样式搜索|

##################################无耻的分割线###################################

  Scenario: 旭日图-静态数据
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "旭日图-静态数据"
    And I click the "Ensure" button
    #旭日图
    And I click the "Chart" button
    And I drag the scroll bar to the element "Sunburst"
    And I click the "Sunburst" button
    And I click the "Style" button
     #数据设置
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count() by apache.status,apache.geo.province, apache.geo.city"
    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"
      #选择静态数据
    And I click the "dataSourceType" button
    And I click the "statisticsData" button
    And I click the "Ensure" button
    And I wait for "6000" millsecond

    And I choose the "count()" from the "DataField"
    And I choose the "apache.geo.city" from the "DivideField"
    #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
#    Then I will see the success message "保存成功"


  Scenario Outline: 旭日图-静态数据发布并截图
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"
    And I close all tabs except main tab
    And I wait for loading invisible
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      |name            |
      |旭日图-静态数据   |

#################################无耻的分割线###############################

  Scenario: 旭日图-绑定搜索
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "旭日图-绑定搜索"
    And I click the "Ensure" button
      #在【其他】中添加一个【搜索】控件
    And I click the "Other" button
    And I click the "otherSearch" button
    And I wait for "2000" millsecond
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count() by apache.status,apache.geo.province, apache.geo.city"
    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"
     #旭日图
    And I click the "Chart" button
    And I drag the scroll bar to the element "Sunburst"
    And I click the "Sunburst" button
    And I click the "Style" button
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
     #对参数进行设置
    And I click the "pictureOne" button
    And I click the "Data" button
    And I wait for "3000" millsecond

    And I choose the "count()" from the "DataField"
    And I choose the "apache.geo.city" from the "DivideField"
    #添加切分字段
    And I click the "Add" button
    And I choose the "apache.geo.province" from the "lastDivideField"
      #保存
    And I click the "Save" button
#    Then I will see the success message "保存成功"


  Scenario Outline: 旭日图-绑定搜索发布页截图
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"
    And I close all tabs except main tab
    And I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      | name  |
      | 旭日图-绑定搜索 |

  ###############################删除分割线#####################################################

  Scenario Outline: 删除关于| 旭日图 |的大屏
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-shanchu1" delete button
    Then I click the "Ensure" button

    Examples:
      |name|
      | 旭日图-绑定搜索 |
      |旭日图-静态数据   |
      | 旭日图-样式搜索|
