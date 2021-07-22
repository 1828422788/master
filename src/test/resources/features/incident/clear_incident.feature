@clearincident
Feature:清理incident

  @clearincident1
  Scenario Outline: 删除用户
    Given open the "users.ListPage" page for uri "/account/users/"
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I will see the success message "删除成功"

    Examples:
      | name  |
      | ctest     |
      | Derek     |
      | Leibniz   |
      | kongfeili |

  @clearincident2
  Scenario Outline: 新建用户分组样例1个
    Given open the "usergroups.ListPage" page for uri "/account/usergroups/"
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I will see the success message "删除成功"


    Examples:
      | name |
      | 日志易用户体验组 |
