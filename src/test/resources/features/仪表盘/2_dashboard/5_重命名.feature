@dashboard @dashboardRename
Feature: 仪表盘05重命名

  Scenario Outline: 重命名（RZY-213）
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    Given I set the parameter "TextFilter" with value "<name>"
    And I wait for loading invisible
    Given the data name is "<name>" then i click the "编辑" button
    And I set the parameter "DashBoardName" with value "<newName>"
    And I click the "Ensure" button
    Then I will see the success message "<message>"
    And I refresh the website
    And I wait for loading invisible
    Given I set the parameter "TextFilter" with value "<newName>"
    And I wait for loading invisible
    Then I will see the search result contains "<newName>"

    Examples: 重命名成功
      | name       | newName      | message          |
      | UIautotest | UI自动化创建 | 更新仪表盘成功   |