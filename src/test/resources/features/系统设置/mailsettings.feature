@setting @autoui01
Feature: 配置发送邮箱

  Background:
    Given open the "system.CustomConfigs" page for uri "/system/"

  @mailset
  Scenario Outline: 执行
    When I set the parameter "SMTPPort" with value "<SMTPPort>"
    When I set the parameter "SMTPAddress" with value "<SMTPAddress>"
    When I set the parameter "SendEmail" with value "<SendEmail>"
    When I set the parameter "EmailPassword" with value "<EmailPassword>"
    When I set the parameter "EmailLogName" with value "sender"

    Examples:
      | SMTPPort | SMTPAddress      | SendEmail            | EmailPassword    |
      | 465      | smtp.vip.163.com | dfuture1@vip.163.com | RTQGPNDFYLCFBAFD |
