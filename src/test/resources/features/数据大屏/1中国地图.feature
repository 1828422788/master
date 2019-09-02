@galaxee
Feature: 数据大屏中国地图

  Background:
    Given I wait for title change text to "仪表盘"
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"

  Scenario: 新建默认类型的中国地图
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "中国地图"
    And I click the "Ensure" button
    And I click the "Map" button
    And I click the "ChinaMap" button
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Height" with value "300"
    And I set the parameter "ChartXaxis" with value "0"
    And I set the parameter "ChartYaxis" with value "0"
    And I click the "Data" button
    And I set the parameter "SplInput" with value "*|stats count() by apache.geo.province"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "apache.geo.province" from the "NameField"
    And I choose the "count()" from the "DataField"
    And I set the parameter "NormalToInput" with value "100"
    And I set the parameter "UnusualFromInput" with value "101"
    And I set the parameter "UnusualToInput" with value "200"
    And I set the parameter "SeriousFromInput" with value "201"
    And I set the parameter "SeriousToInput" with value "5000"
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 甘肃省地图
    When the galaxee name is "<name>" then I click the "el-button el-button--text" button
    And switch to window "<name>"
    Then I will see the "galaxee.CreatePage" page
    And I click the "Map" button
    And I click the "ChinaMap" button
    And I wait for "MapHeader" will be visible
    And I click the "MapHeader" button
    And I choose the "甘肃" from the "MapArea"
    And I click the "AreaColor" button
    And I set the parameter "ColorInput" with value "#9FF50B"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I click the "BoundaryColor" button
    And I set the parameter "ColorInput" with value "#0E0E0E"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "气球" from the "MarkType"
    And I set the parameter "Scale" with value "0.5"
    And I set the parameter "MapWordSize" with value "20"
    And I click the "WordColor" button
    And I set the parameter "ColorInput" with value "#F5CACA"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "bolder" from the "MapWordBold"
    And I click the "ChartPosition" button
    And I set the parameter "Height" with value "300"
    And I set the parameter "ChartXaxis" with value "0"
    And I set the parameter "ChartYaxis" with value "300"
    And I click the "Data" button
    And I set the parameter "SplInput" with value "* AND apache.geo.province:甘肃 | stats count() by apache.geo.city"
    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "apache.geo.city" from the "NameField"
    And I choose the "count()" from the "DataField"
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name |
      | 中国地图 |

  Scenario Outline: 四川省地图
    When the galaxee name is "<name>" then I click the "el-button el-button--text" button
    And switch to window "<name>"
    Then I will see the "galaxee.CreatePage" page
    And I click the "Map" button
    And I click the "ChinaMap" button
    And I wait for "MapHeader" will be visible
    And I click the "MapHeader" button
    And I choose the "四川" from the "MapArea"
    And I click the "AreaColor" button
    And I set the parameter "ColorInput" with value "#9FF50B"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I click the "BoundaryColor" button
    And I set the parameter "ColorInput" with value "#0E0E0E"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "气球" from the "MarkType"
    And I set the parameter "Scale" with value "1.5"
    And I set the parameter "MapWordSize" with value "20"
    And I click the "WordColor" button
    And I set the parameter "ColorInput" with value "#F5CACA"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I choose the "lighter" from the "MapWordBold"
    And I click the "ChartPosition" button
    And I set the parameter "Height" with value "300"
    And I set the parameter "ChartXaxis" with value "0"
    And I set the parameter "ChartYaxis" with value "600"
    And I click the "Data" button
    And I set the parameter "SplInput" with value "* AND apache.geo.province:四川 | stats count() by apache.geo.city"
    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "apache.geo.city" from the "NameField"
    And I choose the "count()" from the "DataField"
    And I alter the element "RightArrow" style to "display: inline;"
    And I click the "RightArrow" button
    And I alter the element "LeftArrow" style to "display: inline;"
    And I click the "LeftArrow" button
    And I wait for "1000" millsecond
    And take part of "Preview" with name "galaxee/<name>"
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name |
      | 中国地图 |
