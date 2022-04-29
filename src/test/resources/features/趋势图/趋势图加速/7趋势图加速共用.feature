@trend @acceleration @accelerationShare
Feature: 趋势图加速_7趋势图加速共用

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible

  Scenario Outline: 创建趋势图
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "OneDay" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "3000" millsecond
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "<name>"
    And I click the "Complete" button
    Then I wait for "SuccessCreate" will be visible
    And I wait for "1500" millsecond
    When I will see the "Accelerate" is clickable
    And I click the "Accelerate" button
    Then I will see the "trend.ListPage" page
    And I switch the "AccelerationSwitch" button to "enable"
    And I choose the "1 天" from the "TimeRange"
    Then I click the "EnsureButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message contains "开启加速成功"

  Examples:
    | name               | spl                                            |
    | 趋势图_sample_1    | * \| stats count()                             |
    | 趋势图_sample_2    | * \| stats count() as cnt                      |
    | 趋势图_sample_3    | * \| stats count() \|eval a=1 \|stats count()  |
    | 趋势图_sample_4    | * \| eval a = 1 \|stats count()                |

  Scenario: 验证共用
    And I click the "AccelerationManagement" button
    Then I will see the "trend.AccelerationPage" page
    And I wait for loading invisible
    And I open the acceleration task which contains the "趋势图_sample_1" trend
    And I will see the text "趋势图_sample_1" exist in page
    And I will see the text "趋势图_sample_2" exist in page
    And I will see the text "趋势图_sample_3" exist in page
    And I will see the text "趋势图_sample_4" is not existed in page

  Scenario: 编辑加速任务
    Given open the "trend.ListPage" page for uri "/trend/"
    When I set the parameter "TextFilter" with value "趋势图_sample_2"
    And I wait for loading invisible
    When the data name is "{'column':'0','name':'趋势图_sample_2'}" then i click the "趋势图加速" button in more menu
    And I wait for "AccelerationSwitch" will be visible
    And I choose the "1 周" from the "TimeRange"
    Then I click the "EnsureButton" button
    And I will see the success message contains "编辑加速成功"

  Scenario: 编辑加速以后验证共用
    And I click the "AccelerationManagement" button
    Then I will see the "trend.AccelerationPage" page
    And I wait for loading invisible
    And I open the acceleration task which contains the "趋势图_sample_1" trend
    And I will see the text "趋势图_sample_1" exist in page
    And I will see the text "趋势图_sample_2" is not existed in page
    And I will see the text "趋势图_sample_3" exist in page
    And I will see the text "趋势图_sample_4" is not existed in page

  Scenario Outline: 删除趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When I set the parameter "TextFilter" with value "<name>"
    And I wait for loading invisible
    When the data name is "{'column':'0','name':'<name>'}" then i click the "删除" button in more menu
    Then I will see the message "确认删除 [<name>] ?"
    When I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"

  Examples:
    | name            |
    | 趋势图_sample_1 |
    | 趋势图_sample_2 |
    | 趋势图_sample_3 |
    | 趋势图_sample_4 |