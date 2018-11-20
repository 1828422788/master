Feature: 系统设置默认首页

  Scenario Outline:
    Given open the "system.CustomConfigs" page for uri "/system/custom/configs/"
    When I choose the "<homePage>" from the "HomePage"
    And I let element "HomePage" lose focus
    Then I will see the success message "首页保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "<name>"
    And I set the parameter "Password" with value "<password>"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And the page's title will be "<title>"

    Examples:
      | homePage | name     | password   | title     |
      | 搜索       | owner    | all123456  | 搜索        |
      | 仪表盘      | AutoTest | qqqqq11111 | 列表 \| 仪表盘 |
#      | 搜索       | UIAutoTest | 12345678a  | 搜索        |