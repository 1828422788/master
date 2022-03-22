#@dashboard @dashboardSmoke
@dashboardDefault
Feature: 仪表盘06设为/取消默认（RZY-211）

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I wait for "2000" millsecond
    And I set the parameter "SearchInput" with value "FirstAutoTest"
    And I wait for "2000" millsecond

  Scenario:设为默认（RZY-211，RZY-239）
    Given the data name is "FirstAutoTest" then i click the "设为默认" button in more menu
    And I wait for "Ensure" will be visible
    And I will see the element "Message" contains "设置仪表盘 FirstAutoTest 作为默认显示"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "设置默认仪表盘成功"
    And I wait for "SuccessMessage" will be invisible
    And I will see the text "默认" exist in page
    And I refresh the website
    And I wait for "Loading" will be invisible
    And switch to window "仪表盘"
    Then I will see the "dashboard.DetailPage" page
    And I close all tabs except main tab
    And I wait for loading invisible
    And I wait for "ShowDashboards" will be visible
    And I click the "ShowDashboards" button
    And I wait for "ReturnToList" will be visible
    And I click the "ReturnToList" button under some element
    And I wait for loading invisible
    And switch to window "仪表盘列表"
    And I close all tabs except main tab
    Then I will see the "dashboard.ListPage" page
    Given the data name is "FirstAutoTest默认" then i click the "取消默认" button in more menu
    And I wait for "Ensure" will be visible
    And I will see the element "Message" contains "取消仪表盘 FirstAutoTest 作为默认显示"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "取消默认仪表盘成功"
    And I wait for "SuccessMessage" will be invisible
    And I will see the text "默认" is not existed in page

