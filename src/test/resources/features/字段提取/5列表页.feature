@all @smoke @configs @configsSmoke
Feature: 字段提取列表页

  Background:
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible

  Scenario: 按名称过滤
    When I set the parameter "SearchInput" with value "脱敏"
    And I wait for loading invisible
    Then I will see the search result "{'column':'1','name':'脱敏'}"

  Scenario: 验证运行统计是否自动关闭
    Then I will see the "SwitchButton" equals "ant-switch-small ant-switch"

  Scenario: 选择标签
    When the data name is "{'column':'1','name':'RZY3417多值字段'}" then i click the "标签" button
    And I choose the "自动化测试标签" from the "TagGroup" in config
    And I click the "Ensure" button
    Then I will see the success message "修改成功"

  Scenario: 按标签过滤
    And I choose the "自动化测试标签" from the "ResourceDropdown" in config
    And I wait for loading invisible
    Then I will see the search result contains "{'column':'1','name':'RZY3417多值字段'}"

  Scenario: 取消标签
    When the data name is "{'column':'1','name':'RZY3417多值字段'}" then i click the "标签" button
    And I cancel selection "自动化测试标签" from the "TagGroup" in config
    And I click the "Ensure" button
    Then I will see the success message "修改成功"

  Scenario: 验证标签取消成功
    And I choose the "自动化测试标签" from the "ResourceDropdown" in config
    Then I wait for loading invisible
    And I will see the "SearchResultIsEmpty" result will be "暂无数据"