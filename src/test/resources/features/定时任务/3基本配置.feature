@timedTask @editTimedTask
Feature: 定时任务_3基本配置

  Scenario: 新建定时任务
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart  | stats count() by tag"
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
    And I set the parameter "Name" with value "Test_Schedule"
    And I set the parameter "Period" with value "5"
    And I choose the "分钟" from the "Unit"
    And I set the parameter "StartTimeInput" with value "23:59:10"
    And I click the "StartTimeInput" button
    And I click the Circle "BasicSettings" button
    And I click the "Parse" button
    And I will see the element "ParseResult" contains " 00:04:10"
    And I click the "EnsureButton" button
    And I click the "Submit" button
    Then I will see the success message "保存成功"

  Scenario: 新建已存搜索
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count()"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "NewSavedSearch" button
    And I set the parameter "SavedSearchName" with value "schedule_test"
    And I click the "EnsureCreateSavedSearch" button
    Then I will see the success message "创建成功"

  Scenario: 新建已存搜索时检查提示
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count()"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "NewSavedSearch" button
    And I set the parameter "SavedSearchName" with value " "
    And I click the "EnsureCreateSavedSearch" button
    And I will see the element "TipText" contains "名称格式有误，仅支持中文、数字、字母、中划线、下划线以及括号的组合"

  Scenario Outline: 在编辑页上检查提示
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'Test_Schedule'}" then i click the "编辑" button
    And I will see the "timedTask.EditPage" page
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
    And I click the "SaveButton" button
    And I will see the element "<element>" contains "<result>"

    Examples:
    |    name       |   number    |    spl                                        |  period| element      |  result                                                                 |
    |               |  10         | tag:*\| stats count() by appname \| limit 10  |  5     | TipText      | 请输入名称                                                              |
    | Test_Schedule |             | tag:*\| stats count() by appname \| limit 10  |  5     | TipText      | 请输入正确的搜索条数                                                    |
    | Test_Schedule |  10         |                                               |  5     | TipText      | 搜索内容 不能为空                                                       |
    | Test_Schedule |  10         | tag:*\| / stats count() by appname \| limit 10|  5     | ErrorMessage | 语法错误: Syntax Error, can't parse pipecommands: unexpected token: '/ '|
    | Test_Schedule |  10         | tag:*\| stats count() by appname \| limit 10  |  0     | TipText      | 定时模式下, 时间间隔不能为零或空                                        |
    | Test_Schedule |  10         | tag:*\| stats count() by appname \| limit 10  |  a     | TipText      | 定时模式下, 时间间隔应该为正整数                                        |

  Scenario Outline: 在编辑页上检查提示_crontab
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'Test_Schedule'}" then i click the "编辑" button
    And I will see the "timedTask.EditPage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "CrontabInput" with value "<crontab>"
    And I click the "<button>" button
    And I will see the element "<element>" contains "<result>"

    Examples:
      |  crontab     |   result                                                                   | element      | button     |
      | 0            | crontab模式下, 执行计划不能为零或空                                        | TipText      | SaveButton |
      | 0 */57 * * ? | crontab格式错误！                                                          | ErrorMessage | SaveButton |
      | 0 */57 * * ? | 解析时间表达式失败，原因：解析错误: parse expression '0 */57 * * ?' failed | ErrorMessage | Parse      |


  Scenario: 修改定时任务
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'Test_Schedule'}" then i click the "编辑" button
    And I will see the "timedTask.EditPage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "Name" with value "Schedule_Test"
    And I set the parameter "Describe" with value "testing schedule"
    And I set the value "tag:*| stats count() by appname | limit 10" to the textarea "SearchTextarea"
    And I choose the "test_app" from the "AppDropdown"
    And I choose the new value "auto_package" from the "TagField"
    And I will see the input element "Period" value will be "5"
    And I set the parameter "CrontabInput" with value "0 */57 * * * ?"
    And I click the "Parse" button
    And I will see the element "ParseResult" contains ":57:00"
    And I will see the element "ParseResult" contains ":00:00"
    And I click the "EnsureButton" button
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I click the "EnsureButton" button

  Scenario: 改spl
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'Schedule_Test'}" then i click the "编辑" button
    And I will see the "timedTask.EditPage" page
    And I wait for element "SelectedUser" change text to username
    And I will see the input element "Name" value will be "Schedule_Test"
    And I will see the input element "Describe" value will be "testing schedule"
    And I will see the input element "SearchTextarea" value will be "tag:*| stats count() by appname | limit 10"
    And I will see the element "SelectedGroup" contains "auto_package"
    And I will see the element "SelectedApp" contains "test_app"
    And I will see the input element "CrontabInput" value will be "0 */57 * * * ?"
    And I choose the "schedule_test" from the "SavedSearch"
    And I will see the input element "SearchTextarea" value will be "tag:sample04061424_chart | stats count()"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I click the "EnsureButton" button

  Scenario: 验证
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading invisible
    When I will see the data "{'column':'1','name':'Schedule_Test'}" values "{'column':'5','name':'0 */57 * * * ?'}"
    And the data name is "{'column':'1','name':'Schedule_Test'}" then I "expand" the item
    And I will see the element "TagOfTheLastItem" contains "auto_package"
    And I will see the element "AppOfTheLastItem" contains "test_app"
    When the data name is "{'column':'1','name':'Schedule_Test'}" then i click the "Schedule_Test" button
    Then I will see the "timedTask.DetailPage" page
    And I will see the element "SearchContent" contains "tag:sample04061424_chart | stats count()"
    And I will see the element "TimePeriod" contains "now/d ~ now"

  Scenario: 删除定时任务
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'Schedule_Test'}" then i click the "删除" button in more menu
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

  Scenario: 删除已存搜索
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "OpenSavedSearchList" button
    And I wait for loading invisible
    When the data is "schedule_test" then i click the button "删除" in more menu in the saved search table
    And I wait for "Cancel" will be visible
    And I will see the element "ConfirmMessage" contains "确认删除 schedule_test?"
    And I click the "EnsureButton" button
    And I will see the message "删除成功"

