@logDisplay
Feature: 普通统计视图

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"

  Scenario Outline: 事件计数统计sample（RZY-807至810）
    When I set the parameter "SearchInput" with value "tag:sample04061424_display"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I will see the "splSearch.StatisticalPage" page
    And I choose the "<chart>" from the "PresentType"
    And I choose the "<value1>" from the "FieldValue"
    And I click the "AddButton" button
    And I choose the "<value2>" from the "FieldValue"
    And I click the "AddButton" button
    And I wait for loading invisible
    Then take a screenshot with name "<caseNum>：日志展现-普通统计视图-<chart>sample"

    Examples:
      | chart | value1                | value2              | caseNum |
      | 曲线图   | logtype               | apache.clientip     | 807     |
      | 面积图   | apache.geo.city       | tag                 | 808     |
      | 散点图   | apache.referer_domain | apache.resp_len     | 809     |
      | 柱状图   | apache.x_forward      | apache.geo.latitude | 810     |

  Scenario Outline: 时间分段（RZY-812、813、2721、2722、2723、2724）
    When I set the parameter "SearchInput" with value "tag:sample04061424_display"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I will see the "splSearch.StatisticalPage" page
    Given I click the "TimeSlice" button
    Then I choose the "<fieldValue>" from the "FieldValue"
    Then I choose the "<statisticType>" from the "StatisticType"
    And I set the parameter "StartTime" with value "<startTime>"
    Then I click the "EnsureButton" button
    And I set the parameter "EndTime" with value "<endTime>"
    Then I click the "EnsureButton" button
    Then I click the "GenerateTime" button under some element
    Then I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    Then take a screenshot with name "<screenName>"

    Examples:
      | fieldValue           | statisticType | startTime           | endTime             | screenName         |
      | apache.request_query |               | 2019-02-01 00:00:00 | 2019-02-01 23:59:59 | 812：日志展现-时间分段-计数   |
      | apache.request_query | 独立数           | 2019-02-01 00:00:00 | 2019-02-01 23:59:59 | 813：日志展现-时间分段-独立数  |
      | apache.resp_len      | 总计            | 2019-02-01 00:00:00 | 2019-02-01 23:59:59 | 2721：日志展现-时间分段-总计  |
      | apache.resp_len      | 平均值           | 2019-02-01 00:00:00 | 2019-02-01 23:59:59 | 2722：日志展现-时间分段-平均值 |
      | apache.resp_len      | 最大值           | 2019-02-01 00:00:00 | 2019-02-01 23:59:59 | 2723：日志展现-时间分段-最大值 |
      | apache.resp_len      | 最小值           | 2019-02-01 00:00:00 | 2019-02-01 23:59:59 | 2724：日志展现-时间分段-最小值 |

  Scenario: 数值分段（RZY-814）
    When I set the parameter "SearchInput" with value "tag:sample04061424*"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I will see the "splSearch.StatisticalPage" page
    Given I click the "DataSlice" button
    When I choose the "apache.resp_len" from the "FieldValue"
    And I set the parameter "StartDataValue" with value "1"
    And I set the parameter "EndDataValue" with value "100"
    And I click the "AddNum" button
    And I set the parameter "StartDataValue" with value "100"
    And I set the parameter "EndDataValue" with value "500"
    And I click the "AddNum" button
    And I set the parameter "StartDataValue" with value "500"
    And I set the parameter "EndDataValue" with value "1000"
    And I click the "Generate" button
    Then I wait for "Loading" will be invisible
    Then take a screenshot with name "814：日志展现-普通统计视图-数值分段"

  Scenario Outline: 时间直方图（RZY-815）
    When I set the parameter "SearchInput" with value "tag:sample04061424*"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I will see the "splSearch.StatisticalPage" page
    Given I click the "TimeHistogram" button
    Then I set the parameter "TimeSpan" with value "<timeSpan>"
    And I choose the "<time>" from the "Time"
    Then I click the "Generate" button
    Then I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    Then take a screenshot with name "<screenName>"

    Examples:
      | timeSpan | time | screenName          |
      | 1        |      | 815：日志展现-时间间隔1h     |
      | 3600     | 秒    | 815：日志展现-时间间隔3600s  |
      | 60       | 分钟   | 815：日志展现-时间间隔60min  |
      | 1        | 天    | 2725：日志展现-时间间隔1d    |
      | 1        | 周    | 2725：日志展现-时间间隔1week |

  Scenario Outline: 生成数值直方图（RZY-816）
    When I set the parameter "SearchInput" with value "tag:sample04061424*"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    And I will see the "splSearch.StatisticalPage" page
    Given I click the "DataHistogram" button
    When I choose the "<fieldValue>" from the "FieldValue"
    And I set the parameter "DataSpan" with value "<number>"
    Then I click the "Generate" button
    Then I wait for "Loading" will be invisible
    Then take a screenshot with name "816：日志展现-普通统计视图-数值直方图"

    Examples:
      | fieldValue    | number |
      | json.duration | 200    |