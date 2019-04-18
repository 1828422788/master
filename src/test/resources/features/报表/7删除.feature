@clean @cleanReport
Feature: 报表删除（RZY-131）

  Background:
    Given open the "report.ListPage" page for uri "/reports/"

  Scenario Outline:
    When the data name is "<name>" then i click the "删除" button
    Then I click the "DeleteEnsure" button

    Examples:
      | name                                                                          |
      | 改为面积图sample2+漏斗图sample1+矩阵热力图sample1+字符云图sample1报表                            |
      | 改为字符云图sample1报表(EXCEL)                                                        |
      | 改为单值sample2+水球图sample1报表                                                      |
      | 改为力图sample1+区间图sample1+多Y轴图sample2+热力地图sample2+攻击地图sample1+区划地图sample2报表(PDF) |
      | 改为柱状图sample2+和弦图sample1+桑基图sample1报表(PDF)6                                    |
      | 改为柱状图sample2+和弦图sample1+桑基图sample1报表(PDF)5                                    |
      | 改为柱状图sample2+和弦图sample1+桑基图sample1报表(PDF)3                                    |
      | RZY-2665:改为饼状图sample3                                                         |
      | 改为曲线图sample2(URL)                                                             |
      | 条形图sample2报表                                                                  |
      | 字符云图sample1报表                                                                 |
      | 区划地图sample1报表                                                                 |
      | 攻击地图sample1报表                                                                 |
      | 条形图sample1报表                                                                  |
      | 饼状图sample1报表                                                                  |
      | 力图sample1报表                                                                   |
      | 和弦图sample1报表                                                                  |
      | 散点图sample1报表                                                                  |
      | 面积图sample1报表                                                                  |

  @cleanFirst
    Examples:
      | name               |
      | 饼状图sample2报表       |
      | 单值sample1报表        |
      | 热力地图sample1报表      |
      | 柱状图sample1报表       |
      | 曲线图sample1报表       |
      | 改为散点图雷达图sample2    |
      | 改为曲线图sample2(WORD) |

  @cleanSecond
    Examples:
      | name                                    |
      | pivot_力图sample2报表                       |
      | pivot_chart指令sample0报表                  |
      | 矩阵热力图sample1报表                          |
      | 漏斗图sample1报表                            |
      | 雷达图sample1报表                            |
      | 水球图sample1报表                            |
      | 旭日图sample1报表                            |
      | 区间图sample1报表                            |
      | 桑基图sample1报表                            |
      | 多Y轴图sample1报表                           |
      | 改为玫瑰图sample3+条形图sample3+旭日图sample2报表    |
      | 改为热力地图sample1+攻击地图sample1+区划地图sample2报表 |