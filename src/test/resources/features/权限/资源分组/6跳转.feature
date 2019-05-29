@all @resourceGroups @smoke @resourceGroupsSmoke
Feature: 资源分组跳转（RZY-1185）

  Background:
    Given open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"

  Scenario Outline:
    Given the data name is "{'column':'1','name':'<dataName>'}" then i click the "跳转" button
    Then the page's title will be "<PageTitle>"

    Examples:
      | dataName | PageTitle |
      | 仪表盘      | 列表 \| 仪表盘 |
      | 知识       | 知识        |
      | 字典       | 字典列表      |
      | 搜索宏      | 搜索宏列表     |
      | 定时任务     | 定时任务      |
      | 监控       | 监控        |
      | 报表       | 报表列表      |
      | 字段提取     | 字段提取      |
      | Agent 管理 | Agent 管理  |
      | 拓扑图      | 拓扑图       |
      | 日志来源     | 日志来源      |
