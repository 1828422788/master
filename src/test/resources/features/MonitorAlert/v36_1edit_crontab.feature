Feature: 设置监控执行计划

  @editalerts @extra0
  Scenario Outline:
    Given open the "alert.ListPage" page for uri "/alerts/"
    When I set the parameter "AlertListSearchInput" with value "<name>"
#    And I click the "AlertListEditButton" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button

    Then I will see the "alert.CreatePage" page
    And I wait for "3000" millsecond
    And I click the "AlertPlanCrontabButton" button
    And I wait for "3000" millsecond

    And I set the parameter "CrontabInput" with value "0 */10 * * ?"

    When I click the "SaveButton" button

    Examples:
      | name |
      |	api00_all_事件计数_设备切分ip_扩展chart_all_合并	|
      |	api00_spl统计ip_cnt_9分钟_高_扩展chart_all_搜索宏_扩展宏	|
      |	api00_spl统计ip_cnt_高_扩展chart_all_合并	|
      |	api00_spl统计_where_ip_cnt_20分钟_高_扩展chart_all	|
      |	api00_基线_status_在区间外_邮件_合并	|
      |	api00_基线_status_在区间外_邮件_合并_交易日	|
      |	api00_字段统计_切分ip_最大数status_扩展chart键值_all_spark	|
      |	api00_字段统计_切分ip_最大数status_扩展chart键值_all_交易日	|
      |	api00_字段统计_切分ip_最大数status_扩展chart键值_all_合并	|
      |	api00_字段统计_切分ip_最大数status_扩展chart键值_all_抑制	|
      |	api00_字段统计_切分ip_最大数status_扩展chart键值_all_抑制连续触发	|
      |	api00_字段统计_切分ip_最大数status_扩展chart键值_all_抑制间隔持续翻倍10-90min	|
      |	api00_连续统计_status<=502_扩展chat_键值_all_合并	|
      |	api00_连续统计_status<=502_扩展chat_键值_all_合并_交易日	|


  @alertplan1
  Scenario Outline: 设置api0监控计划-2分钟
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I set the parameter "AlertListSearchInput" with value "<name>"
    And I wait for "2000" millsecond
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button

    And I wait for "2000" millsecond
#    When I click the "AlertPlanTimingButton" button
    And I set the parameter "CrontabInput" with value "0 */2 * * ?"

    When I click the "SaveButton" button

    Examples:
      | name                                         |
      |	api00_all_事件计数_设备切分ip_扩展chart_all_合并	|
      |	api00_spl统计ip_cnt_9分钟_高_扩展chart_all_搜索宏_扩展宏	|
      |	api00_spl统计ip_cnt_高_扩展chart_all_合并	|
      |	api00_spl统计_where_ip_cnt_20分钟_高_扩展chart_all	|
      |	api00_基线_status_在区间外_邮件_合并	|
      |	api00_基线_status_在区间外_邮件_合并_交易日	|
      |	api00_字段统计_切分ip_最大数status_扩展chart键值_all_spark	|
      |	api00_字段统计_切分ip_最大数status_扩展chart键值_all_交易日	|
      |	api00_字段统计_切分ip_最大数status_扩展chart键值_all_合并	|
      |	api00_字段统计_切分ip_最大数status_扩展chart键值_all_抑制	|
      |	api00_字段统计_切分ip_最大数status_扩展chart键值_all_抑制连续触发	|
      |	api00_字段统计_切分ip_最大数status_扩展chart键值_all_抑制间隔持续翻倍10-90min	|
      |	api00_连续统计_status<=502_扩展chat_键值_all_合并	|
      |	api00_连续统计_status<=502_扩展chat_键值_all_合并_交易日	|