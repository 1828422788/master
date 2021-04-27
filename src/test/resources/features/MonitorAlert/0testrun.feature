@chsrun
Feature: 测试运行-邮件

  Scenario Outline:  Scenario Outline:
    Given I wait for loading complete
    Given open the "alert.ListPage" page for uri "/alerts/"
    When I set the parameter "AlertListSearchInput" with value "<name>"
    And I wait for loading complete
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button
#    Then I click the "AlertListEditButton" button

    Then I will see the "alert.CreatePage" page
    And I wait for loading complete
    Given I wait for loading complete

    And I click the "AlertNoteTypeTab" button
    Given I wait for loading complete
#    And I click the "AddAlertTypeButton" button
#    And I choose the "邮件告警" from the "AlertNoteTypeListButton"
#    Given I wait for loading complete
    And I click the "MailAlertLabel" button
    Given I wait for loading complete

    And I choose the "2312200836@qq.com" from the "MailReceiverList"
    Given I wait for loading complete
    And I wait for "2000" millsecond
    And I click the "mailReceiverLabel" button
    Given I wait for loading complete

    And I wait for "MailAlertContentPanel" will be visible
    And I select all text in "MailAlertContentPanel" alert element
    Given I wait for loading complete
    And I wait for "2000" millsecond

    And I click the "TestRunButton" button
    Given I wait for loading complete
    And I wait for "2000" millsecond

    And I wait for element "TestRunReminder" change text to "提示"
    Then take a screenshot with name "actual/trm_<name>"
    And I wait for element "TestRunReminderText" change text to "<name>"
    And I wait for element "TestRunReminderText" change text to "successfu"
    Given I wait for loading complete
    When I click the "AffirmButton" button

    Examples:
      | name                    |
      |	api3_nods_事件数_ping主机	|
#      |	api3_nods_事件数_ping主机	|

