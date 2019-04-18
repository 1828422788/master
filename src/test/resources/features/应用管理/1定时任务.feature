@app @appSmoke
Feature: 应用定时任务(RZY-2123)

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
    And I choose the "AutoTestRoleWithAllResource" from the "GroupComboBox"
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

  Scenario: 编辑定时任务
    When I click the "TimedTask" button
    And the data name is "AutoApp" then i click the "编辑" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"
    And I will see the "timedTask.EditPage" page
    And I set the parameter "Name" with value "AutoCreateApp"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

  Scenario: 禁用定时任务
    When I click the "TimedTask" button
    And I will see the "timedTask.ListPage" page
    And I disabled the data "AutoCreateApp"
    Then I will see the success message "禁用成功"

  Scenario: 复制定时任务
    When I click the "TimedTask" button
    And I will see the "timedTask.ListPage" page
    When the data name is "AutoCreateApp" then i click the "复制" button
    Then I will see the success message "复制成功"

  Scenario Outline: 定时任务分组
    When I click the "TimedTask" button
    And the data name is "<name>" then i click the "分组" button
    And I will see the "timedTask.ListPage" page
    And I cancel selection "AutoTestRoleWithAllResource" from the "Group"
    And I click the "EnsureChangeGroup" button
    And I refresh the website
    Then I will see the search result "{'contains':'no','column':'0','name':'<name>'}"

    Examples:
      | name          |
      | AutoCreateApp |

  Scenario Outline: 根据定时任务分组进行查询
    When I click the "TimedTask" button
    And I will see the "timedTask.ListPage" page
    Given I choose the "<group>" from the "GroupList"
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'<name>'}"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"

    Examples:
      | group                       | name              |
      | AutoTestRoleWithAllResource | AutoCreateApp(副本) |

  Scenario Outline: 根据定时任务名称进行查询
    When I click the "TimedTask" button
    And I will see the "timedTask.ListPage" page
    Given I set the parameter "SearchInput" with value "<name>"
    And I click the "SearchIcon" button
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'<name>(副本)'}"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"

    Examples:
      | name          |
      | AutoCreateApp |

  Scenario Outline: 定时任务删除
    When I click the "TimedTask" button
    And I will see the "timedTask.ListPage" page
    When the data name is "<name>(副本)" then i click the "删除" button
    And I click the "EnsureDelete" button under some element
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureDelete" button under some element

    Examples:
      | name          |
      | AutoCreateApp |