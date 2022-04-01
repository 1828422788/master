@report @allReports @switchReport
Feature: 报表_6_禁用/启用

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible

  Scenario: 新建报表
    And I click the "NewReportButton" button under some element
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    When I set the parameter "Name" with value "Test_Switch"
    And I set the parameter "Describe" with value "AutoCreate"
    And I choose the "PDF" from the "ReportType"
    And I set the parameter "Hour" with value "15"
    And I set the parameter "Minute" with value "50"
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButton" will be visible
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "LastTrendTitle" contains "报表测试"
    When I click the "Complete" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

  Scenario Outline: 禁用/启用
    And the data name is "{'column':'1','name':'Test_Switch'}" then I "<action>" the switch
    And I wait for "100" millsecond
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "<result>"

    Examples:
      |   action   | result     |
      |   close    | 禁用成功   |
      |   open     | 开启成功   |

  Scenario: 删除报表
    And the data name is "{'column':'1','name':'Test_Switch'}" then i click the "删除" button in more menu
    Then I will see the message "此操作将删除 [Test_Switch], 是否继续？"
    When I click the "Ensure" button
    And I wait for "500" millsecond
    And I wait for "Message" will be visible
    Then I will see the message "删除成功"
    And I click the "Ensure" button