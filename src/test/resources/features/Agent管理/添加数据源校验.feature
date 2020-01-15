Feature: 添加数据源校验

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible

  Scenario Outline: Agent添加数据源-单一数据源采集
#    And I set the agent parameter "IP" with running ip
    When I click the detail which column is "1" in agent page
    And switch to another window
    And I will see the "agent.CreatePage" page
    And I click the "Create" button
    And I click the "Next" button
    Then I will see the element "MemoMessage" name is "请检查输入项，确保完整正确再点击下一步。"
    Then I click the "Ensure" button
    Then I will see the element "RootMessage" name is "请务必输入路径"
    Then I will see the element "WhiteListMessage" name is "请务必输入白名单"
    And I set the parameter "WhiteList" with value "ntp\.log"
    And I click the "Next" button
    And I wait for loading invisible
    Then I will see the element "MemoMessage" name is "请检查输入项，确保完整正确再点击下一步。"
    Then I click the "Ensure" button
    Then I will see the element "RootMessage" name is "请务必输入路径"
    And I set the parameter "Document" with value "/d