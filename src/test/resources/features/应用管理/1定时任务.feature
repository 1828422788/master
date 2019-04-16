@app @appSmoke
Feature: 应用定时任务

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button
    Then I will see the "app.AppPage" page

  Scenario Outline: 新建定时任务
    When I click the "Search" button
    Then I will see the "splSearch.SearchPage" page
    Given I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "<time>" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "<taskName>"
    And I set the parameter "Describe" with value "testing 定时任务样例"
    And I choose the "default_SavedSchedule" from the "GroupComboBox"
    And I set the parameter "Period" with value "<period>"
    And I click the "StartTime" button
    And I set the time input "StartTomorrow" to "<startTime>" minutes later
    And I click the "EnsureButton" button
    And I display the element "TimePanel"
    And I click the "Ensure" button
    Then I will see the success message "保存成功"

    Examples:
      | spl                                                                                                      | time  | taskName | period | startTime |
      | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts | Today | AutoApp  | 17     | 5         |
