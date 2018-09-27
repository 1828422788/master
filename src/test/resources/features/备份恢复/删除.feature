@backup @all
Feature: 删除appName

  Background:
    Given open the "backup.ListPage" page for uri "/backup/"

  Scenario Outline:
    Given the data name "<name>" in table "AppNameTable" then i click the "删除" button
    When I click the "EnsureButton" button
    And I will see the success message "删除成功"

    Examples:
      | name |
      | iis  |