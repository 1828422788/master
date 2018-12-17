@dashboard @smoke @dashboardSmoke @all
Feature: 仪表盘重命名（RZY-213）

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"

  Scenario Outline:
    Given the data name is "<name>" then i click the "重命名" button
    Then I set the parameter "DashBoardName" with value "<newName>"
    Then I click the "EnsureRenameButton" button
    Then I will see the <message>

    Examples: 重命名成功
      | name        | newName        | message                    |
      | sxjautotest | autotestRename | success message "仪表盘重命名成功" |
