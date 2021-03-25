@bvtalert0 @bvtalert
Feature:监控预览

  @preview0
  Scenario Outline:
    And I wait for loading complete
    Given open the "alert.ListPage" page for uri "/alerts/"
    When I set the parameter "AlertListSearchInput" with value "<name>"
    And I wait for loading complete
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button

    Then I will see the "alert.CreatePage" page
    And I wait for loading complete

    And I click the "AlertNoteTypeTab" button
#    And I click the "AddAlertTypeButton" button
    And I choose the "邮件告警" from the "AlertNoteTypeListButton"
    And I wait for loading complete
    And I click the "MailAlertLabel" button
    And I wait for loading complete
    And I click the "MailReceiverButton" button
    And I wait for "2000" millsecond

    And I choose the "2312200836@qq.com" from the "MailReceiverList"
    And I wait for loading complete
    And I wait for "2000" millsecond
#    And I click the "mailReceiverLabel" button
    And I wait for loading complete

    And I wait for "MailAlertContentPanel" will be visible
    And I select all text in "MailAlertContentPanel" alert element
    And I wait for "2000" millsecond

    And I click the "PreviewButton" button
    And I wait for loading complete

    And I wait for element "PreviewReminder" change text to "提示"
    Then take a screenshot with name "actual/preview_<name>"
    And I wait for element "PreviewAlertReminderText" change text to "<name>"
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
