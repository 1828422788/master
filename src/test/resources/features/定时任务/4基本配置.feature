@all @timedTask @editTimedTask
Feature: 定时任务_基本配置

  Scenario: create_schedule
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart  | stats count() by tag"
    And I click the "DateEditor" button under some element
    And I click the "Today" button
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "TaskName" with value "Test_Schedule"
    And I set the parameter "Period" with value "5"
    And I choose the "分钟" from the "ExecuteTime"
    And I set the parameter "StartTimeInput" with value "23:59:10"
    And I will see the "timedTask.EditPage" page
    And I click the "Parse" button
    And I wait for "EnsureButton" will be visible
    And I wait for "ParseResult" will be visible
    And I will see the element "ParseResult" contains " 00:04:10"
    And I click the "EnsureButton" button
    And I will see the "splSearch.SearchPage" page
    And I click the "EnsureButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "创建成功"

  Scenario: create_saved_search
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count()"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "NewSavedSearch" button
    And I wait for "SavedSearchName" will be visible
    And I set the parameter "SavedSearchName" with value "schedule_test"
    And I click the "EnsureCreateSavedSearch" button under some element
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "创建成功"

  Scenario: create_saved_search_empty
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count()"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "NewSavedSearch" button
    And I wait for "SavedSearchName" will be visible
    And I set the parameter "SavedSearchName" with value " "
    And I click the "EnsureCreateSavedSearch" button under some element
    And I wait for "TipText" will be visible
    And I will see the element "TipText" contains "名称 不能为空"

  Scenario Outline: check_details_period
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for "Loading" will be invisible
    When the data name is "{'column':'1','name':'Test_Schedule'}" then i click the "编辑" button
    And I will see the "timedTask.EditPage" page
    And I wait for "2000" millsecond
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "Name" with value "   "
    And I wait for "TipText" will be visible
    And I will see the element "TipText" contains "名称 不能为空"
    And I set the parameter "Number" with value "    "
    And I set the value "   " to the textarea "SearchTextarea"
    And I set the parameter "Period" with value "   "
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Number" with value "<number>"
    And I set the value "<spl>" to the textarea "SearchTextarea"
    And I set the parameter "Period" with value "<period>"
    And I click the "SaveButton" button under some element
    And I wait for "<element>" will be visible
    And I will see the element "<element>" contains "<result>"

    Examples:
    |    name       |   number    |    spl                                        |  period| element      |  result                                                                |
    |               |  10         | tag:*\| stats count() by appname \| limit 10  |  5     | TipText      | 请输入名称                                                             |
    | Test_Schedule |             | tag:*\| stats count() by appname \| limit 10  |  5     | TipText      | 请输入正确的搜索条数                                                   |
    | Test_Schedule |  10         |                                               |  5     | TipText      | 搜索内容 不能为空                                                      |
    | Test_Schedule |  10         | tag:*\| /stats count() by appname \| limit 10 |  5     | ErrorMessage | 语法错误: Syntax Error, can't parse pipecommands: unexpected token: '/'|
    | Test_Schedule |  10         | tag:*\| stats count() by appname \| limit 10  |  0     | TipText      | 定时模式下, 时间间隔不能为零或空                                       |
    | Test_Schedule |  10         | tag:*\| stats count() by appname \| limit 10  |  a     | TipText      | 定时模式下, 时间间隔应该为正整数                                       |

  Scenario Outline: check_details_crontab
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for "Loading" will be invisible
    When the data name is "{'column':'1','name':'Test_Schedule'}" then i click the "编辑" button
    And I will see the "timedTask.EditPage" page
    And I wait for "2000" millsecond
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "CrontabInput" with value "<crontab>"
    And I click the "<button>" button under some element
    And I wait for "<element>" will be visible
    And I will see the element "<element>" contains "<result>"

    Examples:
      |  crontab     |   result                                    | element      | button     |
      | 0            | crontab模式下, 执行计划不能为零或空         | TipText      | SaveButton |
      | 0 */57 * * ? | crontab格式错误！                           | ErrorMessage | SaveButton |
      | 0 */57 * * ? | 解析时间表达式失败，原因：crontab格式错误！ | ErrorMessage | Parse      |


  Scenario: modify_schedule
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for "Loading" will be invisible
    When the data name is "{'column':'1','name':'Test_Schedule'}" then i click the "编辑" button
    And I will see the "timedTask.EditPage" page
    And I wait for "2000" millsecond
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "Name" with value "Schedule_Test"
    And I set the parameter "Describe" with value "testing schedule"
    And I choose the "auto_package" from the "TaskGroup"
    And I set the parameter "TaskGroupInput" with value "auto_package"
    And I click the Circle "BasicSettings" button
    And I set the value "tag:*| stats count() by appname | limit 10" to the textarea "SearchTextarea"
    And I choose the "test_app" from the "AppDropdown"
    And I will see the input element "Period" value will be "5"
    And I set the parameter "CrontabInput" with value "0 */57 * * * ?"
    And I click the "Parse" button
    And I wait for "EnsureButton" will be visible
    And I wait for "ParseResult" will be visible
    And I will see the element "ParseResult" contains ":57:00"
    And I will see the element "ParseResult" contains ":00:00"
    And I click the "EnsureButton" button
    And I click the "SaveButton" button under some element
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "保存成功"
    And I click the "EnsureButton" button under some element

  Scenario: change_spl
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for "Loading" will be invisible
    When the data name is "{'column':'1','name':'Schedule_Test'}" then i click the "编辑" button
    And I will see the "timedTask.EditPage" page
    And I wait for "2000" millsecond
    And I wait for element "SelectedUser" change text to username
    And I will see the input element "Name" value will be "Schedule_Test"
    And I will see the input element "Describe" value will be "testing schedule"
    And I will see the input element "SearchTextarea" value will be "tag:*| stats count() by appname | limit 10"
    And I will see the element "SelectedGroup" contains "auto_package"
    And I will see the element "SelectedApp" contains "test_app"
    And I will see the input element "CrontabInput" value will be "0 */57 * * * ?"
    And I choose the "schedule_test" from the "SavedSearch"
    And I will see the input element "SearchTextarea" value will be "tag:sample04061424_chart | stats count()"
    And I click the "SaveButton" button under some element
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "保存成功"
    And I click the "EnsureButton" button under some element
    Then I will see the "timedTask.ListPage" page

  Scenario: verify_changes
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for "Loading" will be invisible
    And the data name is "{'column':'1','name':'Schedule_Test'}" then I "expand" the item
    And I will see the element "TagOfTheLastItem" contains "auto_package"
    And I will see the element "AppOfTheLastItem" contains "test_app"
    When the data name is "{'column':'1','name':'Schedule_Test'}" then i click the "Schedule_Test" button
    Then I will see the "timedTask.DetailPage" page
    And I will see the element "SearchContent" contains "tag:sample04061424_chart | stats count()"
    And I will see the element "TimePeriod" contains "now/d ~ now"
    And I will see the element "Description" contains "testing schedule"
    And I will see the element "ExecutionPeriod" contains "0 */57 * * * ?"

  Scenario: delete_schedule
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for "Loading" will be invisible
    When the data name is "{'column':'1','name':'Schedule_Test'}" then i click the "删除" button in more menu
    And I click the "Ensure" button under some element
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"

  Scenario: delete_saved_search
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "OpenSavedSearchList" button
    And I wait for "2000" millsecond
    And "删除" the data "schedule_test" in tiny saved search
    And I wait for "Cancel" will be visible
    And I will see the element "ConfirmMessage" contains "确认删除 schedule_test?"
    And I click the "EnsureButton" button
    And I wait for "Message" will be visible
    And I will see the message "删除成功"

