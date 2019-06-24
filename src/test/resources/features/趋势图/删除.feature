@all @smoke @trend @cleanTrend @clean
Feature: 趋势图删除（RZY-1891）

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"

  Scenario Outline: 趋势图删除
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button

    Examples:
      | name                                     |
      | RZY-2661:矩阵热力图sample1(副本)                |
      | RZY-3135:pivot_timechart_column_sample1  |
      | RZY-3132:pivot_timechart_scatter_sample1 |
      | RZY-3130:pivot_timechart_area_sample1    |
      | RZY-3118:pivot_timechart_line_sample1    |
      | RZY-3133:pivot_timechart_column_sample0  |
      | RZY-3131:pivot_timechart_scatter_sample0 |
      | RZY-3129:pivot_timechart_area_sample0    |
      | RZY-3117:pivot_timechart_line_sample0    |
      | RZY-2678:条形图sample2                      |
      | RZY-2664:饼状图sample3                      |
      | RZY-2677:条形图sample1                      |
      | RZY-2504:饼状图sample1                      |
      | RZY-2492:散点图sample2                      |
      | RZY-2500:柱状图sample2                      |
      | RZY-2483:面积图sample2                      |
      | RZY-2479:曲线图sample2                      |
      | RZY-2508:力图sample1                       |
      | RZY-2506:和弦图sample1                      |

  @cleanSecond
    Examples:
      | name                |
      | RZY-2512:桑基图sample1 |

    Examples:
      | name                |
      | RZY-2679:条形图sample3 |

  @cleanSecond
    Examples:
      | name                    |
      | RZY-2856:旭日图sample2     |
      | RZY-2516:区间图sample1     |
      | RZY-2523:多Y轴sample2     |
      | RZY-2547:区划地图sample2    |
      | RZY-2546:区划地图sample1    |
      | RZY-2543:攻击地图sample2    |
      | RZY-2542:攻击地图sample1    |
      | RZY-3085:力图sample2      |
      | RZY-3080:chart指令sample0 |
      | RZY-2962:调用链sample      |
      | RZY-2661:矩阵热力图sample1   |
      | RZY-2552:单值sample3      |
      | RZY-2631:循序图sample1     |
      | RZY-2646:雷达图sample2     |
      | RZY-2658:漏斗图sample1     |
      | RZY-2635:雷达图sample1     |
      | RZY-2563:水球图sample1     |

  @cleanThird
    Examples:
      | name                 |
      | RZY-2626:字符云图sample1 |

  @cleanFirst
    Examples:
      | name                 |
      | RZY-2663:饼状图sample2  |
      | RZY-2539:热力地图sample1 |

  @cleanSecond
    Examples:
      | name                |
      | RZY-2851:旭日图sample1 |
      | RZY-2522:多Y轴sample1 |

    Examples:
      | name                |
      | RZY-2499:散点图sample1 |
      | RZY-2491:面积图sample1 |

  @cleanFirst
    Examples:
      | name                |
      | RZY-2005:柱状图sample1 |
      | RZY-2477:曲线图sample1 |
      | RZY-2551:单值sample2  |
      | RZY-2550:单值sample1  |


