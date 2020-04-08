#@scheduleScreenshot @screenshot
Feature: 定时任务详情页截图

  Background:
    Given open the "timedTask.ListPage" page for uri "/schedule/"

  Scenario Outline:
    And I set the parameter "SearchInput" with value "<name>"
    And I click the "SearchIcon" button
    And I wait for loading invisible
    Given I click the detail which name is "<name>"
    And I will see the "timedTask.DetailPage" page
    When I click the button "LookUpButton" if exist
    And I wait for "1800" millsecond
    And take part of "Chart" with name "timedtask/<screenName>"

#  @firstScreenshot
    Examples:
      | name                         | screenName      |
      | chs_task_funnel              | chs_task_funnel |
      | RZY-397:定时任务sample_昨天        | 397             |
      | RZY-2695:执行计划-crontab_57分钟   | 2695            |
      | RZY-396:定时任务_sample_表格_近一天   | 396             |
      | RZY-2936:task_地图-统计地图_sample | 2936            |

    Examples:
      | name                          | screenName |
      | RZY-403:执行计划-定时_3小时           | 403        |
      | RZY-404:执行计划-定时1天             | 404        |
      | RZY-1488:保存为各种类型的定时任务-序列      | 1488       |
      | RZY-2918:task_维度_旭日图1         | 2918       |
      | RZY-2938:task_地图-统计地图_权重      | 2938       |
      | RZY-2902:task_序列-曲线图          | 2902       |
      | RZY-2904:task_序列-面积图          | 2904       |
      | RZY-2908:task_序列-柱状图          | 2908       |
      | RZY-2906:task_序列-散点图          | 2906       |
      | RZY-2928:task_复合_多Y轴图         | 2928       |
      | RZY-2910:task_维度-饼状图1         | 2910       |
      | RZY-2911:task_维度-饼状图2         | 2911       |
      | RZY-2915:task_维度-条形图1         | 2915       |
      | RZY-2916:task_维度-条形图2         | 2916       |
      | RZY-2940:task_其它_单值_图标        | 2940       |
      | RZY-2941:task_其它_单值_背景        | 2941       |
      | RZY-2942:task_其它_单值-按趋势       | 2942       |
      | RZY-2953:task_其它_漏斗图1         | 2953       |
      | RZY-2949:task_其它_循序图1         | 2949       |
      | RZY-2955:task_其它_矩阵热力图1       | 2955       |
      | RZY-2951:task_其它_雷达图1         | 2951       |
      | RZY-2943:task_其它_单值设置-按区间     | 2943       |
      | RZY-2930:task_地图-热力地图         | 2930       |
      | RZY-2913:task_维度_玫瑰图1         | 2913       |
      | RZY-402:任务分组hunter_roles_m    | 402        |
      | RZY-401:搜索内容                  | 401        |
      | RZY-400:日志来源_api_log_source_m | 400        |
      | RZY-399:运行用户_api_usr_m        | 399        |

#  @secondScreenshot
    Examples:
      | name                              | screenName |
      | RZY-2956:task_其它_调用链_sample       | 2956       |
      | RZY-398:定时任务_更新                   | 398        |
      | RZY-2696:执行计划-定时_7小时              | 2696       |
      | RZY-2698:执行计划-定时_2天               | 2698       |
      | RZY-2699:执行计划-crontab_每个月第15天开始   | 2699       |
      | RZY-2700_执行计划-crontab_每天9点整至9点30分 | 2700       |
      | RZY-2702_执行计划-crontab_周一到周五       | 2702       |
      | RZY-2944:task_其它_水球图_sample       | 2944       |
      | RZY-2935:task_地图-行政区划地图1_中国       | 2935       |
      | RZY-2934:task_地图-行政区划地图_钻取_sample | 2934       |
      | RZY-2917:task_维度_旭日图_sample       | 2917       |
      | RZY-2931:task_地图-攻击地图_sample      | 2931       |
      | RZY-2937:task_地图-统计地图_透明          | 2937       |
      | RZY-2957:task_其它_调用链1             | 2957       |
      | RZY-2948:task_其它_循序图_sample       | 2948       |
      | RZY-2925:task_复合_区间图_sample       | 2925       |
      | RZY-2954:task_其它_矩阵热力图_sample     | 2954       |
      | RZY-2952:task_其它_漏斗图sample        | 2952       |
      | RZY-2950:task_其它_雷达图_sample       | 2950       |
      | RZY-2946:task_其它_字符云图_sample      | 2946       |
      | RZY-2939:task_其它_单值_sample        | 2939       |
      | RZY-2933:task_地图-行政区划地图_sample    | 2933       |
      | RZY-2929:task_地图-热力地图_sample      | 2929       |
      | RZY-2927:task_复合_多Y轴图_sample      | 2927       |
      | RZY-2923:task_关系_力图_sample        | 2923       |
      | RZY-2921:task_关系_桑基图_sample       | 2921       |
      | RZY-2919:task_关系_和弦图_sample       | 2919       |
      | RZY-2914:task_维度_条形图_sample       | 2914       |
      | RZY-2912:task_维度_玫瑰图_sample       | 2912       |
      | RZY-2909:task_维度_饼状图_sample       | 2909       |
      | RZY-2907:task_序列-柱状图_sample       | 2907       |
      | RZY-2905:task_序列-散点图_sample       | 2905       |
      | RZY-2903:task_序列-面积图_sample       | 2903       |
      | RZY-2901:task_序列-曲线图_sample       | 2901       |