@agent
Feature: AgentIP过滤

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    And I close all tabs except main tab

  Scenario Outline: Agent过滤
    And I click the "SeniorfilterButton" button
#    And I set the agent parameter "Hostname" with running ip
#    When I set the parameter "Remark" with value "<remark>"
#    When I set the parameter "Version" with value "<version>"
    And I choose the "<type>" from the "Type"
    And I click the "EnsureButton" button
    Then I will see the agent search result contains "0"

    Examples: 高级搜索过滤单个ip成功
      | hostName              | remark       | version       |        type   |
      | 	192-168-1-136     |        68    |    3.1.0.14   | Server        |

  Scenario Outline: Agent模糊搜索IP过滤
    And I set the agent parameter "IP" with running ip
    And  I wait for loading invisible
    Then I will see the agent search result contains "0"

    Examples: 模糊搜索ip过滤成功

      |      ip          |
      |      3          |
