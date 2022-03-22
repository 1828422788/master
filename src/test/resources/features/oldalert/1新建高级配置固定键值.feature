#@alertSmoke @third
Feature: 监控高级配置固定键值

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"

  Scenario Outline: RZY-2988:新建监控-高级配置-固定键值-保存
    When the data name is "监控高级配置测试" then i click the "编辑" button
    And I wait for loading invisible
    And I will see the "alert.CreatePage" page
    And I click the "AdvancedConfigTab" button
    And I click the "AddKeyValueButton" button
    And I set the parameter "Key" with value "<key>"
    And I set the parameter "Value" with value "<value>"
    And I click the "SaveButton" button
    Then I will see the message "<message>"

    Examples:
      | key | value | message              |
      | key | value | 保存成功                 |
      |     |       | 请填写完整的键值对            |
      | #   | #     | 固定键值只能填写中文、英文、数字和下划线 |
      | key | value | 固定键值的键重复，请修改         |

  Scenario: 验证监控复制键值是否复制
    When the data name is "监控高级配置测试" then i click the "复制" button
    Then I will see the success message "复制成功"
    And I refresh the website
    When the data name is "监控高级配置测试(副本)" then i click the "编辑" button
    And I wait for loading invisible
    And I will see the "alert.CreatePage" page
    And I click the "AdvancedConfigTab" button
    Then I click the "Key" button

  Scenario Outline: RZY-2990:检查各种告警推送是否带出键值
    When the data name is "监控高级配置测试" then i click the "编辑" button
    And I wait for loading invisible
    And I will see the "alert.CreatePage" page
    And I click the "AlertNoteTypeTab" button
    And I choose the "<alert>" from the "AlertDropdown"
    And I click the "Preview" button
    And I wait for "DialogBody" will be visible
    Then I will see the element "DialogBody" contains "<config>"

    Examples:
      | alert | config                            |
      | 邮件告警  | 扩展配置: key,value                   |
      | 告警转发  | "extend_conf": { "key": "value" } |

  Scenario: RZY-1866:新建监控-高级配置-固定键值-删除
    When the data name is "监控高级配置测试" then i click the "编辑" button
    And I wait for loading invisible
    And I will see the "alert.CreatePage" page
    And I click the "AdvancedConfigTab" button
    And I click the "Close" button
    And I click the "SaveButton" button
    Then I will see the message "保存成功"

  Scenario: 验证固定键值是否删除成功
    When the data name is "监控高级配置测试" then i click the "编辑" button
    And I wait for loading invisible
    And I will see the "alert.CreatePage" page
    And I click the "AdvancedConfigTab" button
    Then I will see the "Key" doesn't exist

