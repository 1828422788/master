#@dashboard
Feature: 仪表盘设为/取消默认（RZY-211）

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible

  Scenario:设为默认（RZY-211，RZY-239）
    Given the data name is "FirstAutoTest" then i click the "设为默认" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "设置默认仪表盘成功"
    And I refresh the website
    And I wait for loading invisible
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "默认"
    And I click the "EnsureCreateTagButton" button
    And I wait for loading complete
    And I click the "ReturnToList" button under some element
    And I wait for loading invisible
    When the data name is "FirstAutoTest" then i click the "取消默认" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "取消默认仪表盘成功"

