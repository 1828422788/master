@app @appSmoke
Feature: 应用事件操作（RZY-2141）

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "EventApp" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "OldTitle" name is "EventApp"
    Then I will see the "event.ListPage" page

  Scenario: 新建事件操作
    When I click the "Create" button
    And I will see the "app.AppPage" page
    And I will see the element "OldTitle" name is "EventApp"
    Then I will see the "event.CreatePage" page
    And I set the parameter "Name" with value "AutoTestApp"
    And I set the parameter "Url" with value "https://www.baidu.com"
    And I click the "CreateButton" button
    Then I will see the success message "保存成功"

  Scenario: 编辑事件操作
    When the data name is "AutoTestApp" then i click the "编辑" button
    And I will see the "app.AppPage" page
    And I will see the element "OldTitle" name is "EventApp"
    Then I will see the "event.CreatePage" page
    And I set the parameter "Name" with value "AutoApp"
    And I click the "CreateButton" button
    Then I will see the success message "保存成功"

  Scenario Outline: 搜索事件操作
    Given I set the parameter "SearchInput" with value "<name>"
    And I wait for loading invisible
    Then I will see the search result "<name>"
    And I will see the "app.AppPage" page
    And I will see the element "OldTitle" name is "EventApp"

    Examples:
      | name    |
      | AutoApp |

  Scenario Outline: 删除事件操作
    When the data name is "<name>" then i click the "删除" button
    And I click the "Ensure" button
    And I will see the success message "删除成功"
    And I refresh the website
    Then I will see the search result "{'column':'0','name':'<name>','contains':'no'}"
    And I will see the "app.AppPage" page
    Then I will see the element "OldTitle" name is "EventApp"

    Examples:
      | name    |
      | AutoApp |