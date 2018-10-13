@alert @all @smoke
Feature: 监控搜索

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"

  Scenario Outline:
    When I set the parameter "SearchInputElement" with value "<searchInput>"
    Then I will see the search result "{'column':'0','name':'<searchInput>'}"

    Examples:
      | searchInput |
      | AutoTest    |

  Scenario Outline:
    Given search from "{'DropdownMenu':'<group>'}" then I will see the result contains "{'column':'0','name':'<name>'}"

    Examples:
      | group         | name     |
      | default_Alert | AutoTest |