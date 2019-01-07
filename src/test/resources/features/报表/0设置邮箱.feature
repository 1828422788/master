@smoke @reportSmoke @report @all
Feature: 报表所需邮箱配置

  Background:
    Given open the "system.CustomConfigs" page for uri "/system/custom/configs/"

  Scenario Outline:
    When I set the parameter "SMTPPort" with value "<port>"
    And I set the parameter "SMTPAddress" with value "<address>"
    And I set the parameter "SendEmail" with value "<sendEmail>"
    And I set the parameter "EmailPassword" with value "<password>"
    And I let element "EmailPassword" lose focus

    Examples:
      | port | address          | sendEmail           | password |
      | 465  | smtp.vip.163.com | dfuture@vip.163.com | wym0601  |