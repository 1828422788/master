@all @trend
Feature: 趋势图_搜索页

  Scenario Outline: trend_message_error
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "* | stats count()"
    And I click the "DateEditor" button under some element
    And I click the "<timePeriod>" button
    And I click the "SearchButton" button under some element
    And I wait for "SaveAsOther" will be visible
    Then I click the "SaveAsOther" button
    Then I click the "Trend" button
    And I wait for "TaskName" will be visible
    When I set the parameter "TaskName" with value "<name>"
    And I click the "EnsureButton" button
    And I wait for "TimeTaskEnsure" will be visible
    Then I will see the success message "<message>"

    Examples:
      | timePeriod    | name | message           |
      | Today         |      | 请填写名称！            |
      | ThirtySeconds | test | 实时窗口搜索模式无法进行该操作!|