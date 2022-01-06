@bvtalert @alertcase @bvtalert3
Feature: 系统测试，测试运行-邮件

  Scenario Outline: 执行
    Given open the "system.CustomConfigs" page for uri "/system/"
    And I wait for loading complete
    When I click the "MailServerSet" button
    And I wait for loading complete
    When I set the parameter "EmailPassword" with value "<EmailPassword>"
    And I wait for "3000" millsecond
    When I set the parameter "EmailLogName" with value "sender"

    Examples:
      | EmailPassword    |
      | EDMIEMFKTIRAYEFI |

  Scenario Outline:  Scenario Outline:
    Given I wait for loading complete
    Given open the "alert.ListPage" page for uri "/alerts/"
    When I set the parameter "AlertListSearchInput" with value "<name>"
    And I wait for loading complete
    When the data name is "{'column':'1','name':'<name>'}" then i click the "编辑" button

    Then I will see the "alert.CreatePage" page
    And I wait for loading complete
    Given I wait for loading complete

    And I click the "AlertNoteTypeTab" button
    Given I wait for loading complete
    And I click the "MailAlertLabel" button
    Given I wait for loading complete

    And I click the "MailTestRunButton" button
    And I wait for "30000" millsecond
    Given I wait for loading complete

    And I wait for element "TestRunReminder" change text to "提示"
    Then take a screenshot with name "actual/trm_<name>"
    And I wait for element "TestRunReminderText" change text to "<name>"
    And I wait for element "TestRunReminderText" change text to "successfu"
    Given I wait for loading complete
    When I click the "AffirmButton" button

    Examples:
      | name                              |
      | api01_字段统计_最大数status_扩展chart键值_邮件 |


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

    When I click the "MailPreviewButton" button
    Given I wait for loading complete
    And I wait for "20000" millsecond

    And I wait for element "PreviewReminder" change text to "提示"
    Then take a screenshot with name "actual/preview_<name>"
    And I wait for element "PreviewAlertReminderText" change text to "<name>"

    Given I wait for loading complete
    When I click the "AffirmButton" button

    Examples:
      | name                              |
      | api01_字段统计_最大数status_扩展chart键值_邮件 |

  Scenario Outline: 执行
    Given open the "system.CustomConfigs" page for uri "/system/"
    And I wait for loading complete
    When I click the "MailServerSet" button
    And I wait for loading complete
    When I set the parameter "EmailPassword" with value "<EmailPassword>"
    And I wait for "3000" millsecond
    When I set the parameter "EmailLogName" with value "sender"

    Examples:
      | EmailPassword     |
      | EDMIEMFKTIRAYEFI1 |

