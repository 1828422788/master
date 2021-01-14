Feature: 测试运行-邮件

  @testrun0
  Scenario Outline:
    And I wait for loading invisible
    Given open the "alert.ListPage" page for uri "/alerts/"
    When I set the parameter "AlertListSearchInput" with value "<name>"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button

    Then I will see the "alert.CreatePage" page
    And I wait for loading invisible

    And I click the "AlertNoteTypeTab" button
    And I choose1 the "邮件告警" from the "AlertNoteTypeListButton"
    And I wait for loading invisible
    And I click the "MailAlertLabel" button
    And I wait for loading invisible
    When I set the parameter "MailReceiver" with value "backfuture@yeah.net"
    And I wait for loading invisible
    And I choose the "backfuture@yeah.net" from the "MailReceiverList"
    And I wait for loading invisible

    And I click the "TestRunButton" button
    And I wait for loading invisible

    And I wait for element "TestRunReminder" change text to "提示"
    And I wait for element "TestRunReminderText" change text to "<name>"
    Then take a screenshot with name "actual/trm_<name>"
    And I wait for element "TestRunReminderText" change text to "successful"
    When I click the "AffirmButton" button

    Examples:
      |	name	|
      |	api00_all_事件计数_设备切分ip_扩展chart_all_合并	|
