@manager
Feature: manager 命令行工具

  Background:
    Given I will see the "manager.ListPage" page
    And I click the "Tools" button under some element
    Then I click the "CommandTool" button under some element

  Scenario: RZY-2834:命令行工具_kafka_创建topic
    When I click the "CreateTopic" button
    And I set the parameter "TopicName" with value "UI_auto_test"
    And I click the "GenerateCmd" button
    And I click the "Run" button
    And I wait for "CmdStatus" will be visible

  Scenario: RZY-2833:命令行工具_kafka_查看topic列表
    When I click the "GenerateCmd" button
    And I use the method "compareCommand" with parameter "CmdParams,GeneratedCmd"
    And I click the "Run" button
    And I wait for "CmdStatus" will be visible
    Then I will see the element "CmdDetail" contains "UI_auto_test"

  Scenario: RZY-2835:命令行工具_kafka_调整topic_Partition个数
    When I click the "AlterTopicPartition" button
    And I set the parameter "TopicName" with value "UI_auto_test"
    And I click the "GenerateCmd" button
    Then I use the method "compareTopicCommand" with parameter "Zkip,GeneratedCmd"

  Scenario: RZY-2836:命令行工具_kafka_查看topic中数据
    When I click the "LookupTopic" button
    And I set the parameter "TopicName" with value "UI_auto_test"
    And I click the "GenerateCmd" button
    Then I use the method "compareLookupTopicCommand" with parameter "Zkip,GeneratedCmd"
