 @galaxee  @galaxee1
Feature: 数据大屏-模版

#  Background:
#     Given I will see the "PublicNavBarPage" page
#     And I wait for "Dashboard" will be visible


  Scenario: 模版 RZY-
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "模版"
    And I click the "Ensure" button

  Scenario: 编辑大屏流程 RZY-1931,RZY-1922
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    And I wait for "7000" millsecond
    When the galaxee name is "页面设置" then I click the "iconfont icon-bianji" release button
    And switch to window "页面设置"
    Then I will see the "galaxee.CreatePage" page
    And I close all tabs except main tab
    And I wait for "3000" millsecond
#    And I wait for loading invisible
    And the page's title will be "页面设置"
    And I click the "BackGalaxee" button
    And I wait for loading invisible
    And the page's title will be "大屏管理"












