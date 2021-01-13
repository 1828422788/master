@valert
Feature: 处理下载结果

  Background:
    Given open the "splSearch.OfflineTaskPageNohup" page for uri "/download/#"

  @valert
  Scenario Outline: 下载比较
    And I compare source alert result file "<name>" with target alert result file "<name>"

    Examples: 新建成功
      | name                    |
      |[告警邮件][中]api00_spl统计ip_cnt_高_扩展chart_all_合并.txt |
      |[告警邮件][高]api00_spl统计where_ip_20分钟_cnt_高_扩展chart_all.txt |
      |[告警邮件][低]api00_基线_status_在区间外_邮件_合并.txt |
      |[告警邮件][低]api00_基线_status_在区间外_邮件_合并_交易日.txt |
      |[告警邮件][中]api00_字段统计_切分ip_最大数status_扩展chart键值_all_合并.txt |
      |[告警邮件][中]api00_字段统计_切分ip_最大数status_扩展chart键值_all_交易日.txt |
      |[告警邮件][高]api3_spl统计stats_dc_邮件_合并.txt |
      |[告警邮件][高]api3_按行发送sample.txt |