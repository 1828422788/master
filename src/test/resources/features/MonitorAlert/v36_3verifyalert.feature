Feature: 处理告警结果

  Background:
    Given open the "splSearch.OfflineTaskPageNohup" page for uri "/download/#"

  @valertold
  Scenario Outline: 下载比较
    Then I compare source bucket file "<name>.csv" with target bucket files "<name>.csv"

    Examples: 新建成功
      | name                                                |
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