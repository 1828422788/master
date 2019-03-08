@second
Feature: 应用表格新建（RZY-2150）

  Background:
    Given open the "appTable.ListPage" page for uri "/app/application_table/"

  Scenario: 新建应用表格总流程
    Given I click the "Create" button
    And I will see the "appTable.CreatePage" page
    And I set the parameter "Name" with value "test0214"
    And I set the parameter "Describe" with value "描述中文test"
    And I set the parameter "Keyword" with value "200"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "AddDynamicField" button
    And I set the parameter "DisplayName" with value "传递方式"
    And I click the "AddRelatedField" button
    And I set the parameter "RelatedField" with value "apache.method"
    And I click the "Dropdown" button
    And I click the "AddDisplayField" button
    And I set the parameter "FieldName" with value "apache.method"
    And I set the parameter "Alias" with value "传递方式"
    And I set the parameter "Width" with value "10"
    And I set the parameter "Location" with value "2"
    And I click the "AddDisplayField" button
    And I set the parameter "FieldName" with value "timestamp"
    And I set the parameter "Alias" with value "时间戳"
    And I set the parameter "Width" with value "10"
    And I set the parameter "Location" with value "2"
    Then I click the "Save" button