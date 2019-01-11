Feature: 验证未授权组内管理权限时列表页结果

  Scenario Outline: 验证未授权组内管理权限时列表页结果
    Given I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "alert.ListPage" page for uri "<uri>"
    Then I will see the element "NoSearchResultMessage" name is "暂无数据"

    Examples:
      | uri          |
      | /alerts/     |
      | /dashboard/  |
      | /dictionary/ |