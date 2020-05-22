@galaxeeChart2 @galaxee @galaxee0  @1.19
Feature: 数据大屏-s水球图

#  Background:
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible

  Scenario: 水球图-样式搜索
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "水球图-样式搜索"
    And I click the "Ensure" button
    #水球图
    And I click the "Chart" button
    And I wait for "1000" millsecond
    And I wait for "Liquidfill" will be visible
    And I click the "Liquidfill" button
    And I click the "Style" button
     # 水波动画
    And I wait for "WaterWavePainting" will be visible
    And I click the "WaterWavePainting" button
    And I switch the "WaterWaveSwitchLabel" button to "disable"
    #形状
    And I click the "LiquidShapeHeader" button
    And I choose the "pin" from the "LiquidShape"
    #外边框
    And I click the "OuterFrame" button
    And I switch the "OuterFrameSwitch" button to "disable"
    #标签
    And I click the "Tag" button
    And I set the parameter "TagWordSize" with value "70"
    And I click the "TagColorInWaterWave" button
    And I set the parameter "ColorInput" with value "#F87272"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible

    And I click the "TagColorOutWaterWave" button
    And I set the parameter "ColorInput" with value "#010206"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #水波颜色
    And I click the "WaterWaveColorHeader" button
    And I click the "WaterWaveColor" button
    And I set the parameter "ColorInput" with value "#ECF492"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #尺寸
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "500"
    And I set the parameter "height" with value "600"
    And I set the parameter "ChartXaxis" with value "0"
    And I set the parameter "ChartYaxis" with value "200"
    #3 全局样式修改名称
    And I click the "globalStyle" button
    And I set the parameter "globalStyleName" with value "水球图-样式搜索"
    #开启背景动画
    And I click the "backgroundAuto" button
    #数据
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count() as num | eval p = num/28000"
#    And I click the "DateEditor" button
#    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"

    And I choose the "p" from the "DataField"
    And I click the "Save" button
    Then I will see the success message "保存成功"


  Scenario Outline: 水球图-样式搜索发布页截图
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"
    And I close all tabs except main tab
    And I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    Then take a screenshot with name "galaxee/<name>"
    #删除
    Then open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
    Then I click the "Ensure" button

    Examples:
      | name |
      |水球图-样式搜索 |

##################################无耻的分割线###################################

  Scenario: 水球图-静态数据
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "水球图-静态数据"
    And I click the "Ensure" button
    #水球图
    And I click the "Chart" button
    And I wait for "1000" millsecond
    And I wait for "Liquidfill" will be visible
    And I click the "Liquidfill" button
    And I click the "Style" button
     #数据设置
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count() as num | eval p = num/28000"
#    And I click the "DateEditor" button
#    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"
      #选择静态数据
    And I click the "dataSourceType" button
    And I click the "statisticsData" button
    And I click the "Ensure" button
    And I click the "tips" button

    And I choose the "p" from the "DataField"
    #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"


  Scenario Outline: 水球图-静态数据发布并截图
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"
    And I close all tabs except main tab
    And I wait for loading invisible
    Then take a screenshot with name "galaxee/<name>"
    #删除
    Then open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
    Then I click the "Ensure" button

    Examples:
      |name            |
      |水球图-静态数据  |

#################################无耻的分割线###############################

  Scenario: 水球图-绑定搜索
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "水球图-绑定搜索"
    And I click the "Ensure" button
      #在【其他】中添加一个【搜索】控件
    And I click the "Other" button
    And I click the "otherSearch" button
    And I wait for "2000" millsecond
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count() as num | eval p = num/28000"
#    And I click the "DateEditor" button
#    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"
     #水球图
    And I click the "Chart" button
    And I wait for "1000" millsecond
    And I wait for "Liquidfill" will be visible
    And I click the "Liquidfill" button
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

    And I choose the "p" from the "DataField"
      #保存
    And I click the "Save" button
    Then I will see the success message "保存成功"


  Scenario Outline: 水球图-绑定搜索发布页截图
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"
    And I close all tabs except main tab
    And I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    Then take a screenshot with name "galaxee/<name>"
    #删除
    Then open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
    Then I click the "Ensure" button

    Examples:
      | name  |
      | 水球图-绑定搜索 |

