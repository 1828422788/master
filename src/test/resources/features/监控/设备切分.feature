#@alert @alertSmoke @second
Feature: 监控设备切分

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"

  Scenario: RZY-3035:监控-设备切分-执行结果验证-字段统计型监控-填写hostname
    When the data name is "RZY-2468:新建监控类型-字段统计监控(副本)" then i click the "编辑" button
    Then I will see the "alert.CreatePage" page
    When I set the parameter "AlertName" with value "RZY-3035:监控-设备切分-执行结果验证-字段统计型监控-填写hostname"
    And I click the "Divide" button
    And I set the parameter "DivideInput" with value "hostname"
    And I set the parameter "AlertTriggerInput" with value "240"
    And I choose the "总计" from the "ConditionTypes"
    And I set the parameter "AlertLevelInput" with value "0"
    And I click the "Close" button
    And I click the "Close" button
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

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