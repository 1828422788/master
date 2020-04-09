@galaxee
Feature: 数据大屏-旭日图

  Background:
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"

  Scenario: 新建旭日图，默认配置
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "旭日图"
    And I click the "Ensure" button
    And I click the "Chart" button
    And I click the "Sunburst" button
    And I click the "Style" button
    And I wait for "Sunburst" will be invisible
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "650"
    And I set the parameter "Height" with value "434"
    And I set the parameter "ChartXaxis" with value "0"
    And I set the parameter "ChartYaxis" with value "0"
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count() by apache.status,apache.geo.province, apache.geo.city"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "count()" from the "DataField"
    And I choose the "apache.geo.city" from the "DivideField"
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 旭日图修改配置
    When the galaxee name is "<name>" then I click the "el-button el-button--text" edit button
    And switch to window "<name>"
    Then I will see the "galaxee.CreatePage" page
    And I click the "pictureOne" button
#    And I click the "Chart" button
#    And I click the "Sunburst" button
    And I click the "Style" button
    And I wait for "Sunburst" will be invisible
    And I wait for "ChartTag" will be visible
    And I click the "ChartTag" button
    And I click the "ColorSelector" button
    And I click the "Green" button
    And I set the parameter "ChartWordSize" with value "20"
    And I click the "Radius" button
    And I set the parameter "InnerRadius" with value "20%"
    And I set the parameter "OuterRadius" with value "80%"
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "1000"
    And I set the parameter "Height" with value "375"
    And I set the parameter "ChartXaxis" with value "393"
    And I set the parameter "ChartYaxis" with value "30"
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count() by apache.status,apache.geo.province, apache.geo.city"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "count()" from the "DataField"
    And I choose the "apache.geo.city" from the "DivideField"
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name |
      | 旭日图  |

  Scenario Outline: 旭日图增加切分数据
    When the galaxee name is "<name>" then I click the "el-button el-button--text" edit button
    And switch to window "<name>"
    Then I will see the "galaxee.CreatePage" page
    And I click the "pictureOne" button
#    And I click the "Chart" button
#    And I click the "Sunburst" button
    And I click the "Style" button
    And I wait for "Sunburst" will be invisible
    And I wait for "ChartTag" will be visible
    And I click the "ChartTag" button
    And I click the "ColorSelector" button
    And I click the "Green" button
    And I set the parameter "ChartWordSize" with value "20"
    And I click the "Radius" button
    And I set the parameter "InnerRadius" with value "20%"
    And I set the parameter "OuterRadius" with value "80%"
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "1000"
    And I set the parameter "Height" with value "384"
    And I set the parameter "ChartXaxis" with value "84"
    And I set the parameter "ChartYaxis" with value "408"
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | stats count() by apache.status,apache.geo.province, apache.geo.city"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "count()" from the "DataField"
    And I choose the "apache.geo.city" from the "DivideField"

    And I click the "Add" button
    And I choose the "apache.geo.province" from the "lastDivideField"
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name |
      | 旭日图  |

  Scenario Outline: 发布页截图
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"
    And I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      | name  |
      | 旭日图 |