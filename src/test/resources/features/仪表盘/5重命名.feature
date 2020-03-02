@dashboard @dashboardSmoke
Feature: 仪表盘重命名（RZY-213）

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"

  Scenario Outline: 重命名
    Given the data name is "<name>" then i click the "重命名" button
    And I set the parameter "DashBoardName" with value "<newName>"
    And I click the "Ensure" button
    Then I will see the success message "<message>"
    And I refresh the website
    And I wait for loading invisible
    Then I will see the search result contains "<newName>"

    Examples: 重命名成功
      | name       | newName | message |
      | UIautotest | UI自动化创建 | 重命名成功   |