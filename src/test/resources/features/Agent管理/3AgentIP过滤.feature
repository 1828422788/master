
Feature: AgentIP过滤

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    And I close all tabs except main tab

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



#  @indexSettingSmoke
    Examples: 高级搜索过滤单个ip成功
      | hostName              | remark       | version       |        type   |
      | 	192-168-1-136     |        68    |    3.1.0.14   | Server        |
      | 	136               |              |               | Server        |
      |                       |       68     |               |               |
      | 	136               |              |               | all           |

  Scenario Outline: Agent模糊搜索IP过滤
    When I set the parameter "IP" with value "<ip>"
    And  I wait for loading invisible
    Then I will see the search result "{'column':'1','name':'192.168.1.136'}"
    And I close all windows





    Examples: 模糊搜索ip过滤成功

      |      ip          |
      |      36          |
      |     136          |
      |   192.168.1.136  |