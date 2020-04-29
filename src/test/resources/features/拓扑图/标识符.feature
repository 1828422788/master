@topology
Feature: 拓扑图标识符

  Background:
    Given open the "topology.ListPage" page for uri "/topology/"

  Scenario Outline: 新建拓扑图
    When I click the "Create" button
    And I set the parameter "NameInput" with value "<name>"
    And I click the "Ensure" button

    Examples:
      | name  |
      | 测试标识符 |

  Scenario: RZY-2515：标识前后缀
    When I click the detail which name is "测试标识符"
    Then I will see the "topology.DetailPage" page
    And I wait for "Message" will be invisible
    And I wait for "AddInputButton" will be visible
    And I click the "AddInputButton" button
    And I set the parameter "Title" with value "标识前后缀"
    And I set the parameter "Token" with value "first"
    And I choose the "下拉菜单" from the "InputType"
    And I set the parameter "Optional" with value "stats"
    And I click the "Add" button
    And I choose the "stats" from the "DefaultValueDropdown"
    And I set the parameter "Prefix" with value "* | "
    And I set the parameter "Postfix" with value " avg(apache.resp_len)"
    And I click the "EnsureInputButton" button
    And I set the parameter "NodeName" with value "n1"
    And I set the parameter "NodeGroup" with value "g1"
    And I click the "AddNodeButton" button
    And I click the "AddValue" button
    And I click the "ValueHeader" button
    And I set the parameter "TextArea" with value "${first}"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I will see the message "搜索成功"
    And I choose the "avg(apache.resp_len)" from the "FiledInput"
    And I click the "Apply" button
    And I click the "Save" button
    And I refresh the website
    And I accept alert window

  Scenario: RZY-2517：标识分隔符
    When I click the detail which name is "测试标识符"
    Then I will see the "topology.DetailPage" page
    And I wait for "Message" will be invisible
    And I wait for "AddInputButton" will be visible
    And I click the "AddInputButton" button
    And I set the parameter "Title" with value "标识分隔符"
    And I set the parameter "Token" with value "second"
    And I choose the "下拉菜单" from the "InputType"
    And I set the parameter "Optional" with value "apache.clientip"
    And I click the "Add" button
    And I set the parameter "Optional" with value "apache.status"
    And I click the "Add" button
    And I choose the "apache.clientip" from the "DefaultValueDropdown"
    And I set the parameter "Prefix" with value "tag:sample04061424_chart | stats count() by "
    And I set the parameter "Separate" with value ","
    And I click the "EnsureInputButton" button
    And I wait for "Container" will be visible
    And I click the "Container" button
    And I click the "AddNode" button
    And I set the parameter "NodeName" with value "n2"
    And I set the parameter "NodeGroup" with value "g2"
    And I click the "AddNodeButton" button
    And I click the "AddValue" button
    And I click the "ValueHeader" button
    And I set the parameter "TextArea" with value "${second}"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "1000" millsecond
    And I choose the "count()" from the "FiledInput"
    And I click the "Apply" button
    And I click the "Save" button
    And I refresh the website
    And I accept alert window

  Scenario: RZY-2519：标识值前后缀
    When I click the detail which name is "测试标识符"
    Then I will see the "topology.DetailPage" page
    And I wait for "AddInputButton" will be visible
    And I click the "AddInputButton" button
    And I set the parameter "Title" with value "标识值前后缀"
    And I set the parameter "Token" with value "third"
    And I choose the "下拉菜单" from the "InputType"
    And I click the "MultiChoice" button
    And I set the parameter "Optional" with value "count() as cnt by apache.status"
    And I click the "Add" button
    And I set the parameter "Optional" with value "dc(cnt)"
    And I click the "Add" button
    And I choose the "count() as cnt by apache.status,dc(cnt)" from the "DefaultValueDropdown"
    And I set the parameter "Prefix" with value "tag:sample04061424_chart | "
    And I set the parameter "IdentityPrefix" with value "stats "
    And I set the parameter "Separate" with value "|"
    And I click the "EnsureInputButton" button
    And I wait for "Container" will be visible
    And I click the "Container" button
    And I click the "AddNode" button
    And I set the parameter "NodeName" with value "n3"
    And I set the parameter "NodeGroup" with value "g3"
    And I click the "AddNodeButton" button
    And I click the "AddValue" button
    And I click the "ValueHeader" button
    And I set the parameter "TextArea" with value "${third}"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "1000" millsecond
    And I choose the "dc(cnt)" from the "FiledInput"
    And I click the "Apply" button
    And I click the "Save" button
    And I refresh the website
    And I accept alert window

  Scenario Outline: 添加动态菜单输入项成功（RZY-1243）
    And I click the detail which name is "测试标识符"
    Then I will see the "topology.DetailPage" page
    And I wait for "AddInputButton" will be visible
    Then I click the "AddInputButton" button
    Then I set the parameter "Title" with value "<title>"
    Then I set the parameter "Token" with value "<token>"
    Then I choose the "<inputType>" from the "InputType"
    Then I set the parameter "DynamicFields" with value "<dynamicFields>"
    Then I set the parameter "SearchInput" with value "<searchInput>"
    Then I click the "TimeRange" button
    Then I click the "ThisMonth" button
    Then I click the "SearchButton" button
    Then I will see the message "返回动态字段成功"
    Then I choose the "61" from the "DynamicDefault"
    Then I click the "EnsureInputButton" button
    And I refresh the website
    And I accept alert window

  @all @smoke @topologySmoke
    Examples:
      | title  | token | inputType | dynamicFields   | searchInput                    |
      | 测试动态字段 | tag4  | 动态菜单      | apache.resp_len | tag:* \| top 1 apache.resp_len |

  Scenario Outline: 删除拓扑图
    Given the data name is "<name>" then i click the "删除" button
    And I click the "Ensure" button

    Examples:
      | name  |
      | 测试标识符 |