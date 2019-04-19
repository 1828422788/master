@app @appSmoke
Feature: 应用搜索宏（RZY-2126）

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I click the "SearchMacro" button
    Then I will see the "searchMacro.ListPage" page

  Scenario: 新建搜索宏
    When I click the "CreateButton" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"
    Then I will see the "searchMacro.CreatePage" page
    When I set the parameter "Name" with value "AutoTestApp"
    And I choose the "AutoTestRoleWithAllResource" from the "Group"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

  Scenario: 编辑搜索宏
    When the data name is "AutoTestApp" then i click the "编辑" button
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"
    Then I will see the "searchMacro.CreatePage" page
    When I set the parameter "Name" with value "AutoApp"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

  Scenario: 按分组搜索搜索宏
    When I choose the "AutoTestRoleWithAllResource" from the "GroupList"
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'AutoApp'}"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"

  Scenario: 按名称搜索搜索宏
    When I set the parameter "SearchInput" with value "Auto"
    And I click the "Search" button
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'AutoApp'}"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"

  Scenario Outline: 搜索宏分组
    When the data name is "<name>" then i click the "分组" button
    And I wait for "2000" millsecond
    And I choose the "AutoTestRoleWithAllResource" from the "Group"
    And I click the "EnsureButton" button
    And I refresh the website
    Then I will see the search result "{'contains':'no','column':'0','name':'<name>'}"

    Examples:
      | name    |
      | AutoApp |

  Scenario: 搜索宏删除
    Given open the "searchMacro.ListPage" page for uri "/macro/"
    When the data name is "AutoApp" then i click the "删除" button
    And I click the "EnsureDelete" button