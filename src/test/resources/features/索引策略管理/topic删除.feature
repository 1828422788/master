@clean @cleanSecond @cleanIndex
Feature: topic删除（RZY-2429）

  Background:
    Given open the "index.TopicSetting" page for uri "/indexsettings/topicsettings/"

  Scenario:
    When the data name is "topictest" then i click the "删除" button
    And I click the "Ensure" button