@galaxeeIndex @galaxee  @galaxee2  @3.7
Feature: 数据大屏-g动态卡片二
#  Background:
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible

  Scenario: 动态卡片二样式搜索
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "动态卡片二样式搜索"
    And I click the "Ensure" button
     #选择上方的指标
    And I click the "Index" button
      #选择动态卡片二
    And I click the "dynamicCardTwo" button
    And I hide the element "IndexDropdown"
#设置样式
      #1 设置图表尺寸位置
    And I click the "Style" button
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "1000"
    And I set the parameter "Height" with value "1000"
    And I set the parameter "ChartXaxis" with value "600"
    And I set the parameter "ChartYaxis" with value "100"
    #设置样式
    And I click the "styleDynamicCardTwo" button
#  名称字体大小
    And I set the parameter "nameFontSize" with value "40"
#  名称字体粗细
    And I choose the "bold" from the "DynamicCardTwoWordBold"
    #名称颜色
    And I click the "nameColor" button
    And I wait for "ColorInput" will be visible
    And I set the parameter "ColorInput" with value "#ED3939"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
   #背景颜色
    And I click the "backColor" button
    And I wait for "ColorInput" will be visible
    And I set the parameter "ColorInput" with value "#00FF84"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #  值字体大小
    And I set the parameter "valueFontSize" with value "30"
   #  值字体粗细
    And I choose the "lighter" from the "ValueFontTwoWordBold"
  #值颜色
    And I click the "valueColor" button
    And I wait for "ColorInput" will be visible
    And I set the parameter "ColorInput" with value "#C843BD"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #线宽度
    And  I set the parameter "lineBold" with value "4"
    #线颜色
    And I click the "lineColor" button
    And I wait for "ColorInput" will be visible
    And I set the parameter "ColorInput" with value "#DDFF00"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #边框宽度
    And I set the parameter "bordWidth" with value "3"
    #边框颜色
    And I click the "bordColor" button
    And I wait for "ColorInput" will be visible
    And I set the parameter "ColorInput" with value "#EC31EF"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #动画停留
    And I set the parameter "dynamicStop" with value "6000"
    #间距
    And I set the parameter "spacing" with value "30"
       #3 全局样式修改名成
    And I click the "globalStyle" button
    And I set the parameter "globalStyleName" with value "动态卡片二自定义"
     #开启背景动画
    And I click the "backgroundAuto" button
     #数据设置（数据源类型默认：搜索）
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len | limit 10"
#    And I click the "DateEditor" button
#    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "2"

    And I choose the "count()" from the "dynamicCardNumberFiled"
    And I choose the "apache.clientip" from the "dynamicCardNameTwo"

    #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"


  Scenario Outline: 动态卡片二样式搜索发布并截图
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
      |动态卡片二样式搜索   |

 ######################################无耻的分割线################################

  Scenario: 动态卡片二数据之静态数据
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "动态卡片二数据之静态数据"
    And I click the "Ensure" button
   #选择上方的指标
    And I click the "Index" button
      #选择动态卡片二
    And I click the "dynamicCardTwo" button
    And I hide the element "IndexDropdown"
    And I click the "Style" button
    #数据设置
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len | limit 10"
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

    And I choose the "count()" from the "dynamicCardNumberFiled"
    And I choose the "apache.clientip" from the "dynamicCardNameTwo"


      #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"


  Scenario Outline: 动态卡片二数据之静态数据发布并截图
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
      |动态卡片二数据之静态数据  |

 ######################################无耻的分割线################################


  Scenario: 动态卡片二数据之绑定搜索
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "动态卡片二数据之绑定搜索"
    And I click the "Ensure" button
      #在【其他】中添加一个【搜索】控件
    And I click the "Other" button
    And I click the "otherSearch" button
    And I wait for "SplInput" will be visible
    And I set the parameter "SplInput" with value "tag:sample04061424_display | stats count() by apache.clientip,apache.resp_len | limit 10"
#    And I click the "DateEditor" button
#    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"
     #选择上方的指标
    And I click the "Index" button
      #选择动态卡片二
    And I click the "dynamicCardTwo" button
    And I hide the element "IndexDropdown"
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

    And I choose the "count()" from the "dynamicCardNumberFiled"
    And I choose the "apache.clientip" from the "dynamicCardNameTwo"


      #保存
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 动态卡片二数据之绑定搜索发布并截图
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
      |name             |
      |动态卡片二数据之绑定搜索 |


