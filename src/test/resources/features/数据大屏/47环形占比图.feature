@galaxee
Feature: 数据大屏-环形占比图

  Scenario: 新建默认类型的环形占比图
#    Given I wait for title change text to "仪表盘"
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "环形占比图"
    And I click the "Ensure" button
    And I click the "Chart" button
    And I drag the scroll bar to the element "Percent"
    And I click the "Percent" button
    And I click the "Style" button
    And I wait for "Percent" will be invisible
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "1000"
    And I set the parameter "Height" with value "500"
    And I set the parameter "ChartXaxis" with value "0"
    And I set the parameter "ChartYaxis" with value "0"
    And I click the "Data" button
    And I set the parameter "SplInput" with value "* | stats count() as num | eval p = num/28000"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "num" from the "DataField"
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 修改环形占比图配置
#    Given I wait for title change text to "仪表盘"
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "el-button el-button--text" edit button
    And switch to window "<name>"
    And I close all tabs except main tab
    Then I will see the "galaxee.CreatePage" page
    And I click the "pictureOne" button
#    And I click the "Chart" button
#    And I click the "Percent" button
    And I click the "Style" button
    And I wait for "Percent" will be invisible
    And I click the "Title" button
    And I set the parameter "TitleSize" with value "38"
    And I click the "TitleColor" button
    And I set the parameter "ColorInput" with value "#00A9F0"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I click the "Monocycle" button
    And I click the "MonocycleColor" button
    And I set the parameter "ColorInput" with value "#00A9F0"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I click the "Radius" button
    And I set the parameter "InnerRadius" with value "60%"
    And I set the parameter "OuterRadius" with value "80%"
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "1000"
    And I set the parameter "Height" with value "500"
    And I set the parameter "ChartXaxis" with value "476"
    And I set the parameter "ChartYaxis" with value "16"
    And I click the "Data" button
    And I set the parameter "SplInput" with value "* | stats count() as num | eval p = num/28000"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "num" from the "DataField"
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name  |
      | 环形占比图 |

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
      | name  |
      | 环形占比图 |


  Scenario Outline: 删除关于 | 环形占比图 |的大屏
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
    Then I click the "Ensure" button

    Examples:
      |name|
      | 环形占比图 |