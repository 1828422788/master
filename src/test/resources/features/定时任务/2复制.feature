@timedTaskCopy
Feature: timedTaskCopy

  # need to include source of data
  Scenario Outline: create_new
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "<time>" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I set the parameter "TaskName" with value "<taskName>"
    And I set the parameter "TaskName" with value "<taskName>"
    And I set the parameter "Describe" with value "testing"
    And I choose the "AutoTestTag" from the "GroupComboBox"
    And I choose the "无数集app之api全部测试用例" from the "AppComboBox"

    And I set the parameter "Period" with value "<periodNum>"
    And I choose the "<periodTime>" from the "ExecuteTime"
    And I click the "StartTime" button
    And I set the parameter "StartTimeInput" with value "21:10:10"
    And I hide the element "TimePanel"
    And I click the "EnsureButton" button
    Then I will see the success message "保存成功"

    Examples:
      | time       | taskName     | periodNum | periodTime | spl                                                                                                      |
      | OneDay     | 410copytask  | 5        |   分钟     | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts |


  Scenario: copy_schedule
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    When the data name is "{'column':'2','name':'410copytask'}" then i click the "复制" button
    Then I will see the success message "复制成功"
    And I wait for "SuccessMessage" will be invisible
    And I will see the search result contains "{'column':'2','name':'410copytask(副本)'}"
    And the data name is "{'column':'2','name':'410copytask(副本)'}" then I "open" the switch
    Then I will see the success message "开启成功"

  Scenario: copy_schedule_detailpage
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    When the data name is "{'column':'2','name':'410copytask(副本)'}" then i click the "410copytask(副本)" button
    Then I will see the "timedTask.DetailPage" page
    And I will see the element "SearchContent" contains "tag:sample04061424_chart | bucket timestamp span=1h as ts | stats count(apache.clientip) as c_ip by ts"
    And I will see the element "TimePeriod" contains "-1d ~ now"
    And I will see the element "Description" contains "testing"
    #And I will see the element "StartTime" value contains "21:10:10"
    And I will see the element "ExecutionPeriod" contains "5 分钟"
    

  Scenario: copy_schedule_editpage
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    When the data name is "{'column':'2','name':'410copytask(副本)'}" then i click the "编辑" button
    Then I will see the "timedTask.EditPage" page
    And I will see the input element "Name" value will be "410copytask(副本)"
    And I will see the input element "Describe" value will be "testing"
    #And I will see the element "Resource" contains ""
    And I will see the element "TaskGroup" contains "AutoTestTag"
    And I will see the element "TaskApp" contains "无数集app之api全部测试用例"

  Scenario Outline: delete_copiedTask
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    When the data name is "{'column':'2','name':'<name>'}" then i click the "删除" button
    And I click the "EnsureDelete" button under some element
    Then I will see the success message "删除成功"

    Examples:
      |    name             |
      |  410copytask        |
      |  410copytask(副本)  |




