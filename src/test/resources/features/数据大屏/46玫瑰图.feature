@galaxee
Feature: 数据大屏-玫瑰图

  Scenario: 新建玫瑰图，默认配置
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "玫瑰图"
    And I click the "Ensure" button
    And I click the "Chart" button
    And I click the "Rose" button
    And I click the "Style" button
    And I wait for "Rose" will be invisible
    And I wait for "Data" will be visible
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count | limit 10"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "ip_count" from the "DataField"
    And I choose the "apache.clientip" from the "DivideField"
    And I click the "Style" button
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "1000"
    And I set the parameter "Height" with value "400"
    And I set the parameter "ChartXaxis" with value "0"
    And I set the parameter "ChartYaxis" with value "0"
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 修改配置
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "el-button el-button--text" edit button
    And switch to window "<name>"
    Then I will see the "galaxee.CreatePage" page
    And I click the "pictureOne" button
#    And I click the "Chart" button
#    And I click the "Rose" button
    And I click the "Style" button
    And I wait for "Rose" will be invisible
    And I click the "Tag" button
    And I set the parameter "TagWordSize" with value "20"
    And I click the "TagWordColor" button
    And I set the parameter "ColorInput" with value "#CF3131"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "bolder" from the "TagBold"
    And I click the "Radius" button
    And I set the parameter "InnerRadius" with value "20%"
    And I set the parameter "OuterRadius" with value "80%"
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "1000"
    And I set the parameter "Height" with value "400"
    And I set the parameter "ChartXaxis" with value "0"
    And I set the parameter "ChartYaxis" with value "351"
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count | limit 10"
    And I click the "DateEditor" button
    And I click the "TwoDays" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "ip_count" from the "DataField"
    And I choose the "apache.clientip" from the "DivideField"
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name |
      | 玫瑰图  |

  Scenario Outline: 发布页截图
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"
    And I close all tabs except main tab
    And I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      | name |
      | 玫瑰图   |


  Scenario Outline: 删除关于| 玫瑰图|的大屏
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
    Then I click the "Ensure" button

    Examples:
      |name|
      | 玫瑰图   |