@report @all @switchReport
Feature: 报表禁用/启用

  Background:
    Given open the "report.ListPage" page for uri "/reports/"

  Scenario: create_report
    And I click the "NewReportButton" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to "ctest"
    When I set the parameter "Name" with value "Test_Switch"
    And I set the parameter "Describe" with value "AutoCreate"
    And I choose the "PDF" from the "ReportType"
    And I set the parameter "Hour" with value "15"
    And I set the parameter "Minute" with value "50"
    And I click the "NextButton" button
    Then I wait for "ChartListButton" will be visible
    When I choose the "table_Order" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "table_Order"
    When I click the "FinishButton" button
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button
    And I will see the "report.ListPage" page


  Scenario Outline: switch_off_on
    And the data name is "{'column':'1','name':'Test_Switch'}" then I "<action>" the switch
    Then I will see the success message "<result>"

    Examples:
      |   action   | result     |
      |   close    | 禁用成功   |
      |   open     | 开启成功   |

  Scenario: delete_report
    And the data name is "{'column':'1','name':'Test_Switch'}" then i click the "删除" button
    Then I will see the message "此操作将删除 [Test_Switch], 是否继续？"
    When I click the "EnsureButton" button
    And I wait for "500" millsecond
    Then I will see the message "删除成功"
    And I click the "EnsureButton" button