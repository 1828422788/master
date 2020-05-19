@galaxeeChart2 @galaxee
Feature: 数据大屏-环形占比图

#  Background:
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible

  Scenario: 环形占比图-样式搜索
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "环形占比图-样式搜索"
    And I click the "Ensure" button
    # 环形占比图
    And I click the "Chart" button
    And I wait for "1000" millsecond
    And I wait for "Percent" will be visible
    And I click the "Percent" button
    And I click the "Style" button
    #标题
    And I click the "Title" button
    And I set the parameter "TitleSize" with value "38"
    And I click the "TitleColor" button
    And I set the parameter "ColorInput" with value "#00A9F0"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #单环颜色
    And I click the "Monocycle" button
    And I click the "MonocycleColor" button
    And I set the parameter "ColorInput" with value "#00A9F0"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #半径
    And I click the "Radius" button
    And I set the parameter "InnerRadius" with value "60%"
    And I set the parameter "OuterRadius" with value "80%"
    #尺寸
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "1000"
    And I set the parameter "Height" with value "500"
    And I set the parameter "ChartXaxis" with value "476"
    And I set the parameter "ChartYaxis" with value "16"
    #数据
    And I click the "Data" button
    And I set the parameter "SplInput" with value "* | stats count() as num | eval p = num/2800000"
#    And I click the "DateEditor" button
#    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"

    And I choose the "num" from the "DataField"
    And I click the "Save" button
    Then I will see the success message "保存成功"


  Scenario Outline: 环形占比图-样式搜索发布页截图
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
      | 环形占比图-样式搜索 |


    ######################################无耻的分割线################################


  Scenario: 环形占比图-静态数据
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "环形占比图-静态数据"
    And I click the "Ensure" button
    # 环形占比图
    And I click the "Chart" button
    And I wait for "1000" millsecond
    And I wait for "Percent" will be visible
    And I click the "Percent" button
    And I click the "Style" button
     #数据设置
    And I click the "Data" button
    And I set the parameter "SplInput" with value "* | stats count() as num | eval p = num/2800000"
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

    And I choose the "p" from the "DataField"
    #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"


  Scenario Outline: 环形占比图-静态数据发布并截图
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
      |环形占比图-静态数据  |

######################################无耻的分割线################################

  Scenario: 环形占比图-绑定搜索
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "环形占比图-绑定搜索"
    And I click the "Ensure" button
      #在【其他】中添加一个【搜索】控件
    And I click the "Other" button
    And I click the "otherSearch" button
    And I wait for "2000" millsecond
    And I set the parameter "SplInput" with value "* | stats count() as num | eval p = num/2800000"
#    And I click the "DateEditor" button
#    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"
        # 环形占比图
    And I click the "Chart" button
    And I wait for "1000" millsecond
    And I wait for "Percent" will be visible
    And I click the "Percent" button
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
    And I wait for "3000" millsecond
    And I choose the "p" from the "DataField"
      #保存
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 环形占比图-绑定搜索发布并截图
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
      |环形占比图-绑定搜索 |
