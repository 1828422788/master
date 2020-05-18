@app @appSmoke
Feature: 应用定时任务(RZY-2123)

  Scenario Outline: 新建定时任务
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button
    Then I will see the "app.AppPage" page
    When I click the "Search" button
    Then I will see the "splSearch.SearchPage" page
    Given I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "<time>" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I wait for element "SearchContent" change text to "<spl>"
    And I set the parameter "TaskName" with value "<taskName>"
    And I click the "Crontab" button
    And I set the parameter "CrontabInput" with value "0 0 0/10 * * ?"
    And I click the "EnsureCrontab" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"

    Examples:
      | spl                                                                                                      | time  | taskName |
      | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts | Today | AutoApp  |

  Scenario Outline: 编辑定时任务
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button
    Then I will see the "app.AppPage" page
    When I click the "TimedTask" button
    And the data name is "{'column':'2','name':'AutoApp'}" then i click the "编辑" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTestAppWithAllResources"
    And I will see the "timedTask.EditPage" page
    And I wait for element "Textarea" change text to "<spl>"
    And I set the parameter "Name" with value "AutoCreateApp"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"

    Examples:
      | spl                                                                                                      |
      | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts |


  Scenario: 禁用定时任务
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button
    Then I will see the "app.AppPage" page
    When I click the "TimedTask" button
    Then I will see the "timedTask.ListPage" page
    When the data name is "{'column':'2','name':'AutoCreateApp'}" then I "close" the switch
    Then I will see the success message "禁用成功"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTestAppWithAllResources"

  Scenario: 复制定时任务
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button
    Then I will see the "app.AppPage" page
    When I click the "TimedTask" button
    And I will see the "timedTask.ListPage" page
    When the data name is "{'column':'2','name':'AutoCreateApp'}" then i click the "复制" button
    Then I will see the success message "复制成功"
    And I refresh the website
    Then I will see the search result contains "{'column':'2','name':'AutoCreateApp(副本)'}"

  Scenario: 定时任务标签
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button
    Then I will see the "app.AppPage" page
    When I click the "TimedTask" button
    And I will see the "timedTask.ListPage" page
    When the data name is "{'column':'2','name':'AutoCreateApp'}" then i click the "标签" button
    And I set the parameter "Tag" with value "测试标签"
    And I choose the "测试标签" from the "TagDropdown"
    And I click the "Ensure" button
    Then I will see the success message "更新成功"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTestAppWithAllResources"

  Scenario: 根据定时任务标签进行查询
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button
    Then I will see the "app.AppPage" page
    When I click the "TimedTask" button
    And I will see the "timedTask.ListPage" page
    And I wait for loading invisible
    And I choose the "测试标签" from the "ResourceDropdown"
    And I wait for loading invisible
    Then I will see the search result contains "{'column':'2','name':'AutoCreateApp'}"
    Then I will see the search result "{'column':'2','name':'AutoCreateApp(副本)','contains':'no'}"

  Scenario Outline: 根据定时任务名称进行查询
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button
    Then I will see the "app.AppPage" page
    When I click the "TimedTask" button
    And I will see the "timedTask.ListPage" page
    And I wait for loading invisible
    Given I set the parameter "SearchInput" with value "<name>"
    And I click the "SearchIcon" button
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'<name>'}"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTestAppWithAllResources"

    Examples:
      | name              |
      | AutoCreateApp(副本) |

  Scenario: 在app外新建定时任务
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "tag:sample04061424_chart | bucket timestamp span=1h as ts | stats count(apache.clientip) as c_ip by ts"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I wait for element "SearchContent" change text to "tag:sample04061424_chart | bucket timestamp span=1h as ts | stats count(apache.clientip) as c_ip by ts"
    And I set the parameter "TaskName" with value "AutoTestCreate"
    And I click the "Crontab" button
    And I wait for "CrontabInput" will be visible
    And I set the parameter "CrontabInput" with value "0 0 0/10 * * ?"
    And I choose the "AutoTestAppWithAllResources" from the "AppDropdown"
    And I click the "EnsureCrontab" button
    Then I will see the success message "保存成功"

  Scenario: 在app外按照应用搜索
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading invisible
    And I choose the "AutoTestAppWithAllResources" from the "AppDropdown"
    And I wait for loading invisible
    Then I will see the search result contains "{'column':'2','name':'AutoTestCreate'}"

  Scenario: 取消所属应用
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button
    Then I will see the "app.AppPage" page
    When I click the "TimedTask" button
    And I will see the "timedTask.ListPage" page
    And I wait for loading invisible
    When the data name is "{'column':'2','name':'AutoTestCreate'}" then i click the "编辑" button
    Then I will see the "timedTask.EditPage" page
    And I choose the "AutoTestAppWithAllResources" from the "AppDropdown"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

  Scenario: 验证所属应用是否取消成功
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading invisible
    And I choose the "AutoTestAppWithAllResources" from the "AppDropdown"
    And I wait for loading invisible
    Then I will see the search result "{'column':'2','name':'AutoTestCreate','contains':'no'}"

  Scenario Outline: 修改app资源范围
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "<name>" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I wait for loading invisible
    And I click the "OverallSituation" button
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"

    Examples:
      | name                        |
      | AutoTestAppWithAllResources |

  Scenario Outline: app中定时任务删除
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button
    Then I will see the "app.AppPage" page
    When I click the "TimedTask" button
    And I will see the "timedTask.ListPage" page
    And I wait for loading invisible
    When the data name is "{'column':'2','name':'<name>'}" then i click the "删除" button
    And I click the "Ensure" button under some element
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"

    Examples:
      | name              |
      | AutoCreateApp(副本) |
      | AutoCreateApp     |
      | AutoTestCreate    |

  Scenario Outline: 复原app资源范围
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "<name>" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I wait for loading invisible
    And I click the "CurrentApp" button
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"

    Examples:
      | name                        |
      | AutoTestAppWithAllResources |