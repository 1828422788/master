@all @smoke @app @appSmoke
Feature: 应用打开

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"

  Scenario Outline:
    When the data name is "<name>" then i click the "打开" button
    And I will see the "app.AppPage" page
    And I will see the element "FirstSubNav" name is "仪表盘"
    And I will see the element "SecondSubNav" name is "URL校验"
    And I will see the element "ThirdSubNav" name is "<name>"
    And I click the detail which name is "sunxjTest"
    And I will see the element "FirstSubNav" name is "仪表盘"
    And I will see the element "ThirdSubNav" name is "<name>"
    And I click the "SecondSubNav" button
    And switch to another window
    And the page's title will be "拓扑图列表"

    Examples:
      | name     |
      | AutoTest |
