@agent_script @agentCollect
Feature: Agent编辑脚本类型数据源

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    And I zoom the browse to full screen
    When I click the detail which column is "0" in agent page
    And switch to another window
    And I close all tabs except main tab
    And I will see the "agent.CreatePage" page

  @agentCollectSmoke
  Scenario:新建脚本类型数据源
    And I wait for loading invisible
    And I click the "Create" button
    And I click the "ScriptType" button
    And I click the "Next" button
    And I set the parameter "ScriptFile" with value "/sbin/service"
    And I set the parameter "Param" with value "rsyslog status"
    And I set the parameter "ChangeRowRule" with value "\n"
    And I set the parameter "Interval" with value "120"
    And I click the "Next" button
    And I wait for "Appname" will be visible
    And I set the parameter "Appname" with value "autohekascripttest"
    And I set the parameter "Tag" with value "autohekascripttest"
    And I click the "Next" button
    And I will see the element "CheckScriptFile" name is "/sbin/service"
    And I will see the element "CheckParam" name is "rsyslog status"
    And I will see the element "CheckChangeRowRule" name is "\n"
    And I will see the element "CheckInternal" name is "120 秒"
    And I wait for "Finish" will be visible
    And I click the "Finish" button
    And I will see the element "Addsuccessmsg" name is "添加成功"

  Scenario: 脚本数据源禁用
    Given the data name "autohekascripttest" in agent table "ScriptTable" then i click the "close" switch
    Then I wait for loading invisible
    And I wait for element "ScriptSwitchStatus" change text to "已禁用"

  Scenario: 脚本数据源启用
    Given the data name "autohekascripttest" in agent table "ScriptTable" then i click the "open" switch
    Then I wait for loading invisible
    And I wait for element "ScriptSwitchStatus" change text to "已启用"

  @agentCollectSmoke
  Scenario:脚本数据源修改可执行文件
    Given the data name "autohekascripttest" in table "ScriptTable" then i click the "编辑" button
    And I set the parameter "ExcuteFile" with value "/bin/ls"
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible

  Scenario:脚本数据源修改参数
    Given the data name "autohekascripttest" in table "ScriptTable" then i click the "编辑" button
    And I set the parameter "Param" with value "/opt/rizhiyi/parcels/heka-3.1.0.17/add_on/unix/audit.sh"
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible

  Scenario:脚本数据源修改换行规则
    Given the data name "autohekascripttest" in table "ScriptTable" then i click the "编辑" button
    And I set the parameter "ChangeRowRule" with value "\t"
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible

  Scenario:脚本数据源修改时间间隔
    Given the data name "autohekascripttest" in table "ScriptTable" then i click the "编辑" button
    And I set the parameter "InternalTime" with value "50"
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible

  Scenario Outline:脚本数据源修改时间间隔种类
    Given the data name "autohekascripttest" in table "ScriptTable" then i click the "编辑" button
    When I choose the "<Internaltimekind>" from the "InternalTimeKind"
    Then I wait for "1000" millsecond
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible

    Examples:
      | Internaltimekind |
      | 小时               |
      | 天                |
      | 分钟               |
      | 秒                |

  Scenario Outline: 脚本数据源配置修改字符集
    Given the data name "autohekascripttest" in table "ScriptTable" then i click the "编辑" button
    When I choose the "<characterkind>" from the "CharacterKind"
    Then I wait for "1000" millsecond
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible

    Examples:
      | characterkind |
      |   utf-8    |
      |    gbk    |

  Scenario: 脚本数据源修改tag
    Given the data name "autohekascripttest" in table "ScriptTable" then i click the "编辑" button
    And I set the parameter "Tag" with value "ChangeautohekaSyslogtag"
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible

  Scenario: 脚本数据源修改appname
    Given the data name "autohekascripttest" in table "ScriptTable" then i click the "编辑" button
    And I set the parameter "Appname" with value "Changeautohekascripttest"
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible
    And I wait for loading invisible
    Given the data name "Changeautohekascripttest" in table "ScriptTable" then i click the "编辑" button
    And I set the parameter "Appname" with value "autohekascripttest"
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible

  @agentCollectSmoke
  Scenario: 脚本类型数据源删除
    Given the data name "autohekascripttest" in table "ScriptTable" then i click the "更多" button
    And I click the "Delete" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible

