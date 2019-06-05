@cleanDashboard
Feature: 仪表盘删除（RZY-214）

  Scenario Outline:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureDeleteButton" button
    Then I will see the success message "仪表盘删除成功"

    Examples:
      | name       |
      | UI自动化创建    |
      | UIautotest |

  @cleanFirst
    Examples:
      | name          |
      | FirstAutoTest |

  @cleanFirst
  Scenario: 删除报表
    Given open the "report.ListPage" page for uri "/reports/"
    When the data name is "仪表盘创建报表" then i click the "删除" button
    Then I click the "DeleteEnsure" button
