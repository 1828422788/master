@galaxeeChart2 @galaxee @galaxee0   @1.18
Feature: 数据大屏-r占比图3D

#  Background:
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible


  Scenario: 占比图3D数据之样式-搜索
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "占比图3D数据之样式-搜索"
    And I click the "Ensure" button
      #选择占比图3D
    And I click the "Chart" button
    And I wait for "percent3dChart" will be visible
    And I click the "percent3dChart" button
    And I click the "Style" button
    #设置样式
   # 1 设置图表尺寸位置
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "640"
    And I set the parameter "Height" with value "300"
    And I set the parameter "ChartXaxis" with value "500"
    And I set the parameter "ChartYaxis" with value "360"
    #2 修改样式
    And I click the "stylePercent3dChart" button
    #名称
    And I set the parameter "percent3dName" with value "今日出勤率"
    #名称字号
    And I set the parameter "percent3dNameFontSize" with value "20"
    #名称颜色
    And I click the "percent3dNameColor" button
    And I wait for "ColorInput" will be visible
    And I set the parameter "ColorInput" with value "#8EE1D1"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #数值字号
    And I set the parameter "numberFontSize" with value "40"
    #数值颜色
    And I click the "numberColor" button
    And I wait for "ColorInput" will be visible
    And I set the parameter "ColorInput" with value "#C11C6C"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #3 全局样式修改名成
    And I click the "globalStyle" button
    And I set the parameter "globalStyleName" with value "占比图3D样式修改"
    #开启背景动画
    And I click the "backgroundAuto" button
    #数据设置（数据源类型默认：搜索）
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count() as num | eval p = num/2800000"
#    And I click the "DateEditor" button
#    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"

    And I choose the "p" from the "percent3dDataSearchCategory"
    #值范围使其处于正常范围
    #正常
    And I set the parameter "normalMin" with value "0.5"
    And I set the parameter "normalMax" with value "0.6"
    #异常
    And I set the parameter "abnormalMin" with value "0.7"
    And I set the parameter "abnormalMax" with value "0.8"
    #严重
    And I set the parameter "seriousMin" with value "0.8"
    And I set the parameter "seriousMax" with value "0.9"
    #保存
    And I click the "Save" button
    Then I will see the success message "保存成功"


  Scenario Outline: 占比图3D数据之样式-搜索发布并截图
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
      |name               |
      |占比图3D数据之样式-搜索   |

######################################无耻的分割线################################


  Scenario: 占比图3D数据之静态数据
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "占比图3D数据之静态数据"
    And I click the "Ensure" button
           #选择占比图3D
    And I click the "Chart" button
    And I wait for "percent3dChart" will be visible
    And I click the "percent3dChart" button
    And I click the "Style" button
     #数据设置
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count() as num | eval p = num/2800000"
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

    And I choose the "p" from the "percent3dDataSearchCategory"
     #值范围使其处于异常范围
    #正常
    And I set the parameter "normalMin" with value "0.3"
    And I set the parameter "normalMax" with value "0.4"
    #异常
    And I set the parameter "abnormalMin" with value "0.5"
    And I set the parameter "abnormalMax" with value "0.6"
    #严重
    And I set the parameter "seriousMin" with value "0.7"
    And I set the parameter "seriousMax" with value "0.8"

    #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"


  Scenario Outline: 占比图3D数据之静态数据发布并截图
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
      |占比图3D数据之静态数据   |

######################################无耻的分割线################################

  Scenario: 占比图3D数据之绑定搜索
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "占比图3D数据之绑定搜索"
    And I click the "Ensure" button
      #在【其他】中添加一个【搜索】控件
    And I click the "Other" button
    And I click the "otherSearch" button
    And I hide the element "otherDropdown"
    And I wait for "SplInput" will be visible
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count() as num | eval p = num/2800000"
#    And I click the "DateEditor" button
#    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"
           #选择占比图3D
    And I click the "Chart" button

    And I wait for "percent3dChart" will be visible
    And I click the "percent3dChart" button
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
     #对占比图的参数进行设置
    And I click the "pictureOne" button
    And I click the "Data" button

    And I choose the "p" from the "percent3dDataSearchCategory"
     #值范围使其处于严重范围
    #正常
    And I set the parameter "normalMin" with value "0.1"
    And I set the parameter "normalMax" with value "0.2"
    #异常
    And I set the parameter "abnormalMin" with value "0.3"
    And I set the parameter "abnormalMax" with value "0.4"
    #严重
    And I set the parameter "seriousMin" with value "0.5"
    And I set the parameter "seriousMax" with value "0.6"
      #保存
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 占比图3D数据之绑定搜索发布并截图
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
      |name              |
      |占比图3D数据之绑定搜索 |


