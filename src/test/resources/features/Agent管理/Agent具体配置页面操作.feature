@agent2
Feature: Agent具体配置高级配置及清理缓存操作

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    When I click the detail which column is "1" in agent page
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible
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
    And I wait for "ChangeMemo" will be visible

  Scenario: 清理输出源缓存
    And I click the "CleanCache" button
    And I click the "CleanOutputCache" button
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible

  Scenario: 从Agent具体配置页面返回Agent主页面
    And I click the "BackList" button
    Then I will see the element "AgentMainTitle" name is "Agent 管理"

  Scenario: 从Agent添加页面返回Agent具体配置
    And I click the "Create" button
    And I click the "Backup" button
    And I wait for loading invisible
    Then I will see the element "AgentTitle" name is "Agent 具体配置"

  Scenario: 修改&重启Agent高级配置
    And I click the "Senior" button
    And I click the "ChangeConfiguration" button
#    And I wait for "ChangeMemo" will be visible
#    Then I will see the element "ChangeMemo" name is "提交修改 Agent 配置成功，正在尝试重启。"

  Scenario: 下载Agent高级配置
    And I click the "Senior" button
    And I click the "DownloadConfiguration" button

  Scenario: 关闭Agent高级配置
    And I click the "Senior" button
    And I click the "Cancle" button
    Then I wait for loading invisible
#    And I will see the "AgentConfigurationTitle" doesn't exist

  Scenario: 性能数据源删除
    Given the data name ".*" in table "FuctionTypeTable" then i click the "删除" button
    And I wait for loading invisible
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible
    Then I will see the element "ChangeMemo" name is "删除 Agent 配置成功。"

  Scenario: 输出配置关闭输出压缩
    And I click the "OutputEdit" button
    And I click the "Compressed" button
    And I click the "Ensure" button
    And I wait for loading invisible
    And I will see the element "CompressStatus" name is "开启"

  Scenario: 输出配置开启输出压缩
    And I click the "OutputEdit" button
    And I click the "Compressed" button
    And I click the "Ensure" button
    And I wait for loading invisible
    And I will see the element "CompressStatus" name is "关闭"

  Scenario Outline: 输出配置修改发送速率限制
    And I click the "OutputEdit" button
    And I set the parameter "SendSpeedLimit" with value "100"
    And I choose the "<sendspeed>" from the "SendSpeed"
    And I click the "Ensure" button
    And I wait for loading invisible
    And I wait for "3000" millsecond
    And I will see the element "SendSpeedStatus" name is "<sendspeedstatus>"

    Examples:
      | sendspeed | sendspeedstatus |
      | KB/S      | 100.00 KB/s       |
      | B/S       | 100 B/s          |
      | MB/S      | 100.00 MB/s      |

  Scenario Outline: 输出配置修改单行日志最大长度
    And I click the "OutputEdit" button
    And I set the parameter "LogLength" with value "<loglength>"
    And I click the "Ensure" button
    And I wait for loading invisible
    And I wait for "3000" millsecond
    And I will see the element "LogLengthStatus" name is "<loglengthstatus>"

    Examples:
      | loglength | loglengthstatus |
      | 10000     | 10000 Byte      |
      | 65536     | 65536 Byte      |




