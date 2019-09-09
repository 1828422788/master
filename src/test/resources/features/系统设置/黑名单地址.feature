@setting @settingSmoke
Feature: 系统设置黑名单地址

  Background:
    Given open the "system.CustomConfigs" page for uri "/system/custom/configs/"

  Scenario: 设置黑名单
    When I click the "BlacklistInput" button
    When I set the parameter "BlacklistInput" with value "/knowledge/"
    And I click the "LiButton" button
    And I let element "Blacklist" lose focus
    Then I will see the success message "黑名单地址保存成功"
    And open the "system.CustomConfigs" page for uri "/knowledge/"
    Then the page's title will be "404 Page Not Found"

  Scenario: 取消设置黑名单
    When I click the "Close" button
    Then I will see the success message "黑名单地址保存成功"
    And open the "system.CustomConfigs" page for uri "/knowledge/"
    Then the page's title will be "知识"

  Scenario: 设置黑名单地址不合法
    When I click the "BlacklistInput" button
    When I set the parameter "BlacklistInput" with value "测试是否保存"
    And I click the "Test" button
    Then I will see the error message "黑名单地址 不合法"
