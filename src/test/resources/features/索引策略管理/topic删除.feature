@clean @cleanSecond @cleanIndex @indexSettingSmoke
Feature: topic删除（RZY-2429）

  Background:
<<<<<<< HEAD
    Given open the "index.TopicSetting" page for uri "/topicsettings/"
=======
    Given open the "index.TopicSetting" page for uri "/indexmatchrules/topicsettings/"
>>>>>>> V3.5

  Scenario:
    When the data name is "topictest" then i click the "删除" button
    And I click the "Ensure" button