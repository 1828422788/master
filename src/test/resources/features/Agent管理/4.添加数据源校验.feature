@agent
Feature: Agent添加数据源校验

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    When I click the detail which column is "1" in agent page
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible
    And I will see the "agent.CreatePage" page

  Scenario: 添加文件目录类型数据源校验
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
    And I set the parameter "Document" with value "/data/rizhiyi/logs"
    And I click the "Next" button
    And I click the "Back" button
    And I set the parameter "Document" with value "/data/rizhiyi/logs/heka"
    And I set the parameter "WhiteList" with value "hekad-daemon\.log"
    And I set the parameter "BlackList" with value "hekad\.stderr"
    And I set the parameter "LastChangeTime" with value "10"
    And I click the "Next" button
    And I click the "Next" button
    Then I will see the element "MemoMessage" name is "请检查输入项，确保完整正确再点击下一步。"
    And I click the "Ensure" button
    And I will see the element "PreviewMessage" name is "请务必选择一个文件用来预览。"
    And I click the "ChooseButton" button
    And I click the "Next" button


