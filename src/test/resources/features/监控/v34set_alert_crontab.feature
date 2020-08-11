@v32tc @clean @cleanalerts
Feature: 设置监控执行计划2分钟

  @alertplan1
  Scenario Outline: 设置api0监控计划-2分钟
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I set the parameter "AlertListSearchInput" with value "<name>"
    And I wait for "2000" millsecond
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button

    And I wait for "2000" millsecond
#    When I click the "AlertPlanTimingButton" button
    And I set the parameter "crontabInput" with value "0 */2 * * ?"

    When I click the "SaveButton" button

    Examples:
      | name                                         |
      | api0_字段统计_最大数status_扩展chart键值_邮件_合并    |
      | api0_all_事件计数_设备切分ip_扩展chart_all抑制45         |
      | api0_基线_status_在区间内_all_合并                   |
      | api0_all_事件数_扩展chart_all_sample_合并           |
      | api0_连续统计_status<=502_扩展chat_键值_all_合并       |
      | api0_all_事件计数_设备切分ip_扩展chart_all_spark       |
      | api0_all_事件计数_设备切分ip_扩展chart_all_合并          |
      | 交易日_api0_基线_status_在区间内_all                  |
      | 交易日_api0_all_事件计数_设备切分ip_扩展chart_all         |
      | 交易日_api0_连续统计_status<=502_扩展chat_键值_all      |
      | api0_基线_status_在区间外_邮件_合并                    |
      | api0_字段统计_最大数status_扩展chart键值_邮件_合并          |
      | api0_spl统计ip_cnt_9分钟_高_扩展chart_all_搜索宏       |
      | api0_字段统计_切分ip_最大数status_扩展chart键值_all_合并    |
      | api0_spl统计ip_cnt_高_扩展chart_all_合并            |
      | api0_spl统计_stats_dc_邮件_合并                    |
      | api0_字段统计_切分ip_最大数status_扩展chart键值_all_抑制    |
      | api0_字段统计_切分ip_最大数status_扩展chart键值_all_spark |
      | api0_spl统计ip_cnt_9分钟_高_扩展chart_all_搜索宏_扩展宏   |
      | api0_字段统计_切分ip_最大数status_扩展chart键值_all_合并    |
      | api0_字段统计_最大数status_扩展chart键值_邮件_合并          |
