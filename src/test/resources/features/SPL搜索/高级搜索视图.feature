@spl @all
Feature: 高级搜索视图

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    When I set the parameter "SearchInput" with value "starttime="-3d/d" endtime="now" tag:"sample04061424" | top 50 apache.resp_len"
    And I click the "DateEditor" button
    And I click the "ThisMonth" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "splSearch.StatisticalPage" page

  @splSmoke
  Scenario: 设置表格颜色（第一列为梯度、第二列为范围、第三列为值）
    Given I click the "FirstEditColourButton" button
    When I choose the "梯度" from the "ColourDropdown"
    And I click the "SaveButton" button
    And I click the "SecondEditColourButton" button
    And I choose the "范围" from the "ColourDropdown"
    And I click the "SaveButton" button
    And I click the "ThirdEditColourButton" button
    And I choose the "值" from the "ColourDropdown"
    And I click the "SaveButton" button
    Then take a screenshot

  Scenario Outline: 设置表格颜色失败（梯度）
    Given I click the "FirstEditColourButton" button
    When I choose the "梯度" from the "ColourDropdown"
    And I set the parameter "LowerLimit" with value "<lowerLimit>"
    And I set the parameter "MiddleLimit" with value "<middleLimit>"
    And I set the parameter "TopLimit" with value "<topLimit>"
    And I click the "SaveButton" button
    Then I will see the error message "<message>"

    Examples:
      | lowerLimit | middleLimit | topLimit | message    |
      | 200        | 100         | 50       | 请填写正确数值内容！ |







