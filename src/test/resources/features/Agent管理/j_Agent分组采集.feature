@agentGroup @test_agent_group

Feature: Agent分组采集

  Background:
    Given open the "agent.GroupPage" page for uri "/agent/agentgroup/"
    And I zoom the browse to full screen

  @agentGroupSmoke
  Scenario Outline: 新建Agent分组设置并添加ip
    And I wait for loading complete
    And I click the "CreateAgentGroupButton" button
    And I set the parameter "Name" with value "<name>"
    When I set the parameter "Description" with value "<description>"
    And I wait for loading invisible
    And I click the "Save" button
    And I wait for "Addsuccessmsg" will be visible
    And I will see the element "Addsuccessmsg" name is "添加 Agent 分组成功"
    And I wait for "Back" will be visible
    And I click the "Back" button
    And I will see the "agent.ListPage" page
    And I click the "AgentMultiButton" button
    Then the column is "0" then i click the "分组" button in agent page
    And  I wait for loading invisible
    And I click the "GroupButton" button
    Then I will see the element "GroupMemo" name is "<message>"
    And I click the "FinishGroupButton" button
    And I click the "OpenGroupButton" button
    And I wait for loading invisible
    And I wait for "2000" millsecond
    Then I will see the agent search result contains "1"
    Examples: 成功
      | name      | description | role      | message              |
      | sunxctest | English     | __admin__ | 成功加入分组 [ sunxctest ] |

  @agentGroupSmoke
  Scenario: Agent分组采集数据
    And I click the "OpenGroupButton" button
    And I click the "Addgroupinput" button
    And I click the "Addgroupinputbutton" button
    And I will see the "agent.CreatePage" page
    And I wait for loading invisible
    And I click the "Next" button
    And I set the parameter "Document" with value "/data/rizhiyi/logs/heka"
    And I set the parameter "WhiteList" with value "hekad-daemon\.log"
    And I set the parameter "BlackList" with value "hekad\.stderr"
    And I set the parameter "LastChangeTime" with value "10"
    And I click the "Next" button
    And I set the parameter "Appname" with value "autohekafiletest"
    And I set the parameter "Tag" with value "autohekafiletest"
    And I click the "Next" button
    And I will see the element "InputKind" name is "文件监视"
    And I will see the element "SourceRoot" name is "/data/rizhiyi/logs/heka"
    And I will see the element "Monitoring" name is "是"
    And I will see the element "CheckAppname" name is "autohekafiletest"
    And I click the "Finish" button
    And I wait for "{'Addsuccessmsg':'添加成功'}" will be visible by xpath

  Scenario: 分组采集数据源禁用
    And I click the "OpenGroupButton" button
    And I click the "Addgroupinput" button
    And I will see the "agent.CreatePage" page
    Given the data name "autohekafiletest" in agent table "AppNameTable" then i click the "close" switch
    And I wait for loading invisible
    And I wait for "3000" millsecond
    And I wait for element "DataSourceSwitchStatus1" change text to "已禁用"

  Scenario: 分组采集数据源启用
    And I click the "OpenGroupButton" button
    And I click the "Addgroupinput" button
    And I will see the "agent.CreatePage" page
    Then I wait for loading invisible
    Given the data name "autohekafiletest" in agent table "AppNameTable" then i click the "open" switch
    And I wait for loading invisible
    And I wait for "3000" millsecond
    And I wait for element "DataSourceSwitchStatus1" change text to "已启用"

  @agentGroupSmoke
  Scenario: 分组采集数据修改日志内容白名单
    And I click the "OpenGroupButton" button
    And I click the "Addgroupinput" button
    And I will see the "agent.CreatePage" page
    And I click the "EditAutoFile" button
    And I wait for loading invisible
    And I set the parameter "ContextWhiteList" with value "error"
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible

  Scenario: 分组采集数据修改日志内容黑名单
    And I click the "OpenGroupButton" button
    And I click the "Addgroupinput" button
    And I will see the "agent.CreatePage" page
    And I click the "EditAutoFile" button
    And I wait for "ContextBlackList" will be visible
    And I set the parameter "ContextBlackList" with value "false"
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible

  Scenario Outline: 分组采集数据修改最后修改时间
    And I click the "OpenGroupButton" button
    And I click the "Addgroupinput" button
    And I will see the "agent.CreatePage" page
    And I click the "EditAutoFile" button
    And I wait for "LastModifyTime" will be visible
    And I set the parameter "LastModifyTime" with value "20"
    When I choose the "<timekind>" from the "TimeKind"
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible


    Examples:
      | timekind |
      | 小时       |
      | 天        |
      | 分钟       |

  Scenario Outline: 分组采集数据配置修改字符集
    And I click the "OpenGroupButton" button
    And I click the "Addgroupinput" button
    And I will see the "agent.CreatePage" page
    And I click the "EditAutoFile" button
    When I choose the "<characterkind>" from the "CharacterKind"
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible

    Examples:
      | characterkind |
      | utf-8         |
      | gbk           |

  Scenario: 分组采集数据修改tag
    And I click the "OpenGroupButton" button
    And I click the "Addgroupinput" button
    And I will see the "agent.CreatePage" page
    And I click the "EditAutoFile" button
    And I wait for "Tag" will be visible
    And I set the parameter "Tag" with value "Changeautohekafiletag"
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible

  Scenario: 分组采集数据修改appname
    And I click the "OpenGroupButton" button
    And I click the "Addgroupinput" button
    And I will see the "agent.CreatePage" page
    And I click the "EditAutoFile" button
    And I wait for "Appname" will be visible
    And I set the parameter "Appname" with value "Changeautohekafileappname"
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible
    And I wait for loading invisible
    Given the data name "Changeautohekafileappname" in table "AppNameTable" then i click the "编辑" button
    And I wait for loading invisible
    And I set the parameter "Appname" with value "autohekafiletest"
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible

  @agentGroupSmoke
  Scenario: 分组采集数据数据源删除
    And I click the "OpenGroupButton" button
    And I click the "Addgroupinput" button
    And I will see the "agent.CreatePage" page
    And I wait for loading invisible
    Given the data name "autohekafiletest" in table "AppNameTable" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible

  @agentGroupSmoke
  Scenario Outline: 删除Agent分组
    And I click the "<name>" button
    And I click the "More" button
    And I click the "Ensure" button
    And I wait for "Addsuccessmsg" will be visible

    Examples:
      | name       |
      | Deletefour |
