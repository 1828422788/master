 @galaxee  @galaxee2  @3.2
Feature: 数据大屏-b状态图
#  Background:
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible

  Scenario: 状态图demo
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When  I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "状态图demo"
    And I click the "Ensure" button
    #选择状态图
    And I click the "Index" button
    And I click the "Status" button
    And I hide the element "IndexDropdown"
      #开启背景动画
    And I click the "Style" button
    And I click the "globalStyle" button
    And I click the "backgroundAuto" button
       #保存
    And I wait for "Save" will be visible
    And I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"


#  Scenario Outline: 状态图demo发布页截图
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
#      |状态图demo |



  ######################################无耻的分割线################################

  Scenario: 状态图值异常-搜索
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When  I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "状态图值异常-搜索"
    And I click the "Ensure" button
    #选择状态图
    And I click the "Index" button
    And I click the "Status" button
    And I hide the element "IndexDropdown"
    #样式
    And I click the "Style" button
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "300"
    And I set the parameter "Height" with value "200"
    And I set the parameter "ChartXaxis" with value "546"
    And I set the parameter "ChartYaxis" with value "400"
     #全局样式修改名称
    And I click the "globalStyle" button
    And I set the parameter "globalStyleName" with value "状态图值异常-搜索"
      #开启背景动画
    And I click the "backgroundAuto" button
    #数据
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_display  | stats avg(apache.status) as err_avg"
#    And I click the "DateEditor" button
#    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "err_avg" from the "Type"
       #保存
    And I wait for "Save" will be visible
    And I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"

#  Scenario Outline: 状态图值异常-搜索发布页截图
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
#      |状态图值异常-搜索 |

######################################无耻的分割线################################

  Scenario: 状态图值正常-静态数据
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When  I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "状态图值正常-静态数据"
    And I click the "Ensure" button
    #选择状态图
    And I click the "Index" button
    And I click the "Status" button
    And I hide the element "IndexDropdown"
     #样式
    And I click the "Style" button
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "300"
    And I set the parameter "Height" with value "200"
    And I set the parameter "ChartXaxis" with value "546"
    And I set the parameter "ChartYaxis" with value "400"
     #全局样式修改名称
    And I click the "globalStyle" button
    And I set the parameter "globalStyleName" with value "状态图值正常-静态数据"
      #开启背景动画
    And I click the "backgroundAuto" button
    #数据
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_display  | stats avg(apache.status) as err_avg"
#    And I click the "DateEditor" button
#    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "err_avg" from the "Type"
    #静态数据
    And I click the "dataSourceType" button
    And I click the "statisticsData" button
    And I click the "Ensure" button
    And I wait for "tipsText" will be invisible

    And I choose the "err_avg" from the "Type"
    #设置值范围
    And I set the parameter "normalStart" with value "200"
    And I set the parameter "normalEnd" with value "300"

    And I set the parameter "abnormalStart" with value "300"
    And I set the parameter "abnormalEnd" with value "400"

    And I set the parameter "seriousStart" with value "400"
    And I set the parameter "seriousEnd" with value "500"
      #保存
    And I wait for "Save" will be visible
    And I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"

#
#  Scenario Outline: 状态图值正常-静态数据发布页截图
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
#      |状态图值正常-静态数据 |
######################################无耻的分割线################################

  Scenario: 状态图值严重-绑定搜索
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "状态图值严重-绑定搜索"
    And I click the "Ensure" button
      #在【其他】中添加一个【搜索】控件
    And I click the "Other" button
    And I click the "otherSearch" button
    And I hide the element "otherDropdown"
    And I wait for "SplInput" will be visible
    And I set the parameter "SplInput" with value "tag:sample04061424_display | stats avg(apache.status) as err_avg"
#    And I click the "DateEditor" button
#    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"
      #选择状态图
    And I click the "Index" button
    And I click the "Status" button
    And I hide the element "IndexDropdown"
     #样式
    And I click the "Style" button
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "300"
    And I set the parameter "Height" with value "200"
    And I set the parameter "ChartXaxis" with value "546"
    And I set the parameter "ChartYaxis" with value "400"
      #开启背景动画
    And I click the "globalStyle" button
    And I click the "backgroundAuto" button
      #在数据源类型中选择绑定搜索
    And I click the "Style" button
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
     #对实体的参数进行设置
    And I click the "pictureOne" button
    And I click the "Data" button

    And I choose the "err_avg" from the "Type"
    #设置值范围
    And I set the parameter "normalStart" with value "0"
    And I set the parameter "normalEnd" with value "100"

    And I set the parameter "abnormalStart" with value "100"
    And I set the parameter "abnormalEnd" with value "200"

    And I set the parameter "seriousStart" with value "200"
    And I set the parameter "seriousEnd" with value "300"
       #保存
    And I wait for "Save" will be visible
    And I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"


#  Scenario Outline: 状态图值严重-绑定搜索发布并截图
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
#      |状态图值严重-绑定搜索 |


