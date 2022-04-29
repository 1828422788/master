@trend @acceleration @notAccelerated
Feature: 趋势图加速_1无法加速的趋势图

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"

  Scenario: 无法加速的趋势图_最后的一步
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "tag:sample04061424 | table *"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "3000" millsecond
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "无法加速的趋势图"
    And I click the "Complete" button
    Then I wait for "SuccessCreate" will be visible
    And I wait for "1000" millsecond
    Then I will see the element "Accelerate" attribute "class" is "yotta-button-disabled"
    Then I will see the "trend.ListPage" page
    And I move the mouse pointer to the "InfoIcon"
    And I will see the element "Tooltip" contains "当前趋势图无法加速"

  @trendSmoke @accelerationSmoke
  Scenario: 修改趋势图的spl
    When I set the parameter "TextFilter" with value "趋势图加速_1年"
    And I wait for loading invisible
    When the data name is "趋势图加速_1年" then i click the "编辑" button
    And I will see the "trend.CreatePage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "tag:sample04061424 | table *"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "3000" millsecond
    And I wait for "Header" will be visible
    When I click the "NextButton" button
    And I wait for "Prompt" will be visible
    Then I will see the element "Prompt" contains "此趋势图语句改动后将无法加速"
    And I click the "EnsureButton" button
    When I click the "Complete" button
    Then I wait for "SuccessUpdate" will be visible
    And I wait for "1000" millsecond
    Then I will see the element "Accelerate" attribute "class" is "yotta-button-disabled"
    Then I will see the "trend.ListPage" page
    And I move the mouse pointer to the "InfoIcon"
    And I will see the element "Tooltip" contains "当前趋势图无法加速"

  Scenario: 验证提示显示无法加速
    When I set the parameter "TextFilter" with value "趋势图加速_1年"
    And I wait for loading invisible
    When the data name is "趋势图加速_1年" then i click the "趋势图加速" button in more menu
    Then I will see the text "当前趋势图无法加速" exist in page