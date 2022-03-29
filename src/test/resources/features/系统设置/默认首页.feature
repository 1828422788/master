@setting @settingSmoke
Feature: 系统设置_默认首页

  Scenario:修改默认首页
    Given open the "system.CustomConfigs" page for uri "/system/"
    Then I set the parameter "HomePage" with value "/search/"
    And I let element "HomePage" lose focus
    And I logout current user

  Scenario:验证默认首页
   Then the page's title will be "搜索"

  Scenario:恢复默认首页
    Given open the "system.CustomConfigs" page for uri "/system/"
    Then I set the parameter "HomePage" with value "/dashboard/"
    And I let element "HomePage" lose focus
    And I logout current user

  Scenario:验证恢复后的默认首页
    Then the page's title will be "仪表盘列表"