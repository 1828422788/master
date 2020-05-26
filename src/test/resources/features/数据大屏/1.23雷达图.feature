@galaxeeChart2 @galaxee @galaxee1   @1.23
Feature: 数据大屏-d雷达图

#  Background:
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible

  Scenario: 雷达图样式-搜索
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "雷达图样式-搜索"
    And I click the "Ensure" button
      #选择雷达图
    And I click the "Chart" button
    And I wait for "radarChart" will be visible
    And I click the "radarChart" button
 #设置样式
   # 1 设置图表尺寸位置
    And I click the "Style" button
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "660"
    And I set the parameter "Height" with value "476"
    And I set the parameter "ChartXaxis" with value "405"
    And I set the parameter "ChartYaxis" with value "215"
    #2 修改样式
    And I click the "styleRadarChart" button
    #字号
    And I set the parameter "radarFontSize" with value "20"
    #颜色
    And I click the "radarColor" button
    And I wait for "ColorInput" will be visible
    And I set the parameter "ColorInput" with value "#EAEE0E"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #字体粗细
    And I choose the "bold" from the "RadarWordBold"
     #区域边框颜色
    And I click the "areaBorderColor" button
    And I wait for "ColorInput" will be visible
    And I set the parameter "ColorInput" with value "#DB13ED"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
     #区域颜色
     And I click the "radarAreaColor" button
    And I wait for "ColorInput" will be visible
    And I set the parameter "ColorInput" with value "#A1A937"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #辐射线颜色
    And I click the "radarLineColor" button
    And I wait for "ColorInput" will be visible
    And I set the parameter "ColorInput" with value "#EE2415"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
     #分割线颜色
    And I click the "splitLineColor" button
    And I wait for "ColorInput" will be visible
    And I set the parameter "ColorInput" with value "#32CC49"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #雷达图占比大小
    And I set the parameter "proportionOfRadarChart" with value "80"
    #3 全局样式修改名称
    And I click the "globalStyle" button
    And I set the parameter "globalStyleName" with value "雷达图样式修改"
    #开启背景动画
    And I click the "backgroundAuto" button
#数据-搜索
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:*display | stats count() by apache.clientip | limit 10"
#    And I click the "DateEditor" button
#    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"

    And I choose the "count()" from the "radarNumberFile"
    And I choose the "apache.clientip" from the "radarNameFile"

     #保存
    And I click the "Save" button
    Then I will see the success message "保存成功"


  Scenario Outline: 雷达图样式-搜索发布并截图
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
      |name         |
      |雷达图样式-搜索|

 ##################################无耻的分割线################################
  Scenario: 雷达图数据之静态数据
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "雷达图数据之静态数据"
    And I click the "Ensure" button
            #选择雷达图
    And I click the "Chart" button
#    And I wait for "1000" millsecond
    And I wait for "radarChart" will be visible
    And I click the "radarChart" button
    And I click the "Style" button

    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "660"
    And I set the parameter "Height" with value "476"
    And I set the parameter "ChartXaxis" with value "405"
    And I set the parameter "ChartYaxis" with value "215"
     #数据设置
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:*display | stats count() by apache.clientip | limit 10"
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

    And I choose the "count()" from the "radarNumberFile"
    And I choose the "apache.clientip" from the "radarNameFile"
    #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"


  Scenario Outline: 雷达图数据之静态数据发布并截图
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
      |雷达图数据之静态数据   |

#################################无耻的分割线###############################

  Scenario: 雷达图数据之绑定搜索
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "雷达图数据之绑定搜索"
    And I click the "Ensure" button
      #在【其他】中添加一个【搜索】控件
    And I click the "Other" button
    And I click the "otherSearch" button
    And I wait for "SplInput" will be visible
    And I set the parameter "SplInput" with value "tag:*display | stats count() by apache.clientip | limit 10"
#    And I click the "DateEditor" button
#    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"
           #选择雷达图
    And I click the "Chart" button
#    And I wait for "2000" millsecond
    And I wait for "radarChart" will be visible
    And I click the "radarChart" button
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
     #对雷达图的参数进行设置
    And I click the "pictureOne" button
    And I click the "Data" button

    And I choose the "count()" from the "radarNumberFile"
    And I choose the "apache.clientip" from the "radarNameFile"

      #保存
    And I click the "Save" button
    Then I will see the success message "保存成功"


  Scenario Outline: 雷达图数据之绑定搜索发布并截图
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
      |雷达图数据之绑定搜索 |






