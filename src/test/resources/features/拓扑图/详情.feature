@topology
Feature: 拓扑图详情页

  Background:
    Given open the "topology.ListPage" page for uri "/topology/"

  Scenario Outline: 新建拓扑图
    When I click the "Create" button
    And I set the parameter "NameInput" with value "<name>"
    And I click the "Ensure" button

    Examples:
      | name            |
      | auto_topology样例 |

  @all @smoke @topologySmoke
  Scenario Outline: 添加文本、下拉输入项成功（RZY-1239、RZY-1240）
    And I click the detail which name is "auto_topology样例"
    Then I will see the "topology.DetailPage" page
    And I wait for "1000" millsecond
    Then I click the "AddInputButton" button
    Then I set the parameter "Title" with value "<title>"
    Then I set the parameter "Token" with value "<token>"
    Then I choose the "<inputType>" from the "InputType"
    Then I click the "EnsureInputButton" button
    And I refresh the website
    And I accept alert window

    Examples:
      | title           | token | inputType |
      | apache.resp_len | tag1  |           |
      | apache.resp_len | tag2  | 下拉菜单      |

  Scenario Outline: 添加动态菜单输入项失败
    And I click the detail which name is "auto_topology样例"
    Then I will see the "topology.DetailPage" page
    And I wait for "1000" millsecond
    And I click the "AddInputButton" button
    And I set the parameter "Title" with value "<title>"
    And I set the parameter "Token" with value "<token>"
    And I choose the "<inputType>" from the "InputType"
    And I set the parameter "DynamicFields" with value "<dynamicFields>"
    And I set the parameter "SearchInput" with value "<searchInput>"
    And I click the "SearchButton" button
    And I will see the message "<message>"
    And I refresh the website
    And I accept alert window

    Examples:
      | title           | token | inputType | dynamicFields   | searchInput                                   | message  |
      | apache.resp_len | tag3  | 动态菜单      |                 |                                               | 请填写动态字段！ |
      | apache.resp_len | tag3  | 动态菜单      | apache.resp_len |                                               | 请填写搜索内容！ |
      | apache.resp_len | tag3  | 动态菜单      | apache.resp_len | tag:"sample04061424" \| top 1 apache.resp_len | 返回动态字段成功 |

  Scenario Outline: 添加输入项失败
    And I click the detail which name is "auto_topology样例"
    Then I will see the "topology.DetailPage" page
    And I wait for "1000" millsecond
    Then I click the "AddInputButton" button
    Then I set the parameter "Title" with value "<title>"
    Then I click the "EnsureInputButton" button
    Then I will see the message "<message>"
    And I refresh the website
    And I accept alert window

  @all
    Examples:
      | title | message     |
      |       | 请检查必填项是否完成！ |
      | title | 请检查必填项是否完成！ |

  Scenario: 验证输入项重名校验
    And I click the detail which name is "auto_topology样例"
    Then I will see the "topology.DetailPage" page
    And I wait for "1000" millsecond
    And I click the "AddInputButton" button
    And I set the parameter "Title" with value "title"
    And I set the parameter "Token" with value "token"
    Then I click the "EnsureInputButton" button
    And I click the "AddInputButton" button
    And I set the parameter "Title" with value "title"
    And I set the parameter "Token" with value "token"
    Then I click the "EnsureInputButton" button
    Then I will see the message "该标识符已经存在，请重新输入！"
    And I refresh the website
    And I accept alert window

  Scenario Outline: 节点配置失败提示
    And I click the detail which name is "auto_topology样例"
    Then I will see the "topology.DetailPage" page
    Then I set the parameter "NodeGroup" with value "<nodeGroup>"
    Then I click the "AddNodeButton" button
    Then I will see the message "<message>"
    And I refresh the website
    And I accept alert window

  @all
    Examples:
      | nodeGroup | message  |
      |           | 请输入节点名称！ |
      | test      | 请输入节点名称！ |

  Scenario Outline: 失败提示
    And I click the detail which name is "auto_topology样例"
    Then I will see the "topology.DetailPage" page
    Then I set the parameter "NodeName" with value "test"
    Then I set the parameter "NodeGroup" with value "group"
    Then I click the "AddNodeButton" button
    And I click the "AddValue" button
    And I click the "ValueHeader" button
    Then I set the parameter "TextArea" with value "<leftValue>"
    Then I click the "<dateEditor>" button
    And I click the "<date>" button
    And I click the "SearchButton" button
    Then I will see the message "<message>"
    And I refresh the website
    And I accept alert window

  @all
    Examples:
      | leftValue | dateEditor | date  | message    |
      |           |            |       | 搜索语句不能为空   |
#      | *         | DateEditor | Today | 请输入统计类搜索内容 |

  Scenario Outline: 删除拓扑图
    Given the data name is "<name>" then i click the "删除" button
    And I click the "Ensure" button

    Examples:
      | name            |
      | auto_topology样例 |