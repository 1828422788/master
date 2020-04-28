@agent @agent_senior
Feature: Agent具体配置高级配置及清理缓存操作

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    When I click the detail which column is "1" in agent page
    And switch to another window
    And I close all tabs except main tab
    And I will see the "agent.CreatePage" page

  Scenario: 新建性能数据库类型数据源
    And I click the "Create" button
    And I click the "FuctionType" button
    And I set the parameter "SpecialPort" with value "23"
    And I click the "Next" button
    And I wait for loading invisible
    And I set the parameter "PreAppname" with value "autotop_info"
    And I set the parameter "Tag" with value "autotop_info"
    And I click the "Next" button
    And I click the "Finish" button
    And I will see the element "Addsuccessmsg" name is "添加成功"

  Scenario: 清理输入源缓存
    And I click the "CleanCache" button
    And I click the "CleanInputCache" button
    And I "checked" the label before "采集指标" in the agent
    And I click the "Clean" button
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "位于 192.168.1.139:10001 的 agent 正在 清理缓存"

  Scenario: 清理输出源缓存
    And I click the "CleanCache" button
    And I click the "CleanOutputCache" button
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "位于 192.168.1.139:10001 的 agent 正在 清理缓存"

  Scenario: 从Agent具体配置页面返回Agent主页面
    And I click the "BackList" button
    Then I will see the element "AgentMainTitle" name is "Agent 管理"

  Scenario: 从Agent添加页面返回Agent具体配置
    And I click the "Create" button
    And I click the "Backup" button
    Then I will see the element "AgentTitle" name is "Agent 具体配置"

  Scenario: 修改&重启Agent高级配置
    And I click the "Senior" button
    And I click the "ChangeConfiguration" button
#    Then I will see the element "ChangeMemo" name is "提交修改 Agent 配置成功，正在尝试重启。"

  Scenario: 下载Agent高级配置
    And I click the "Senior" button
    And I click the "DownloadConfiguration" button

  Scenario: 关闭Agent高级配置
    And I click the "Senior" button
    And I click the "Cancle" button
    And I will see the "AgentConfigurationTitle" doesn't exist

  Scenario: 性能数据源删除
    Given the data name ".*" in table "FuctionTypeTable" then i click the "删除" button
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "删除 Agent 配置成功。"

