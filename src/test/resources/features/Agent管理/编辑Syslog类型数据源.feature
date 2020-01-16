Feature: 添加数据源

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    When I click the detail which column is "1" in agent page
    And switch to another window
    And I will see the "agent.CreatePage" page

  Scenario: Syslog配置修改可执行文件
    And I click the "EditAutoScript" button
    And I set the parameter "ExcuteFile" with value "hekad\.stderr"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"