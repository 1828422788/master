@bvtalert @alertcase
Feature:监控预览

  @bvtalert0 @preview0
  Scenario Outline:
    Given open the "alert.ListPage" page for uri "/alerts/"
    Given I wait for loading complete
    When I set the parameter "AlertListSearchInput" with value "<name>"
    Given I wait for loading complete
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button

    Then I will see the "alert.CreatePage" page
    Given I wait for loading complete
    Given I wait for loading complete

    And I click the "AlertNoteTypeTab" button
    Given I wait for loading complete
    And I click the "MailAlertLabel" button
    Given I wait for loading complete

    And I choose the "2312200836@qq.com" from the "MailReceiverList"
    Given I wait for loading complete
    And I wait for "2000" millsecond
    And I click the "mailReceiverLabel" button
    Given I wait for loading complete
    And I wait for "2000" millsecond

    When I wait for "MailAlertContentPanel" will be visible
    And I select all text in "MailAlertContentPanel" alert element
    Given I wait for loading complete
    And I wait for "2000" millsecond

    When I click the "PreviewButton" button
    Given I wait for loading complete
    And I wait for "9000" millsecond

    And I wait for element "PreviewReminder" change text to "提示"
    Then take a screenshot with name "actual/preview_<name>"
#    And I wait for element "PreviewAlertReminderText" change text to "<name>"
    When I click the "AffirmButton" button

    Examples:
      | name                                                   |
      |	api3_nods_事件数_ping主机	|
      |	api00_spl统计ip_cnt_高_扩展chart_all_宏	|
      |	api00_all_事件数_扩展chart_all_sample_合并	|
      |	api3_nods_事件数_ping主机	|
      |	api3_事件_multiwords_切分_扩展chart插图_键值_邮件	|
      |	api4_spl统计bucket_扩展bucket	|
      |	api7_nods_字段统计ip_20秒_邮件	|
      |	api7_spl统计avg_高_扩展avg_all	|