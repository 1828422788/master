@all @smoke @configs @configsSmoke
Feature: 字段提取搜索

  Background:
    Given open the "configs.ListPage" page for uri "/configs/"

  Scenario: 按名称搜索
    When I set the parameter "SearchInput" with value "多值字段"
    And I wait for loading invisible
    Then I will see the search result "{'column':'1','name':'多值字段'}"

  Scenario: 验证运行统计是否自动关闭
    Then I will see the "SwitchButton" is "ant-switch-small ant-switch"
