@galaxee
Feature: 数据大屏桑基图

  Scenario: 新建桑基图，默认配置
    Given I wait for title change text to "仪表盘"
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "桑基图"
    And I click the "Ensure" button
    And I click the "Chart" button
    And I click the "Sankey" button
    And I click the "Style" button
    And I wait for "Sankey" will be invisible
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "684"
    And I set the parameter "Height" with value "664"
    And I set the parameter "ChartXaxis" with value "-9"
    And I set the parameter "ChartYaxis" with value "-8"
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart AND NOT apache.clientip:221.226.97.92 | stats count() by apache.clientip,apache.resp_len,apache.method | limit 10"
    And I click the "Search" button
    And I wait for "1000" millsecond
    And I choose the "apache.clientip" from the "SourceField"
    And I choose the "apache.method" from the "TargetField"
    And I choose the "count()" from the "WeightField"
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 修改配置
    Given I wait for title change text to "仪表盘"
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "el-button el-button--text" button
    And switch to window "<name>"
    Then I will see the "galaxee.CreatePage" page
    And I click the "Chart" button
    And I click the "Sankey" button
    And I click the "Style" button
    And I wait for "Sankey" will be invisible
    And I wait for "ChartTag" will be visible
    And I click the "ChartTag" button
    And I click the "ColorSelector" button
    And I click the "Red" button
    And I set the parameter "ChartWordSize" with value "20"
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "610"
    And I set the parameter "Height" with value "645"
    And I set the parameter "ChartXaxis" with value "582"
    And I set the parameter "ChartYaxis" with value "-4"
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart AND NOT apache.clientip:221.226.97.92 | stats count() by apache.clientip,apache.resp_len,apache.method | limit 10"
    And I click the "Search" button
    And I wait for "1000" millsecond
    And I choose the "apache.clientip" from the "SourceField"
    And I choose the "apache.method" from the "TargetField"
    And I choose the "count()" from the "WeightField"
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name |
      | 桑基图  |

  Scenario Outline: 发布页截图
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" button
    And switch to window "<name>"
    And I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      | name |
      | 桑基图   |