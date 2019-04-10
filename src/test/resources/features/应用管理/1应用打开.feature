@all @smoke @app @appSmoke
Feature: 应用打开

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AutoTestAppWithAllResources" then i click the "打开" button
    And I will see the "app.AppPage" page

  Scenario Outline: 验证全部资源下拉框是否正确
    Given I click the "<rightArrow>" button
    And I click the "<menu>" button
    Then I will see the "knowledge.ListPage" page
    When I click the "ArrowDown" button
    And I wait for "GroupMenu" will be visible
    And I wait for loading invisible
    And I click the "Setting" button
    And the page's title will be "资源分组"
    Then I will see the element "Title" name is "AutoTest...pWithAllResources"

    Examples:
      | rightArrow | menu        |
      | RightArrow | Knowledge   |
      |            | Alert       |
      |            | Report      |
      |            | Topology    |
      |            | TimedTask   |
      |            | Trend       |
      |            | SearchMacro |
      |            | Config      |
      |            | Source      |
      | RightArrow | Agent       |

  Scenario Outline: 验证资源筛选是否正确
    Given I click the "<rightArrow>" button
    And I click the "<menu>" button
    Then I will see the "knowledge.ListPage" page
    When I click the "ArrowDown" button
    And I set the parameter "SearchGroup" with value "default"
    And I wait for "NoMatch" will be visible

    Examples:
      | rightArrow | menu        |
      | RightArrow | Knowledge   |
      |            | Alert       |
      |            | Report      |
      |            | Topology    |
      |            | TimedTask   |
      |            | Trend       |
      |            | SearchMacro |
      |            | Config      |
      |            | Source      |