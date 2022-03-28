@agent3 @agentConfig
Feature: AgentIP过滤

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    And I zoom the browse to full screen
    And I close all tabs except main tab

  Scenario: Agent过滤
    And I click the "SeniorfilterButton" button
#    And I set the agent parameter "Hostname" with running ip
#    When I set the parameter "Remark" with value "<remark>"
#    When I set the parameter "Version" with value "<version>"
    And I choose the "Server" from the "Type"
    And I click the "EnsureButton" button
    And I wait for "2000" millsecond
#    Then I will see the agent search result contains "0"
    And I will see the element "ListName" name is "192.168.1.253"

#    Examples: 高级搜索过滤单个ip成功
#      | hostName              | remark       | version       |        type   |
#      | 	192-168-1-136     |        68    |    3.1.0.14   | Server        |

  Scenario: Agent模糊搜索IP过滤
    And I wait for "2000" millsecond
#    And I set the agent parameter "IP" with running ip
    And I set the parameter "IP" with value "253"
    And I click the "EnsureButton" button
#    And  I wait for loading invisible
    And I wait for "2000" millsecond
#    Then I will see the agent search result contains "0"
    And I will see the element "ListName" name is "192.168.1.253"

#    Examples: 模糊搜索ip过滤成功
#
#      |      ip          |
#      |      3          |
