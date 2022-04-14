@manager
Feature: manager agent相关

  Background:
    Given I will see the "manager.ListPage" page
    And I click the "Tools" button
    And I click the "CommandTool" button
    Then I click the "Supervisord" button

  Scenario: RZY-2841:命令行工具_Supervisord
    When I click the "GenerateCmd" button
    Then I will see the input element "GeneratedCmd" value will contains "/opt/rizhiyi/tools/ctl.sh status"
    And I click the "Run" button
    And I wait for "CmdStatus" will be visible
    Then I will see the element "CmdDetail" contains "RUNNING"

  Scenario: RZY-2842:命令行工具_Supervisord_指定进程管理
    When I click the "StopProcess" button
    And I set the parameter "ProcessName" with value "1007-zookeeper"
    When I click the "GenerateCmd" button
    Then I will see the input element "GeneratedCmd" value will contains "/opt/rizhiyi/tools/ctl.sh stop 1007-zookeeper"