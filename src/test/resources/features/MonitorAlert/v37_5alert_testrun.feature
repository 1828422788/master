@bvtalert @alertcase @testrun
Feature: 测试运行-邮件1

  @testrun1
  Scenario Outline:
    And I wait for loading invisible
    Given open the "alert.ListPage" page for uri "/alerts/"
    When I set the parameter "AlertListSearchInput" with value "<name>"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
#    Then I click the "AlertListEditButton" button

    Then I will see the "alert.CreatePage" page
    And I wait for loading complete
    And I wait for "2000" millsecond

    And I click the "AlertNoteTypeTab" button
#    And I click the "AddAlertTypeButton" button
    And I choose the "邮件告警" from the "AlertNoteTypeListButton"
    And I wait for loading complete
    And I click the "MailAlertLabel" button
    And I wait for loading complete
    And I click the "MailReceiverButton" button
    And I wait for "2000" millsecond
#    When I set the parameter "MailReceiver" with value "2312200836@qq.com"
#    And I wait for loading complete
    And I choose the "2312200836@qq.com" from the "MailReceiverList"
    And I wait for loading complete
    And I wait for "2000" millsecond
#    And I click the "mailReceiverLabel" button
    And I wait for loading complete

    And I wait for "MailAlertContentPanel" will be visible
    And I select all text in "MailAlertContentPanel" alert element
    And I wait for "2000" millsecond

    And I click the "TestRunButton" button
    And I wait for loading complete

    And I wait for element "TestRunReminder" change text to "提示"
    Then take a screenshot with name "actual/trm_<name>"
    And I wait for element "TestRunReminderText" change text to "<name>"
    And I wait for element "TestRunReminderText" change text to "successful"
    When I click the "AffirmButton" button

    Examples:
      | name                                                     |
      |	api01_字段统计_最大数status_扩展chart键值_邮件	|
      |	api3_all_事件计数_设备切分ip_扩展chart_all抑制45	|
      |	api3_all_连续统计_status<404_低_邮件	|
      |	api3_all_连续统计_status=200_邮件_抑制59	|
      |	api3_all_连续统计_status>=200_邮件_合并	|
      |	api3_nods_事件数_ping主机	|
      |	api3_spl统计stats_dc_邮件	|
      |	api3_事件_multiwords_切分_扩展chart插图_键值_邮件	|
      |	api3_基线_len_24hours大于100_邮件	|
      |	api3_基线_len_24hour小于100_邮件	|
      |	api3_基线_len_24hour小于100_邮件_抑制10-120m16:06	|
      |	api3_基线_len_24hour小于100_邮件_抑制10-30m	|
      |	api3_字段统计_分组事件数status_邮件	|
      |	api3_字段统计_去重数status_邮件	|
      |	api3_字段统计_平均数resplen_邮件	|
      |	api3_字段统计_总和status_邮件	|
      |	api3_字段统计_最小数resplen_邮件_不告警	|
      |	api3_连续统计_status>200_扩展chat_键值_all_连续触发3次	|
      |	api4_spl统计avg_高_扩展avg_邮件_搜索宏	|
      |	api4_spl统计bucket_扩展bucket	|
      |	api4_基线_status_在区间外_邮件_同比1天前	|
      |	api4_基线_status_在区间外_邮件_同比2天前	|
      |	api4_基线_status_在区间外_邮件_同比3天前	|
      |	api4_基线_status_在区间外_邮件_同比4天前	|
      |	api4_基线_status_在区间外_邮件_同比5天前	|
      |	api4_基线_status_在区间外_邮件_同比6天前	|
      |	api4_基线_status_在区间外_邮件_同比一周前	|
      |	api4_基线_status_在区间外_邮件_同比一月前	|
      |	api4_基线_status_在区间外_邮件_环比上一时间段	|
      |	api7_guest_ds200_事件数_邮件	|
      |	api7_nods_事件数_rsyslog	|
      |	api7_nods_字段统计ip_20秒_邮件	|
      |	api7_spl统计avg_高_扩展avg_all	|
      |	api9_all_事件计数_设备切分ip_扩展chart_all_spark	|
      |	api9_事件_multiwords_切分_扩展chart插图_键值_邮件_splark	|
      |	api9_字段统计_切分ip_最大数status_扩展chart键值_all_spark	|
      |	api_RZY-2980:新建监控-基本配置-执行计划-crontab-周一到周五下午14：00~14：45之间	|