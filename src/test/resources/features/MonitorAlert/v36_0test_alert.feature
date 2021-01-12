Feature: 批量修改邮件邮箱

  @addmail1
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
      | name     | FunctionName | Parameter                                                                                                                                                                                                                                                                                   | Result                 |
      | api00_spl统计ip_cnt_9分钟_高_扩展chart_all_宏 | emailType    | {'title':'auto test alert.','email':['autotest@yottabyte.cn'],'condition':[''],'content':''}                                                                                                                                                                                                | success message "保存成功" |
