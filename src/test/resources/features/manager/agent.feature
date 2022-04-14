@manager
Feature: manager agent相关

  Background:
    Given I will see the "manager.ListPage" page
    And I click the "Tools" button
    And I click the "CommandTool" button
    Then I click the "Manager" button

  Scenario: RZY-2837:命令行工具_manager_重启Agent
    When I click the "GenerateCmd" button
    Then I will see the input element "GeneratedCmd" value will contains "service rizhiyi_manager_agent restart"

  Scenario: RZY-2838:命令行工具_manager_停止Agent
    When I click the "StopAgent" button
    When I click the "GenerateCmd" button
    Then I will see the input element "GeneratedCmd" value will contains "service rizhiyi_manager_agent stop"

  Scenario: RZY-2839:命令行工具_manager_停止Supervisor
    When I click the "StopSupervisor" button
    When I click the "GenerateCmd" button
    Then I will see the input element "GeneratedCmd" value will contains "killall -9 supervisord"

  Scenario: RZY-2840:命令行工具_manager_执行通用命令(同步)
    When I click the "ExecuteCommand" button
    And I set the parameter "CmdInput" with value "cd /opt/rizhiyi"
    When I click the "GenerateCmd" button
    Then I will see the input element "GeneratedCmd" value will contains "cd /opt/rizhiyi"