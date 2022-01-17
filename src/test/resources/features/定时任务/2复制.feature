@timedTask @copyTimedTask @timedTaskSmoke
Feature: 定时任务复制

  Scenario Outline: 新建定时任务
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I drag the element "SearchPageSvg" to the "right" side
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count() as cnt | eval icon=if(cnt>1000000,1,0)"
    And I click the "ResourceAll" button
    And I click the "DateEditor" button under some element
    And I click the "<time>" button
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And switch to window "编辑报表"
    And I close all tabs except main tab
    Then I will see the "timedTask.EditPage" page
    And I wait for element "SelectedUser" change text to username
    And I choose the "test_app" from the "AppDropdown"
    And I set the parameter "Describe" with value "testing"
    And I will see the element "SelectDataset" contains "已选择 1 个数据集/节点"
    And I click the "SelectDataset" button
    And I wait for "SelectedDatasetAll" will be visible
    And I click the "Cancel" button
    And I set the parameter "Period" with value "<periodNum>"
    And I choose the "<periodTime>" from the "Unit"
    And I set the parameter "StartTimeInput" with value "23:58:10"
    And I click the "StartTimeInput" button
    And I click the Circle "BasicSettings" button
    And I will see the "timedTask.ListPage" page
    And I click the "TagToInput" button
    And I set the parameter "Tag" with value "auto_package"
    And I choose the "auto_package" from the "TagField"
    Then I will see the "timedTask.EditPage" page
    And I set the parameter "Name" with value "<taskName>"
    And I click the "Submit" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"

    Examples:
      | time       | taskName     | periodNum | periodTime |
      | OneDay     | copytask     | 5        |   分钟     |


  Scenario: 复制
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for "Loading" will be invisible
    And the data name is "{'column':'1','name':'copytask'}" then I "expand" the item
    And I will see the element "TagOfTheLastItem" contains "auto_package"
    And I will see the element "AppOfTheLastItem" contains "test_app"
    When the data name is "{'column':'1','name':'copytask'}" then i click the "编辑" button
    And I will see the "timedTask.EditPage" page
    And I wait for "5000" millsecond
    And I wait for element "SelectedUser" change text to username
    And I will see the input element "Number" value will be "20"
    And I set the parameter "Number" with value "123"
    And I click the "SaveButton" button under some element
    And I wait for "EnsureButton" will be visible
    And I will see the success message "保存成功"
    And I click the "EnsureButton" button under some element
    Then I will see the "timedTask.ListPage" page

    And I wait for "Loading" will be invisible
    When the data name is "{'column':'1','name':'copytask'}" then i click the "复制" button in more menu
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "复制成功"
    And I wait for "SuccessMessage" will be invisible
    And I will see the search result contains "{'column':'1','name':'copytask(副本)'}"
    And the data name is "{'column':'1','name':'copytask(副本)'}" then I "open" the switch
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "开启成功"
    And the data name is "{'column':'1','name':'copytask(副本)'}" then I "expand" the item
    And I will see the element "TagOfTheLastItem" contains "auto_package"
    And I will see the element "AppOfTheLastItem" contains "test_app"

  Scenario: 检查应用和标签
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    When I set the parameter "GlobalTagInput" with value "auto_package"
    When I choose the "auto_package" from the "TagDropdown"
    And I click the "HideElement" button
    And I wait for "Loading" will be invisible
    And I choose the "test_app" from the "AppDropdown"
    And I wait for "Loading" will be invisible
    And the data name is "{'column':'1','name':'copytask'}" then I "expand" the item
    And I will see the element "TagOfTheLastItem" contains "auto_package"
    And I will see the element "AppOfTheLastItem" contains "test_app"
    And the data name is "{'column':'1','name':'copytask'}" then I "close" the item
    And the data name is "{'column':'1','name':'copytask(副本)'}" then I "expand" the item
    And I will see the element "TagOfTheLastItem" contains "auto_package"
    And I will see the element "AppOfTheLastItem" contains "test_app"
    And the data name is "{'column':'1','name':'copytask(副本)'}" then I "close" the item
    And I click the "ExpandLastItem" button
    And I will see the element "TagOfTheLastItem" contains "auto_package"
    And I will see the element "AppOfTheLastItem" contains "test_app"

  Scenario: 检查新定时任务的细节
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for "Loading" will be invisible
    When the data name is "{'column':'1','name':'copytask(副本)'}" then i click the "copytask(副本)" button
    Then I will see the "timedTask.DetailPage" page
#    And I will see the element "DetailDataSet" contains "(*)"
    And I will see the element "SearchContent" contains "tag:sample04061424_chart | stats count() as cnt | eval icon=if(cnt>1000000,1,0)"
    And I will see the element "TimePeriod" contains "-1d ~ now"
    And I will see the element "Description" contains "testing"
    And I will see the element "ExecutionPeriod" contains "5 分钟"

  Scenario: 检查新定时任务的编辑页
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for "Loading" will be invisible
    When the data name is "{'column':'1','name':'copytask(副本)'}" then i click the "编辑" button
    Then I will see the "timedTask.EditPage" page
    And I wait for "5000" millsecond
    And I wait for element "SelectedUser" change text to username
    And I will see the input element "Name" value will be "copytask(副本)"
    And I will see the input element "Describe" value will be "testing"
    And I will see the input element "Number" value will be "123"
    And I will see the element "SelectDataset" contains "已选择 1 个数据集/节点"
    And I click the "SelectDataset" button
    And I wait for "SelectedDatasetAll" will be visible
    And I click the "Cancel" button
    And I will see the element "SelectedGroup" contains "auto_package"
    And I will see the element "SelectedApp" contains "test_app"
    And I will see the input element "Period" value will be "5"
    And I click the "Parse" button
    And I wait for "EnsureButton" will be visible
    And I wait for "ParseResult" will be visible
    And I click the "EnsureButton" button

  Scenario Outline: 删除
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for "Loading" will be invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button in more menu
    And I click the "Ensure" button under some element
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"

    Examples:
      |    name          |
      |  copytask        |
      |  copytask(副本)  |




