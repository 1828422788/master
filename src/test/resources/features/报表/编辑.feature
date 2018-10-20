@report @all @smoke
Feature: 报表编辑

  Background:
    Given open the "report.ListPage" page for uri "/reports/"

  Scenario Outline:
    When the data name is "<dataName>" then i click the "编辑" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "<describe>"
    And I choose the "<runningUser>" from the "RunningUser"
    And I choose the "<reportGroup>" from the "ReportGroup"
    And I choose the "<reportType>" from the "ReportType"
    And I choose the "<email>" from the "Email"
    And I set the parameter "Subject" with value "<subject>"
    And I set the parameter "Hour" with value "<hour>"
    And I set the parameter "Minute" with value "<minute>"
    Then I click the "NextButton" button
    Then I choose the "<chartLists>" from the "ChartList"
    Then I click the "<layout>" button
    Then I click the "Save" button
    Then I will see the success message "<result>"

    Examples: 保存成功
      | dataName    | name        | describe | runningUser | reportGroup | reportType | email               | subject   | hour | minute | chartLists                        | layout  | result |
      | sxjautotest | sxjautotest | autotest | owner       |             | PDF        | 15194315230@163.com | hello sxj | 11   | 30     | bin-zft,bin-zft-spl,bin-zft-local | Layout1 | 保存成功   |
