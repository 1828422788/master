Feature: 批量修改邮件邮箱

  @bvtalert1 @uamail
  Scenario Outline:
    And I wait for loading complete
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I set the parameter "AlertListSearchInput" with value "<name>"
    And I wait for loading complete
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button

    Then I will see the "alert.CreatePage" page
    And I wait for loading complete
    When I click the "AlertNoteTypeTab" button
    When I click the "MailAlertLabel" button
    And I set the parameter "MailReceiver" with value "backfuture@yeah.net"
    And I wait for "2000" millsecond
    And I choose the "backfuture@yeah.net" from the "MailReceiverList"
    And I wait for "2000" millsecond

    When I click the "SaveButton" button
    When I click the "AffirmButton" button

    Examples:
      | name                                                     |
      |	api00_all_事件数_扩展chart_all_sample_合并	|
      |	api00_all_事件计数_设备切分ip_扩展chart_all_交易日	|
      |	api00_all_事件计数_设备切分ip_扩展chart_all_合并	|
      |	api00_spl统计ip_cnt_高_扩展chart_all_合并	|
      |	api00_spl统计ip_cnt_高_扩展chart_all_宏	|
      |	api00_spl统计_按行发送sample	|
      |	api00_spl统计_按行发送_抑制_连续触发3次_分组单字段	|
      |	api00_spl统计_按行发送_抑制_连续触发3次_分组多字段	|
      |	api00_spl统计_按行发送_抑制翻倍_cnt_10-59min_分组单字段	|
      |	api00_spl统计_按行发送_抑制翻倍_cnt_10-59min_分组多字段	|
      |	api00_spl统计_按行发送_抑制翻倍_cnt_10-59min_无分组	|
      |	api00_spl统计_非按行发送sample	|
      |	api00_基线_status_在区间内_all_合并	|
      |	api00_基线_status_在区间外_邮件_合并	|
      |	api00_基线_status_在区间外_邮件_合并_交易日	|
      |	api00_字段统计_切分ip_最大数status_扩展chart键值_all	|
      |	api00_字段统计_切分ip_最大数status_扩展chart键值_all_交易日	|
      |	api00_字段统计_切分ip_最大数status_扩展chart键值_all_抑制连续触发3次	|
      |	api00_字段统计_切分ip_最大数status_扩展chart键值_all_抑制间隔翻倍10-90min	|
      |	api00_连续统计_status<=502_扩展chat_键值_all_合并	|
      |	api00_连续统计_status<=502_扩展chat_键值_all_合并_交易日	|

  @addmail
  Scenario Outline:
    And I wait for loading invisible
    Given open the "alert.ListPage" page for uri "/alerts/"
    When I set the parameter "AlertListSearchInput" with value "<name>"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button

    Then I will see the "alert.CreatePage" page
    And I wait for loading invisible
    And I click the "AlertNoteTypeTab" button
#    And I add a "emailType" with parameter "{'title':'auto test alert.','email':['backfuture@yeah.net'],'condition':['高','中','低'],'content':''}"
    And I click the "MailAlertLabel" button
    When I set the parameter "MailReceiver" with value "backfuture@yeah.net"
    And I wait for "2000" millsecond
    And I choose the "backfuture@yeah.net" from the "MailReceiverList"
    And I wait for "2000" millsecond

    When I click the "SaveButton" button
    When I click the "AffirmButton" button

    Examples:
      | name                                                     |
      | api00_all_事件计数_设备切分ip_扩展chart_all_合并 |
      | api00_spl统计ip_cnt_9分钟_高_扩展chart_all_宏 |
      | api00_spl统计ip_cnt_高_扩展chart_all_合并 |
      | api00_spl统计where_ip_20分钟_cnt_高_扩展chart_all |
      | api00_基线_status_在区间外_邮件_合并 |
      | api00_基线_status_在区间外_邮件_合并_交易日 |
      | api00_字段统计_切分ip_最大数status_扩展chart键值_all_spark |
      | api00_字段统计_切分ip_最大数status_扩展chart键值_all_交易日 |
      | api00_字段统计_切分ip_最大数status_扩展chart键值_all_合并 |
      | api00_字段统计_切分ip_最大数status_扩展chart键值_all_抑制 |
      | api00_字段统计_切分ip_最大数status_扩展chart键值_all_抑制连续触发 |
      | api00_字段统计_切分ip_最大数status_扩展chart键值_all_抑制间隔持续翻倍10-90min |
      | api00_按行发送_抑制_连续触发3次_分组字段ip |
      | api00_连续统计_status<=502_扩展chat_键值_all_合并 |
      | api00_连续统计_status<=502_扩展chat_键值_all_合并_交易日 |
      | api01_all_事件计数_扩展chart_all_合并 |
      | api01_字段统计_最大数status_扩展chart键值_邮件_合并 |
      | api0_all_事件数_扩展chart_all_sample_合并 |
      | api0_all_事件计数_设备切分ip_扩展chart_all_spark |
      | api0_all_事件计数_设备切分ip_扩展chart_all_交易日 |
      | api0_all_事件计数_设备切分ip_扩展chart_all抑制45 |
      | api0_基线_status_在区间内_all_合并 |
      | api1_all_连续统计_status>=200_邮件_合并 |
      | api1_spl统计avg_高_扩展avg_all |
      | api1_spl统计avg_高_扩展avg_all_搜索宏_扩展宏 |
      | api1_事件_multiwords_切分_扩展chart插图_键值_邮件 |
      | api1_字段统计_平均数resplen_邮件 |
      | api2_guest_ds200_事件数_邮件 |
      | api2_nods_事件数_ping主机 |
      | api2_nods_事件数_rsyslog |
      | api3_spl统计bucket_扩展bucket |
      | api3_spl统计count_9分钟_高_扩展chart_all |
      | api3_spl统计ip_cnt_9分钟_高_扩展chart_all_搜索宏 |
      | api3_spl统计ip_cnt_高_扩展chart_all_合并 |
      | api3_spl统计stats_dc_邮件_合并 |
      | api3_按行发送sample |
      | api3_按行发送sample_连续触发3次 |
      | api3_按行发送_抑制_连续触发3次_分组字段sample |
      | api3_按行发送_抑制翻倍_ip分组cnt_10-59min |
      | api_all_连续统计_status<404_低_邮件 |
      | api_nods_字段统计ip_20秒_邮件 |
      | api_RZY-2980:新建监控-基本配置-执行计划-crontab-周一到周五下午14：00~14：45之间 |
      | api_基线_len_24hours大于100_邮件 |
      | api_基线_len_24hour小于100_邮件 |
      | api_基线_len_24hour小于100_邮件_抑制10-120m16:06 |
      | api_基线_len_24hour小于100_邮件_抑制10-30m |
      | api_字段统计_总计status_邮件 |
      | api_字段统计_最小数resplen_邮件_不告警 |
      | api_字段统计_独立数status_邮件 |
      | 交易日_监控_sample |