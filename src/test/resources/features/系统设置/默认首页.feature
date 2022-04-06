@setting @settingSmoke
Feature: 系统设置_默认首页

  Scenario:修改默认首页
    Given open the "system.CustomConfigs" page for uri "/system/"
    Then I set the parameter "HomePage" with value "/search/"
    And I let element "HomePage" lose focus
    And I logout current user
    Given I login user "admin" with password "All#123456"
    Then the page's title will be "搜索"

  Scenario:恢复默认首页
    Given open the "system.CustomConfigs" page for uri "/system/"
    Then I set the parameter "HomePage" with value "/dashboard/"
    And I let element "HomePage" lose focus
    And I logout current user
    Given I login user "admin" with password "All#123456"
    Then the page's title will be "仪表盘列表"