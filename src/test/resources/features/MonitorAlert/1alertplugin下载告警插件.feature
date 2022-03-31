@bvtalert @uplugins @alertSmoke
Feature: 下载告警插件

  Background:
    Given open the "alert.PluginPage" page for uri "/plugins/"

  Scenario: 下载告警插件成功
    Then I set the parameter "SearchInput" with value "ping_host"
    And I wait for "1000" millsecond
    And I click the "Download" button