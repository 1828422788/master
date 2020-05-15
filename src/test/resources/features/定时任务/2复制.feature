@all @timedTask @copyTimedTask
Feature: 定时任务复制

  Scenario Outline: create_new
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "ResourceAll" button
    And I click the "DateEditor" button
    And I click the "<time>" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "Describe" with value "testing"
    And I set the parameter "Describe" with value "testing"
    And I choose the "auto_package" from the "GroupComboBox"
    And I choose the "TrendApp" from the "AppComboBox"

    And I set the parameter "Period" with value "<periodNum>"
    And I choose the "<periodTime>" from the "ExecuteTime"
    And I click the "StartTime" button
    And I set the parameter "StartTimeInput" with value "23:58:10"
    And I hide the element "TimePanel"
    And I set the parameter "TaskName" with value "<taskName>"
    And I click the "EnsureButton" button
    Then I will see the success message "保存成功"

    Examples:
      | time       | taskName     | periodNum | periodTime | spl                                                                                                      |
      | OneDay     | copytask     | 5        |   分钟     | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts |


  Scenario: copy_schedule
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    When the data name is "{'column':'2','name':'copytask'}" then i click the "编辑" button
    And I will see the "timedTask.EditPage" page
    And I wait for "1000" millsecond
    And I wait for element "SelectedUser" change text to username
    And I will see the input element "Number" value will be "20000"
    And I set the parameter "Number" with value "123"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I click the "EnsureButton" button
    Then I will see the "timedTask.ListPage" page

    When the data name is "{'column':'2','name':'copytask'}" then i click the "复制" button
    Then I will see the success message "复制成功"
    And I wait for "SuccessMessage" will be invisible
    And I will see the search result contains "{'column':'2','name':'copytask(副本)'}"
    And the data name is "{'column':'2','name':'copytask(副本)'}" then I "open" the switch
    Then I will see the success message "开启成功"


  Scenario: copy_schedule_detailpage
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    When the data name is "{'column':'2','name':'copytask(副本)'}" then i click the "copytask(副本)" button
    Then I will see the "timedTask.DetailPage" page
    And I will see the element "DetailDataSet" contains "(*)"
    And I will see the element "SearchContent" contains "tag:sample04061424_chart | bucket timestamp span=1h as ts | stats count(apache.clientip) as c_ip by ts"
    And I will see the element "TimePeriod" contains "-1d ~ now"
    And I will see the element "Description" contains "testing"
    And I will see the element "ExecutionPeriod" contains "5 分钟"


  Scenario: copy_schedule_editpage
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    When the data name is "{'column':'2','name':'copytask(副本)'}" then i click the "编辑" button
    Then I will see the "timedTask.EditPage" page
    And I wait for "5000" millsecond
    And I wait for element "SelectedUser" change text to username
    And I will see the input element "Name" value will be "copytask(副本)"
    And I will see the input element "Describe" value will be "testing"
    And I will see the input element "Number" value will be "123"
    And I will see the element "Resource" contains "(*)"
    And I cancel selection "auto_package" from the "TaskGroup"
    And I cancel selection "TrendApp" from the "TaskApp"
    And I will see the input element "Period" value will be "5"

  Scenario Outline: delete_copiedTask
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    When the data name is "{'column':'2','name':'<name>'}" then i click the "删除" button
    And I click the "Ensure" button under some element
    Then I will see the success message "删除成功"

    Examples:
      |    name          |
      |  copytask        |
      |  copytask(副本)  |




