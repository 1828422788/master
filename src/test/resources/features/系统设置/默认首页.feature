@setting @settingSmoke
Feature: 系统设置默认首页

  Scenario:
    Given open the "system.CustomConfigs" page for uri "/system/custom/configs/"
    When I choose the "搜索" from the "HomePage"
    And I let element "HomePage" lose focus

  Scenario:
    Given the page's title will be "搜索"
    And open the "system.CustomConfigs" page for uri "/system/custom/configs/"
    When I choose the "仪表盘" from the "HomePage"
    And I let element "HomePage" lose focus

  Scenario:
    Then the page's title will be "列表 | 仪表盘"