@alert @alertSmoke @second
Feature: 监控编辑

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"

  Scenario Outline:
    When the data name is "监控高级配置测试" then i click the "编辑" button
    And I will see the "alert.CreatePage" page
    And I wait for loading invisible
    And I click the "AlertNoteTypeTab" button
    And I choose the "<alert>" from the "AlertDropdown"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

    Examples:
      | alert     |
      | rsyslog告警 |
      | 邮件告警      |
      | 告警转发      |
      | ping主机    |

  Scenario: 告警抑制
    When the data name is "监控高级配置测试" then i click the "编辑" button
    And I will see the "alert.CreatePage" page
    And I wait for loading invisible
    And I click the "AdvancedConfigTab" button
    And I click the "Control" button
    And I set the parameter "SendFirstAlert" with value "20"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"


