@agent2 @agent_addfile
Feature: Agent添加数据源

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    When I click the detail which column is "1" in agent page
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible
    And I will see the "agent.CreatePage" page


  Scenario Outline: Agent添加数据源-单一数据源采集-gbk
    And I click the "Create" button
    And I set the parameter "WhiteList" with value "ntp\.log"
    And I set the parameter "Document" with value "/data/rizhiyi/logs"
    And I click the "Next" button
    And I click the "Back" button
    And I set the parameter "Document" with value "/data/rizhiyi/logs/heka"
    And I set the parameter "WhiteList" with value "hekad-daemon\.log"
    And I set the parameter "BlackList" with value "hekad\.stderr"
    And I set the parameter "LastChangeTime" with value "10"
    And I click the "Next" button
    And I click the "ChooseButton" button
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
    And I wait for loading invisible
    And I will see the element "Addsuccessmsg" name is "添加成功"
    And I click the "CurrentConfiguration" button
    And I wait for loading invisible
    Given the data name "autohekafiletest" in table "AppNameTable" then i click the "删除" button
    And I wait for loading invisible
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible
    Then I will see the element "ChangeMemo" name is "删除 Agent 配置成功。"



    Examples:
      | charsetKind |
      | utf-8       |
      | gbk         |
      | utf-16      |


  Scenario: 到搜索页中进行验证
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "appname:autohekafiletest"
    And I click the "DateEditor" button
    And I click the "WholeTime" button
    And I click the "SearchButton" button
    And I wait for "5000" millsecond
    And I wait for "SearchStatus" will be visible
    And I wait for element "SearchStatus" change text to "搜索完成!"



  Scenario: Agent添加Syslog数据源
    And I click the "Create" button
    And I click the "SyslogType" button
    And I set the parameter "Listenaddress" with value "192.168.1.161:514"
    And I click the "Next" button
    And I wait for loading invisible
    And I click the "Next" button
    And I will see the element "MemoMessage" name is "请至少添加一个映射。"
    And I click the "Ensure" button
    And I click the "AddNewMap" button
    And I set the parameter "Syslogip" with value "192.168.1.134"
    And I set the parameter "Syslogappname" with value "autohekaSyslog"
    And I set the parameter "Syslogtag" with value "autohekaSyslog"
    And I click the "Next" button
    And I will see the element "CheckListenaddress" name is "192.168.1.161:514"
    And I click the "Next" button
    And I wait for loading invisible
    And I will see the element "Addsuccessmsg" name is "添加成功"
    And I click the "CurrentConfiguration" button
    Given the data name "192.168.1.161:514" in table "SyslogTable" then i click the "删除" button
    And I wait for loading invisible
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible
    Then I will see the element "ChangeMemo" name is "删除 Agent 配置成功。"

  Scenario Outline: Agent添加数据源-脚本采集
    And I wait for loading invisible
    And I click the "Create" button
    And I wait for loading invisible
    And I click the "ScriptType" button
    And I set the parameter "ScriptFile" with value "/sbin/service"
    And I set the parameter "Param" with value "rsyslog status"
    And I set the parameter "ChangeRowRule" with value "\n"
    And I set the parameter "Interval" with value "120"
    And I click the "Next" button
    And I wait for loading invisible
    And I set the parameter "Appname" with value "autohekascripttest"
    And I set the parameter "Tag" with value "autohekascripttest"
    When I choose the "<charsetKind>" from the "CharsetKind"
    And I click the "Next" button
    And I will see the element "CheckScriptFile" name is "/sbin/service"
    And I will see the element "CheckParam" name is "rsyslog status"
    And I will see the element "CheckChangeRowRule" name is "\n"
    And I will see the element "CheckInternal" name is "120 秒"
    And I click the "Next" button
    And I wait for loading invisible
    And I will see the element "Addsuccessmsg" name is "添加成功"
    And I wait for "2000" millsecond
    And I click the "CurrentConfiguration" button
    Given the data name "/sbin/service" in table "ScriptTable" then i click the "删除" button
    And I wait for loading invisible
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible
    Then I will see the element "ChangeMemo" name is "删除 Agent 配置成功。"

    Examples:
      | charsetKind |
      | utf-8       |
      | utf-16      |
      | gbk         |