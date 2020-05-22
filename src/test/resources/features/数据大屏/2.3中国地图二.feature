@galaxeeMap @galaxee @galaxee1   @2.3
  Feature: 数据大屏-k中国地图II
#    Background:
#      Given I will see the "PublicNavBarPage" page
#      And I wait for "Dashboard" will be visible


  Scenario: 对中国地图II进行样式-搜索
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    And I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "中国地图II样式-搜素"
    And I click the "Ensure" button
      #选择上方的地图
    And I click the "Map" button
      #选择中国地图二
    And I click the "ChineseMapTwo" button
    And I hide the element "MapDropdown"
#设置样式
    #1 设置图表尺寸位置
    And I click the "Style" button
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "700"
    And I set the parameter "Height" with value "500"
    And I set the parameter "ChartXaxis" with value "600"
    And I set the parameter "ChartYaxis" with value "300"
    #2 设置地图颜色
    And I click the "MapHeader" button
      #区域默认是【中国】
       #名称颜色
    And I click the "ChineseMapTwoNameColor" button
    And I set the parameter "ColorInput" with value "#9FF50B"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
      #数值颜色
    And I click the "ChineseMapTwoNumberColor" button
    And I set the parameter "ColorInput" with value "#9FF50B"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #边框宽度
    And I set the parameter "borderWidth" with value "5"
    #边框颜色
    And I click the "borderColor" button
    And I set the parameter "ColorInput" with value "#D72644"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #3 全局样式修改名成
    And I click the "globalStyle" button
    And I set the parameter "globalStyleName" with value "中国地图II样式修改"
    #开启背景动画
   And I click the "backgroundAuto" button
    #数据设置（数据源类型默认：搜索）
    And I click the "Data" button
    And I set the parameter "SplInput" with value "*|stats count() by apache.geo.province"
#    And I click the "DateEditor" button
#    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"
      #类别
    And I choose the "apache.geo.province" from the "ChineseMapTwoDataSearchCategory"
      #值
    And I choose the "count()" from the "ChineseMapTwoDataSearchValue"
#保存
    And I click the "Save" button
    Then I will see the success message "保存成功"

Scenario Outline: 中国地图II样式-搜索发布并截图
  Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
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
  |中国地图II样式-搜素    |


######################################无耻的分割线################################


    Scenario: 对中国地图II样式->地图->区域选择无锡
      Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      And  I click the "Create" button
      Then I will see the "galaxee.CreatePage" page
      When I click the "Create" button
      And I set the parameter "Name" with value "中国地图II样式无锡"
      And I click the "Ensure" button
      #选择上方的地图
      And I click the "Map" button
      #选择中国地图二
      And I click the "ChineseMapTwo" button
      And I hide the element "MapDropdown"
      And I click the "Style" button
    #设置->样式->地图->区域选择无锡
      And I click the "MapHeader" button
      And I choose the "无锡" from the "MapArea"

      And I wait for "Save" will be visible
      And I wait for "1000" millsecond
      And I click the "Save" button
      Then I will see the success message "保存成功"

    Scenario Outline: 中国地图II样式->地图->区域选择无锡发布并截图
      Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
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
        |name                 |
        |中国地图II样式无锡     |


######################################无耻的分割线################################
  #数据-静态数据
    Scenario: 中国地图II数据之静态数据
      Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When I click the "Create" button
      Then I will see the "galaxee.CreatePage" page
      When I click the "Create" button
      And I set the parameter "Name" with value "中国地图II数据之静态数据"
      And I click the "Ensure" button
    #选择上方的地图
      And I click the "Map" button
      #选择中国地图二
      And I click the "ChineseMapTwo" button
      And I hide the element "MapDropdown"
      And I click the "Style" button
     #数据设置
      And I click the "Data" button
      And I set the parameter "SplInput" with value "*|stats count() by apache.geo.province"
#      And I click the "DateEditor" button
#      And I click the "RecentSevenDay" button
      And I click the "Search" button
      And I wait for "SearchTip" will be invisible
      And I set the parameter "updateFrequency" with value "0.1"
      #选择静态数据
      And I click the "dataSourceType" button
      And I click the "statisticsData" button
      And I click the "Ensure" button
      And I click the "tips" button
     #类别
      And I choose the "apache.geo.province" from the "ChineseMapTwoDataSearchCategory"
      #值
      And I choose the "count()" from the "ChineseMapTwoDataSearchValue"
    #保存
      And I wait for "Save" will be visible
      And I click the "Save" button
      Then I will see the success message "保存成功"


    Scenario Outline: 中国地图II数据之静态数据发布并截图
      Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
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
        |中国地图II数据之静态数据   |

######################################无耻的分割线################################
  #数据-绑定数据
    Scenario: 中国地图II数据之绑定搜索
      Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      And I click the "Create" button
      Then I will see the "galaxee.CreatePage" page
      When I click the "Create" button
      And I set the parameter "Name" with value "中国地图II数据之绑定搜索"
      And I click the "Ensure" button
      #在【其他】中添加一个【搜索】控件
      And I click the "Other" button
      And I click the "otherSearch" button
      And I wait for "SplInput" will be visible
      And I set the parameter "SplInput" with value "*|stats count() by apache.geo.province"
#      And I click the "DateEditor" button
#      And I click the "RecentSevenDay" button
      And I click the "Search" button
      And I wait for "SearchTip" will be invisible
      And I set the parameter "updateFrequency" with value "0.1"
      #添加一个中国地图二控件
      #选择上方的地图
      And I click the "Map" button
      #选择中国地图二
      And I click the "ChineseMapTwo" button
      And I hide the element "MapDropdown"
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
     #对中国地图二的参数进行设置
      And I click the "pictureOne" button
      And I click the "Data" button
      And I wait for "3000" millsecond
      #类别
      And I choose the "apache.geo.province" from the "ChineseMapTwoDataSearchCategory"
      #值
      And I choose the "count()" from the "ChineseMapTwoDataSearchValue"

      Then take a screenshot with name "galaxee/中国地图II数据之绑定搜索编辑页"
      #保存
      And I click the "Save" button
      Then I will see the success message "保存成功"


    Scenario Outline: 中国地图II数据之绑定搜索发布并截图
      Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
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
        |中国地图II数据之绑定搜索 |













