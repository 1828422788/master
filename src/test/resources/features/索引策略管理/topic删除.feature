@clean @cleanSecond @cleanIndex @indexSettingSmoke
Feature: topic删除（RZY-2429）

  Background:
<<<<<<< HEAD
<<<<<<< HEAD
    Given open the "index.TopicSetting" page for uri "/topicsettings/"
=======
    Given open the "index.TopicSetting" page for uri "/indexmatchrules/topicsettings/"
>>>>>>> V3.5
=======
    Given open the "index.TopicSetting" page for uri "/indexmatchrules/topicsettings/"
>>>>>>> 5de9a0fa880b8d2b85102ab3f607855ddb1f6505

  Scenario:
    When the data name is "topictest" then i click the "删除" button
    And I click the "Ensure" button