@galaxee  @galaxee1   @2.2
Feature: 数据大屏-j热力地图
#  Background:
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible

  Scenario: 热力地图-样式搜索
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "热力地图-样式搜索"
    And I click the "Ensure" button
    #热力地图
    And I click the "Map" button
    And I click the "Heatmap" button
    And I hide the element "MapDropdown"
    #样式
    And I wait for "Style" will be visible
    And I click the "Style" button
    And I wait for "MapHeader" will be visible
    And I click the "MapHeader" button
#    And I choose the "山东" from the "MapArea"
    #区域颜色
    And I click the "AreaColor" button
    And I wait for "AreaColor" will be visible
    And I set the parameter "AreaColor" with value "#253D58"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #边界颜色
#    And I click the "BoundaryColor" button
    And I wait for "BoundaryColor" will be visible
    And I set the parameter "BoundaryColor" with value "#85DEDE"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
#  标注色(起)
#    And I click the "markColor1" button
    And I wait for "markColor1" will be visible
    And I set the parameter "markColor1" with value "#C11970"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
#  标注色(中)
#    And I click the "markColor2" button
    And I wait for "markColor2" will be visible
    And I set the parameter "markColor2" with value "#EAEBB3"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
#  标注色(止)
#    And I click the "markColor3" button
    And I wait for "markColor3" will be visible
    And I set the parameter "markColor3" with value "#53B11D"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #缩放
    And I set the parameter "Scaling" with value "1.5"
    #尺寸
    And I click the "ChartPosition" button
    And I wait for "Height" will be visible
    And I set the parameter "Height" with value "500"
    And I set the parameter "ChartXaxis" with value "242"
    And I set the parameter "ChartYaxis" with value "315"
    #数据
    And I click the "Data" button
    And I wait for "SplInput" will be visible
    And I set the parameter "SplInput" with value "tag:sample04061424_display | stats count() by apache.geo.province"
    And I wait for "1000" millsecond
  #    And I click the "DateEditor" button
#    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"
    And I wait for "3000" millsecond

    And I choose the "count()" from the "DataField"
    And I choose the "apache.geo.province" from the "NameField"

      #保存
    And I wait for "Save" will be visible
    And I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"

#  Scenario Outline: 热力地图-样式搜索发布页截图
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
#      |热力地图-样式搜索 |

######################################无耻的分割线################################

  Scenario: 热力地图-静态数据
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "热力地图-静态数据"
    And I click the "Ensure" button
    #热力地图
    And I click the "Map" button
    And I click the "Heatmap" button
    And I hide the element "MapDropdown"
     #数据设置
    And I wait for "Data" will be visible
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_display | stats count() by apache.geo.province"
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

    And I choose the "count()" from the "DataField"
    And I choose the "apache.geo.province" from the "NameField"

       #保存
    And I wait for "Save" will be visible
    And I wait for "2000" millsecond
    And I click the "Save" button under some element
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"

#  Scenario Outline: 热力地图-静态数据发布并截图
#    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
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
#      |热力地图-静态数据   |

######################################无耻的分割线################################
  #数据-绑定数据
  Scenario: 热力地图-绑定搜索
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    And I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "热力地图-绑定搜索"
    And I click the "Ensure" button
      #在【其他】中添加一个【搜索】控件
    And I click the "Other" button
    And I click the "otherSearch" button under some element
    And I hide the element "otherDropdown"
    And I wait for "SplInput" will be visible
    And I set the parameter "SplInput" with value "tag:sample04061424_display | stats count() by apache.geo.province"
#    And I click the "DateEditor" button
#    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"
      #热力地图
    And I click the "Map" button
    And I click the "Heatmap" button
    And I hide the element "MapDropdown"
    And I wait for "Data" will be visible
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


    And I choose the "count()" from the "DataField"
    And I choose the "apache.geo.province" from the "NameField"
   #保存
    And I wait for "Save" will be visible
    And I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"

#  Scenario Outline: 热力地图-绑定搜索发布并截图
#    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
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
#      |name              |
#      |热力地图-绑定搜索 |


