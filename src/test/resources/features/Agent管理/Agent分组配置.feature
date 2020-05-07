@agent @agent_group
Feature: Agent分组采集

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    And I close all tabs except main tab

  Scenario Outline: 新建Agent分组设置
    And I click the "AgentGroupButton" button
    And open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible
    And I click the "CreateAgentGroupButton" button
    And I set the parameter "Name" with value "<name>"
    When I set the parameter "Description" with value "<description>"
    And I choose the "<role>" from the "Role"
    And I click the "Save" button
    And I will see the element "Addsuccessmsg" name is "添加 Agent 分组成功"

#  @indexSettingSmoke
    Examples: 成功
      | name       | description | role      |
      | sunxctest  | English     | __admin__ |

  Scenario Outline: Agent分组添加ip并分组采集数据
    Then the column is "1" then i click the "分组" button in agent page
    And  I wait for loading invisible
    And I click the "GroupButton" button
    Then I will see the element "GroupMemo" name is "<message>"
    And I click the "FinishButton" button
    And I click the "AgentGroupButton" button
    And open the "agent.GroupPage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible
    And I click the "OpenGroupButton" button
    And I click the "Addgroupinput" button
    And I click the "Addgroupinputbutton" button
    And open the "agent.CreatePage" page
    And I set the parameter "Document" with value "/data/rizhiyi/logs/heka"
    And I set the parameter "WhiteList" with value "hekad-daemon\.log"
    And I set the parameter "BlackList" with value "hekad\.stderr"
    And I set the parameter "LastChangeTime" with value "10"
    And I click the "Next" button
    And I set the parameter "Appname" with value "autohekafiletest"
    And I set the parameter "Tag" with value "autohekafiletest"
    When I choose the "<charsetKind>" from the "CharsetKind"
    And I click the "Next" button
    And I will see the element "InputKind" name is "文件监视"
    And I will see the element "SourceRoot" name is "/data/rizhiyi/logs/heka"
    And I will see the element "Monitoring" name is "是"
    And I will see the element "CheckAppname" name is "autohekafiletest"
    And I click the "Next" button
    And I will see the element "Addsuccessmsg" name is "添加成功"

#  @indexSettingSmokes
    Examples:
      | message              |
      | 成功加入分组 [ sunxctest ] |

  Scenario: 分组采集数据源禁用
    And I click the "AgentGroupButton" button
    And open the "agent.GroupPage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible
    And I click the "OpenGroupButton" button
    And I click the "Addgroupinput" button
    And I will see the "agent.CreatePage" page
    Given the data name "autohekafiletest" in agent table "AppNameTable" then i click the "close" switch
    Then I wait for loading invisible
    Then I will see the element "DataSourceSwitchStatus" name is "已禁用"

  Scenario: 分组采集数据源启用
    And I click the "AgentGroupButton" button
    And open the "agent.GroupPage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible
    And I click the "OpenGroupButton" button
    And I click the "Addgroupinput" button
    And I will see the "agent.CreatePage" page
    Then I wait for loading invisible
    Given the data name "autohekafiletest" in agent table "AppNameTable" then i click the "close" switch
    And I wait for "2000" millsecond
#    Then I will see the element "DataSourceSwitchStatus" name is "已启用"


  Scenario: 文件目录配置修改日志内容白名单
    And I click the "AgentGroupButton" button
    And open the "agent.GroupPage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible
    And I click the "OpenGroupButton" button
    And I click the "Addgroupinput" button
    And I will see the "agent.CreatePage" page
    And I click the "EditAutoFile" button
    And I set the parameter "ContextWhiteList" with value "error"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"


  Scenario: 文件目录配置修改日志内容黑名单
    And I click the "AgentGroupButton" button
    And open the "agent.GroupPage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible
    And I click the "OpenGroupButton" button
    And I click the "Addgroupinput" button
    And I will see the "agent.CreatePage" page
    And I click the "EditAutoFile" button
    And I set the parameter "ContextBlackList" with value "false"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"

  Scenario Outline: 文件目录配置修改最后修改时间
    And I click the "AgentGroupButton" button
    And open the "agent.GroupPage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible
    And I click the "OpenGroupButton" button
    And I click the "Addgroupinput" button
    And I will see the "agent.CreatePage" page
    And I click the "EditAutoFile" button
    And I set the parameter "LastModifyTime" with value "20"
    When I choose the "<timekind>" from the "TimeKind"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"


    Examples:
      | timekind |
      | 小时       |
      | 天        |
      | 分钟       |

  Scenario Outline: 文件目录配置修改字符集
    And I click the "AgentGroupButton" button
    And open the "agent.GroupPage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible
    And I click the "OpenGroupButton" button
    And I click the "Addgroupinput" button
    And I will see the "agent.CreatePage" page
    And I click the "EditAutoFile" button
    When I choose the "<characterkind>" from the "CharacterKind"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"


    Examples:
      | characterkind |
      |   utf-8    |
      |    gbk    |

  Scenario: 文件目录配置修改tag
    And I click the "AgentGroupButton" button
    And open the "agent.GroupPage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible
    And I click the "OpenGroupButton" button
    And I click the "Addgroupinput" button
    And I will see the "agent.CreatePage" page
    And I click the "EditAutoFile" button
    And I set the parameter "Tag" with value "Changeautohekafiletag"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"


  Scenario: 文件目录配置修改appname
    And I click the "AgentGroupButton" button
    And open the "agent.GroupPage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible
    And I click the "OpenGroupButton" button
    And I click the "Addgroupinput" button
    And I will see the "agent.CreatePage" page
    And I click the "EditAutoFile" button
    And I set the parameter "Appname" with value "Changeautohekafileappname"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"
    Given the data name "Changeautohekafileappname" in table "AppNameTable" then i click the "编辑" button
    And I set the parameter "Appname" with value "autohekafiletest"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"


  Scenario: 文件目录数据源删除
    And I click the "AgentGroupButton" button
    And open the "agent.GroupPage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible
    And I click the "OpenGroupButton" button
    And I click the "Addgroupinput" button
    And I will see the "agent.CreatePage" page
    Given the data name "autohekafiletest" in table "AppNameTable" then i click the "删除" button
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "删除 Agent 配置成功。"

  Scenario Outline: 删除Agent分组
    And I click the "AgentGroupButton" button
    And open the "agent.GroupPage" page for uri "/sources/input/agent/group/"
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible
    And I click the "<name>" button
    And I click the "More" button
    And I click the "Delete" button
    And I click the "Ensure" button
    Then I will see the element "Addsuccessmsg" name is "删除 Agent 分组成功"


    Examples:
      | name        |
      | Deletefour   |
