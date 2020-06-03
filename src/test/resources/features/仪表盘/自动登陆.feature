#@dashboard @dashboardSmoke
Feature: 仪表盘自动登陆

  Scenario: 勾选仪表盘支持自动登录
    Given open the "system.CustomConfigs" page for uri "/system/"
    And I "checked" the checkbox which name is "仪表盘支持自动登录"
    And I wait for "1000" millsecond

  Scenario: 自动登陆
    Given open the "dashboard.ListPage" page for uri "/dashboard/login/admin/46f1c7d1893b10727385fe05cdb51566/f9b427a351f4d00e1b5f0af0ed07921d/"
    And I wait for loading invisible
    Then the page's title will be "仪表盘"