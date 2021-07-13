@app @appSmoke
Feature: 应用定时任务(RZY-2123)

  Scenario Outline: 新建定时任务
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button in more menu
    Then I will see the "app.AppPage" page
    When I click the "Search" button
    Then I will see the "splSearch.SearchPage" page
    Given I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "<time>" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "2000" millsecond
    And I click the "SaveAsOther" button
    And I wait for "2000" millsecond
    And I click the "TimedTask" button
    And switch to window "编辑报表"
    And I close all tabs except main tab
    And I wait for "2000" millsecond
    Then I will see the "timedTask.EditPage" page
    And I wait for "2000" millsecond
   # And I wait for element "Textarea" change text to "<spl>"
   # And I wait for element "SelectedUser" change text to username
    And I set the parameter "Name" with value "<taskName>"
    And I wait for "2000" millsecond
    And I choose the "AutoTestAppWithAllResources" from the "AppComboBox"
    And I wait for "2000" millsecond
    And I click the "Crontab" button
    And I wait for "2000" millsecond
    And I set the parameter "CrontabInput" with value "0 0 0/10 * * ?"
    And I wait for "2000" millsecond
    And I click the "Submit" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"

    Examples:
      | spl                                                                                                      | time  | taskName |
      | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts | Today | AutoApp  |

  Scenario Outline: 编辑定时任务
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button in more menu
    Then I will see the "app.AppPage" page
    When I click the "TimedTask" button
    And I wait for "2000" millsecond
    And the data name is "{'column':'1','name':'AutoApp'}" then i click the "编辑" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTestAppWithAllResources"
    And I will see the "timedTask.EditPage" page
    And I wait for element "Textarea" change text to "<spl>"
    And I set the parameter "Name" with value "AutoCreateApp"
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"

    Examples:
      | spl                                                                                                      |
      | tag:sample04061424_chart \| bucket timestamp span=1h as ts \| stats count(apache.clientip) as c_ip by ts |


  Scenario: 禁用定时任务
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button in more menu
    Then I will see the "app.AppPage" page
    When I click the "TimedTask" button
    Then I will see the "timedTask.ListPage" page
    And I wait for "2000" millsecond
    When the data name is "{'column':'1','name':'AutoCreateApp'}" then I "close" the switch
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "禁用成功"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTestAppWithAllResources"

  Scenario: 复制定时任务
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button in more menu
    Then I will see the "app.AppPage" page
    When I click the "TimedTask" button
    And I will see the "timedTask.ListPage" page
    And I wait for "2000" millsecond
    When the data name is "{'column':'1','name':'AutoCreateApp'}" then i click the "复制" button in more menu
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "复制成功"
    And I refresh the website

  Scenario: 定时任务标签
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button in more menu
    Then I will see the "app.AppPage" page
    When I click the "TimedTask" button
    And I will see the "timedTask.ListPage" page
    And I wait for "2000" millsecond
    When the data name is "{'column':'1','name':'AutoCreateApp'}" then i click the "标签" button in more menu
    And I click the Element with text "请选择或输入"
    And I wait for "Tag" will be visible
    And I set the parameter "Tag" with value "测试标签"
    And I wait for "1500" millsecond
    And I choose the "测试标签" from the "TagDropdown"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTestAppWithAllResources"

  Scenario: 根据定时任务标签进行查询
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button in more menu
    Then I will see the "app.AppPage" page
    When I click the "TimedTask" button
    And I will see the "timedTask.ListPage" page
    And I wait for loading invisible
    And I choose the "测试标签" from the "ResourceDropdown"
    And I wait for "2000" millsecond
    Then I will see the search result contains "{'column':'1','name':'AutoCreateApp'}"
  #  Then I will see the search result "{'column':'1','name':'AutoCreateApp(副本)','contains':'no'}"

  Scenario Outline: 根据定时任务名称进行查询
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button in more menu
    Then I will see the "app.AppPage" page
    When I click the "TimedTask" button
    And I will see the "timedTask.ListPage" page
    And I wait for loading invisible
    Given I set the parameter "SearchInput" with value "<name>"
#    And I click the "SearchIcon" button
    And I wait for "2000" millsecond
    Then I will see the search result "{'column':'0','name':'<name>'}"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTestAppWithAllResources"

    Examples:
      | name              |
      | AutoCreateApp(副本) |

  Scenario: 在app外新建定时任务
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "tag:sample04061424_chart | bucket timestamp span=1h as ts | stats count(apache.clientip) as c_ip by ts"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And switch to window "编辑报表"
    And I close all tabs except main tab
    Then I will see the "timedTask.EditPage" page
    And I wait for element "Textarea" change text to "tag:sample04061424_chart | bucket timestamp span=1h as ts | stats count(apache.clientip) as c_ip by ts"
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "Name" with value "AutoTestCreate"
    And I click the "Crontab" button
    And I wait for "CrontabInput" will be visible
    And I set the parameter "CrontabInput" with value "0 0 0/10 * * ?"
    And I wait for "1500" millsecond
    And I choose the "AutoTestAppWithAllResources" from the "AppComboBox"
    And I click the "Submit" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"

  Scenario: 在app外按照应用搜索
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading invisible
    And I choose the "AutoTestAppWithAllResources" from the "AppDropdown"
    And I wait for loading invisible
    Then I will see the search result contains "{'column':'1','name':'AutoTestCreate'}"

  Scenario: 取消所属应用
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button in more menu
    Then I will see the "app.AppPage" page
    When I click the "TimedTask" button
    And I will see the "timedTask.ListPage" page
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'AutoTestCreate'}" then i click the "编辑" button
    Then I will see the "timedTask.EditPage" page
    And I move the mouse pointer to the "DeleteAppicon"
    And I click the "DeleteApp" button
    And I click the "SaveButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"

  Scenario: 验证所属应用是否取消成功
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading invisible
    And I choose the "AutoTestAppWithAllResources" from the "AppDropdown"
    And I wait for loading invisible
    Then I will see the search result "{'column':'1','name':'AutoTestCreate','contains':'no'}"

  Scenario Outline: 修改app资源范围
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "<name>" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I wait for loading invisible
    And I click the "OverallSituation" button
    And I click the "SaveButton" button under some element

    Examples:
      | name                        |
      | AutoTestAppWithAllResources |

  Scenario Outline: app中定时任务删除
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button in more menu
    Then I will see the "app.AppPage" page
    When I click the "TimedTask" button
    And I will see the "timedTask.ListPage" page
    And I wait for "2000" millsecond
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
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

    Examples:
      | name                        |
      | AutoTestAppWithAllResources |