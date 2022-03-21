#@alertss @alertSmoke @second
Feature: 监控设备切分

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"

  Scenario Outline: 验证切分字段
    When the data name is "RZY-434:字段统计监控步骤1(副本)" then i click the "编辑" button
    Then I will see the "alert.CreatePage" page
    And I click the "Divide" button
    And I set the parameter "DivideInput" with value "<divideInput>"
    And I click the "AlertNoteTypeTab" button
    And I choose the "邮件告警" from the "AlertDropdown"
    And I click the "Preview" button
    And I wait for "DialogBody" will be visible
    And I will see the element "DialogBody" name contains "切分字段: <divideInput>"

    Examples:
      | divideInput |
      | tag         |
      | ip          |
      | hostname    |
      | appname     |