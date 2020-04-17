@all @timedTask @tagTimedTask
Feature: 定时任务标签

  Scenario: create_schedule
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart  | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count | limit 5"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I wait for element "SelectedUser" change text to "admin"
    And I set the parameter "TaskName" with value "Tag_Schedule"
    And I set the parameter "Describe" with value "tag testing"
    And I set the parameter "Period" with value "5"
    And I choose the "分钟" from the "ExecuteTime"
    And I click the "StartTime" button
    And I set the parameter "StartTimeInput" with value "23:00:00"
    And I hide the element "TimePanel"
    And I click the "EnsureButton" button
    Then I will see the success message "保存成功"

  Scenario: tag_schedule
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    When the data name is "{'column':'2','name':'Tag_Schedule'}" then i click the "标签" button
    And I choose the "AutoTest" from the "TagField"
    And I click the "TagPanel" button
    And I click the "Ensure" button
    Then I will see the success message "更新成功"
    And I refresh the website
    And I wait for loading invisible
    Then I will see the data "{'column':'2','name':'Tag_Schedule'}" values "{'column':'7','name':'AutoTest'}"


  Scenario: verify_tag
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    When the data name is "{'column':'2','name':'Tag_Schedule'}" then i click the "编辑" button
    And I will see the "timedTask.EditPage" page
    And I wait for "1000" millsecond
    And I will see the input element "Describe" value will be "tag testing"
    And I will see the element "TaskGroupSelected" contains "AutoTest"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I click the "EnsureButton" button
    Then I will see the "timedTask.ListPage" page



  Scenario: delete_schedule
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    When the data name is "{'column':'2','name':'Tag_Schedule'}" then i click the "删除" button
    And I click the "Ensure" button under some element
    Then I will see the success message "删除成功"


