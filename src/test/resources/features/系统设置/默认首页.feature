@all @configs @smoke @configsSmoke
Feature: 系统设置默认首页

  Scenario Outline:
    Given open the "system.CustomConfigs" page for uri "/system/custom/configs/"
    When I choose the "<homePage>" from the "HomePage"
    And I let element "HomePage" lose focus
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "<name>"
    And I set the parameter "Password" with value "<password>"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And the page's title will be "<title>"

    Examples:
      | homePage | name  | password  | title     |
      | 搜索       | owner | all123456 | 搜索        |
      | 仪表盘      | owner | all123456 | 列表 \| 仪表盘 |