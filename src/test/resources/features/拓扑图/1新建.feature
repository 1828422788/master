@topology @all
Feature: 拓扑图新建

  Background:
    Given open the "topology.ListPage" page for uri "/topology/"

  Scenario Outline: 成功新建拓扑图
    When I click the "CreateButton" button
    And I set the parameter "NameInput" with value "<name>"
    And I choose the "<group>" from the "GroupInput"
    And I click the "EnsureButton" button
    Then I will see the <message>
    And I refresh the website
    Then I will see the search result contains "{'column':'0','name':'<name>'}"

  @smoke @topologySmoke
    Examples:
      | name        | group            | message                |
      | sxjautotest | default_Topology | success message "创建成功" |
      | 测试中文名称      |                  | success message "创建成功" |

  Scenario Outline: 新建拓扑图失败
    When I click the "CreateButton" button
    And I set the parameter "NameInput" with value "<name>"
    And I choose the "<group>" from the "GroupInput"
    And I click the "EnsureButton" button
    Then I will see the <message>

    Examples:
      | name             | group            | message                             |
      |                  |                  | error message "请输入拓扑图名称"            |
      | 我是超出长度的名称哦我有十六个字 | default_Topology | error message "名称太长, 请输入小于32个字符的名称" |