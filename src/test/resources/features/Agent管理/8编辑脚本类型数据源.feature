@agent @agent_script
Feature: Agent编辑脚本类型数据源

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    When I click the detail which column is "1" in agent page
    And switch to another window
    And I will see the "agent.CreatePage" page

  Scenario:新建脚本类型数据源
    And I wait for loading invisible
    And I click the "Create" button
    And I click the "ScriptType" button
    And I set the parameter "ScriptFile" with value "/sbin/service"
    And I set the parameter "Param" with value "rsyslog status"
    And I set the parameter "ChangeRowRule" with value "\n"
    And I set the parameter "Interval" with value "120"
    And I click the "Next" button
    And I wait for loading invisible
    And I set the parameter "Appname" with value "autohekascripttest"
    And I set the parameter "Tag" with value "autohekascripttest"
    And I click the "Next" button
    And I will see the element "CheckScriptFile" name is "/sbin/service"
    And I will see the element "CheckParam" name is "rsyslog status"
    And I will see the element "CheckChangeRowRule" name is "\n"
    And I will see the element "CheckInternal" name is "120 秒"
    And I click the "Next" button
    And I will see the element "Addsuccessmsg" name is "添加成功"

  Scenario:编辑修改可执行文件
    And I click the "EditAutoScript" button
    And I set the parameter "ExcuteFile" with value "/bin/ls"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"

  Scenario:编辑修改参数
    And I click the "EditAutoScript" button
    And I set the parameter "Param" with value "/opt/rizhiyi/parcels/heka-3.1.0.17/add_on/unix/audit.sh"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"

  Scenario:编辑修改换行规则
    And I click the "EditAutoScript" button
    And I set the parameter "ChangeRowRule" with value "\t"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"

  Scenario:编辑修改时间间隔
    And I click the "EditAutoScript" button
    And I set the parameter "InternalTime" with value "50"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"

  Scenario Outline:编辑修改时间间隔种类
    And I click the "EditAutoScript" button
    When I choose the "<Internaltimekind>" from the "InternalTimeKind"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"

    Examples:
      | Internaltimekind |
      | 小时               |
      | 天                |
      | 分钟               |
      | 秒                |

  Scenario Outline: Syslog配置修改字符集
    And I click the "EditAutoScript" button
    When I choose the "<characterkind>" from the "CharacterKind"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"
    Examples:
      | characterkind |
      |   utf-8    |
      |    gbk    |

  Scenario: 文件目录配置修改tag
    And I click the "EditAutoScript" button
    And I set the parameter "Tag" with value "ChangeautohekaSyslogtag"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"

  Scenario: 文件目录配置修改appname
    And I click the "EditAutoScript" button
    And I set the parameter "Appname" with value "Changeautohekascripttest"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"
    Given the data name "Changeautohekascripttest" in table "ScriptTable" then i click the "编辑" button
    And I set the parameter "Appname" with value "autohekascripttest"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"

  Scenario: 文件目录数据源禁用
    Given the data name "autohekascripttest" in agent table "ScriptTable" then i click the "close" switch
    Then I wait for loading invisible
    Then I will see the element "ScriptSwitchStatus" name is "已禁用"


  Scenario: 文件目录数据源启用
    Given the data name "autohekascripttest" in agent table "ScriptTable" then i click the "open" switch
    Then I wait for loading invisible
    Then I will see the element "ScriptSwitchStatus" name is "已启用"

  Scenario: 脚本类型数据源删除
    Given the data name "autohekascripttest" in table "ScriptTable" then i click the "删除" button
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "删除 Agent 配置成功。"
    And I close all windows
