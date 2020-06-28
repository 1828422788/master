@dellagacydb
Feature: 删除过期仪表盘

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"

  Scenario Outline: 删除过期仪表盘
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name          |
      |gentimes|
      |1|
      |2|
      |按选择周|
      |N1|
      |11111|
      |test|
      |父子行为无|
      |mc|
      |父子行为无|
      |父子行为汇聚|
      |父子行为继承|
      |test|
      |test|
      |test|
      |test|
      |demo|
      |1|
      |test|
      |图表|
      |图表1|
      |图表1|
      |2|
      |3|
      |4|
      |5|
      |123123|
      |1|
      |2|
      |2|
      |单值|
      |安全日志分析|
      |错误事件分析|
      |在线操作分析|
      |audit日志审计|
      |定时任务详情|
      |中间件_nginx_请求分析|
      |中间件_nginx_错误日志分析|
      |中间件_nginx_请求分析|
      |中间件_nginx_错误日志分析|
      |中间件_nginx_请求分析|
      |中间件_nginx_错误日志分析|
      |a|
      |1|
      |123|
      |join|
      |test|
      |饼状图|
      |test|
      |Windows运维异常详细概览|
      |Windows主机性能指标|
      |Windows运维异常概览|
      |11|
      |1`|
      |1|
      |test|
      |geostatsmap|
      |1|
      |34343|
      |test|
      |t2|
      |test1|
      |test|
      |lkjhg|
      |test|
      |test|
      |散点图|
      |过滤项|
      |事件操作|
      |关联搜索|
      |力图|
      |区划地图|
      |区间图|
      |和弦图|
      |多Y轴图|
      |字符云图|
      |循序图|
      |攻击地图|
      |旭日图|
      |条形图|
      |桑基图|
      |水球图|
      |漏斗图|
      |热力地图|
      |123|
      |ROW|
      |demo|
      |tag1|
      |RRR|
      |R|
      |r|