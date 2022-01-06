@clean @cleanSecond @cleanIndex @indexSettingSmoke @indexSetting
Feature: topic删除（RZY-2429）

  Background:
    Given open the "index.TopicSetting" page for uri "/topicsettings/"

  Scenario:删除topic
#    When the data name is "topictest" then i click the "删除" button
    When the data name is "{'column':'0','name':'topictest'}" then i click the "删除" button in more menu
    And I click the "Ensure" button