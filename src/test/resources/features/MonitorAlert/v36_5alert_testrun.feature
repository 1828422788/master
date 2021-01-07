Feature:

  @testrun @alertcase
  Scenario Outline:
    And I wait for loading invisible
    Given open the "alert.ListPage" page for uri "/alerts/"
    When I set the parameter "AlertListSearchInput" with value "<name>"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button

    Then I will see the "alert.CreatePage" page
    And I wait for loading invisible
    And I click the "AlertNoteTypeTab" button
    And I click the "MailAlertLabel" button
    And I wait for loading invisible

    And I click the "TestRunButton" button
    And I wait for loading invisible

    And I wait for element "TestRunReminder" change text to "提示"
    And I wait for element "TestRunAlertName" change text to "<name>"
    And I wait for element "TestRunAlertName" change text to "successful"
    Then take a screenshot with name "actual/testRun_<name>"
    And I click the "PreviewConfigButton" button

    Examples:
      | name                                                     |
      | api00_按行发送_抑制_连续触发3次_分组字段ip                              |
      | api00_all_事件计数_设备切分ip_扩展chart_all_合并                     |
      | api00_spl统计ip_cnt_9分钟_高_扩展chart_all_宏                    |
      | api00_spl统计ip_cnt_高_扩展chart_all_合并                       |
      | api00_spl统计where_ip_20分钟_cnt_高_扩展chart_all               |
      | api00_基线_status_在区间外_邮件_合并                               |
      | api00_基线_status_在区间外_邮件_合并_交易日                           |
      | api00_字段统计_切分ip_最大数status_扩展chart键值_all_spark            |
      | api00_字段统计_切分ip_最大数status_扩展chart键值_all_交易日              |
      | api00_字段统计_切分ip_最大数status_扩展chart键值_all_合并               |
      | api00_字段统计_切分ip_最大数status_扩展chart键值_all_抑制               |
      | api00_字段统计_切分ip_最大数status_扩展chart键值_all_抑制连续触发           |
      | api00_字段统计_切分ip_最大数status_扩展chart键值_all_抑制间隔持续翻倍10-90min |
      | api00_连续统计_status<=502_扩展chat_键值_all_合并                  |
      | api00_连续统计_status<=502_扩展chat_键值_all_合并_交易日              |
      | api01_all_事件计数_扩展chart_all_合并                            |
      | api01_字段统计_最大数status_扩展chart键值_邮件_合并                     |
      | api0_all_事件数_扩展chart_all_sample_合并                       |
      | api0_all_事件计数_设备切分ip_扩展chart_all_spark                   |
      | api0_all_事件计数_设备切分ip_扩展chart_all_交易日                     |
      | api0_all_事件计数_设备切分ip_扩展chart_all抑制45                     |
      | api0_基线_status_在区间内_all_合并                               |
      | api1_all_连续统计_status>=200_邮件_合并                          |
      | api1_spl统计avg_高_扩展avg_all                                |
      | api1_spl统计avg_高_扩展avg_all_搜索宏_扩展宏                        |
      | api1_事件_multiwords_切分_扩展chart插图_键值_邮件                    |
      | api1_事件_multiwords_切分_扩展chart插图_键值_邮件_splark             |
