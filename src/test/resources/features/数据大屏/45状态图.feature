@galaxee
Feature: 数据大屏-状态图

  Background:
#    Given I wait for title change text to "仪表盘"
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"

  Scenario: 新建默认类型的状态图
    When  I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "状态图"
    And I click the "Ensure" button
    And I click the "Index" button
    And I click the "Status" button
    And I click the "Style" button
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "456"
    And I set the parameter "Height" with value "417"
    And I set the parameter "ChartXaxis" with value "0"
    And I set the parameter "ChartYaxis" with value "0"
    And I click the "Data" button
    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "err_avg" from the "Type"
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 修改配置
    When the galaxee name is "<name>" then I click the "el-button el-button--text" edit button
    And switch to window "<name>"
    Then I will see the "galaxee.CreatePage" page
    And I click the "pictureOne" button
#    And I click the "Index" button
#    And I click the "Status" button
    And I click the "Style" button
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "514"
    And I set the parameter "Height" with value "407"
    And I set the parameter "ChartXaxis" with value "460"
    And I set the parameter "ChartYaxis" with value "0"
    And I click the "Data" button
    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "err_avg" from the "Type"
    And I set the parameter "UnusualFromInput" with value "100"
    And I set the parameter "UnusualToInput" with value "200"
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name |
      | 状态图  |

  Scenario Outline: 发布页截图
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"

    And I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      | name |
      | 状态图 |



  Scenario Outline: 删除关于| 状态图 |的大屏
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
    Then I click the "Ensure" button

    Examples:
      |name|
      | 状态图 |