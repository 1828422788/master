@clean @userGroups
Feature: 用户分组清理

  Background:
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"

  Scenario Outline:
    Given the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I click the "MessageBoxOKButton" button

    Examples:
      | name            |
      | AutoTestForUser |

  @cleanUserGroups
  Scenario Outline: 根据配置项清理
    Given the data properties is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I click the "MessageBoxOKButton" button

    Examples:
      | name               |
      | group              |
      | groupWithResources |