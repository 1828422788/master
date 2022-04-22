@timedTask @tagTimedTask
Feature: 定时任务标签

  Scenario: 新建定时任务
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart  | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count | limit 5"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And switch to window "编辑报表"
    And I close all tabs except main tab
    Then I will see the "timedTask.EditPage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "Name" with value "Tag_Schedule"
    And I set the parameter "Describe" with value "tag testing"
    And I set the parameter "Period" with value "5"
    And I choose the "分钟" from the "Unit"
    And I set the parameter "StartTimeInput" with value "23:59:00"
    And I click the "StartTimeInput" button
    And I click the Circle "BasicSettings" button
    And I click the "Submit" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"

  Scenario: 添加标签
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'Tag_Schedule'}" then I "expand" the item
    And I will see the element "TagOfTheLastItem" contains "无"
    And I will see the element "AppOfTheLastItem" contains "无"
    When the data name is "{'column':'1','name':'Tag_Schedule'}" then i click the "标签" button in more menu
    And I wait for "TagToInput" will be visible
    And I click the "TagToInput" button
    And I set the parameter "Tag" with value "auto_package"
    And I choose the "auto_package" from the "TagField"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'Tag_Schedule'}" then I "expand" the item
    And I will see the element "TagOfTheLastItem" contains "auto_package"

  Scenario: 验证标签
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'Tag_Schedule'}" then i click the "编辑" button
    And I will see the "timedTask.EditPage" page
    And I wait for "2000" millsecond
    And I wait for element "SelectedUser" change text to username
    And I will see the element "SelectedGroup" contains "auto_package"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "保存成功"
    And I click the "EnsureButton" button

  Scenario: 删除定时任务
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'Tag_Schedule'}" then i click the "删除" button in more menu
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"


