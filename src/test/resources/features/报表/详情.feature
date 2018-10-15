@report @all @smoke
Feature: 报表详情

  Background:
    Given open the "report.ListPage" page for uri "/reports/"

  Scenario Outline:
    Given I click the detail which name is "<name>"
    When I download the file
    Then I delete from "Report" where "{'name':'<name>'}"


    Examples:
      | name     |
      | autotest |

