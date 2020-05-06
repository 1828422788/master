@galaxeeChart
Feature: 数据大屏-力图

  Scenario: 力图-样式搜索
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "力图-样式搜索"
    And I click the "Ensure" button
    #力图
    And I click the "Chart" button
    And I drag the scroll bar to the element "Force"
    And I click the "Force" button
    #样式
    And I click the "Style" button
    And I wait for "ChartTag" will be visible
    And I click the "ChartTag" button
    And I click the "ColorSelector" button
    And I click the "Red" button
    And I set the parameter "ChartWordSize" with value "20"
    And I click the "RepulsionFactorHeader" button
    And I set the parameter "RepulsionFactor" with value "10"
    #尺寸
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "611"
    And I set the parameter "Height" with value "618"
    And I set the parameter "ChartXaxis" with value "506"
    And I set the parameter "ChartYaxis" with value "20"
    #3 全局样式修改名成
    And I click the "globalStyle" button
    And I set the parameter "globalStyleName" with value "力图-样式搜索"
     #开启背景动画
    And I click the "backgroundAuto" button
    #数据
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart| stats count() by apache.clientip,apache.request_path |limit 10"
    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"

    And I choose the "apache.clientip" from the "SourceField"
    And I choose the "apache.request_path" from the "TargetField"
    And I choose the "count()" from the "WeightField"
    And I click the "Save" button
#    Then I will see the success message "保存成功"


  Scenario Outline: 力图-样式搜索发布页截图
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"
    And I close all tabs except main tab
    And I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      | name |
      | 力图-样式搜索 |

######################################无耻的分割线################################

  Scenario: 力图-静态数据
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "力图-静态数据"
    And I click the "Ensure" button
     #力图
    And I click the "Chart" button
    And I drag the scroll bar to the element "Force"
    And I click the "Force" button
    And I click the "Style" button
    #数据
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart| stats count() by apache.clientip,apache.request_path |limit 10"
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

    And I choose the "apache.clientip" from the "SourceField"
    And I choose the "apache.request_path" from the "TargetField"
    And I choose the "count()" from the "WeightField"

    #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
#    Then I will see the success message "保存成功"


  Scenario Outline: 力图-静态数据发布并截图
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"
    And I close all tabs except main tab
    And I wait for loading invisible
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      |name            |
      |力图-静态数据  |

######################################无耻的分割线################################


  Scenario: 力图-绑定搜索
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "力图-绑定搜索"
    And I click the "Ensure" button
      #在【其他】中添加一个【搜索】控件
    And I click the "Other" button
    And I click the "otherSearch" button
    And I wait for "SplInput" will be visible
    And I set the parameter "SplInput" with value "tag:sample04061424_chart| stats count() by apache.clientip,apache.request_path |limit 10"
    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"
      #力图
    And I click the "Chart" button
    And I drag the scroll bar to the element "Force"
    And I click the "Force" button
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
     #参数进行设置
    And I click the "pictureOne" button
    And I click the "Data" button
    And I wait for "3000" millsecond

    And I choose the "apache.clientip" from the "SourceField"
    And I choose the "apache.request_path" from the "TargetField"
    And I choose the "count()" from the "WeightField"
      #保存
    And I click the "Save" button
#    Then I will see the success message "保存成功"

  Scenario Outline: 力图-绑定搜索发布并截图
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"
    And I close all tabs except main tab
    And I wait for loading invisible
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      |name                |
      |力图-绑定搜索|


  Scenario Outline: 删除关于力图的大屏
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-shanchu1" delete button
    Then I click the "Ensure" button

    Examples:
      |name|
      | 力图-样式搜索 |
      |力图-静态数据  |
      |力图-绑定搜索|