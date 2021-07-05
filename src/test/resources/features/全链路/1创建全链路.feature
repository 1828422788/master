@fulllink @fulllinkCreate
Feature: 全链路_1创建

  Background:
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for "3000" millsecond

  Scenario: 创建全链路_空名称
    When I click the "Create" button
    And I wait for "Name" will be visible
    And I set the parameter "Name" with value "  "
    And I click the "Ensure" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "名称格式有误, 仅支持汉字，数字，字母，中划线及下划线"

  Scenario: 创建全链路1
    When I click the "Create" button
    And I wait for "Name" will be visible
    And I choose the "test_app" from the "AppField"
    And I wait for "2000" millsecond
    And I choose the "auto_package" from the "GroupField"
    And I set the parameter "Name" with value "AutoTest_1"
    And I click the "Ensure" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "创建成功"

  Scenario: 创建全链路2
    When I click the "Create" button
    And I wait for "Name" will be visible
    And I choose the "auto_package" from the "GroupField"
    And I set the parameter "Name" with value "AutoTest_2"
    And I click the "Ensure" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "创建成功"

  Scenario: 创建全链路3
    When I click the "Create" button
    And I wait for "Name" will be visible
    And I choose the "test_app" from the "AppField"
    And I set the parameter "Name" with value "AutoTest_3"
    And I click the "Ensure" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "创建成功"

  Scenario: global_tag_app_1
    And I wait for "2000" millsecond
    When I choose the "auto_package" from the "ResourceDropdown"
    And I click the "HideElement" button
    And I wait for "Loading" will be invisible
    When I will see the data "{'column':'0','name':'AutoTest_2'}" values "{'column':'4','name':'auto_package'}"
    Then I will see the data "{'column':'0','name':'AutoTest_1'}" values "{'column':'4','name':'auto_package'}"
    Then I will see the search result "{'column':'0','name':'AutoTest_3','contains':'no'}"
    And I choose the "test_app" from the "AppDropdown"
    And I wait for "Loading" will be invisible
    When I will see the data "{'column':'0','name':'AutoTest_1'}" values "{'column':'4','name':'auto_package'}"
    Then I will see the data "{'column':'0','name':'AutoTest_1'}" values "{'column':'3','name':'test_app'}"
    Then I will see the search result "{'column':'0','name':'AutoTest_3','contains':'no'}"
    Then I will see the search result "{'column':'0','name':'AutoTest_2','contains':'no'}"

  Scenario: global_tag_app_2
    And I wait for "2000" millsecond
    And I choose the "test_app" from the "AppDropdown"
    And I click the "HideElement" button
    And I wait for "Loading" will be invisible
    When I will see the data "{'column':'0','name':'AutoTest_3'}" values "{'column':'3','name':'test_app'}"
    Then I will see the data "{'column':'0','name':'AutoTest_1'}" values "{'column':'3','name':'test_app'}"
    Then I will see the search result "{'column':'0','name':'AutoTest_2','contains':'no'}"
    When I choose the "auto_package" from the "ResourceDropdown"
    And I wait for "Loading" will be invisible
    When I will see the data "{'column':'0','name':'AutoTest_1'}" values "{'column':'4','name':'auto_package'}"
    Then I will see the data "{'column':'0','name':'AutoTest_1'}" values "{'column':'3','name':'test_app'}"
    Then I will see the search result "{'column':'0','name':'AutoTest_3','contains':'no'}"
    Then I will see the search result "{'column':'0','name':'AutoTest_2','contains':'no'}"

  @fulllink_test
  Scenario: 创建全链路1
    When I click the "Create" button
    And I wait for "Name" will be visible
    And I set the parameter "Name" with value "AutoTest"
    And I click the "Ensure" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "创建成功"