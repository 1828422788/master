@alert @alertSmoke @second
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

  Scenario Outline: RZY-3016、3015
    When the data name is "<name>(副本)" then i click the "编辑" button
    Then I will see the "alert.CreatePage" page
    When I set the parameter "AlertName" with value "<alertName>"
    And I click the "Divide" button
    And I set the parameter "DivideInput" with value "<divideName>"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

    Examples:
      | name                  | alertName                              | divideName    |
      | RZY-2478:新建监控类型-事件数监控 | RZY-3016:监控-设备切分-执行结果验证-填写appname      | appname       |
      | RZY-2478:新建监控类型-事件数监控 | RZY-3015:监控-设备切分-执行结果验证-填写tag          | tag           |
      | RZY-2478:新建监控类型-事件数监控 | RZY-2971:监控-设备切分-执行结果验证-填写ip或timestamp | tag、timestamp |