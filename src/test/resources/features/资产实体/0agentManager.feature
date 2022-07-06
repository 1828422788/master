@assetsModelSmoke @assetsModel
Feature: 租户系统-Agent管理-上传Heka

  Background:
    Given open the "saas.SaasLoginPage" page for uri "/auth/domainlogin/"

  Scenario Outline: 登录租户后上传Heka
    When I set the parameter "Username" with value "<name>"
    And I set the parameter "Password" with value "<password>"
    And I click the "LoginButton" button
    Given open the "saas.ListPage" page for uri "/domain/tenant/"
    Then I click the Element with text "Agent 管理"
    And I wait for loading invisible
    Given I click the Element with text "本地上传"
    And I wait for loading invisible
    #已在4和80机器上上传Heka安装包，路径均为/root/smokeTest
    And I upload a file with name "/root/smokeTest/heka-4_1_0.9-linux-amd64.tar.gz"
    And I wait the text "heka-4_1_0.9-linux-amd64.tar.gz 文件上传成功" occur in "90000" millsecond

    Examples:
      | name  | password          |
      | admin | admin@rizhiyi.com |