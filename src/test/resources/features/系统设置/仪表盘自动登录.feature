@setting
Feature: 系统设置仪表盘自动登录

  Background:
    Given open the "system.CustomConfigs" page for uri "/system/custom/configs/"

  @second
  Scenario: RZY-222:自动登录查看仪表盘的方式
    When I "checked" the checkbox which name is "仪表盘支持自动登录"
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "PublicNavBarPage" page for uri "/dashboard/login/owner/8e750784517d429f5b27abcd9cfbd473/57f04416bce20f4d0e55738697c5a93d/"
    Then the page's title will be "列表 | 仪表盘"
    And I click the "OwnerIcon" button
    Then I will see the element "LoginUser" name is "owner"

  Scenario: RZY-1765:仪表盘支持自动登录（取消勾选）
    When I "unchecked" the checkbox which name is "仪表盘支持自动登录"
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "PublicNavBarPage" page for uri "/dashboard/login/owner/8e750784517d429f5b27abcd9cfbd473/57f04416bce20f4d0e55738697c5a93d/"
    Then the page's title will be "403 Permission Denied"
