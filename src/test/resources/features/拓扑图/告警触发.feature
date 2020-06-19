@topology
Feature: 拓扑图告警触发

  Background:
    Given open the "topology.ListPage" page for uri "/topology/"

  Scenario Outline: 新建拓扑图
    When I click the "Create" button
    And I set the parameter "NameInput" with value "<name>"
    And I click the "Ensure" button

    Examples:
      | name |
      | 告警触发 |

  Scenario Outline: 验证告警等级
    When I click the detail which name is "告警触发"
    Then I will see the "topology.DetailPage" page
    And I wait for "AddInputButton" will be visible
    And I set the parameter "NodeName" with value "n1"
    And I set the parameter "NodeGroup" with value "g1"
    And I click the "AddNodeButton" button
    And I click the "AddValue" button
    And I click the "ValueHeader" button
    And I set the parameter "TextArea" with value "*|stats dc('apache.request_query')"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I will see the message "搜索成功"
    And I click the "AddAlert" button
    And I set the parameter "<min>" with value "0"
    And I set the parameter "<max>" with value "10000"
    And I click the "Apply" button
    Then I will see the element "AlertNode" attribute "fill" is "<attribute>"
    And I refresh the website
    And I accept alert window
    And open the "topology.ListPage" page for uri "/topology/"

    Examples:
      | min       | max       | attribute |
      | HigherMin | HigherMax | #FF3434   |
      | MediumMin | MediumMax | #FF9F02   |
      | LowerMin  | LowerMax  | #FFD700   |

  Scenario: 验证高级告警优先级
    When I click the detail which name is "告警触发"
    Then I will see the "topology.DetailPage" page
    And I wait for "AddInputButton" will be visible
    And I set the parameter "NodeName" with value "n1"
    And I set the parameter "NodeGroup" with value "g1"
    And I click the "AddNodeButton" button
    And I click the "AddValue" button
    And I click the "ValueHeader" button
    And I set the parameter "TextArea" with value "*|stats dc('apache.request_query')"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I will see the message "搜索成功"
    And I click the "AddAlert" button
    And I set the parameter "HigherMin" with value "0"
    And I set the parameter "HigherMax" with value "10000"
    And I set the parameter "MediumMin" with value "0"
    And I set the parameter "MediumMax" with value "10000"
    And I set the parameter "LowerMin" with value "0"
    And I set the parameter "LowerMax" with value "10000"
    And I click the "Apply" button
    Then I will see the element "AlertNode" attribute "fill" is "#FF3434"
    And I refresh the website
    And I accept alert window

  Scenario: 验证中级告警优先级
    When I click the detail which name is "告警触发"
    Then I will see the "topology.DetailPage" page
    And I wait for "AddInputButton" will be visible
    And I set the parameter "NodeName" with value "n1"
    And I set the parameter "NodeGroup" with value "g1"
    And I click the "AddNodeButton" button
    And I click the "AddValue" button
    And I click the "ValueHeader" button
    And I set the parameter "TextArea" with value "*|stats dc('apache.request_query')"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I will see the message "搜索成功"
    And I click the "AddAlert" button
    And I set the parameter "MediumMin" with value "0"
    And I set the parameter "MediumMax" with value "10000"
    And I set the parameter "LowerMin" with value "0"
    And I set the parameter "LowerMax" with value "10000"
    And I click the "Apply" button
    Then I will see the element "AlertNode" attribute "fill" is "#FF9F02"
    And I refresh the website
    And I accept alert window

  Scenario: 验证告警删除
    When I click the detail which name is "告警触发"
    Then I will see the "topology.DetailPage" page
    And I wait for "AddInputButton" will be visible
    And I set the parameter "NodeName" with value "n1"
    And I set the parameter "NodeGroup" with value "g1"
    And I click the "AddNodeButton" button
    And I click the "AddValue" button
    And I click the "ValueHeader" button
    And I set the parameter "TextArea" with value "*|stats dc('apache.request_query')"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I will see the message "搜索成功"
    And I click the "AddAlert" button
    And I set the parameter "HigherMin" with value "0"
    And I set the parameter "HigherMax" with value "10000"
    And I set the parameter "MediumMin" with value "0"
    And I set the parameter "MediumMax" with value "10000"
    And I set the parameter "LowerMin" with value "0"
    And I set the parameter "LowerMax" with value "10000"
    And I click the "Apply" button
    And I click the "ValueHeader" button
    And I click the "DeleteAlert" button
    And I click the "Apply" button
    Then I will see the element "AlertNode" attribute "fill" is "#FF9F02"
    And I refresh the website
    And I accept alert window

  Scenario Outline: 删除拓扑图
    Given the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button

    Examples:
      | name |
      | 告警触发 |