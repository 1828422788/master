@all @timedTask @editTimedTask
Feature: 定时任务_基本配置

  Scenario: create_schedule
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart  | stats count() by tag"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I wait for element "SelectedUser" change text to "admin"
    And I set the parameter "TaskName" with value "Test_Schedule"
    And I set the parameter "Period" with value "5"
    And I choose the "分钟" from the "ExecuteTime"
    And I click the "StartTime" button
    And I set the parameter "StartTimeInput" with value "23:59:10"
    And I hide the element "TimePanel"
    And I click the "EnsureButton" button
    Then I will see the success message "保存成功"

  Scenario: modify_schedule
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    When the data name is "{'column':'2','name':'Test_Schedule'}" then i click the "编辑" button
    And I will see the "timedTask.EditPage" page
    And I wait for "1000" millsecond
    And I set the parameter "Name" with value "Schedule_Test"
    And I set the parameter "Describe" with value "testing schedule"
    And I set the value "tag:*| stats count() by appname | limit 10" to the textarea "SearchTextarea"
    And I will see the input element "Period" value will be "5"
    And I set the parameter "CrontabInput" with value "0 */57 * * * ?"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I click the "EnsureButton" button
    Then I will see the "timedTask.ListPage" page

  Scenario: verify_changes
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    When the data name is "{'column':'2','name':'Schedule_Test'}" then i click the "Schedule_Test" button
    Then I will see the "timedTask.DetailPage" page
    And I will see the element "SearchContent" contains "*| stats count() by appname | limit 10"
    And I will see the element "TimePeriod" contains "now/d ~ now"
    And I will see the element "Description" contains "testing schedule"
    And I will see the element "ExecutionPeriod" contains "0 */57 * * * ?"

  Scenario: delete_schedule
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    When the data name is "{'column':'2','name':'Schedule_Test'}" then i click the "删除" button
    And I click the "Ensure" button under some element
    Then I will see the success message "删除成功"


