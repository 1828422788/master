@agent_backup @agent2
Feature: Agent备份功能

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    When I click the detail which column is "1" in agent page
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible
    And I will see the "agent.CreatePage" page
    And I click the "BackUp" button
    And I wait for loading invisible

  Scenario: Agent备份，添加备份页面的修改&重启Agent高级配置
    And I click the "Senior" button
    And I click the "ChangeConfiguration" button
#    Then I will see the element "ChangeMemo" name is "提交修改 Agent 配置成功，正在尝试重启。"

  Scenario: Agent备份，添加备份页面的下载Agent高级配置
    And I click the "Senior" button
    And I click the "DownloadConfiguration" button

  Scenario: Agent备份，添加备份页面的关闭Agent高级配置
    And I click the "Senior" button
    And I click the "Cancle" button
    Then I wait for loading invisible
#    And I will see the "AgentConfigurationTitle" doesn't exist

  Scenario: Agent备份，添加备份
    And I click the "AddBackUP" button
    And I set the parameter "Document" with value "/data/rizhiyi/logs/heka"
    And I set the parameter "WhiteList" with value ".*\.log"
    And I set the parameter "BackUPTime" with value "0"
    And I wait for "Next" will be visible
    And I click the "Next" button
    And I wait for "Next" will be visible
    And I click the "Next" button
    And I click the "BackupLocalDisk" button
    And I set the parameter "BackUpRoot" with value "/tmp/"
    And I set the parameter "BackUpName" with value "hekabackup"
    And I set the parameter "BackUpTimeout" with value "1"
    And I click the "Next" button
    And I click the "Next" button
    And I wait for "Addsuccessmsg" will be visible
    And I will see the element "Addsuccessmsg" name is "添加成功"

  Scenario: 备份策略禁用
    Given the data name "hekabackup" in agent table "BackUpTable" then i click the "close" switch
    Then I wait for loading invisible
    Then I will see the element "BackUpSwitchStatus" name is "已禁用"

  Scenario: 备份策略启用
    Given the data name "hekabackup" in agent table "BackUpTable" then i click the "open" switch
    Then I wait for loading invisible
    Then I will see the element "BackUpSwitchStatus" name is "已启用"

#  Scenario: 备份策略新建目的对象
#    And I click the "AddBackUP" button
#    And I set the parameter "Document" with value "/data/rizhiyi/logs/heka"
#    And I set the parameter "WhiteList" with value ".*\.log"
#    And I set the parameter "BackUPTime" with value "0"
#    And I click the "Next" button
#    And I wait for loading invisible
#    And I click the "Next" button
#    And I click the "CreateDestObject" button
#    And I set the parameter "DestObjectName" with value "autotest"
#    And I set the parameter "ThreadNum" with value "4"
#    And I set the parameter "ServerAddress" with value "192.168.1.2:10001"
#    And I set the parameter "TimeOut" with value "30"
#    Then I wait for loading invisible
#    And I wait for "Save" will be visible
#    And I click the "Save" button
#    Then I will see the element "ChangeMemo" name is "保存成功"
#
#
#  Scenario: 备份策略编辑目的对象安全链接
#    And I click the "AddBackUP" button
#    And I set the parameter "Document" with value "/data/rizhiyi/logs/heka"
#    And I set the parameter "WhiteList" with value ".*\.log"
#    And I set the parameter "BackUPTime" with value "0"
#    And I click the "Next" button
#    And I click the "Next" button
#    And I click the "BackUpObject" button
#    And I click the "EditBackUpObject" button
#    And I click the "SecuritySwitchStatus" button
#    And I click the "Save" button
#    And I wait for "ChangeMemo" will be visible
#    Then I will see the element "ChangeMemo" name is "修改成功"
#
#  Scenario: 备份策略编辑目的对象处理线程数
#    And I click the "AddBackUP" button
#    And I set the parameter "Document" with value "/data/rizhiyi/logs/heka"
#    And I set the parameter "WhiteList" with value ".*\.log"
#    And I set the parameter "BackUPTime" with value "0"
#    And I click the "Next" button
#    And I click the "Next" button
#    And I click the "BackUpObject" button
#    And I click the "EditBackUpObject" button
#    And I set the parameter "ThreadNum" with value "1"
#    And I click the "Save" button
#    And I wait for "ChangeMemo" will be visible
#    Then I will see the element "ChangeMemo" name is "修改成功"
#
#  Scenario Outline: 备份策略编辑目的对象服务器地址
#    And I click the "AddBackUP" button
#    And I set the parameter "Document" with value "/data/rizhiyi/logs/heka"
#    And I set the parameter "WhiteList" with value ".*\.log"
#    And I set the parameter "BackUPTime" with value "0"
#    And I click the "Next" button
#    And I click the "Next" button
#    And I click the "BackUpObject" button
#    And I click the "EditBackUpObject" button
#    And I set the parameter "ServerAddress" with value "<serveraddress>"
#    And I click the "Save" button
#    And I wait for "ChangeMemo" will be visible
#    Then I will see the element "ChangeMemo" name is "修改成功"
#
#  Examples:
#  | serveraddress |
#  |   192.168.1.3:10003    |
#  |   192.168.1.2:10001,192.168.1.3:10003   |
#
#  Scenario: 备份策略编辑目的对象超时秒数
#    And I click the "AddBackUP" button
#    And I set the parameter "Document" with value "/data/rizhiyi/logs/heka"
#    And I set the parameter "WhiteList" with value ".*\.log"
#    And I set the parameter "BackUPTime" with value "0"
#    And I click the "Next" button
#    And I click the "Next" button
#    And I click the "BackUpObject" button
#    And I click the "EditBackUpObject" button
#    And I set the parameter "TimeOut" with value "20"
#    And I wait for loading invisible
#    And I click the "Save" button
#    And I wait for "ChangeMemo" will be visible
#    Then I will see the element "ChangeMemo" name is "修改成功"
#
#  Scenario: 备份策略编辑目的对象删除
#    And I click the "AddBackUP" button
#    And I set the parameter "Document" with value "/data/rizhiyi/logs/heka"
#    And I set the parameter "WhiteList" with value ".*\.log"
#    And I set the parameter "BackUPTime" with value "0"
#    And I click the "Next" button
#    And I click the "Next" button
#    And I wait for loading invisible
#    And I click the "BackUpObject" button
#    And I click the "DeleteBackUpObject" button
#    And I wait for loading invisible
#    And I click the "Ensure" button
#    And I wait for "ChangeMemo" will be visible
#    Then I will see the element "ChangeMemo" name is "删除目的对象成功。"

  Scenario: 备份策略删除
    Then I wait for loading invisible
    Given the data name "hekabackup" in table "BackUpTable" then i click the "删除" button
    And I wait for loading invisible
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible
    Then I will see the element "ChangeMemo" name is "删除备份配置成功"



