@dashboard @dashboardSmoke @dashboard07
Feature: 仪表盘07列表页

  Scenario:页签管理（RZY-215）
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the "ChartYeQian" button
    And I wait for "1000" millsecond
    Then I wait for "ThirtyOnePage" will be visible
    Then I wait for "FiftyOnePage" will be visible
    And I click the "FiftyOnePage" button
    And I wait for "1000" millsecond
    Then I wait for element "ChartYeQian" change text to "50"

  Scenario Outline:新建仪表盘-批量操作
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

    Examples:
      | name   |
      | 仪表盘批量1 |
      | 仪表盘批量2 |
      | 仪表盘批量3 |

  Scenario:批量添加标签 RZY-4838
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the "MultiOperate" button
    And I wait for "1000" millsecond
    And I click the "ListItemOne" button
    And I wait for "1000" millsecond
    And I click the "ListItemTwo" button
    And I wait for "1000" millsecond
    And I click the "ListItemThree" button
    And I click the "MultiChooseButton" button
    And I wait for "500" millsecond
    And I click the "AddResouceTag" button
    And I choose the "AutoTest" from the "MultiAddTag"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"


  Scenario: 验证批量添加标签成功 RZY-4839
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I wait for "3500" millsecond
    And I click the dashboard icon which name is "仪表盘批量3"
    Then I will see the text "资源标签..............AutoTest" exist in page
    And I click the dashboard icon which name is "仪表盘批量3"
    And I click the dashboard icon which name is "仪表盘批量2"
    Then I will see the text "资源标签..............AutoTest" exist in page
    And I click the dashboard icon which name is "仪表盘批量2"
    And I click the dashboard icon which name is "仪表盘批量1"
    Then I will see the text "资源标签..............AutoTest" exist in page
#    Then I will see the data "仪表盘批量3" values "{'column':'5','name':'AutoTest'}"
#    Then I will see the data "仪表盘批量2" values "{'column':'5','name':'AutoTest'}"
#    Then I will see the data "仪表盘批量1" values "{'column':'5','name':'AutoTest'}"

  Scenario:批量删除仪表盘 RZY-4840
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the "MultiOperate" button
    And I wait for "1000" millsecond
    And I click the "ListItemOne" button
    And I wait for "1000" millsecond
    And I click the "ListItemTwo" button
    And I wait for "1000" millsecond
    And I click the "ListItemThree" button
    And I click the "MultiChooseButton" button
    And I wait for "500" millsecond
    And I click the "MultiDelete" button
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"

  Scenario Outline: 验证删除成功 RZY-4840
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'<name>','contains':'no'}"

    Examples:
      | name      |
      | 仪表盘批量3 |
      | 仪表盘批量2 |
      | 仪表盘批量1 |




