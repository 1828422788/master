#@topology
Feature: 拓扑图插图功能

  Background:
    Given open the "topology.ListPage" page for uri "/topology/"

  Scenario Outline: 新建拓扑图
    When I click the "Create" button
    And I set the parameter "NameInput" with value "<name>"
    And I click the "Ensure" button

    Examples:
      | name |
      | 插图   |

  Scenario: 添加插图节点
    When I click the detail which name is "插图"
    Then I will see the "topology.DetailPage" page
    And I wait for "AddInputButton" will be visible
    And I set the parameter "NodeName" with value "n1"
    And I set the parameter "NodeGroup" with value "g1"
    And I click the "AddNodeButton" button
    And I click the "AddValue" button
    And I click the "ValueHeader" button
    And I set the parameter "TextArea" with value "tag:"sample04061424_display" | timechart sep="-sep分格-" format="$VAL-分格2-$AGG" cont=true span=30m bins=100 startindex=1 endindex=8 limit=5 rendertype="area" count() min(apache.resp_len) by apache.status"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Message" will be visible
    And I will see the message "搜索成功"
    And I click the "OpenChart" button
    And I click the "Apply" button
    And I click the "AddValue" button
    And I click the "ValueHeader" button
    And I set the parameter "TextArea" with value "tag:"sample04061424_display" | timechart sep="-sep分格-" format="$VAL-分格2-$AGG" cont=true span=30m bins=100 startindex=1 endindex=8 limit=5 rendertype="area" count() min(apache.resp_len) by apache.status"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Message" will be visible
    And I will see the message "搜索成功"
    And I click the "OpenChart" button
    And I choose the "200-分格2-min(apache.resp_len)" from the "FiledInput"
    And I click the "Apply" button
    And I click the "AddValue" button
    And I click the "ValueHeader" button
    And I set the parameter "TextArea" with value "tag:"sample04061424_display" | timechart sep="-sep分格-" format="$VAL-分格2-$AGG" cont=true span=30m bins=100 startindex=1 endindex=8 limit=5 rendertype="area" count() min(apache.resp_len) by apache.status"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Message" will be visible
    And I will see the message "搜索成功"
    And I click the "OpenChart" button
    And I choose the "404-分格2-count()" from the "FiledInput"
    And I click the "Apply" button
    And I click the "AddValue" button
    And I click the "ValueHeader" button
    And I set the parameter "TextArea" with value "tag:"sample04061424_display" | timechart sep="-sep分格-" format="$VAL-分格2-$AGG" cont=true span=30m bins=100 startindex=1 endindex=8 limit=5 rendertype="area" count() min(apache.resp_len) by apache.status"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Message" will be visible
    And I will see the message "搜索成功"
    And I click the "OpenChart" button
    And I choose the "404-分格2-min(apache.resp_len)" from the "FiledInput"
    And I click the "Apply" button
    And I click the "Save" button
    And I refresh the website
    And I accept alert window
    And open the "topology.ListPage" page for uri "/topology/"

  Scenario: 查看节点值是否正确
    When I click the detail which name is "插图"
    Then I will see the "topology.DetailPage" page
    And I wait for "AddInputButton" will be visible
    Then I will see the element "ValueList" value contains "28,61,2,1222"
    And open the "topology.ListPage" page for uri "/topology/"

  Scenario Outline: 删除拓扑图
    Given the data name is "<name>" then i click the "删除" button
    And I click the "Ensure" button

    Examples:
      | name |
      | 插图   |
