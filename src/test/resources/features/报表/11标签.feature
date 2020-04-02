@report @all @tagReport
Feature: 报表标签

  Background:
    Given open the "report.ListPage" page for uri "/reports/"

  Scenario: create_report
    And I click the "NewReportButton" button
    Then I will see the "report.CreatePage" page
    When I set the parameter "Name" with value "Test_Tag"
    And I set the parameter "Describe" with value "AutoCreate"
    And I choose the "PDF" from the "ReportType"
    And I set the parameter "Hour" with value "15"
    And I set the parameter "Minute" with value "50"
    And I click the "NextButton" button
    Then I wait for "FinishButton" will be visible
    When I choose the "LineChart_2477" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "LineChart_2477"
    When I click the "FinishButton" button
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button

  Scenario: tag_report
    When I will see the data "{'column':'1','name':'Test_Tag'}" values "{'column':'6','name':'无'}"
    When the data name is "{'column':'1','name':'Test_Tag'}" then i click the "标签" button
    And I choose the "AutoTest" from the "TagField"
    And I click the "TagPanel" button
    And I click the "EnsureButton" button
    Then I will see the success message "修改成功"
    And I click the "EnsureButton" button
    And I refresh the website
    #column 6 is a tag
    Then I will see the data "{'column':'1','name':'Test_Tag'}" values "{'column':'6','name':'AutoTest'}"


  Scenario: verify_tag
    When the data name is "{'column':'1','name':'Test_Tag'}" then i click the "编辑" button
    Then I will see the "report.CreatePage" page
    And I will see the input element "Name" value will be "Test_Tag"
    And I will see the input element "Describe" value will be "AutoCreate"
    And I will see the element "ChosenTag" contains "AutoTest"
    And I click the "NextButton" button
    Then I will see the element "ChosenTrendLast" contains "LineChart_2477"
    When I click the "FinishButton" button
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button


  Scenario: delete_report
    When the data name is "{'column':'1','name':'Test_Tag'}" then i click the "删除" button
    Then I will see the message "此操作将删除 [Test_Tag], 是否继续？"
    When I click the "EnsureButton" button
    And I wait for "500" millsecond
    Then I will see the message "删除成功"
    And I click the "EnsureButton" button
