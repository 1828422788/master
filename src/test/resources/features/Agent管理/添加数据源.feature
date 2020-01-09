Feature: 操作

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible

  Scenario Outline: Agent过滤
    And I click the "SeniorfilterButton" button
    And I set the parameter "Hostname" with value "<hostName>"
    When I set the parameter "Remark" with value "<remark>"
    When I set the parameter "Version" with value "<version>"
    And I choose the "<type>" from the "Type"
    And I click the "EnsureButton" button
    And I wait for loading invisible
    Then I will see the search result "{'column':'1','name':'192.168.1.136'}"
    And I wait for loading invisible
    And I click the "SeniorfilterButton" button
    And I click the "ResetButton" button
    And I click the "EnsureButton" button
    And I wait for loading invisible
    Then I will see the search result contains "{'column':'1','name':'192.168.1.4'}"

    Examples: 高级搜索过滤单个ip成功
      | hostName              | remark       | version       |        type   |
      | 	192-168-1-136     |        68    |    3.1.0.14   | Server        |

