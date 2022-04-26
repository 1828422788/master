@all @report @reportMulti
Feature: 报表_4_批量操作

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible

  Scenario Outline: 新建报表-5个
    And I click the "NewReportButton" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "AutoCreate"
    And I choose the "PDF" from the "ReportType"
    And I set the parameters "Hour" and "Minute" as "3" minutes later from now
    And I click the "NextButton" button
    Then I wait for "ChartListButton" will be visible
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "LastTrendTitle" contains "报表测试"
    When I click the "Complete" button
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"
    And I wait for "35000" millsecond

  Examples:
    |   name               |
    |  test_multi_file_1   |
    |  test_multi_file_2   |
    |  test_multi_1        |
    |  test_multi_2        |
    |  test_multi_3        |

  Scenario: 批量操作_添加资源标签
    And I click the "BatchControl" button
    And I "checked" the checkbox which name is "test_multi_1" in the list
    And I "checked" the checkbox which name is "test_multi_2" in the list
    And I "checked" the checkbox which name is "test_multi_3" in the list
    And I choose the "添加资源标签" from the "BatchOperation"
    And I choose the "auto_package" from the "TagField"
    And I click the "Ensure" button
    Then I will see the success message "更新成功"
    And I click the "Complete" button

  Scenario: 验证标签
    And the data name is "{'column':'1','name':'test_multi_1'}" then I "expand" the item
    And I will see the element "ExpandedRow" contains "资源标签.................auto_package"
    And the data name is "{'column':'1','name':'test_multi_1'}" then I "close" the item

    And the data name is "{'column':'1','name':'test_multi_2'}" then I "expand" the item
    And I will see the element "ExpandedRow" contains "资源标签.................auto_package"
    And the data name is "{'column':'1','name':'test_multi_2'}" then I "close" the item

    And the data name is "{'column':'1','name':'test_multi_3'}" then I "expand" the item
    And I will see the element "ExpandedRow" contains "资源标签.................auto_package"
    And the data name is "{'column':'1','name':'test_multi_3'}" then I "close" the item

  Scenario: 批量操作_停止
    When I set the parameter "SearchInput" with value "test_multi_"
    And I wait for loading invisible
    And I click the "BatchControl" button
    And I "checked" the checkbox which name is "test_multi_1" in the list
    And I "checked" the checkbox which name is "test_multi_2" in the list
    And I "checked" the checkbox which name is "test_multi_3" in the list
    And I choose the "停止" from the "BatchOperation"
    And I will see the message "确定停止 3 个资源"
    When I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
    And I click the "Complete" button

  Scenario: 批量操作_启动
    And I click the "BatchControl" button
    And I "checked" the checkbox which name is "test_multi_2" in the list
    And I "checked" the checkbox which name is "test_multi_3" in the list
    And I choose the "启动" from the "BatchOperation"
    And I will see the message "确定启用 2 个资源"
    When I click the "Ensure" button
    Then I will see the success message "更新成功"
    And I wait for "SuccessMessage" will be invisible
    And I click the "Complete" button
    And the data name is "{'column':'1','name':'test_multi_1'}" then I "open" the switch
    Then I will see the success message "开启成功"

  Scenario: 验证 开启/禁用
    When the data name is "{'column':'1','name':'test_multi_1'}" then I "close" the switch
    Then I will see the success message "禁用成功"
    And I wait for "SuccessMessage" will be invisible
    When the data name is "{'column':'1','name':'test_multi_2'}" then I "close" the switch
    Then I will see the success message "禁用成功"
    And I wait for "SuccessMessage" will be invisible
    When the data name is "{'column':'1','name':'test_multi_3'}" then I "close" the switch
    Then I will see the success message "禁用成功"

  Scenario: 批量操作_下载文件
    When I click the "ReportListButton" button
    And I wait for "SelectedReport" will be visible
    And I wait for element "SelectedReport" change text to "全部报表文件"
    And I wait for "LastGeneratedReport" will be visible
    And I will see the "report.ListPage" page
    And I wait for loading invisible
    And I click the "BatchControl" button
    And I "checked" the checkbox which name is "test_multi_file_1" in the list
    And I "checked" the checkbox which name is "test_multi_file_2" in the list
    And I choose the "下载" from the "BatchOperation"
    Then I will see the message "您选中的 2 个资源将开始下载，是否继续？"
    When I click the "Ensure" button
    Then I will see the success message "下载成功"
    And I click the "Complete" button

  Scenario: 批量操作_删除文件
    When I click the "ReportListButton" button
    And I wait for "SelectedReport" will be visible
    And I wait for element "SelectedReport" change text to "全部报表文件"
    And I wait for "LastGeneratedReport" will be visible
    And I wait for loading invisible
    And I click the "BatchControl" button
    And I "checked" the checkbox which name is "test_multi_file_1" in the list
    And I "checked" the checkbox which name is "test_multi_file_2" in the list
    And I choose the "删除" from the "BatchOperation"
    Then I will see the message "您选中的 2 个资源将被删除，是否继续？"
    When I click the "Ensure" button
    Then I will see the success message "删除成功"
    And I click the "Complete" button

  Scenario Outline: 验证删除文件
    When I set the parameter "SearchInput" with value "<name>"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'<name>'}" then i click the "<name>" button
    And I wait for element "SelectedReport" change text to "<name>"
    Then I wait for "NoData" will be visible

    Examples:
      |   name               |
      |  test_multi_file_1   |
      |  test_multi_file_2   |

  Scenario: 批量操作_删除
    And I click the "BatchControl" button
    And I "checked" the checkbox which name is "test_multi_file_1" in the list
    And I "checked" the checkbox which name is "test_multi_file_2" in the list
    And I "checked" the checkbox which name is "test_multi_1" in the list
    And I "checked" the checkbox which name is "test_multi_2" in the list
    And I "checked" the checkbox which name is "test_multi_3" in the list
    And I choose the "删除" from the "BatchOperation"
    Then I will see the message "您选中的 5 个资源将被删除，是否继续？"
    When I click the "Ensure" button
    Then I will see the success message "删除成功"
    And I click the "Complete" button

  Scenario: 验证删除
    When I set the parameter "SearchInput" with value "test_multi_"
    And I wait for loading invisible
    Then I wait for "NoData" will be visible

  Scenario Outline: 提示
    And I click the "BatchControl" button
    And I choose the "<button>" from the "BatchOperation"
    Then I will see the message "请至少选择一个资源进行操作"

    Examples:
      | button        |
      | 删除          |
      | 添加资源标签  |
      | 启动          |
      | 停止          |