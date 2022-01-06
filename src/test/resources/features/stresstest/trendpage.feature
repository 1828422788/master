@stress
Feature: 压测趋势图

  @stress1
  Scenario Outline: 创建仪表盘所用趋势图
    And open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePageDash" page
    And I set the parameter "SearchInput" with value "<spl>"
    And I wait for "1000" millsecond
    And I click the "DateEditor" button
    And I wait for "Today" will be visible
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    When I click the "NextButton" button
    Given I wait for loading complete
    And I wait for "Header" will be visible
    When I click the "NextButton" button
    Given I wait for loading complete
    When I set the parameter "NameInput" with value "<name>"
    And I click the "Complete" button
    And I wait for "SuccessCreate" will be visible

    Examples:
      | name    | spl                                                            |
      | 压测所用趋势图 | tag: sample04061424_chart \|stats count() by 'apache.geo.city' |