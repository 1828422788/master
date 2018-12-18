@report @all @smoke @reportSmoke
Feature: 报表详情（RZY-135）

  Background:
    Given open the "report.ListPage" page for uri "/reports/"

  Scenario Outline:
    Given I click the report detail which name is "<name>"
    Then I download the file

    Examples:
      | name     |
      | autotest |

