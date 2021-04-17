@bvtalert @alertcase
Feature: 设置监控执行计划

  @editalerts
  Scenario Outline:
    Given open the "alert.ListPage" page for uri "/alerts/"
    Given I wait for loading complete
    When I set the parameter "AlertListSearchInput" with value "<name>"
    Given I wait for loading complete
    And I wait for "2000" millsecond

    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button

    Then I will see the "alert.CreatePage" page
    Given I wait for loading complete
    And I wait for "2000" millsecond

    And I click the "AlertPlanCrontabButton" button
    Given I wait for "2000" millsecond

    And I set the parameter "CrontabInput" with value "0 1/10 * * * ?"
    When I click the "ResolveCrontab" button
    Given I wait for loading complete
    When I click the "resolveConfirmButton" button

    When I click the "SaveButton" button

    Examples:
      | name |
      |	api00_all_事件数_扩展chart_all_sample_合并	|
      |	api00_all_事件计数_设备切分ip_扩展chart_all_交易日	|
      |	api00_all_事件计数_设备切分ip_扩展chart_all_合并	|
      |	api00_spl统计ip_cnt_高_扩展chart_all_合并	|
      |	api00_spl统计ip_cnt_高_扩展chart_all_宏	|
      |	api00_spl统计_按行发送sample	|
      |	api00_spl统计_按行发送_抑制_连续触发3次_分组单字段	|
      |	api00_spl统计_按行发送_抑制_连续触发3次_分组多字段	|
      |	api00_spl统计_非按行发送sample	|
      |	api00_基线_status_在区间内_all_合并	|
      |	api00_基线_status_在区间外_邮件_合并	|
      |	api00_基线_status_在区间外_邮件_合并_交易日	|
      |	api00_字段统计_切分ip_最大数status_扩展chart键值_all	|
      |	api00_字段统计_切分ip_最大数status_扩展chart键值_all_交易日	|
      |	api00_字段统计_切分ip_最大数status_扩展chart键值_all_抑制连续触发3次	|
      |	api00_连续统计_status<=502_扩展chat_键值_all_合并	|
      |	api00_连续统计_status<=502_扩展chat_键值_all_合并_交易日	|
      |	api01_字段统计_最大数status_扩展chart键值_邮件	|
      |	api3_all_连续统计_status<404_低_邮件	|
      |	api3_all_连续统计_status>=200_邮件_合并	|
      |	api3_nods_事件数_ping主机	|
      |	api3_spl统计stats_dc_邮件	|
      |	api3_事件_multiwords_切分_扩展chart插图_键值_邮件	|
      |	api3_基线_len_24hours大于100_邮件	|
      |	api3_基线_len_24hour小于100_邮件	|
      |	api3_字段统计_分组事件数status_邮件	|
      |	api3_字段统计_去重数status_邮件	|
