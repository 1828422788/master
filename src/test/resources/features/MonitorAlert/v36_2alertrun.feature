Feature: 监控启用

  @onalert @extra0
  Scenario Outline: 启用
    Given open the "alert.ListPage" page for uri "/alerts/"
#    And I wait for "3000" millsecond
    And I wait for loading invisible
    When I set the parameter "AlertListSearchInput" with value "<name>"
    And I wait for "3000" millsecond

    When the data name is "{'column':'1','name':'<name>'}" then I "open" the switch
    And I wait for "3000" millsecond
    And I wait for loading invisible

    Then I will see the element "{'column':'1','name':'<name>'}" is "open"

    Examples:
      | name |
      |	api00_all_事件计数_设备切分ip_扩展chart_all_合并	|
      |	api00_spl统计ip_cnt_9分钟_高_扩展chart_all_宏	|
      |	api00_spl统计ip_cnt_高_扩展chart_all_合并	|
      |	api00_spl统计where_ip_20分钟_cnt_高_扩展chart_all	|
      |	api00_基线_status_在区间外_邮件_合并	|
      |	api00_基线_status_在区间外_邮件_合并_交易日	|
      |	api00_字段统计_切分ip_最大数status_扩展chart键值_all_spark	|
      |	api00_字段统计_切分ip_最大数status_扩展chart键值_all_交易日	|
      |	api00_字段统计_切分ip_最大数status_扩展chart键值_all_合并	|
      |	api00_字段统计_切分ip_最大数status_扩展chart键值_all_抑制	|
      |	api00_字段统计_切分ip_最大数status_扩展chart键值_all_抑制连续触发	|
      |	api00_字段统计_切分ip_最大数status_扩展chart键值_all_抑制间隔持续翻倍10-90min	|
      |	api00_按行发送_抑制_连续触发3次_分组字段ip	|
      |	api00_连续统计_status<=502_扩展chat_键值_all_合并	|
      |	api00_连续统计_status<=502_扩展chat_键值_all_合并_交易日	|
      |	api01_all_事件计数_扩展chart_all_合并	|
      |	api01_字段统计_最大数status_扩展chart键值_邮件_合并	|
      |	api0_all_事件数_扩展chart_all_sample_合并	|
      |	api0_all_事件计数_设备切分ip_扩展chart_all_spark	|
      |	api0_all_事件计数_设备切分ip_扩展chart_all_交易日	|
      |	api0_all_事件计数_设备切分ip_扩展chart_all抑制45	|
      |	api0_基线_status_在区间内_all_合并	|
      |	api1_all_连续统计_status>=200_邮件_合并	|
      |	api1_spl统计avg_高_扩展avg_all	|
      |	api1_spl统计avg_高_扩展avg_all_搜索宏_扩展宏	|
      |	api1_事件_multiwords_切分_扩展chart插图_键值_邮件	|
      |	api1_事件_multiwords_切分_扩展chart插图_键值_邮件_splark	|
      |	api1_字段统计_平均数resplen_邮件	|
      |	api2_guest_ds200_事件数_邮件	|
      |	api2_nods_事件数_ping主机	|
      |	api2_nods_事件数_rsyslog	|
      |	api3_spl统计bucket_扩展bucket	|
      |	api3_spl统计count_9分钟_高_扩展chart_all	|
      |	api3_spl统计ip_cnt_9分钟_高_扩展chart_all_搜索宏	|
      |	api3_spl统计ip_cnt_高_扩展chart_all_合并	|
      |	api3_spl统计stats_dc_邮件_合并	|
      |	api3_按行发送sample	|
      |	api3_按行发送sample_连续触发3次	|
      |	api3_按行发送_抑制_连续触发3次_分组字段sample	|
      |	api3_按行发送_抑制翻倍_ip分组cnt_10-59min	|
      |	api_all_连续统计_status<404_低_邮件	|
      |	api_nods_字段统计ip_20秒_邮件	|
      |	api_RZY-2980:新建监控-基本配置-执行计划-crontab-周一到周五下午14：00~14：45之间	|
      |	api_基线_len_24hours大于100_邮件	|
      |	api_基线_len_24hour小于100_邮件	|
      |	api_基线_len_24hour小于100_邮件_抑制10-120m16:06	|
      |	api_基线_len_24hour小于100_邮件_抑制10-30m	|
      |	api_字段统计_总计status_邮件	|
      |	api_字段统计_最小数resplen_邮件_不告警	|
      |	api_字段统计_独立数status_邮件	|
      |	交易日_监控_sample	|
      |	维护期0_字段统计_独立数status_邮件_单次今天9点开始	|
      |	维护期0_字段统计_独立数status_邮件_每周一至周六	|
      |	维护期0_字段统计_独立数status_邮件_每天0-23点	|
      |	维护期0_字段统计_独立数status_邮件_每月1-30	|
      |	维护期0_字段统计_独立数status_邮件_永久	|


  @onalert1 @extra1
  Scenario Outline: 启用
    Given open the "alert.ListPage" page for uri "/alerts/"
    When I set the parameter "AlertListSearchInput" with value "<name>"
#    And I wait for "3000" millsecond
    And I wait for loading invisible

    When the data name is "{'column':'1','name':'<name>'}" then I "open" the switch
    And I wait for loading invisible
    Then I will see the element "{'column':'1','name':'<name>'}" is "open"

    Examples:
      | name |
      |	api00_all_事件计数_设备切分ip_扩展chart_all_合并	|
      |	api00_spl统计ip_cnt_9分钟_高_扩展chart_all_宏	|
      |	api00_spl统计ip_cnt_高_扩展chart_all_合并	|
      |	api00_spl统计where_ip_20分钟_cnt_高_扩展chart_all	|
      |	api00_基线_status_在区间外_邮件_合并	|
      |	api00_基线_status_在区间外_邮件_合并_交易日	|
      |	api00_字段统计_切分ip_最大数status_扩展chart键值_all_spark	|
      |	api00_字段统计_切分ip_最大数status_扩展chart键值_all_交易日	|
      |	api00_字段统计_切分ip_最大数status_扩展chart键值_all_合并	|
      |	api00_字段统计_切分ip_最大数status_扩展chart键值_all_抑制	|
      |	api00_字段统计_切分ip_最大数status_扩展chart键值_all_抑制连续触发	|
      |	api00_字段统计_切分ip_最大数status_扩展chart键值_all_抑制间隔持续翻倍10-90min	|
      |	api00_按行发送_抑制_连续触发3次_分组字段ip	|
      |	api00_连续统计_status<=502_扩展chat_键值_all_合并	|
      |	api00_连续统计_status<=502_扩展chat_键值_all_合并_交易日	|
      |	api01_all_事件计数_扩展chart_all_合并	|
      |	api01_字段统计_最大数status_扩展chart键值_邮件_合并	|
      |	api0_all_事件数_扩展chart_all_sample_合并	|
      |	api0_all_事件计数_设备切分ip_扩展chart_all_spark	|
      |	api0_all_事件计数_设备切分ip_扩展chart_all_交易日	|
      |	api0_all_事件计数_设备切分ip_扩展chart_all抑制45	|
      |	api0_基线_status_在区间内_all_合并	|

#    Then I refresh the website
#    And I wait for loading invisible
#    When the data name is "{'column':'1','name':'<name>'}" then I "close" the switch
#    Then I wait for loading invisible
#    Then I will see the element "{'column':'1','name':'<name>'}" is "close"
