@recieve @cruxee @autoui02 @testc
Feature: Cruxee下载插件

  Background:
    Given open the "incident.SendPolicyPage" page for uri "/app/incident/settings/"
    When I click the "SendPolicyItem" button

  Scenario Outline: 下载
    Given I wait for loading complete
    And I click the "PluginButton" button
    And I set the parameter "noticeReceiveGroupNameSearchInput" with value "<inputFileName>"
    Then I click the Element with text "下载"

    Examples:
      | inputFileName  |
      | http_forwarder |