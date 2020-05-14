@agent_packetbeat @agent2
Feature: Agent编辑Packetbeat类型数据源

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    When I click the detail which column is "1" in agent page
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible
    And I will see the "agent.CreatePage" page

  Scenario:新建Packetbeat类型数据源
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

  Scenario Outline: Packetbeat数据源修改appname成功
    Given the data name "autoPacketbeattest" in table "PacketbeatTable" then i click the "编辑" button
    And I set the parameter "Appname" with value "<appnamekind>"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"

    Examples:
      | appnamekind         |
      | changePacketbeatsappname  |
      | changePacketbeatappname2 |
      | change_Packetbeatsappname |


  Scenario Outline: Packetbeat数据源修改appname失败
    Given the data name "autoPacketbeattest" in table "PacketbeatTable" then i click the "编辑" button
    And I set the parameter "Appname" with value "<appnamekind>"
    And I click the "Ensure" button
    Then I will see the element "PreviewMessage" name is "请以字母或数字下划线为元素"

    Examples:
      | appnamekind |
      | 中文          |
      | #.。，        |

  Scenario Outline: Packetbeat数据源修改tag成功
    Given the data name "any" in table "PacketbeatTable" then i click the "编辑" button
    And I set the parameter "Tag" with value "<tagkind>"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"

    Examples:
      | tagkind                         |
      | changePacketbeattag                  |
      | changePacketbeattag,changePacketbeattag2 |
      | change_Packetbeatstag                 |

  Scenario Outline: Packetbeat数据源修改tag失败
    Given the data name "any" in table "PacketbeatTable" then i click the "编辑" button
    And I set the parameter "Tag" with value "<tagkind>"
    And I click the "Ensure" button
    Then I will see the element value in json "{'PreviewMessage':'请以字母、数字、中文或下划线为元素,tags 之间可用 "," 分隔。'}"

    Examples:
      | tagkind |
      | s，s     |
      | #￥%…&*  |

  Scenario: Packetbeat数据源删除
    Given the data name "any" in table "PacketbeatTable" then i click the "删除" button
    And I wait for loading invisible
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "删除 Agent 配置成功。"


