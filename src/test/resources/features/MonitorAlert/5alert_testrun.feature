@bvtalert
Feature: 测试运行-邮件

  Scenario Outline: 执行
    Given open the "system.CustomConfigs" page for uri "/system/"
    And I wait for loading invisible
    When I click the "MailServerSet" button
    When I set the parameter "EmailPassword" with value "<EmailPassword>"
    When I set the parameter "EmailLogName" with value "sender"

    Examples:
      | EmailPassword    |
      | UtOiRnil&.6Co4 |


  Scenario Outline:  测试运行-邮件
    Given open the "alert.ListPage" page for uri "/alerts/"
    When I set the parameter "AlertListSearchInput" with value "<name>"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "alert.CreatePage" page
    And I wait for loading invisible
    And I click the "AlertNoteTypeTab" button
    And I wait for "MailAlertLabelXpath" will be clickable by xpath
    And I click the "MailAlertLabel" button
    And I click the "MailTestRunButton" button
    And I wait for "TestRunReminder" will be visible in "60000" milliseconds
    And I wait for element "TestRunReminder" change text to "提示"
    Then take a screenshot with name "actual/trm_<name>"
    And I wait for element "TestRunReminderText" change text to "<name>"
    And I wait for element "TestRunReminderText" change text to "successfu"
    When I click the "AffirmButton" button

    Examples:
      | name                    |
      |	api00_spl统计_按行发送1_sample_444444	|
      |	api00_spl统计_按行发送2_抑制翻倍_cnt_10-59min_分组单字段_22020002 |
      |	api00_基线_status_在区间内_all_合并	|
      |	api00_字段统计_切分ip_最大数status_扩展chart键值_all_抑制间隔翻倍10-90min	|
      |	api00_spl统计ip_cnt_高_扩展chart_all_合并	|
      |	api00_spl统计ip_cnt_高_扩展chart_all_宏	|
      |	api00_all_事件数_扩展chart_all_sample_合并	|
      |	api00_all_事件计数_设备切分ip_扩展chart_all_交易日	|
      |	api00_all_事件计数_设备切分ip_扩展chart_all_合并	|
      | api00_spl统计_非按行发送0_sample_111111|
      |	api00_spl统计_按行发送2_抑制翻倍_cnt_10-59min_无分组_44040004 |
      |	api00_spl统计_按行发送2_抑制翻倍_cnt_10-59min_分组多字段_22020002 |
      |	api00_spl统计_按行发送3_抑制[连续触发]3次_分组多字段_112 |
      |	api00_spl统计_按行发送3_抑制[连续触发]3次_分组单字段_112 |
      |	api00_基线_status_在区间外_邮件_合并_交易日	|
      |	api00_字段统计_切分ip_最大数status_扩展chart键值_all	|
      |	api00_字段统计_切分ip_最大数status_扩展chart键值_all_抑制连续触发3次	|
      |	api00_连续统计_status<=502_扩展chat_键值_all_合并	|
      |	api00_连续统计_status<=502_扩展chat_键值_all_合并_交易日	|
      |	api3_all_连续统计_status=200_邮件_抑制59	|
      |	api3_基线_len_24hour小于100_邮件_抑制10-30m	|
      |	api3_字段统计_最小数resplen_邮件_不告警	|
      |	api3_all_事件计数_设备切分ip_扩展chart_all抑制45	|
      |	api3_all_连续统计_status<404_低_邮件	|
      |	api3_spl统计stats_dc_邮件	|
      |	api3_事件_multiwords_切分_扩展chart插图_键值_邮件	|
      |	api3_基线_len_24hours大于100_邮件	|
      |	api3_基线_len_24hour小于100_邮件	|
      |	api3_字段统计_分组事件数status_邮件	|
      |	api3_字段统计_去重数status_邮件	|
      |	api3_字段统计_平均数resplen_邮件	|
      |	api3_字段统计_总和status_邮件	|
      |	api3_连续统计_status>200_扩展chat_键值_all_连续触发3次	|
      |	api4_spl统计bucket_扩展bucket	|
      |	api4_基线_status_在区间外_邮件_同比1天前	|
      |	api4_基线_status_在区间外_邮件_同比2天前	|
      |	api4_基线_status_在区间外_邮件_同比3天前	|
      |	api4_基线_status_在区间外_邮件_同比4天前	|
      |	api4_基线_status_在区间外_邮件_同比5天前	|
      |	api4_基线_status_在区间外_邮件_同比6天前	|
      |	api4_基线_status_在区间外_邮件_同比一周前	|
      |	api4_基线_status_在区间外_邮件_同比一月前	|
      |	api7_guest_ds200_事件数_邮件	|
      |	api7_nods_事件数_rsyslog	|
      | pi01_字段统计_最大数status_扩展chart键值_邮件                      |

  Scenario Outline:  测试运行-邮件_报错
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible
    When I set the parameter "AlertListSearchInput" with value "<name>"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
    Then I will see the "alert.CreatePage" page
    And I wait for loading invisible
    And I click the "AlertNoteTypeTab" button
    And I wait for "MailAlertLabelXpath" will be clickable by xpath
    And I click the "MailAlertLabel" button
    And I click the "MailTestRunButton" button
    And I wait for "TestRunReminder" will be visible
    And I wait for element "TestRunReminder" change text to "提示"
    Then take a screenshot with name "actual/trm_<name>"
    And I wait for element "TestRunReminderText" change text to "<name>"
    And I wait for element "TestRunReminderText" change text to "Error: {'admin@rizhiyi.com': (550, b'Mailbox not found"
    When I click the "AffirmButton" button

    Examples:
      | name                    |
      |	api3_nods_事件数_ping主机 |

  Scenario Outline: 执行
    Given open the "system.CustomConfigs" page for uri "/system/"
    And I wait for loading invisible
    When I click the "MailServerSet" button
    When I set the parameter "EmailPassword" with value "<EmailPassword>"
    When I set the parameter "EmailLogName" with value "sender"

    Examples:
      | EmailPassword    |
      | EDMIEMFKTIRAYEFI1 |

