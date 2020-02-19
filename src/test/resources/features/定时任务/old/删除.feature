@clean
Feature: 定时任务删除（RZY-412）

  @cleanTimedTask
  Scenario Outline: 定时任务删除
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureDelete" button under some element

  @cleanSecond
    Examples:
      | name                              |
      | RZY-398:定时任务_更新                   |
      | RZY-2702_执行计划-crontab_周一到周五       |
      | RZY-2700_执行计划-crontab_每天9点整至9点30分 |
      | RZY-2699:执行计划-crontab_每个月第15天开始   |
      | RZY-2698:执行计划-定时_2天               |
      | RZY-2696:执行计划-定时_7小时              |

  @cleanThird
    Examples:
      | name                          |
      | RZY-402:任务分组hunter_roles_m    |
      | RZY-401:搜索内容                  |
      | RZY-400:日志来源_api_log_source_m |
      | RZY-399:运行用户_api_usr_m        |
      | RZY-2906:task_序列-散点图          |
      | RZY-2908:task_序列-柱状图          |
      | RZY-2904:task_序列-面积图          |
      | RZY-2902:task_序列-曲线图          |
      | RZY-2953:task_其它_漏斗图1         |
      | RZY-2949:task_其它_循序图1         |
      | RZY-2955:task_其它_矩阵热力图1       |
      | RZY-2951:task_其它_雷达图1         |
      | RZY-2943:task_其它_单值设置-按区间     |
      | RZY-2942:task_其它_单值-按趋势       |
      | RZY-2941:task_其它_单值_背景        |
      | RZY-2940:task_其它_单值_图标        |
      | RZY-2937:task_地图-统计地图_透明      |
      | RZY-2916:task_维度-条形图2         |
      | RZY-2915:task_维度-条形图1         |
      | RZY-2911:task_维度-饼状图2         |
      | RZY-2910:task_维度-饼状图1         |
      | RZY-2928:task_复合_多Y轴图         |

  @cleanSecond
    Examples:
      | name                              |
      | RZY-2957:task_其它_调用链1             |
      | RZY-2917:task_维度_旭日图_sample       |
      | RZY-2931:task_地图-攻击地图_sample      |
      | RZY-2944:task_其它_水球图_sample       |
      | RZY-2935:task_地图-行政区划地图1_中国       |
      | RZY-2934:task_地图-行政区划地图_钻取_sample |
      | RZY-2948:task_其它_循序图_sample       |
      | RZY-2925:task_复合_区间图_sample       |

  @cleanThird
    Examples:
      | name                     |
      | RZY-2930:task_地图-热力地图    |
      | RZY-2913:task_维度_玫瑰图1    |
      | RZY-2938:task_地图-统计地图_权重 |
      | RZY-2918:task_维度_旭日图1    |

  @cleanSecond
    Examples:
      | name                           |
      | RZY-2954:task_其它_矩阵热力图_sample  |
      | RZY-2952:task_其它_漏斗图sample     |
      | RZY-2950:task_其它_雷达图_sample    |
      | RZY-2946:task_其它_字符云图_sample   |
      | RZY-2939:task_其它_单值_sample     |
      | RZY-2933:task_地图-行政区划地图_sample |
      | RZY-2929:task_地图-热力地图_sample   |
      | RZY-2927:task_复合_多Y轴图_sample   |
      | RZY-2923:task_关系_力图_sample     |
      | RZY-2921:task_关系_桑基图_sample    |
      | RZY-2919:task_关系_和弦图_sample    |
      | RZY-2914:task_维度_条形图_sample    |
      | RZY-2912:task_维度_玫瑰图_sample    |
      | RZY-2909:task_维度_饼状图_sample    |
      | RZY-2907:task_序列-柱状图_sample    |
      | RZY-2905:task_序列-散点图_sample    |
      | RZY-2903:task_序列-面积图_sample    |
      | RZY-2901:task_序列-曲线图_sample    |

  @cleanFirst
    Examples:
      | name                         |
      | RZY-2936:task_地图-统计地图_sample |

  @cleanThird
    Examples:
      | name                |
      | RZY-404:执行计划-定时1天   |
      | RZY-403:执行计划-定时_3小时 |

  @cleanSecond
    Examples:
      | name                        |
      | RZY-2956:task_其它_调用链_sample |

    Examples:
      | name                     |
      | RZY-1488:保存为各种类型的定时任务-序列 |

  @cleanFirst
    Examples:
      | name                       |
      | RZY-2695:执行计划-crontab_57分钟 |
      | chs_task_funnel            |
      | RZY-397:定时任务sample_昨天      |
      | RZY-396:定时任务_sample_表格_近一天 |

  Scenario Outline: 补采任务删除
    Given open the "timedTask.ListPage" page for uri "/schedule/complement/"
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureDelete" button

    Examples:
      | name                            |
      | RZY-404:执行计划-定时1天               |
      | RZY-2698:执行计划-定时_2天             |
      | RZY-2699:执行计划-crontab_每个月第15天开始 |
      | RZY-396:定时任务_sample_表格_近一天      |
      | RZY-2696:执行计划-定时_7小时            |