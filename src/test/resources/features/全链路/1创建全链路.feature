@fulllink @fulllinkCreate
Feature: 全链路_1创建

  Background:
    Given open the "fulllink.ListPage" page for uri "/fulllink/"
    And I wait for loading invisible

  Scenario: 创建全链路_名称为空格
    When I click the "Create" button
    And I wait for "Name" will be visible
    And I set the parameter "Name" with value "  "
    And I click the "Ensure" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "名称不能为空"

  Scenario: 创建全链路_名称为空
    When I click the "Create" button
    And I wait for "Name" will be visible
    And I set the parameter "Name" with value ""
    And I click the "Ensure" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "名称不能为空"

  Scenario: 创建全链路_取消
    When I click the "Create" button
    And I wait for "Name" will be visible
    And I choose the "test_app" from the "AppField"
    And I click the "TagToInput" button
    And I set the parameter "Tag" with value "auto_package"
    And I choose the "auto_package" from the "TagField"
    And I set the parameter "Name" with value "AutoTest_1"
    And I will see the element "SelectedApp" contains "test_app"
    And I click the "Cancel" button
    When I click the "Create" button
    And I wait for "Name" will be visible
    And I will see the input element "Name" value will be ""
    And I will see the "SelectedApp" doesn't exist
    And I will see the "SelectedTag" doesn't exist

  Scenario: 创建全链路1
    When I click the "Create" button
    And I wait for "Name" will be visible
    And I choose the "test_app" from the "AppField"
    And I wait for "2000" millsecond
    And I click the "TagToInput" button
    And I set the parameter "Tag" with value "auto_package"
    And I choose the "auto_package" from the "TagField"
    And I set the parameter "Name" with value "AutoTest_1"
    And I click the "Ensure" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "创建成功"

  Scenario: 创建全链路2
    When I click the "Create" button
    And I wait for "Name" will be visible
    And I click the "TagToInput" button
    And I set the parameter "Tag" with value "auto_package"
    And I choose the "auto_package" from the "TagField"
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
    And I choose the "auto_package" from the "TagFilter"
    And I click the "HideElement" button
    And I wait for loading invisible
    When I will see the data "{'column':'0','name':'AutoTest_2'}" values "{'column':'4','name':'auto_package'}"
    Then I will see the data "{'column':'0','name':'AutoTest_1'}" values "{'column':'4','name':'auto_package'}"
    Then I will see the search result "{'column':'0','name':'AutoTest_3','contains':'no'}"
    And I choose the "test_app" from the "AppDropdown"
    And I wait for loading invisible
    When I will see the data "{'column':'0','name':'AutoTest_1'}" values "{'column':'4','name':'auto_package'}"
    Then I will see the data "{'column':'0','name':'AutoTest_1'}" values "{'column':'3','name':'test_app'}"
    Then I will see the search result "{'column':'0','name':'AutoTest_3','contains':'no'}"
    Then I will see the search result "{'column':'0','name':'AutoTest_2','contains':'no'}"

  Scenario: global_tag_app_2
    And I wait for "2000" millsecond
    And I choose the "test_app" from the "AppFilter"
    And I click the "HideElement" button
    And I wait for loading invisible
    When I will see the data "{'column':'0','name':'AutoTest_3'}" values "{'column':'3','name':'test_app'}"
    Then I will see the data "{'column':'0','name':'AutoTest_1'}" values "{'column':'3','name':'test_app'}"
    Then I will see the search result "{'column':'0','name':'AutoTest_2','contains':'no'}"
    And I choose the "auto_package" from the "TagFilter"
    And I click the "HideElement" button
    And I wait for loading invisible
    When I will see the data "{'column':'0','name':'AutoTest_1'}" values "{'column':'4','name':'auto_package'}"
    Then I will see the data "{'column':'0','name':'AutoTest_1'}" values "{'column':'3','name':'test_app'}"
    Then I will see the search result "{'column':'0','name':'AutoTest_3','contains':'no'}"
    Then I will see the search result "{'column':'0','name':'AutoTest_2','contains':'no'}"

  @fulllinkSmoke
  Scenario: 创建全链路
    When I click the "Create" button
    And I wait for "Name" will be visible
    And I set the parameter "Name" with value "AutoTest"
    And I click the "Ensure" button
    Then I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "创建成功"