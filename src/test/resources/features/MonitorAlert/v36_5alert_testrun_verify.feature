@valert
Feature: 处理下载结果

  Background:
    Given open the "splSearch.OfflineTaskPageNohup" page for uri "/download/#"

  @valert
  Scenario Outline: 下载比较
    And I compare source alert result file "<name>" with target alert result file "<name>"

    Examples: 新建成功
      | name                    |
      | [告警邮件][]api0_基线_status_在区间内_all_合并.txt|
      | [告警邮件][]api3_spl统计count_9分钟_高_扩展chart_all.txt|
      | [告警邮件][]api_基线_len_24hours大于100_邮件.txt|
      | [告警邮件][]api_基线_len_24hour小于100_邮件.txt|
      | [告警邮件][]api_基线_len_24hour小于100_邮件_抑制10-120m16:06.txt|
      | [告警邮件][]api_基线_len_24hour小于100_邮件_抑制10-30m.txt|
      | [告警邮件][]api_字段统计_最小数resplen_邮件_不告警.txt|
      | [告警邮件][低]api00_基线_status_在区间外_邮件_合并.txt|
      | [告警邮件][低]api00_基线_status_在区间外_邮件_合并_交易日.txt|
      | [告警邮件][低]api2_guest_ds200_事件数_邮件.txt|
      | [告警邮件][低]api_nods_字段统计ip_20秒_邮件.txt|
      | [告警邮件][高]api00_spl统计where_ip_20分钟_cnt_高_扩展chart_all.txt|
      | [告警邮件][高]api00_按行发送_抑制_连续触发3次_分组字段ip.txt|
      | [告警邮件][高]api00_字段统计_切分ip_最大数status_扩展chart键值_all_抑制连续触发.txt|
      | [告警邮件][高]api01_all_事件计数_扩展chart_all_合并.txt|
      | [告警邮件][高]api01_字段统计_最大数status_扩展chart键值_邮件_合并.txt|
      | [告警邮件][高]api0_all_事件计数_设备切分ip_扩展chart_all_交易日.txt|
      | [告警邮件][高]api0_all_事件计数_设备切分ip_扩展chart_all抑制45.txt|
      | [告警邮件][高]api0_all_事件数_扩展chart_all_sample_合并.txt|
      | [告警邮件][高]api1_spl统计avg_高_扩展avg_all.txt|
      | [告警邮件][高]api1_事件_multiwords_切分_扩展chart插图_键值_邮件.txt|
      | [告警邮件][高]api1_字段统计_平均数resplen_邮件.txt|
      | [告警邮件][高]api2_nods_事件数_ping主机.txt|
      | [告警邮件][高]api2_nods_事件数_rsyslog.txt|
      | [告警邮件][高]api3_spl统计bucket_扩展bucket.txt|
      | [告警邮件][高]api3_spl统计stats_dc_邮件_合并.txt|
      | [告警邮件][高]api3_按行发送sample.txt|
      | [告警邮件][高]api3_按行发送sample_连续触发3次.txt|
      | [告警邮件][高]api3_按行发送_抑制翻倍_ip分组cnt_10-59min.txt|
      | [告警邮件][高]api3_按行发送_抑制_连续触发3次_分组字段sample.txt|
      | [告警邮件][高]api_字段统计_独立数status_邮件.txt|
      | [告警邮件][高]api_字段统计_总计status_邮件.txt|
      | [告警邮件][高]维护期0_字段统计_独立数status_邮件_单次今天9点开始.txt|
      | [告警邮件][高]维护期0_字段统计_独立数status_邮件_每天0-23点.txt|
      | [告警邮件][高]维护期0_字段统计_独立数status_邮件_每月1-30.txt|
      | [告警邮件][高]维护期0_字段统计_独立数status_邮件_每周一至周六.txt|
      | [告警邮件][高]维护期0_字段统计_独立数status_邮件_永久.txt|
      | [告警邮件][中]api00_spl统计ip_cnt_高_扩展chart_all_合并.txt|
      | [告警邮件][中]api00_字段统计_切分ip_最大数status_扩展chart键值_all_合并.txt|
      | [告警邮件][中]api00_字段统计_切分ip_最大数status_扩展chart键值_all_交易日.txt|
      | [告警邮件][中]api00_字段统计_切分ip_最大数status_扩展chart键值_all_抑制.txt|
      | [告警邮件][中]api3_spl统计ip_cnt_高_扩展chart_all_合并.txt|
      | [告警邮件][中]api_RZY-2980:新建监控-基本配置-执行计划-crontab-周一到周五下午14：00~14：45之间.txt|