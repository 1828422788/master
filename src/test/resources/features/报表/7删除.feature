@clean @cleanReport
Feature: 报表删除（RZY-131）

  Scenario Outline: 删除报表
    Given open the "report.ListPage" page for uri "/reports/"
    When the data name is "<name>" then i click the "删除" button
    Then I click the "DeleteEnsure" button

  @cleanSecond
    Examples:
      | name            |
      | 改为旭日图sample2报表  |
      | 改为条形图sample3报表  |
      | 改为玫瑰图sample3报表  |
      | 改为区划地图sample2报表 |
      | 改为攻击地图sample1报表 |
      | 改为热力地图sample1报表 |

    Examples:
      | name                   |
      | 改为字符云图sample1报表        |
      | 改为矩阵热力图sample1报表       |
      | 改为漏斗图sample1报表         |
      | 改为面积图sample2报表         |
      | 改为字符云图sample1报表(EXCEL) |
      | 改为水球图sample1报表         |
      | 改为单值sample2            |
      | 改为区划地图sample2报表        |
      | 改为攻击地图sample1报表        |
      | 改为热力地图sample2报表        |
      | 改为多Y轴图sample2报表        |
      | 改为区间图sample1报表         |
      | 改为力图sample1报表          |
      | 改为桑基图sample1报表         |
      | 改为和弦图sample1报表         |
      | 改为柱状图sample2           |
      | 改为曲线图sample2(URL)      |

  @cleanFirst
    Examples:
      | name               |
      | 改为曲线图sample2(WORD) |
      | 改为雷达图sample2       |
      | 改为散点图sample2       |

  Scenario Outline: 删除趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button

  @cleanFirst
    Examples:
      | name       |
      | 雷达图sample0 |
      | 散点图sample0 |
      | 曲线图sample0 |

    Examples:
      | name       |
      | 区间图sample0 |
      | 力图sample0  |
      | 桑基图sample0 |
      | 和弦图sample0 |
      | 柱状图sample0 |
      | 面积图sample0 |

  @cleanSecond
    Examples:
      | name         |
      | 调用链sample0   |
      | 旭日图sample0   |
      | 条形图sample0   |
      | 玫瑰图sample0   |
      | 矩阵热力图sample0 |
      | 漏斗图sample0   |
      | 循序图sample0   |
      | 字符云图sample0  |
      | 水球图sample0   |
      | 单值sample0    |
      | 区划地图sample0  |
      | 攻击地图sample0  |
      | 热力地图sample0  |
      | 多Y轴sample0   |
      | 饼状图sample0   |
