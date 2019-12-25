@dashboard
Feature: 仪表盘设为/取消默认（RZY-211）

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"

  Scenario:
    Given the data name is "FirstAutoTest" then i click the "设为默认" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "设置默认仪表盘成功"
    And I refresh the website
    Then I wait for title change text to "FirstAutoTest | 仪表盘"
    And I click the "ReturnList" button under some element
    And I wait for loading invisible
    When the data name is "FirstAutoTest" then i click the "取消默认" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "取消默认仪表盘成功"

