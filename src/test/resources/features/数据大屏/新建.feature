@third
Feature: 数据大屏新建

  Background:
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"

  Scenario: 保存为银行运维模版
    And I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Bank" button
    And I click the "Create" button
    And I set the parameter "Name" with value "test"
    And I click the "Ensure" button
    And I click the "Chart" button
    And I click the "Line" button
    And I click the "Data" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I choose the "ts" from the "Xaxis"
    And I choose the "count()" from the "Yaxis"
    And I click the "SaveAsTemplate" button
    Then I will see the success message "操作成功"

  Scenario: 保存为test2
    And I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Test" button
    And I click the "Create" button
    And I set the parameter "Name" with value "test2"
    And I click the "Ensure" button
    And I click the "Save" button
    Then I will see the success message "保存成功"
