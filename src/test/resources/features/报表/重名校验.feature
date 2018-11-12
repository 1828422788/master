#@report @all
Feature: 报表重名校验

  Background:
    Given open the "report.ListPage" page for uri "/reports/"

  Scenario Outline:
    When I click the "CreateButton" button
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "<describe>"
    And I choose the "<runningUser>" from the "RunningUser"
    And I choose the "<reportGroup>" from the "ReportGroup"
    And I choose the "<reportType>" from the "ReportType"
    And I choose the "<email>" from the "Email"
    And I set the parameter "Subject" with value "<subject>"
    And I set the parameter "Hour" with value "<hour>"
    And I set the parameter "Minute" with value "<minute>"
    And I click the "NextButton" button
    And I choose the "<chartLists>" from the "ChartList"
    And I click the "<layout>" button
    And I click the "Save" button
    Then I will see the success message "<result>"

    Examples:
      | name     | describe | runningUser | reportGroup    | reportType | email | subject | hour | minute | chartLists | layout  | result |
      | 自动化      |          | owner       | default_Report | WORD       |       | test    | 11   | 30     | rose       | Layout1 | 保存成功   |
      | 11       |          | owner       | default_Report | WORD       |       | test    | 11   | 30     | rose       | Layout1 | 保存成功   |
      | test     |          | owner       | default_Report | WORD       |       | test    | 11   | 30     | rose       | Layout1 | 保存成功   |
      | 1test    |          | owner       | default_Report | WORD       |       | test    | 11   | 30     | rose       | Layout1 | 保存成功   |
      | 1重名      |          | owner       | default_Report | WORD       |       | test    | 11   | 30     | rose       | Layout1 | 保存成功   |
      | test重名   |          | owner       | default_Report | WORD       |       | test    | 11   | 30     | rose       | Layout1 | 保存成功   |
      | test重名11 |          | owner       | default_Report | WORD       |       | test    | 11   | 30     | rose       | Layout1 | 保存成功   |

  Scenario:
#    Given I delete from "Report" where "{'name':['自动化','11','test','1test','1重名','test重名','test重名11']}"

