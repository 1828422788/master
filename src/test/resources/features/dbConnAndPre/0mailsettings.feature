@setting @autoui02
Feature: 配置发送邮箱

  Background:
    Given open the "system.CustomConfigs" page for uri "/system/"

  @mailset
  Scenario Outline: 执行
    And I wait for loading complete
    When I click the "MailServerSet" button
    And I wait for loading complete
    When I set the parameter "SMTPPort" with value "<SMTPPort>"
    And I wait for "3000" millsecond
    When I set the parameter "SMTPAddress" with value "<SMTPAddress>"
    And I wait for "3000" millsecond
    When I set the parameter "SendEmail" with value "<SendEmail>"
    And I wait for "3000" millsecond
    When I set the parameter "EmailPassword" with value "<EmailPassword>"
    And I wait for "3000" millsecond
    When I set the parameter "EmailLogName" with value "sender"

    Examples:
      | SMTPPort | SMTPAddress      | SendEmail            | EmailPassword    |
      | 465      | smtp.exmail.qq.com | tools@yottabyte.cn | UtOiRnil&.6Co4 |
