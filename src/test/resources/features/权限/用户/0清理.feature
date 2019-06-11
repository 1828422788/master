@clean @cleanUser
Feature: 用户清理

  Background:
    Given open the "users.ListPage" page for uri "/account/users/"

  Scenario Outline:
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I click the "EnsureButton" button

    Examples:
      | name                   |
      | AutoTestAllResource    |
      | AutoTest               |
