#@dashboard @smoke @dashboardSmoke @all
Feature: 仪表盘设为/取消默认（RZY-211）

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"

  Scenario: 仪表盘设为默认
    Given the data name is "UIautotest" then i click the "设为默认" button
    And I click the "EnsureSetDefaultButton" button
    Then I will see the success message "仪表盘默认显示设置成功"

  Scenario: 仪表盘取消默认
    When I click the "ReturnList" button
    And the data name is "UIautotest" then i click the "取消默认" button
    And I click the "EnsureSetDefaultButton" button
    Then I will see the success message "仪表盘默认显示取消成功"

