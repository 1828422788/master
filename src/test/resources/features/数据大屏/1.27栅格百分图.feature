@galaxeeChart3
Feature: 数据大屏-栅格百分图
#  Background:
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible


  Scenario: 栅格百分图样式-搜索
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "栅格百分图样式-搜索"
    And I click the "Ensure" button
      #选择栅格百分图
    And I click the "Chart" button
    And I wait for "1000" millsecond
    And I wait for "gridPercentChart" will be visible
    And I click the "gridPercentChart" button
    And I click the "Style" button
 #设置样式
   # 1 设置图表尺寸位置
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "850"
    And I set the parameter "Height" with value "460"
    And I set the parameter "ChartXaxis" with value "440"
    And I set the parameter "ChartYaxis" with value "260"
   #2修改样式
    And I click the "styleGridPercentChart" button
    #字号
    And I set the parameter "gridPercentFontSize" with value "50"
    #行高
    And I set the parameter "rowHeight" with value "2"
    #字体颜色
    And I click the "gridFontColor" button
    And I set the parameter "ColorInput" with value "#E333E0"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #栅格间隙
    And I set the parameter "gridClearance" with value "10"
    #栅格颜色
    And I click the "gridColor" button
    And I set the parameter "ColorInput" with value "#42C87E"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #标题
    And I set the parameter "gridTitle" with value "修改样式"
    #3 全局样式修改名成
    And I click the "globalStyle" button
    And I set the parameter "globalStyleName" with value "栅格百分图样式修改"
     #开启背景动画
    And I click the "backgroundAuto" button
     #数据设置（数据源类型默认：搜索）
    And I click the "Data" button
    And I set the parameter "SplInput" with value "* | stats count() as num | eval p = num/28000"
#    And I click the "DateEditor" button
#    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"
    And I choose the "p" from the "gridDataSearchCategory"
       #保存
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 栅格百分图样式-搜索发布并截图
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
      |栅格百分图样式-搜索    |


######################################无耻的分割线################################

  Scenario: 栅格百分图数据之静态数据
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "栅格百分图数据之静态数据"
    And I click the "Ensure" button
      #选择栅格百分图
    And I click the "Chart" button
    And I wait for "1000" millsecond
    And I wait for "gridPercentChart" will be visible
    And I click the "gridPercentChart" button
    And I click the "Style" button
     #数据设置
    And I click the "Data" button
    And I set the parameter "SplInput" with value "* | stats count() as num | eval p = num/28000"
#    And I click the "DateEditor" button
#    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"
      #选择静态数据
    And I click the "dataSourceType" button
    And I click the "statisticsData" button
    And I click the "Ensure" button
    And I wait for "6000" millsecond
    And I choose the "num" from the "gridDataSearchCategory"

    #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"


  Scenario Outline: 栅格百分图数据之静态数据发布并截图
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
      |栅格百分图数据之静态数据   |

######################################无耻的分割线################################

  Scenario: 栅格百分图数据之绑定搜索
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "栅格百分图数据之绑定搜索"
    And I click the "Ensure" button
      #在【其他】中添加一个【搜索】控件
    And I click the "Other" button
    And I click the "otherSearch" button
    And I wait for "SplInput" will be visible
    And I set the parameter "SplInput" with value "* | stats count() as num | eval p = num/28000"
#    And I click the "DateEditor" button
#    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"
       #选择栅格百分图
    And I click the "Chart" button
    And I wait for "1000" millsecond
    And I wait for "gridPercentChart" will be visible
    And I click the "gridPercentChart" button
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
     #对栅格百分图的参数进行设置
    And I click the "pictureOne" button
    And I click the "Data" button
    And I wait for "3000" millsecond
    And I choose the "num" from the "gridDataSearchCategory"
      #保存
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 栅格百分图数据之绑定搜索发布并截图
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
      |栅格百分图数据之绑定搜索 |



