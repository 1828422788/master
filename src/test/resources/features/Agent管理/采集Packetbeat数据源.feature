@agent_packetbeat
Feature: Agent编辑Packetbeat类型数据源

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    When I click the detail which column is "1" in agent page
    And switch to another window
    And I close all tabs except main tab
    And I will see the "agent.CreatePage" page

  Scenario:新建Packetbeat类型数据源
    And I wait for loading invisible
    And I click the "Create" button
    And I click the "PacketbeatType" button
    And I set the parameter "BeatsAppname" with value "autoPacketbeattest"
    And I set the parameter "BeatsTag" with value "autoPacketbeattest"
    And I click the "Next" button
    And I click the "Next" button
    And I will see the element "Addsuccessmsg" name is "添加成功"

  Scenario: Packetbeat数据源禁用
    Given the data name "autoPacketbeattest" in agent table "PacketbeatTable" then i click the "close" switch
    Then I wait for loading invisible
    And I wait for "2000" millsecond
    Then I will see the element "PacketbeatSwitchStatus" name is "已禁用"

  Scenario: Packetbeat数据源启用
    Given the data name "autoPacketbeattest" in agent table "PacketbeatTable" then i click the "open" switch
    Then I wait for loading invisible
    And I wait for "2000" millsecond
    Then I will see the element "PacketbeatSwitchStatus" name is "已启用"

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
    Then I wait for "1000" millsecond
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"


    Examples:
      | Internaltimekind |
      | 小时               |
      | 天                |
      | 分钟               |
      | 秒                |

