@agent @agent_addfile
Feature: Agent编辑文件目录类型数据源

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    When I click the detail which column is "1" in agent page
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible
    And I will see the "agent.CreatePage" page

  Scenario: 文件目录配置修改文件路径白名单
    And I click the "Create" button
    And I set the parameter "WhiteList" with value "ntp\.log"
    And I set the parameter "Document" with value "/data/rizhiyi/logs"
    And I click the "Next" button
    And I click the "Back" button
    And I wait for loading invisible
    And I set the parameter "Document" with value "/data/rizhiyi/logs/heka"
    And I set the parameter "WhiteList" with value "hekad-daemon\.log"
    And I set the parameter "BlackList" with value "hekad\.stderr"
    And I set the parameter "LastChangeTime" with value "10"
    And I click the "Next" button
    And I wait for loading invisible
    And I click the "ChooseButton" button
    And I click the "Next" button
    And I wait for loading invisible
    And I set the parameter "Appname" with value "autohekafiletest"
    And I set the parameter "Tag" with value "autohekafiletest"
    And I click the "Next" button
    And I wait for loading invisible
    And I will see the element "InputKind" name is "文件监视"
    And I will see the element "SourceRoot" name is "/data/rizhiyi/logs/heka"
    And I will see the element "Monitoring" name is "是"
    And I will see the element "CheckAppname" name is "autohekafiletest"
    And I click the "Next" button
    And I wait for loading invisible
    And I will see the element "Addsuccessmsg" name is "添加成功"
    And I click the "CurrentConfiguration" button
    And I wait for loading invisible
    And I click the "EditAutoFile" button
    And I set the parameter "WhiteList" with value "hekad\.stderr"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"



  Scenario: 文件目录数据源禁用
    Given the data name "autohekafiletest" in agent table "AppNameTable" then i click the "close" switch
    Then I wait for loading invisible
    Then I will see the element "DataSourceSwitchStatus" name is "已禁用"



  Scenario: 文件目录数据源启用
    Given the data name "autohekafiletest" in agent table "AppNameTable" then i click the "open" switch
    Then I wait for loading invisible
    Then I will see the element "DataSourceSwitchStatus" name is "已启用"



  Scenario: 文件目录配置修改文件路径黑名单
    And I click the "EditAutoFile" button
    And I wait for loading invisible
    And I set the parameter "BlackList" with value "hekad-daemon\.log"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"



  Scenario: 文件目录配置修改文件换行正则
    And I click the "EditAutoFile" button
    And I wait for loading invisible
    And I set the parameter "Regex" with value "\t"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"



  Scenario: 文件目录配置修改日志内容白名单
    And I click the "EditAutoFile" button
    And I wait for loading invisible
    And I set the parameter "ContextWhiteList" with value "error"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"


  Scenario: 文件目录配置修改日志内容黑名单
    And I click the "EditAutoFile" button
    And I wait for loading invisible
    And I set the parameter "ContextBlackList" with value "false"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"



#  Scenario: 文件目录配置修改分流字段
#    And I click the "EditAutoFile" button
#    And I set the parameter "Stream" with value ""
#    And I click the "Ensure" button
#    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"
#


  Scenario Outline: 文件目录配置修改最后修改时间
    And I click the "EditAutoFile" button
    And I wait for loading invisible
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
    And I click the "EditAutoFile" button
    And I wait for loading invisible
    When I choose the "<characterkind>" from the "CharacterKind"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"


    Examples:
      | characterkind |
      |   utf-8    |
      |    gbk    |

  Scenario: 文件目录配置修改tag
    And I click the "EditAutoFile" button
    And I wait for loading invisible
    And I set the parameter "Tag" with value "Changeautohekafiletag"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"


  Scenario: 文件目录配置修改appname
    And I click the "EditAutoFile" button
    And I wait for loading invisible
    And I set the parameter "Appname" with value "Changeautohekafileappname"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"
    And I wait for loading invisible
    Given the data name "Changeautohekafileappname" in table "AppNameTable" then i click the "编辑" button
    And I wait for loading invisible
    And I set the parameter "Appname" with value "autohekafiletest"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"


  Scenario: 文件目录数据源删除
    Given the data name "autohekafiletest" in table "AppNameTable" then i click the "删除" button
    And I wait for loading invisible
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "删除 Agent 配置成功。"


