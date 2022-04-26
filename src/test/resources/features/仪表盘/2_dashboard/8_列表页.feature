@dashboard @dashboard07
Feature: 仪表盘08列表页

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

  Scenario:批量添加标签 RZY-4838
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I set the parameter "SearchInput" with value "仪表盘批量"
    And I wait for loading invisible
    And I click the "BatchControl" button
    And I click the "SelectAll" button
    And I choose the "添加资源标签" from the "BatchOperation"
    And I choose the "auto_package" from the "TagField"
    And I click the "Ensure" button
    Then I will see the success message "更新成功"


  Scenario: 验证批量添加标签成功 RZY-4839
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "仪表盘批量"
    And I wait for loading invisible
    And the data name is "仪表盘批量3" then I "expand" the item
    And I will see the element "ExpandedRow" contains "资源标签..............auto_package"
    And the data name is "仪表盘批量3" then I "close" the item
    And the data name is "仪表盘批量2" then I "expand" the item
    And I will see the element "ExpandedRow" contains "资源标签..............auto_package"
    And the data name is "仪表盘批量2" then I "close" the item
    And the data name is "仪表盘批量1" then I "expand" the item
    And I will see the element "ExpandedRow" contains "资源标签..............auto_package"
    And the data name is "仪表盘批量1" then I "close" the item

  Scenario:批量删除仪表盘 RZY-4840
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    When I click the "BatchControl" button
    And I "checked" the checkbox which name is "仪表盘批量1" in the list
    And I "checked" the checkbox which name is "仪表盘批量2" in the list
    And I "checked" the checkbox which name is "仪表盘批量3" in the list
    And I choose the "删除" from the "BatchOperation"
    And I will see the message contains "您选中的 3 个资源将被删除，是否继续？"
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

  Scenario: 验证删除成功 RZY-4840
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I set the parameter "SearchInput" with value "仪表盘批量"
    And I wait for loading invisible
    And I will see the text "暂无数据" exist in page