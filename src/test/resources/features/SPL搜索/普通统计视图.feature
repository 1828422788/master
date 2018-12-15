@spl @all
Feature: 普通统计视图（有截图）

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    When I set the parameter "SearchInput" with value "*"
    And I click the "DateEditor" button
    And I click the "ThisMonth" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    And I click the "CountButton" button
    Then I will see the "splSearch.StatisticalPage" page

  Scenario: 事件计数(添加失败)
    Then I click the "AddButton" button
    Then I will see the error message "请选择统计字段"

  @smoke @splSmoke
  Scenario Outline: 事件计数
    Given I choose the "<presentType>" from the "PresentType"
    Then I choose the "<fieldValue>" from the "FieldValue"
    Then I click the "AddButton" button
    Then I choose the "<fieldValue1>" from the "FieldValue"
    Then I click the "AddButton" button
    Then I choose the "<fieldValue2>" from the "FieldValue"
    Then I click the "AddButton" button
    Then I choose the "<fieldValue3>" from the "FieldValue"
    Then I click the "AddButton" button
    Then I choose the "<fieldValue4>" from the "FieldValue"
    Then I click the "AddButton" button
    Then I choose the "<fieldValue5>" from the "FieldValue"
    Then I click the "AddButton" button
    Then I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    Then take a screenshot

    Examples: 曲线图下的各字段展示图表
      | presentType | fieldValue | fieldValue1 | fieldValue2 | fieldValue3 | fieldValue4 | fieldValue5 |
      |             | tag        |             |             |             |             |             |
      |             | tag        | appname     |             |             |             |             |
      |             | tag        | appname     | logtype     |             |             |             |
      |             | tag        | appname     | logtype     | hostname    |             |             |
      |             | tag        | appname     | logtype     | hostname    | ip          |             |
      |             | tag        | appname     | logtype     | hostname    | ip          | source      |

    Examples: 面积图下的各字段展示图表
      | presentType | fieldValue | fieldValue1 | fieldValue2 | fieldValue3 | fieldValue4 | fieldValue5 |
      | 面积图         | tag        |             |             |             |             |             |
      | 面积图         | tag        | appname     |             |             |             |             |
      | 面积图         | tag        | appname     | logtype     |             |             |             |
      | 面积图         | tag        | appname     | logtype     | hostname    |             |             |
      | 面积图         | tag        | appname     | logtype     | hostname    | ip          |             |
      | 面积图         | tag        | appname     | logtype     | hostname    | ip          | source      |

    Examples: 散点图下的各字段展示图表
      | presentType | fieldValue | fieldValue1 | fieldValue2 | fieldValue3 | fieldValue4 | fieldValue5 |
      | 散点图         | tag        |             |             |             |             |             |
      | 散点图         | tag        | appname     |             |             |             |             |
      | 散点图         | tag        | appname     | logtype     |             |             |             |
      | 散点图         | tag        | appname     | logtype     | hostname    |             |             |
      | 散点图         | tag        | appname     | logtype     | hostname    | ip          |             |
      | 散点图         | tag        | appname     | logtype     | hostname    | ip          | source      |

    Examples: 柱状图下的各字段展示图表
      | presentType | fieldValue | fieldValue1 | fieldValue2 | fieldValue3 | fieldValue4 | fieldValue5 |
      | 柱状图         | tag        |             |             |             |             |             |
      | 柱状图         | tag        | appname     |             |             |             |             |
      | 柱状图         | tag        | appname     | logtype     |             |             |             |
      | 柱状图         | tag        | appname     | logtype     | hostname    |             |             |
      | 柱状图         | tag        | appname     | logtype     | hostname    | ip          |             |
      | 柱状图         | tag        | appname     | logtype     | hostname    | ip          | source      |

  @smoke @splSmoke
  Scenario Outline: 事件计数(勾选独立数统计)
    Given I choose the "<presentType>" from the "PresentType"
    Then I choose the "<fieldValue>" from the "FieldValue"
    And I click the "EventCheckBox" button
    Then I click the "AddButton" button
    Then I choose the "<fieldValue1>" from the "FieldValue"
    Then I click the "AddButton" button
    Then I choose the "<fieldValue2>" from the "FieldValue"
    Then I click the "AddButton" button
    Then I choose the "<fieldValue3>" from the "FieldValue"
    Then I click the "AddButton" button
    Then I choose the "<fieldValue4>" from the "FieldValue"
    Then I click the "AddButton" button
    Then I choose the "<fieldValue5>" from the "FieldValue"
    Then I click the "AddButton" button
    Then I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    Then take a screenshot

    Examples: 曲线图下的各字段展示图表
      | presentType | fieldValue | fieldValue1 | fieldValue2 | fieldValue3 | fieldValue4 | fieldValue5 |
      |             | tag        |             |             |             |             |             |
      |             | tag        | appname     |             |             |             |             |
      |             | tag        | appname     | logtype     |             |             |             |
      |             | tag        | appname     | logtype     | hostname    |             |             |
      |             | tag        | appname     | logtype     | hostname    | ip          |             |
      |             | tag        | appname     | logtype     | hostname    | ip          | source      |

    Examples: 面积图下的各字段展示图表
      | presentType | fieldValue | fieldValue1 | fieldValue2 | fieldValue3 | fieldValue4 | fieldValue5 |
      | 面积图         | tag        |             |             |             |             |             |
      | 面积图         | tag        | appname     |             |             |             |             |
      | 面积图         | tag        | appname     | logtype     |             |             |             |
      | 面积图         | tag        | appname     | logtype     | hostname    |             |             |
      | 面积图         | tag        | appname     | logtype     | hostname    | ip          |             |
      | 面积图         | tag        | appname     | logtype     | hostname    | ip          | source      |

    Examples: 散点图下的各字段展示图表
      | presentType | fieldValue | fieldValue1 | fieldValue2 | fieldValue3 | fieldValue4 | fieldValue5 |
      | 散点图         | tag        |             |             |             |             |             |
      | 散点图         | tag        | appname     |             |             |             |             |
      | 散点图         | tag        | appname     | logtype     |             |             |             |
      | 散点图         | tag        | appname     | logtype     | hostname    |             |             |
      | 散点图         | tag        | appname     | logtype     | hostname    | ip          |             |
      | 散点图         | tag        | appname     | logtype     | hostname    | ip          | source      |

    Examples: 柱状图下的各字段展示图表
      | presentType | fieldValue | fieldValue1 | fieldValue2 | fieldValue3 | fieldValue4 | fieldValue5 |
      | 柱状图         | tag        |             |             |             |             |             |
      | 柱状图         | tag        | appname     |             |             |             |             |
      | 柱状图         | tag        | appname     | logtype     |             |             |             |
      | 柱状图         | tag        | appname     | logtype     | hostname    |             |             |
      | 柱状图         | tag        | appname     | logtype     | hostname    | ip          |             |
      | 柱状图         | tag        | appname     | logtype     | hostname    | ip          | source      |

  @smoke @splSmoke
  Scenario Outline: 时间分段
    Given I click the "TimeSlice" button
    Then I choose the "<fieldValue>" from the "FieldValue"
    Then I choose the "<statisticType>" from the "StatisticType"
    And I set the parameter "StartTime" with value "<startTime>"
    Then I click the "EnsureButton" button
    Then I click the "CurrentTime" button
    Then I click the "GenerateTime" button
    Then I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    Then take a screenshot

    Examples:
      | fieldValue | statisticType | startTime  |
      | tag        |               | 2018-01-01 |
      | tag        | 独立数           | 2018-01-01 |

  Scenario Outline: 时间分段生成失败
    Given I click the "TimeSlice" button
    When I choose the "<fieldValue>" from the "FieldValue"
    And I set the parameter "StartTime" with value "<startTime>"
    And I click the "EnsureButton" button
    And I click the "Generate" button
    Then I will see the error message "<message>"

    Examples:
      | fieldValue | startTime  | message    |
      |            |            | 请选择统计字段    |
      | tag        |            | 请正确填写时间分段! |
      | tag        | 2018-01-01 | 请正确填写时间分段! |

  Scenario Outline: 数值分段生成失败
    Given I click the "DataSlice" button
    When I choose the "<fieldValue>" from the "FieldValue"
    And I set the parameter "StartDataValue" with value "<startValue>"
    And I click the "Generate" button
    Then I will see the error message "<message>"

    Examples:
      | fieldValue    | startValue | message     |
      |               |            | 请选择统计字段     |
      | json.duration |            | 请填写合理的数值分段！ |
      | json.duration | 1          | 请填写合理的数值分段！ |

  @smoke @splSmoke
  Scenario Outline: 数值分段
    Given I click the "DataSlice" button
    When I choose the "<fieldValue>" from the "FieldValue"
    And I set the parameter "StartDataValue" with value "<startValue>"
    And I set the parameter "EndDataValue" with value "<endValue>"
    And I click the "Generate" button
    And I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    Then take a screenshot

    Examples:
      | fieldValue    | startValue | endValue |
      | json.duration | 1          | 2000     |

  Scenario Outline: 时间直方图生成失败
    Given I click the "TimeHistogram" button
    Then I set the parameter "TimeSpan" with value "<timeSpan>"
    Then I click the "Generate" button
    Then I will see the error message "<message>"

    Examples:
      | timeSpan | message     |
      |          | 请填写合理的时间间隔！ |
      | 0        | 请填写合理的时间间隔！ |
      | -1       | 请输入正整数      |
      | 0.5      | 请输入正整数      |

  @smoke @splSmoke
  Scenario Outline: 时间直方图
    Given I click the "TimeHistogram" button
    Then I set the parameter "TimeSpan" with value "<timeSpan>"
    And I choose the "<time>" from the "Time"
    Then I click the "Generate" button
    Then I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    Then take a screenshot

    Examples:
      | timeSpan | time |
      | 12       |      |
      | 2000     | 秒    |
      | 120      | 分钟   |
      | 1        | 天    |
      | 1        | 周    |

  Scenario Outline: 生成数值直方图失败
    Given I click the "DataHistogram" button
    Then I choose the "<fieldValue>" from the "FieldValue"
    Then I set the parameter "DataSpan" with value "<number>"
    Then I click the "Generate" button
    Then I will see the error message "<message>"

    Examples:
      | fieldValue    | number | message     |
      |               |        | 请选择统计字段     |
      | json.duration |        | 请填写合理的数值间隔！ |
      | json.duration | 0      | 请填写合理的数值间隔！ |
      | json.duration | -1     | 请输入正整数      |
      | json.duration | 0.5    | 请输入正整数      |

  @smoke @splSmoke
  Scenario Outline: 生成数值直方图
    Given I click the "DataHistogram" button
    When I choose the "<fieldValue>" from the "FieldValue"
    And I set the parameter "DataSpan" with value "<number>"
    Then I click the "Generate" button
    Then I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    Then take a screenshot

    Examples:
      | fieldValue    | number |
      | json.duration | 200    |

  Scenario Outline: 生成字段值分类失败
    Given I click the "ClassifyFieldValue" button
    When I click the "Generate" button
    Then I will see the error message "<message>"

    Examples:
      | message |
      | 请选择统计字段 |

  @smoke @splSmoke
  Scenario Outline: 生成字段值分类
    Given I click the "ClassifyFieldValue" button
    When I choose the "<fieldValue>" from the "FieldValue"
    And I choose the "<presentType>" from the "PresentType"
    And I choose the "<topElement>" from the "TopElement"
    And I click the "Generate" button
    And I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    Then take a screenshot

    Examples:
      | fieldValue | presentType | topElement |
      | tag        |             |            |
      | tag        |             | 10         |
      | tag        |             | 20         |
      | tag        |             | 50         |
      | tag        | 条形图         |            |
      | tag        | 条形图         | 10         |
      | tag        | 条形图         | 20         |
      | tag        | 条形图         | 50         |

  Scenario Outline: 生成字段数值失败
    Given I click the "FieldNumber" button
    When I choose the "<yAxis>" from the "YAxis"
    And I choose the "<groupField>" from the "GroupField"
    And I set the parameter "TopNumber" with value "<number>"
    And I set the parameter "TimeBucket" with value "<timeBucket>"
    And I click the "Generate" button
    Then I will see the error message "<message>"

    Examples:
      | yAxis           | groupField      | number | timeBucket | message     |
      |                 |                 | 1      |            | 请选择Y轴字段！    |
      | apache.resp_len |                 | 1      |            | 请选择分组字段！    |
      | apache.resp_len | apache.clientip | 1      |            | 请输入时间桶!     |
      | apache.resp_len | apache.clientip | 1      | 0          | 请输入时间桶!     |
      | apache.resp_len | apache.clientip | 1      | -1         | 请输入正整数      |
      | apache.resp_len | apache.clientip | 1      | 0.5        | 请输入正整数      |
      | apache.resp_len | apache.clientip | 0      | 1          | 请正确填写分组字段值! |
      | apache.resp_len | apache.clientip | -1     | 1          | 请正确填写分组字段值! |
      | apache.resp_len | apache.clientip | 0.5    | 1          | 请正确填写分组字段值! |

  @smoke @splSmoke
  Scenario Outline: 生成字段数值
    Given I click the "FieldNumber" button
    When I choose the "<yAxis>" from the "YAxis"
    And I choose the "<groupField>" from the "GroupField"
    And I set the parameter "TopNumber" with value "<number>"
    And I choose the "<statisticType>" from the "StatisticType"
    And I choose the "<presentType>" from the "PresentType"
    And I set the parameter "TimeBucket" with value "<timeBucket>"
    And I choose the "<timeSpan>" from the "TimeBucketDropdownButton"
    And I click the "Generate" button
    And I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    Then take a screenshot

    Examples:
      | yAxis           | groupField      | number | statisticType | presentType | timeBucket | timeSpan |
      | apache.resp_len | apache.clientip | 5      |               |             | 1          |          |
      | apache.resp_len | apache.clientip | 10     |               | 面积图         | 30         | 分钟       |
      | apache.resp_len | apache.clientip | 15     |               | 散点图         | 1200       | 秒        |
      | apache.resp_len | apache.clientip | 5      |               | 柱状图         | 30         | 分钟       |
      | apache.resp_len | apache.clientip | 5      | 平均值           |             | 1          | 天        |
      | apache.resp_len | apache.clientip | 5      | 平均值           | 柱状图         | 1          | 天        |
      | apache.resp_len | apache.clientip | 5      | 平均值           | 散点图         | 1          | 周        |
      | apache.resp_len | apache.clientip | 5      | 平均值           | 面积图         | 1          | 周        |
      | apache.resp_len | apache.clientip | 5      | 最大值           |             | 1          | 天        |
      | apache.resp_len | apache.clientip | 5      | 最大值           | 柱状图         | 1          | 天        |
      | apache.resp_len | apache.clientip | 5      | 最大值           | 散点图         | 1          | 周        |
      | apache.resp_len | apache.clientip | 5      | 最大值           | 面积图         | 1          | 周        |
      | apache.resp_len | apache.clientip | 5      | 最小值           |             | 1          | 天        |
      | apache.resp_len | apache.clientip | 5      | 最小值           | 柱状图         | 1          | 天        |

  @smoke @splSmoke
  Scenario Outline: 生成字段数值
    Given I click the "FieldNumber" button
    When I choose the "<yAxis>" from the "YAxis"
    And I choose the "<groupField>" from the "GroupField"
    And I click the "<radio>" button
    And I choose the "<optional>" from the "SelfOptional"
    And I choose the "<statisticType>" from the "StatisticType"
    And I choose the "<presentType>" from the "PresentType"
    And I set the parameter "TimeBucket" with value "<timeBucket>"
    And I choose the "<timeSpan>" from the "TimeBucketDropdownButton"
    And I click the "Generate" button
    And I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    Then take a screenshot

    Examples:
      | yAxis           | groupField      | radio     | optional                    | statisticType | presentType | timeBucket | timeSpan |
      | apache.resp_len | apache.clientip | selfRadio | 222.128.29.229,27.154.61.18 | 最小值           | 散点图         | 1          | 周        |
      | apache.resp_len | apache.clientip | selfRadio | 222.128.29.229              | 最小值           | 面积图         | 1          | 周        |

  Scenario: 生成累计百分比失败
    Given I click the "TotalPercent" button
    When I click the "Generate" button
    Then I will see the error message "请选择统计字段"

  Scenario Outline: 生成累计百分比失败
    Given I click the "TotalPercent" button
    When I choose the "<fieldValue>" from the "FieldValue"
    And I set the parameter "AddPercent" with value "<percent>"
    When I click the "Generate" button
    Then I will see the error message "<message>"

    Examples:
      | fieldValue    | percent | message            |
      | json.duration | 0       | 请输入正确的数值(0<数值<100) |
      | json.duration | -1      | 请输入正确的数值(0<数值<100) |

  @smoke @splSmoke
  Scenario Outline: 生成累计百分比
    Given I click the "TotalPercent" button
    When I choose the "<fieldValue>" from the "FieldValue"
    And I set the parameter "AddPercent" with value "<percent>"
    When I click the "Generate" button
    And I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    Then take a screenshot

    Examples:
      | fieldValue                              | percent |
      | json.duration,json.execTime             |         |
      | json.duration,json.execTime,json.copies | 20      |

  Scenario Outline: 生成百分位等级失败
    Given I click the "PercentDegree" button
    When I choose the "<fieldValue>" from the "FieldValue"
    And I set the parameter "GoalValue" with value "<goalValue>"
    When I click the "Generate" button
    Then I will see the error message "<message>"

    Examples:
      | fieldValue    | goalValue | message   |
      |               |           | 请选择统计字段   |
      | apache.status |           | 请输入目标值。   |
      | apache.status | test      | 请填写合理的数值！ |

  @smoke @splSmoke
  Scenario Outline: 生成百分位等级成功
    Given I click the "PercentDegree" button
    When I choose the "<fieldValue>" from the "FieldValue"
    And I set the parameter "GoalValue" with value "<goalValue>"
    And I click the "Generate" button
    And I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    Then take a screenshot

    Examples:
      | fieldValue    | goalValue |
      | apache.status | 200       |

  Scenario: 生成多级统计失败
    Given I click the "MultilevelStatistics" button
    When I click the "Generate" button
    Then I will see the error message "请选择统计字段"

  @smoke @splSmoke
  Scenario Outline: 生成多级统计成功(统计图)
    Given I click the "MultilevelStatistics" button
    When I choose the "<fieldValue>" from the "FieldValue"
    And I choose the "<topElement>" from the "TopElement"
    And I click the "Generate" button
    And I wait for "Loading" will be invisible
    And I click the "StatisticsGram" button
    And I choose the "<presentType>" from the "PresentType"
    And I set the parameter "TimeBucket" with value "<timeBucket>"
    And I choose the "<timeOption>" from the "TimeBucketDropdownButton"
    And I click the "GenerateWithGram" button
    And I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    Then take a screenshot

    Examples:
      | fieldValue | topElement | presentType | timeBucket | timeOption |
      | tag        |            |             | 1          |            |
      | tag        | 10         | 面积图         | 1          | 周          |
      | tag        | 20         | 散点图         | 1          | 小时         |
      | tag        | 20         | 柱状图         | 120        | 分钟         |
      | tag        |            | 柱状图         | 3600       | 秒          |

  @smoke @splSmoke
  Scenario Outline: 生成多级统计成功(统计图)
    Given I click the "MultilevelStatistics" button
    When I choose the "<fieldValue>" from the "FieldValue"
    And I choose the "<topElement>" from the "TopElement"
    And I click the "Generate" button
    And I wait for "Loading" will be invisible
    And I click the "StatisticsGram" button
    And I choose the "<presentType>" from the "PresentType"
    And I click the "GenerateWithoutTimeBucket" button
    And I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    Then take a screenshot

    Examples:
      | fieldValue | topElement | presentType |
      | tag        | 10         | 饼图          |
      | tag        | 20         | 条形图         |

  @smoke @splSmoke
  Scenario Outline: 生成多级统计成功(下一步)
    Given I click the "MultilevelStatistics" button
    When I choose the "<fieldValue>" from the "FieldValue"
    And I choose the "<topElement>" from the "TopElement"
    And I click the "Generate" button
    And I wait for "Loading" will be invisible
    And I click the "NextButton" button
    And I choose the "<nextFieldValue>" from the "NextFieldValue"
    And I choose the "<statisticType>" from the "StatisticType"
    And I click the "CheckAll" button
    And I click the "NextGenerateButton" button
    And I wait for "Loading" will be invisible
    And I click the "LastNextButton" button
    And I choose the "<lastFieldValue>" from the "LastFieldValue"
    And I choose the "<lastStatisticType>" from the "LastStatisticType"
    And I click the "LastCheckBox" button
    And I click the "LastGenerateButton" button
    And I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    Then take a screenshot

    Examples:
      | fieldValue | topElement | nextFieldValue | statisticType | lastFieldValue | lastStatisticType |
      | tag        |            | appname        |               | logtype        |                   |
      | tag        | 10         | appname        | 独立数           | tag            |                   |
      | tag        | 20         | appname        |               | ip             | 独立数               |

  Scenario: 生成地理分布失败
    Given I click the "GeographicalDistribution" button
    When I click the "Generate" button
    Then I will see the error message "请选择统计字段"

  @smoke @splSmoke
  Scenario: 生成地理分布成功
    Given I click the "GeographicalDistribution" button
    When I choose the "apache.geo.country" from the "FieldValue"
    And I click the "Generate" button
    And I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    Then take a screenshot

