@authorization @all @smoke
Feature: 授权角色权限

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"

  Scenario Outline:
    When the data name is "AutoTestWithAllResource" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    When I click the "{'TabButton':'<Tab>'}" button
    And I check "<CheckBoxes>" from the "{'GroupManagement':['<GroupName>']}"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

    Examples:
      | Tab      | CheckBoxes | GroupName       |
      | 用户分组     | 读取         | AutoTestForAuth |
      | Agent 管理 | 读取         | AutoTestForAuth |
      | 监控       | 读取         | AutoTestForAuth |
      | 仪表盘      | 读取         | AutoTestForAuth |
      | 字典       | 读取         | AutoTestForAuth |
      | 知识       | 读取         | AutoTestForAuth |
      | 搜索宏      | 读取         | AutoTestForAuth |
      | 字段提取     | 读取         | AutoTestForAuth |
      | 报表       | 读取         | AutoTestForAuth |
      | 定时任务     | 读取         | AutoTestForAuth |
      | 已存搜索     | 读取         | AutoTestForAuth |
      | 日志来源     | 读取         | AutoTestForAuth |
      | 拓扑图      | 读取         | AutoTestForAuth |
      | 趋势图      | 读取         | AutoTestForAuth |

    Examples:
      | Tab      | CheckBoxes | GroupName       |
      | 用户分组     | 读取,编辑,删除   | AutoTestForAuth |
      | Agent 管理 | 读取,编辑,删除   | AutoTestForAuth |
      | 监控       | 读取,编辑,删除   | AutoTestForAuth |
      | 仪表盘      | 读取,编辑,删除   | AutoTestForAuth |
      | 字典       | 读取,编辑,删除   | AutoTestForAuth |
      | 知识       | 读取,编辑,删除   | AutoTestForAuth |
      | 搜索宏      | 读取,编辑,删除   | AutoTestForAuth |
      | 字段提取     | 读取,编辑,删除   | AutoTestForAuth |
      | 报表       | 读取,编辑,删除   | AutoTestForAuth |
      | 定时任务     | 读取,编辑,删除   | AutoTestForAuth |
      | 已存搜索     | 读取,编辑,删除   | AutoTestForAuth |
      | 日志来源     | 读取,编辑,删除   | AutoTestForAuth |
      | 拓扑图      | 读取,编辑,删除   | AutoTestForAuth |
      | 趋势图      | 读取,编辑,删除   | AutoTestForAuth |