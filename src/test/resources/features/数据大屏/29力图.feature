@galaxee
Feature: 数据大屏-力图

  Scenario: 新建力图，默认配置
#    Given I wait for title change text to "仪表盘"
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "力图"
    And I click the "Ensure" button
    And I click the "Chart" button
    And I drag the scroll bar to the element "Force"
    And I click the "Force" button
    And I click the "Style" button
    And I wait for "Force" will be invisible
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "550"
    And I set the parameter "Height" with value "500"
    And I set the parameter "ChartXaxis" with value "0"
    And I set the parameter "ChartYaxis" with value "0"
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart| stats count() by apache.clientip,apache.request_path |limit 10"
    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "apache.clientip" from the "SourceField"
    And I choose the "apache.request_path" from the "TargetField"
    And I choose the "count()" from the "WeightField"
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 修改配置
#    Given I wait for title change text to "仪表盘"
   And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "el-button el-button--text" edit button
    And switch to window "<name>"
    Then I will see the "galaxee.CreatePage" page

    And I click the "pictureOne" button
  #  And I click the "Chart" button
  #  And I click the "Force" button
    And I click the "Style" button
    And I wait for "Force" will be invisible
    And I wait for "ChartTag" will be visible
    And I click the "ChartTag" button
    And I click the "ColorSelector" button
    And I click the "Red" button
    And I set the parameter "ChartWordSize" with value "20"
    And I click the "RepulsionFactorHeader" button
    And I set the parameter "RepulsionFactor" with value "10"
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "611"
    And I set the parameter "Height" with value "618"
    And I set the parameter "ChartXaxis" with value "506"
    And I set the parameter "ChartYaxis" with value "20"
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart| stats count() by apache.clientip,apache.request_path |limit 10"
    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "apache.clientip" from the "SourceField"
    And I choose the "apache.request_path" from the "TargetField"
    And I choose the "count()" from the "WeightField"
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name |
      | 力图   |

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
      | 力图 |


  Scenario Outline: 删除关于力图的大屏
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
    Then I click the "Ensure" button

    Examples:
      |name|
      | 力图 |