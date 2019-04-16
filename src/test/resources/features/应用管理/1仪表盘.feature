@app @appSmoke
Feature: 应用仪表盘

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I click the "Dashboard" button
    Then I will see the "dashboard.ListPage" page

  Scenario: 新建仪表盘
    Given I click the "CreateButton" button
    Then I set the parameter "DashBoardName" with value "AutoApp"
    Then I choose the "AutoTestRoleWithAllResource" from the "DashBoardGroup"
    Then I click the "EnsureCreateButton" button
    Then I will see the success message "仪表盘新建成功"

  Scenario: 按照名称搜索
    When I set the parameter "SearchInput" with value "Auto"
    And I click the "Search" button
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'AutoApp'}"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "AutoTest...pWithAllResources"

  Scenario: 删除仪表盘
    Given the data name is "AutoApp" then i click the "删除" button
    Then I click the "EnsureDeleteButton" button