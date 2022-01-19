@agent_backup @agent2 @agentSmoke2
Feature: Agent备份功能

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
#    And I zoom the screen up to the maximum
    And I zoom the browse to full screen
    And I wait for loading invisible
    When I click the detail which column is "0" in agent page
#    When I click the detail which name is "253" in agent page
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible
    And I will see the "agent.CreatePage" page
    And I move the mouse pointer to the "DetailMoreButton"
    And I click the "BackUp" button
#    And I choose the "备份配置" from the "DetailMoreButton"
    And I wait for loading invisible

  Scenario: Agent备份，添加备份页面的修改&重启Agent高级配置
    And I click the "BackupSenior" button
    And I click the "ChangeConfiguration" button
#    Then I will see the element "ChangeMemo" name is "提交修改 Agent 配置成功，正在尝试重启。"
    And I wait for "3000" millsecond   

  Scenario: Agent备份，添加备份页面的下载Agent高级配置
    And I click the "BackupSenior" button
    And I wait for "2000" millsecond
    And I click the "DownloadConfiguration" button
    And I wait for "2000" millsecond

  Scenario: Agent备份，添加备份页面的关闭Agent高级配置
    And I click the "BackupSenior" button
    And I click the "Cancle" button
    Then I wait for loading invisible
#    And I will see the "AgentConfigurationTitle" doesn't exist

  Scenario: Agent备份，添加备份到本地磁盘
    And I click the "AddBackUP" button
    And I set the parameter "Document" with value "/data/rizhiyi/logs/heka"
    And I set the parameter "WhiteList" with value ".*\.log"
    And I set the parameter "BackUPTime" with value "0"
    And I wait for "Next" will be visible
    And I click the "Next" button
    And I wait for loading invisible
    And I click the "Next" button
#    And I click the "Next" button
    And I wait for "BackupLocalDisk" will be visible
    And I click the "BackupLocalDisk" button
    And I set the parameter "BackUpRoot" with value "/tmp/"
    And I set the parameter "BackUpName" with value "hekabackup"
    And I set the parameter "BackUpTimeout" with value "1"
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Finish" button
    And I wait for "Addsuccessmsg" will be visible
    And I will see the element "Addsuccessmsg" name is "添加成功"

  Scenario: 备份策略禁用
    Given the data name "hekabackup" in agent table "BackUpTable" then i click the "close" switch
    Then I wait for loading invisible
    And I wait for element "BackUpSwitchStatus1" change text to "已禁用"


  Scenario: 备份策略启用
    Given the data name "hekabackup" in agent table "BackUpTable" then i click the "open" switch
    Then I wait for loading invisible
    And I wait for element "BackUpSwitchStatus1" change text to "已启用"

  Scenario: 备份策略新建目的对象
    And I click the "AddBackUP" button
    And I set the parameter "Document" with value "/data/rizhiyi/logs/heka"
    And I set the parameter "WhiteList" with value ".*\.log"
    And I set the parameter "BackUPTime" with value "0"
    And I wait for "Next" will be visible
    And I click the "Next" button
    And I wait for loading invisible
    And I click the "Next" button
    And I click the "CreateDestObject" button
    And I set the parameter "DestObjectName" with value "autotest"
    And I set the parameter "ThreadNum" with value "4"
    And I set the parameter "ServerAddress" with value "192.168.1.2:10001"
    And I set the parameter "TimeOut" with value "30"
    And I wait for "Save" will be visible
    And I click the "Save" button
    And I wait for "ChangeMemo" will be visible
#    And I will see the success message "保存成功"

#  备份策略备份到目的磁盘

  Scenario: 备份策略编辑目的对象安全链接
    And I click the "AddBackUP" button
    And I set the parameter "Document" with value "/data/rizhiyi/logs/heka"
    And I set the parameter "WhiteList" with value ".*\.log"
    And I set the parameter "BackUPTime" with value "0"
#    Given the data name "hekabackup" in table "BackUpTable" then i click the "编辑" button
    And I wait for "Next" will be visible
    And I click the "Next" button
    And I wait for loading invisible
    And I click the "Next" button
    And I click the "BackUpObject" button
    And I click the "EditBackUpObject" button
    And I click the "SecuritySwitchStatus" button
    And I click the "Save" button
    And I wait for "ChangeMemo" will be visible
#    Then I will see the element "ChangeMemo" name is "修改成功"

  Scenario: 备份策略编辑目的对象处理线程数
    And I click the "AddBackUP" button
    And I set the parameter "Document" with value "/data/rizhiyi/logs/heka"
    And I set the parameter "WhiteList" with value ".*\.log"
    And I set the parameter "BackUPTime" with value "0"
    And I wait for "Next" will be visible
    And I click the "Next" button
    And I wait for loading invisible
    And I click the "Next" button
    And I click the "BackUpObject" button
    And I click the "EditBackUpObject" button
    And I set the parameter "ThreadNum" with value "1"
    And I click the "Save" button
    And I wait for "ChangeMemo" will be visible
#    And I will see the success message "修改成功"
#    Then I will see the element "ChangeMemo" name is "修改成功"

  Scenario Outline: 备份策略编辑目的对象服务器地址
    And I click the "AddBackUP" button
    And I set the parameter "Document" with value "/data/rizhiyi/logs/heka"
    And I set the parameter "WhiteList" with value ".*\.log"
    And I set the parameter "BackUPTime" with value "0"
    And I click the "Next" button
    And I wait for loading invisible
    And I click the "Next" button
    And I click the "BackUpObject" button
    And I click the "EditBackUpObject" button
    And I set the parameter "ServerAddress" with value "<serveraddress>"
    And I click the "Save" button
    And I wait for "ChangeMemo" will be visible
#    Then I will see the element "ChangeMemo" name is "修改成功"

  Examples:
  | serveraddress |
  |   192.168.1.3:10003    |
  |   192.168.1.2:10001,192.168.1.3:10003   |

  Scenario: 备份策略编辑目的对象超时秒数
    And I click the "AddBackUP" button
    And I set the parameter "Document" with value "/data/rizhiyi/logs/heka"
    And I set the parameter "WhiteList" with value ".*\.log"
    And I set the parameter "BackUPTime" with value "0"
    And I click the "Next" button
    And I wait for loading invisible
    And I click the "Next" button
    And I click the "BackUpObject" button
    And I click the "EditBackUpObject" button
    And I set the parameter "TimeOut" with value "20"
    And I wait for loading invisible
    And I click the "Save" button
    And I wait for "ChangeMemo" will be visible
#    Then I will see the element "ChangeMemo" name is "修改成功"

  Scenario: Agent备份，添加备份到目的对象
    And I click the "AddBackUP" button
    And I set the parameter "Document" with value "/data/rizhiyi/logs/heka"
    And I set the parameter "WhiteList" with value ".*\.log"
    And I set the parameter "BackUPTime" with value "0"
    And I wait for "Next" will be visible
    And I click the "Next" button
    And I wait for loading invisible
    And I click the "Next" button
#    And I click the "Next" button
    And I wait for "BackUpObject" will be visible
    And I click the "BackUpObject" button
    And I set the parameter "BackUpRoot1" with value "/tmp/"
    And I set the parameter "BackUpName" with value "fute"
    And I wait for "2000" millsecond
    And I set the parameter "BackUpRoute" with value "0 */1 * * * *"
    And I set the parameter "BackUpTimeout" with value "1"
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Finish" button
    And I wait for "Addsuccessmsg" will be visible
    And I will see the element "Addsuccessmsg" name is "添加成功"

  Scenario: 备份策略目的对象删除失败
    And I click the "AddBackUP" button
    And I set the parameter "Document" with value "/data/rizhiyi/logs/heka"
    And I set the parameter "WhiteList" with value ".*\.log"
    And I set the parameter "BackUPTime" with value "0"
    And I click the "Next" button
    And I wait for loading invisible
    And I click the "Next" button
    And I wait for loading invisible
    And I click the "BackUpObject" button
    And I click the "DeleteBackUpObject" button
#    And I wait for loading invisible
    And I click the "Ensure" button
    And I wait for "2000" millsecond
#    And I wait for "ChangeMemofail" will be visible
    Then I will see the element "ChangeMemofail" name is "删除目的对象失败，原因：Remote[autotest] is used by backup[fute]"

  Scenario: 去除对象依赖
    And I click the "FuteEdit" button
    And I click the "Next" button
    And I wait for "2000" millsecond
    And I click the "Next" button
    And I wait for "BackupLocalDisk" will be visible
    And I click the "BackupLocalDisk" button
    And I wait for "1000" millsecond
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Finish" button
    And I wait for "Addsuccessmsg" will be visible
    And I will see the element "Addsuccessmsg" name is "修改成功"


  Scenario: 备份策略目的对象删除成功
    And I click the "AddBackUP" button
    And I set the parameter "Document" with value "/data/rizhiyi/logs/heka"
    And I set the parameter "WhiteList" with value ".*\.log"
    And I set the parameter "BackUPTime" with value "0"
    And I click the "Next" button
    And I wait for loading invisible
    And I click the "Next" button
    And I wait for loading invisible
    And I click the "BackUpObject" button
    And I click the "DeleteBackUpObject" button
#    And I wait for loading invisible
    And I click the "Ensure" button
#    And I wait for "ChangeMemo" will be visible
    Then I will see the element "ChangeMemo" name is "删除目的对象成功。"

  Scenario: 分发目的对象
    Given the data name "hekabackup" in table "BackUpTable" then i click the "更多" button
    And I click the "Distribution" button
    And I wait for "1000" millsecond
    And I click the "AgentOne" button
    And I wait for "1000" millsecond
    And I click the "EnsureDistribution" button
    And I wait for element "ChangeMemoSuccess" change text to "操作成功。"

  Scenario: 检验分发结果
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I zoom the browse to full screen
    And I wait for loading invisible
    And I wait for "2000" millsecond
    And I click the "AgentOTN" button
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible
    And I will see the "agent.CreatePage" page
    And I move the mouse pointer to the "DetailMoreButton"
    And I click the "BackUp" button
    And I wait for loading invisible
    And I wait for element "OneBackup" change text to "hekabackup"


  Scenario Outline: 原始备份策略删除
    Then I wait for loading invisible
    Given the data name "<deletename>" in table "BackUpTable" then i click the "更多" button
    And I click the "Delete" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible
#    Then I will see the element "ChangeMemo" name is "删除备份配置成功"
  Examples:
    | deletename  |
    | hekabackup  |
    | fute        |
  Scenario: 分发备份策略删除
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I zoom the browse to full screen
    And I wait for loading invisible
    And I wait for "2000" millsecond
    And I click the "AgentOTN" button
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible
    And I will see the "agent.CreatePage" page
    And I move the mouse pointer to the "DetailMoreButton"
    And I click the "BackUp" button
    Then I wait for loading invisible
    Given the data name "hekabackup" in table "BackUpTable" then i click the "更多" button
    And I click the "Delete" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible




