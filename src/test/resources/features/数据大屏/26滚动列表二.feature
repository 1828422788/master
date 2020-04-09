@galaxee
Feature: 数据大屏-滚动列表二

  Scenario: 滚动列表二默认设置
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "滚动列表二默认设置"
    And I click the "Ensure" button
      #选择上方的图表
    And I click the "Chart" button
      #选择滚动列表二
    And I click the "rollList2" button
    And I hide the element "ChartDropdown"
       #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"


  Scenario Outline: 滚动列表二默认设置发布并截图
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"
    And I wait for loading invisible
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      |name              |
      |滚动列表二默认设置   |

######################################无耻的分割线################################

  Scenario: 滚动列表2样式
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "滚动列表2样式"
    And I click the "Ensure" button
    #选择上方的图表
    And I click the "Chart" button
      #选择滚动列表二
    And I click the "rollList2" button
    And I hide the element "ChartDropdown"
#修改样式
    # 1 设置图表尺寸位置
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "997"
    And I set the parameter "Height" with value "526"
    And I set the parameter "ChartXaxis" with value "352"
    And I set the parameter "ChartYaxis" with value "262"
    #2 设置滚动频率
    And I click the "roll" button
    And I set the parameter "rollF" with value "4"
    #3 设置外观
    And I click the "styleRollList2" button
    #字体大小
    And I set the parameter "RollList2WordSize" with value "28"
    #字体粗细
    And I choose the "bold" from the "RollList2WordBold"
    #序号颜色
    And I click the "serialNumberColor" button
    And I set the parameter "ColorInput" with value "#B42F2F"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #背景颜色
    And I click the "listOfTurnsBackgroundColor" button
    And I set the parameter "ColorInput" with value "#D7D55F"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #背景颜色1
    And I click the "backgroundColor1" button
    And I set the parameter "ColorInput" with value "#00FF73"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #背景颜色2
    And I click the "backgroundColor2" button
    And I set the parameter "ColorInput" with value "#DDA6DC"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #背景颜色3
    And I click the "backgroundColor3" button
    And I set the parameter "ColorInput" with value "#50B6DC"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
   #内容颜色
    And I click the "contentColor" button
    And I set the parameter "ColorInput" with value "#EE4CE1"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #4 全局样式修改名成
    And I click the "globalStyle" button
    And I set the parameter "globalStyleName" with value "滚动列表2样式修改"
    And I wait for "3000" millsecond
    Then take a screenshot with name "galaxee/滚动列表2样式编辑页"
     #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"


  Scenario Outline: 滚动列表2样式发布并截图
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"
    And I wait for loading invisible
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      |name              |
      |滚动列表2样式    |

######################################无耻的分割线################################


  Scenario: 滚动列表2数据之搜索
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "滚动列表2数据之搜索"
    And I click the "Ensure" button
      #选择上方的图表
    And I click the "Chart" button
      #选择滚动列表二
    And I click the "rollList2" button
    And I hide the element "ChartDropdown"
    #  设置图表尺寸位置
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "997"
    And I set the parameter "Height" with value "526"
    And I set the parameter "ChartXaxis" with value "352"
    And I set the parameter "ChartYaxis" with value "262"
    #数据设置（数据源类型默认：搜索）
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count | limit 10"
    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"

    And I choose the "apache.clientip" from the "scrollBarSearchName"
    And I choose the "ip_count" from the "ScrollBarSearchNumber"

    #保存
    And I wait for "3000" millsecond
    And I click the "Save" button
    Then I will see the success message "保存成功"


  Scenario Outline: 滚动列表2数据之搜索发布并截图
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"
    And I wait for loading invisible
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      |name               |
      |滚动列表2数据之搜索   |


##################################无耻的分割线###############################

  Scenario: 滚动列表2数据之静态数据
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "滚动列表2数据之静态数据"
    And I click the "Ensure" button
       #选择上方的图表
    And I click the "Chart" button
      #选择滚动列表二
    And I click the "rollList2" button
    And I hide the element "ChartDropdown"
    #  设置图表尺寸位置
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "997"
    And I set the parameter "Height" with value "526"
    And I set the parameter "ChartXaxis" with value "352"
    And I set the parameter "ChartYaxis" with value "262"
    #数据设置（数据源类型默认：搜索）
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count | limit 10"
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

    And I choose the "apache.clientip" from the "scrollBarSearchName"
    And I choose the "ip_count" from the "ScrollBarSearchNumber"

    And I wait for "3000" millsecond
    #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"


  Scenario Outline: 滚动列表2数据之静态数据发布并截图
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"
    And I wait for loading invisible
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      |name            |
      |滚动列表2数据之静态数据 |


##################################无耻的分割线###############################


  Scenario: 滚动列表2数据之绑定搜索
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "滚动列表2数据之绑定搜索"
    And I click the "Ensure" button
      #在【其他】中添加一个【搜索】控件
    And I click the "Other" button
    And I click the "otherSearch" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count | limit 10"
    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"
      #添加一个滚动列表2控件
     #选择上方的图表
    And I click the "Chart" button
      #选择滚动列表二
    And I click the "rollList2" button
    And I hide the element "ChartDropdown"
    #  设置图表尺寸位置
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "997"
    And I set the parameter "Height" with value "526"
    And I set the parameter "ChartXaxis" with value "352"
    And I set the parameter "ChartYaxis" with value "262"

      #在数据源类型中选择绑定搜索
    And I click the "Data" button
    And I click the "dataSourceType" button
    And I click the "bindingSearch" button
      #选择上步添加的搜索
    And I click the "bindingSearchChoose" button
    And I click the "search_widget" button
      #再次点击搜索控件中的【搜索按钮】
    And I click the "pictureTwo" button
    And I click the "pictureOne" button
    And I click the "Search" button
     #对滚动列表2的参数进行设置
    And I click the "pictureOne" button
    And I click the "pictureTwo" button
    And I click the "Data" button
    And I wait for "3000" millsecond

    And I choose the "apache.clientip" from the "scrollBarSearchName"
    And I choose the "ip_count" from the "ScrollBarSearchNumber"

    And I wait for "3000" millsecond
      #保存
    And I click the "Save" button
    Then I will see the success message "保存成功"


  Scenario Outline: 滚动列表2数据之绑定搜索发布并截图
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"
    And I wait for loading invisible
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      |name              |
      |滚动列表2数据之绑定搜索 |



