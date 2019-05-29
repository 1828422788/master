@cleanDashboard
Feature: 仪表盘删除（RZY-214）

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"

  Scenario Outline:
    Given the data name is "<name>" then i click the "删除" button
    Then I click the "EnsureDeleteButton" button
    Then I will see the success message "仪表盘删除成功"

    Examples:
      | name           |
      | autotestRename |
      | UIautotest     |

  @cleanFirst
    Examples:
      | name          |
      | FirstAutoTest |