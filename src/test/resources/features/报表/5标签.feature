@report @allReports @tagReport
Feature: 报表标签

  Background:
    Given open the "report.ListPage" page for uri "/reports/"

  Scenario: create_report
    And I click the "NewReportButton" button under some element
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    When I set the parameter "Name" with value "Test_Tag"
    And I set the parameter "Describe" with value "AutoCreate"
    And I choose the "PDF" from the "ReportType"
    And I wait for "2000" millsecond
    And I choose the "test_app" from the "App"
    And I set the parameter "Hour" with value "15"
    And I set the parameter "Minute" with value "50"
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButton" will be visible
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "LastTrendTitle" contains "报表测试"
    When I click the "FinishButton" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

  Scenario: tag_report
    And I wait for "Loading" will be invisible
    And the data name is "{'column':'1','name':'Test_Tag'}" then I "expand" the item
    And I will see the element "TagOfTheLastItem" contains "无"
    And I will see the element "AppOfTheLastItem" contains "test_app"
    When the data name is "{'column':'1','name':'Test_Tag'}" then i click the "标签" button in more menu
    And I choose the "auto_package" from the "TagField"
    And I click the "TagPanel" button
    And I click the "Ensure" button
    And I wait for "100" millsecond
    And I wait for "Message" will be visible
    Then I will see the message "修改成功"
    And I click the "Ensure" button
    And I refresh the website

    And I wait for "Loading" will be invisible
    And the data name is "{'column':'1','name':'Test_Tag'}" then I "expand" the item
    And I will see the element "TagOfTheLastItem" contains "auto_package"
    And I will see the element "AppOfTheLastItem" contains "test_app"

  Scenario: global_tag_app
    When I choose the "auto_package" from the "ResourceDropdown"
    And I click the "HideElement" button
    And I wait for "Loading" will be invisible
    And I choose the "test_app" from the "AppDropdown"
    And I wait for "Loading" will be invisible
    And the data name is "{'column':'1','name':'Test_Tag'}" then I "expand" the item
    And I will see the element "TagOfTheLastItem" contains "auto_package"
    And I will see the element "AppOfTheLastItem" contains "test_app"
    And the data name is "{'column':'1','name':'Test_Tag'}" then I "close" the item
    And I click the "ExpandLastItem" button
    And I will see the element "TagOfTheLastItem" contains "auto_package"
    And I will see the element "AppOfTheLastItem" contains "test_app"

  Scenario: verify_tag
    And I wait for "Loading" will be invisible
    When the data name is "{'column':'1','name':'Test_Tag'}" then i click the "编辑" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I will see the input element "Name" value will be "Test_Tag"
    And I will see the input element "Describe" value will be "AutoCreate"
    And I will see the element "ChosenTag" contains "auto_package"
    And I click the "NextButton" button under some element
    Then I will see the element "LastTrendTitle" contains "报表测试"
    When I click the "FinishButton" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "更新成功"

  Scenario: delete_report
    And I wait for "Loading" will be invisible
    When the data name is "{'column':'1','name':'Test_Tag'}" then i click the "删除" button in more menu
    Then I will see the message "此操作将删除 [Test_Tag], 是否继续？"
    When I click the "Ensure" button
    And I wait for "500" millsecond
    And I wait for "Message" will be visible
    Then I will see the message "删除成功"
    And I click the "Ensure" button