@galaxee
Feature: 数据大屏-热力地图

  Background:
#    Given I wait for title change text to "仪表盘"
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"

  Scenario: 新建默认类型的热力地图
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "热力地图"
    And I click the "Ensure" button
    And I click the "Map" button
    And I click the "Heatmap" button
    And I click the "Style" button
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "700"
    And I set the parameter "Height" with value "500"
    And I set the parameter "ChartXaxis" with value "0"
    And I set the parameter "ChartYaxis" with value "0"
    And I click the "Data" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "apache.geo.province" from the "NameField"
    And I choose the "count()" from the "DataField"
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 修改热力地图配置
    When the galaxee name is "<name>" then I click the "el-button el-button--text" edit button
    And switch to window "<name>"
    Then I will see the "galaxee.CreatePage" page
    And I click the "pictureOne" button
#    And I click the "Map" button
#    And I click the "Heatmap" button
    And I click the "Style" button
    And I wait for "MapHeader" will be visible
    And I click the "MapHeader" button
    And I choose the "山东" from the "MapArea"
    And I click the "AreaColor" button
    And I set the parameter "ColorInput" with value "#9FF50B"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I click the "BoundaryColor" button
    And I set the parameter "ColorInput" with value "#0E0E0E"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I click the "ChartPosition" button
    And I set the parameter "Height" with value "500"
    And I set the parameter "ChartXaxis" with value "242"
    And I set the parameter "ChartYaxis" with value "315"
    And I click the "Data" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "apache.geo.province" from the "NameField"
    And I choose the "count()" from the "DataField"
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name |
      | 热力地图 |

  Scenario Outline: 发布页截图
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"

    And I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      | name |
      | 热力地图 |



  Scenario Outline: 删除关于| 热力地图 |的大屏
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
    Then I click the "Ensure" button

    Examples:
      |name|
      | 热力地图 |