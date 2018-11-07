@authorization @all @smoke
Feature: 授权角色权限

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"

  Scenario Outline:
    When the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    When I click the "{'TabButton':'<Tab>'}" button
    And I check "<CheckBoxes>" from the "{'GroupManagement':['AutoTestWithAllResource']}"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And open the "userGroups.ListPage" page for uri "/account/resourcegroups/"
    Then I will see the search result contains "{'column':'1','name':'<Tab>'}"

    Examples:
      | Tab      | CheckBoxes |
      | Agent 管理 | 读取         |
      | 监控       | 读取         |
      | 仪表盘      | 读取         |
      | 字典       | 读取         |
      | 知识       | 读取         |
      | 搜索宏      | 读取         |
      | 字段提取     | 读取         |
      | 报表       | 读取         |
      | 定时任务     | 读取         |
      | 已存搜索     | 读取         |
      | 日志来源     | 读取         |
      | 拓扑图      | 读取         |
      | 趋势图      | 读取         |
