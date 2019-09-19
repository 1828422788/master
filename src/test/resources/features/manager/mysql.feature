@manager
Feature: manager mysql工具

  Background:
    Given I will see the "manager.ListPage" page
    And I click the "Tools" button under some element

  Scenario:
    When I click the "MysqlTool" button under some element
    And I set the parameter "SqlInput" with value "show databases"
    And I click the "Run" button
    Then I will see the element "Detail" contains "rizhiyi_manager"