@trend @acceleration @createAccelerationTask
Feature: 趋势图加速_0创建加速任务

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"

  Scenario Outline: 创建加速任务
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "<date>" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element
    And I wait for "3000" millsecond
    And I wait for "Header" will be visible
    And I click the "NextButton" button under some element
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "加速_时间范围：<period>"
    And I click the "Complete" button under some element
    Then I wait for "SuccessCreate" will be visible
    And I wait for "1500" millsecond
    When I will see the "Accelerate" is clickable
    And I click the "Accelerate" button
    Then I will see the "trend.ListPage" page
    And I switch the "AccelerationSwitch" button to "enable"
    And I choose the "<period>" from the "TimeRange"
    Then I click the "EnsureButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message contains "开启加速成功"

    @trendSmoke @accelerationSmoke
    Examples:
      | name                |  period | date        | spl                                                              |
      | 趋势图_报表(复制)   |  1 月   | Yesterday   | tag:sample04061424_chart \| stats count() by apache.status       |
      | 趋势图_报表(引用)   |  1 月   | Yesterday   | tag:sample04061424_chart \| stats count() by apache.geo.province |
      | 趋势图加速_1天      |  1 天   | OneDay      | * \| bucket timestamp span = 2h as ts \| stats count() by ts     |
      | 趋势图加速_1年      |  1 年   | ThisMonth   | * \| stats count()                                               |

    Examples:
      | name                |  period | date        | spl                                                              |
      | 趋势图_报表(预览)   |  1 月   | Yesterday   | tag:sample04061424_chart \| stats count() by apache.geo.city     |
      | 趋势图_仪表盘(引用) |  1 周   | ThisWeek    | tag:sample04061424_chart \| stats count() by apache.resp_len     |
      | 趋势图加速_3月      |  3 月   | ThisWeek    | * \| stats values(timestamp)                                     |

