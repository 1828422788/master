@galaxee
Feature: 数据大屏-世界地图

  Scenario: 新建默认类型的世界地图
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "世界地图"
    And I click the "Ensure" button
    And I click the "Map" button
    And I click the "World" button
    And I hide the element "MapDropdown"
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "700"
    And I set the parameter "Height" with value "500"
    And I set the parameter "ChartXaxis" with value "0"
    And I set the parameter "ChartYaxis" with value "0"
    And I click the "Data" button
    And I click the "Search" button
    And I click the "Update" button
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 修改世界地图配置
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "el-button el-button--text" edit button
    And switch to window "<name>"
    Then I will see the "galaxee.CreatePage" page
    And I click the "pictureOne" button
   # And I click the "Map" button
   # And I click the "World" button
   # And I hide the element "MapDropdown"

    And I click the "MapHeader" button

    And I click the "AreaColor" button
    And I set the parameter "ColorInput" with value "#9FF50B"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible

    And I click the "BoundaryColor" button
    And I set the parameter "ColorInput" with value "#0E0E0E"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I click the "MarkColor" button
    And I set the parameter "ColorInput" with value "#F5CACA"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "800"
    And I set the parameter "Height" with value "500"
    And I set the parameter "ChartXaxis" with value "538"
    And I set the parameter "ChartYaxis" with value "64"
    And I click the "Data" button
    And I click the "Search" button
    And I click the "Update" button
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name |
      | 世界地图 |

  Scenario Outline: 发布页截图
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"
    And I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      | name |
      | 世界地图 |


