@all @report @reportMulti
Feature: 报表_4_批量操作

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible
    And I wait for "BatchControl" will be visible

  Scenario Outline: create_report
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

  Scenario: multi_tag
    And I click the "BatchControl" button
    And I "checked" the checkbox which name is "test_multi_1" in the list
    And I "checked" the checkbox which name is "test_multi_2" in the list
    And I "checked" the checkbox which name is "test_multi_3" in the list
    And I click the "SelectBatchOperation" button
    And I click the "AddResourceTags" button
    And I wait for "Ensure" will be visible
    And I choose the "auto_package" from the "TagField"
    And I click the "TagPanel" button
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
    And I wait for loading complete
    And I click the "CompleteBatchControl" button

  Scenario: verify_tag
    And the data name is "{'column':'1','name':'test_multi_1'}" then I "expand" the item
    And I will see the element "TagOfTheLastItem" contains "auto_package"
    And the data name is "{'column':'1','name':'test_multi_1'}" then I "close" the item

    And the data name is "{'column':'1','name':'test_multi_2'}" then I "expand" the item
    And I will see the element "TagOfTheLastItem" contains "auto_package"
    And the data name is "{'column':'1','name':'test_multi_2'}" then I "close" the item

    And the data name is "{'column':'1','name':'test_multi_3'}" then I "expand" the item
    And I will see the element "TagOfTheLastItem" contains "auto_package"
    And the data name is "{'column':'1','name':'test_multi_3'}" then I "close" the item

  Scenario: disable
    When I set the parameter "SearchInput" with value "test_multi_"
    And I wait for "2000" millsecond
    And I wait for "BatchControl" will be visible
    And I click the "BatchControl" button
    And I "checked" the checkbox which name is "test_multi_1" in the list
    And I "checked" the checkbox which name is "test_multi_2" in the list
    And I "checked" the checkbox which name is "test_multi_3" in the list
    And I click the "SelectBatchOperation" button
    And I click the "DisableResources" button
    And I wait for "Ensure" will be visible
    And I will see the message "确定停止 3 个资源"
    When I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
    And I wait for loading complete
    And I click the "CompleteBatchControl" button

  Scenario: multi_switch
    And I click the "BatchControl" button
    And I "checked" the checkbox which name is "test_multi_2" in the list
    And I "checked" the checkbox which name is "test_multi_3" in the list
    And I click the "SelectBatchOperation" button
    And I click the "EnableResources" button
    And I wait for "Ensure" will be visible
    And I will see the message "确定启用 2 个资源"
    When I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
    And I wait for "SuccessMessage" will be invisible
    And I click the "CompleteBatchControl" button
    And the data name is "{'column':'1','name':'test_multi_1'}" then I "open" the switch
    And I wait for "100" millsecond
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "开启成功"

  Scenario: verify_switch
    When the data name is "{'column':'1','name':'test_multi_1'}" then I "close" the switch
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "禁用成功"
    And I wait for "SuccessMessage" will be invisible
    When the data name is "{'column':'1','name':'test_multi_2'}" then I "close" the switch
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "禁用成功"
    And I wait for "SuccessMessage" will be invisible
    When the data name is "{'column':'1','name':'test_multi_3'}" then I "close" the switch
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "禁用成功"

  Scenario: multi_download_files
    When I click the "ReportListButton" button
    And I wait for "SelectedReport" will be visible
    And I wait for element "SelectedReport" change text to "全部报表文件"
    And I wait for "5000" millsecond
    And I wait for "LastGeneratedReport" will be visible
    And I will see the "report.ListPage" page
    And I wait for "Loading" will be invisible
    And I click the "BatchControl" button
    And I "checked" the checkbox which name is "test_multi_file_1" in the list
    And I "checked" the checkbox which name is "test_multi_file_2" in the list
    And I click the "SelectBatchOperation" button
    And I click the "DownloadResources" button
    And I wait for "Ensure" will be visible
    Then I will see the message "您选中的 2 个资源将开始下载，是否继续？"
    When I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "下载成功"
    And I click the "CompleteBatchControl" button

  Scenario: multi_delete_files
    When I click the "ReportListButton" button
    And I wait for "SelectedReport" will be visible
    And I wait for element "SelectedReport" change text to "全部报表文件"
    And I wait for "5000" millsecond
    And I wait for "LastGeneratedReport" will be visible
    And I wait for "Loading" will be invisible
    And I click the "BatchControl" button
    And I "checked" the checkbox which name is "test_multi_file_1" in the list
    And I "checked" the checkbox which name is "test_multi_file_2" in the list
    And I click the "SelectBatchOperation" button
    And I click the "DeleteResources" button
    And I wait for "Ensure" will be visible
    Then I will see the message "您选中的 2 个资源将被删除，是否继续？"
    When I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"
    And I click the "CompleteBatchControl" button

  Scenario Outline: verify_delete_files
    When I set the parameter "SearchInput" with value "<name>"
    And I wait for "2000" millsecond
    And the data name is "{'column':'1','name':'<name>'}" then i click the "<name>" button
    And I wait for element "SelectedReport" change text to "<name>"
    And I wait for "2000" millsecond
    Then I wait for "NoData" will be visible

    Examples:
      |   name               |
      |  test_multi_file_1   |
      |  test_multi_file_2   |

  Scenario: multi_delete
    And I click the "BatchControl" button
    And I "checked" the checkbox which name is "test_multi_file_1" in the list
    And I "checked" the checkbox which name is "test_multi_file_2" in the list
    And I "checked" the checkbox which name is "test_multi_1" in the list
    And I "checked" the checkbox which name is "test_multi_2" in the list
    And I "checked" the checkbox which name is "test_multi_3" in the list
    And I click the "SelectBatchOperation" button
    And I click the "DeleteResources" button
    And I wait for "Ensure" will be visible
    Then I will see the message "您选中的 5 个资源将被删除，是否继续？"
    When I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"
    And I wait for loading complete
    And I click the "CompleteBatchControl" button

  Scenario: verify_delete
    When I set the parameter "SearchInput" with value "test_multi_"
    And I wait for "2000" millsecond
    Then I wait for "NoData" will be visible

  Scenario Outline: prompt
    And I click the "BatchControl" button
    And I click the "SelectBatchOperation" button
    And I click the "<button>" button
    And I wait for "Ensure" will be visible
    Then I will see the message "请至少选择一个资源进行操作"

    Examples:
      | button          |
      | DeleteResources |
      | AddResourceTags |
      | EnableResources |