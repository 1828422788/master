@bvtalert @alertcase @onalert
Feature: 监控启用

  @onalert0
  Scenario Outline: 启用高优先级用例
    Given open the "alert.ListPage" page for uri "/alerts/"
#   And I wait for "3000" millsecond
    And I wait for loading complete
    When I set the parameter "AlertListSearchInput" with value "<name>"
    And I wait for "3000" millsecond

    When the data name is "{'column':'1','name':'<name>'}" then I "open" the switch
    And I wait for "3000" millsecond
    And I wait for loading complete

    Then I will see the element "{'column':'1','name':'<name>'}" is "open"

    Examples:
      | name                                                   |
      | api00_all_事件数_扩展chart_all_sample_合并                    |
      | api00_all_事件计数_设备切分ip_扩展chart_all_交易日                  |
      | api00_all_事件计数_设备切分ip_扩展chart_all_合并                   |
      | api00_spl统计ip_cnt_高_扩展chart_all_合并                     |
      | api00_spl统计ip_cnt_高_扩展chart_all_宏                      |
      | api00_spl统计_按行发送sample                                 |
      | api00_spl统计_按行发送_抑制_连续触发3次_分组单字段                       |
      | api00_spl统计_按行发送_抑制_连续触发3次_分组多字段                       |
      | api00_spl统计_按行发送_抑制翻倍_cnt_10-59min_分组单字段               |
      | api00_spl统计_按行发送_抑制翻倍_cnt_10-59min_分组多字段               |
      | api00_spl统计_按行发送_抑制翻倍_cnt_10-59min_无分组                 |
      | api00_spl统计_非按行发送sample                                |
      | api00_基线_status_在区间内_all_合并                            |
      | api00_基线_status_在区间外_邮件_合并                             |
      | api00_基线_status_在区间外_邮件_合并_交易日                         |
      | api00_字段统计_切分ip_最大数status_扩展chart键值_all                |
      | api00_字段统计_切分ip_最大数status_扩展chart键值_all_交易日            |
      | api00_字段统计_切分ip_最大数status_扩展chart键值_all_抑制连续触发3次       |
      | api00_字段统计_切分ip_最大数status_扩展chart键值_all_抑制间隔翻倍10-90min |
      | api00_连续统计_status<=502_扩展chat_键值_all_合并                |
      | api00_连续统计_status<=502_扩展chat_键值_all_合并_交易日            |

  @onalert1 @alertcase
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
      | name                                         |
      | api01_字段统计_最大数status_扩展chart键值_邮件            |
      | api3_all_事件计数_设备切分ip_扩展chart_all抑制45         |
      | api3_all_连续统计_status<404_低_邮件                |
      | api3_all_连续统计_status=200_邮件_抑制59             |
      | api3_all_连续统计_status>=200_邮件_合并              |
      | api3_nods_事件数_ping主机                         |
      | api3_spl统计stats_dc_邮件                        |
      | api3_事件_multiwords_切分_扩展chart插图_键值_邮件        |
      | api3_基线_len_24hours大于100_邮件                  |
      | api3_基线_len_24hour小于100_邮件                   |
      | api3_基线_len_24hour小于100_邮件_抑制10-120m16:06    |
      | api3_基线_len_24hour小于100_邮件_抑制10-30m          |
      | api3_字段统计_分组事件数status_邮件                     |
      | api3_字段统计_去重数status_邮件                       |
      | api3_字段统计_平均数resplen_邮件                      |
      | api3_字段统计_总和status_邮件                        |
      | api3_字段统计_最小数resplen_邮件_不告警                  |
      | api3_连续统计_status>200_扩展chat_键值_all_连续触发3次    |
      | api4_spl统计avg_高_扩展avg_邮件_搜索宏                 |
      | api4_spl统计bucket_扩展bucket                    |
      | api4_基线_status_在区间外_邮件_同比1天前                 |
      | api4_基线_status_在区间外_邮件_同比2天前                 |
      | api4_基线_status_在区间外_邮件_同比3天前                 |
      | api4_基线_status_在区间外_邮件_同比4天前                 |
      | api4_基线_status_在区间外_邮件_同比5天前                 |
      | api4_基线_status_在区间外_邮件_同比6天前                 |
      | api4_基线_status_在区间外_邮件_同比一周前                 |
      | api4_基线_status_在区间外_邮件_同比一月前                 |
      | api4_基线_status_在区间外_邮件_环比上一时间段               |
      | api7_guest_ds200_事件数_邮件                      |
      | api7_nods_事件数_rsyslog                        |
      | api7_nods_字段统计ip_20秒_邮件                      |
      | api7_spl统计avg_高_扩展avg_all                    |
      | api9_all_事件计数_设备切分ip_扩展chart_all_spark       |
      | api9_事件_multiwords_切分_扩展chart插图_键值_邮件_splark |
      | api9_字段统计_切分ip_最大数status_扩展chart键值_all_spark |

  @onalert2 @alertcase
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
      | name                             |
      | 维护期_字段统计_分组事件数status_邮件_每月1-30   |
      | 维护期_字段统计_分组事件数status_邮件_每周一至周六   |
      | 维护期_字段统计_分组事件数status_邮件_每天0-23点  |
      | 维护期_字段统计_分组事件数status_邮件_永久       |
      | 维护期_字段统计_分组事件数status_邮件_单次今天9点开始 |