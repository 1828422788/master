#@app @appSmoke
Feature: 应用资源分组（RZY-2145）

  Scenario: 新建资源分组
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AuthApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I click the "ResourceGroup" button
    Then I will see the "resourceGroups.ListPage" page
    When I will see the search result "{'column':'0','name':'Auto'}"
    And I click the "CreateResourceGroup" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"
    Then I will see the "resourceGroups.CreatePage" page
    When I set the parameter "ResourceGroupName" with value "AutoTestApp"
    And I choose the "知识" from the "ResourceGroupType"
    And I choose the "AutoTestAppWithAllResources" from the "App"
    And I choose the "AutoTestRoleWithAllResource" from the "ResourceGroupOwner"
    And I click the "CreateButton" button
    Then I will see the success message "创建成功"

  Scenario: 编辑资源分组
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I click the "ResourceGroup" button
    Then I will see the "resourceGroups.ListPage" page
    When the data name is "AutoTestApp" then i click the "编辑" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"
    And I will see the "resourceGroups.EditPage" page
    When I set the parameter "ResourceGroupName" with value "AutoAppResource"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

  Scenario: 资源分组跳转
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I click the "ResourceGroup" button
    Then I will see the "resourceGroups.ListPage" page
    When the data name is "AutoAppResource" then i click the "跳转" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"
    Then the page's title will be "知识"

  Scenario: 按照分组类型查找资源分组
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I click the "ResourceGroup" button
    Then I will see the "resourceGroups.ListPage" page
    Given I choose the "知识" from the "SearchDropdown"
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'Auto'}"

  Scenario: 按照名称查找资源分组
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I click the "ResourceGroup" button
    Then I will see the "resourceGroups.ListPage" page
    And I wait for loading invisible
    Given I set the search input with "AutoApp"
#    And I click the "Search" button under some element
#    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'AutoApp'}"

  Scenario: 修改资源分组所属应用
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I click the "ResourceGroup" button
    Then I will see the "resourceGroups.ListPage" page
    When the data name is "AutoAppResource" then i click the "所属应用" button
    And I choose the "AutoTestAppWithAllResources" from the "App"
    Then I click the "EnsureButton" button
    And I refresh the website
    Then I will see the search result "{'contains':'no','column':'0','name':'AutoAppResource'}"

  Scenario: 删除资源分组
    Given open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"
    When the data name is "AutoAppResource" then i click the "删除" button
    And I click the "MessageBoxOKButton" button
    Then I will see the success message "删除成功"

  Scenario: RZY-2119:新建搜索宏测试
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    When I click the "CreateButton" button
    Then I will see the "searchMacro.CreatePage" page
    When I set the parameter "Name" with value "AutoAppTestMacro"
    And I choose the "default_Macro" from the "Group"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

  Scenario: RZY-2119:资源分组添加多个所属应用
    Given open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"
    When the data name is "default_Macro" then i click the "所属应用" button
    And I choose the "ReportApp,DashboardApp,AlertApp,ScheduleApp,TrendApp,SavedsearchesApp,KnowledgeApp,MacroApp,SourceApp,TopologyApp,ConfigsApp" from the "App"
    Then I click the "EnsureButton" button

  Scenario Outline: RZY-2119:验证资源分组是否生效
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "<name>" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I click the "SearchMacroTest" button
    Then I will see the search result contains "{'column':'0','name':'AutoAppTestMacro'}"

    Examples:
      | name             |
      | ReportApp        |
      | DashboardApp     |
      | AlertApp         |
      | ScheduleApp      |
      | TrendApp         |
      | SavedsearchesApp |
      | KnowledgeApp     |
      | MacroApp         |
      | SourceApp        |
      | TopologyApp      |
      | ConfigsApp       |

  Scenario: 删除搜索宏
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    When the data name is "AutoAppTestMacro" then i click the "删除" button
    And I click the "EnsureDelete" button