@manager
Feature: manager mysql工具

  Background:
    Given I will see the "manager.ListPage" page
    And I click the "Tools" button

  Scenario:
    When I click the "MysqlTool" button
    And I set the parameter "SqlInput" with value "show databases"
    And I click the "Run" button
    And I wait for "CmdStatus" will be visible
    Then I will see the element "Detail" contains "rizhiyi_manager"