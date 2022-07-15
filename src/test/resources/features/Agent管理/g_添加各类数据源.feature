@agent_addfile @agentCollect
Feature: Agent添加各类数据源

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    And I zoom the browse to full screen
    When I click the detail which column is "0" in agent page
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible
    And I will see the "agent.CreatePage" page


  Scenario Outline: Agent添加数据源-单一数据源采集-gbk
    And I click the "Create" button
    And I click the "Next" button
    And I set the parameter "Document" with value "/data/rizhiyi/logs/heka"
    And I set the parameter "WhiteList" with value "hekad-daemon\.log"
    And I set the parameter "BlackList" with value "hekad\.stderr"
    And I set the parameter "LastChangeTime" with value "10"
    And I click the "Next" button
    And I click the "ChooseButton" button
    And I click the "Next" button
    And I set the parameter "Appname" with value "autohekafiletest"
    And I set the parameter "Tag" with value "autohekafiletest"
    And I wait for "Charset" will be visible
    And I set the parameter "Charset" with value "<charsetKind>"
    And I wait for "2000" millsecond
    And I set the parameter "Charset" with value "<charsetKind1>"
    And I click the "Next" button
    And I click the "Finish" button
    And I wait for "{'Addsuccessmsg':'添加成功'}" will be visible by xpath
    And I click the "CurrentConfiguration" button
    And I wait for loading invisible
    Given the data name "autohekafiletest" in table "AppNameTable" then i click the "更多" button
    And I click the "Delete" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible

    Examples:
      | charsetKind | charsetKind1 |
      | gbk         | gbk          |
      | utf-8       | utf-8        |
      | utf-16      | utf-16       |

  @agentCollectSmoke
  Scenario: 到搜索页中进行验证
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "appname:autohekafiletest"
    And I click the "DateEditor" button
    And I click the "WholeTime" button
    And I click the "SearchButton" button
    And I wait for "5000" millsecond
    And I wait for "SearchStatus" will be visible
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "EventsTitle" change text to "事件列表"

  Scenario Outline: Agent添加数据源-单一数据源采集-全拼大写Appname
    And I click the "Create" button
    And I click the "Next" button
    And I set the parameter "Document" with value "<filepath>"
    And I set the parameter "WhiteList" with value "<listdetails>"
    And I set the parameter "LastChangeTime" with value "30"
    And I click the "Next" button
    And I click the "ChooseButton" button
    And I click the "Next" button
    And I set the parameter "Appname" with value "<appname>"
    And I set the parameter "Tag" with value "<tag>"
    And I click the "Next" button
    And I click the "Finish" button
    And I wait for "{'Addsuccessmsg':'添加成功'}" will be visible by xpath
    And I click the "SearchThis" button
    And I wait for loading invisible
    And I will see the "splSearch.SearchPage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "EventsTitle" change text to "事件列表"
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    When I click the detail which column is "0" in agent page
    And switch to another window
    And I close all tabs except main tab
    And I will see the "agent.CreatePage" page
    Given the data name "<deletename>" in table "AppNameTable" then i click the "更多" button
    And I wait for "Delete" will be visible
    And I click the "Delete" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible

    Examples:
      | filepath                         | listdetails      | appname       | tag           | deletename    |
      | /data/rizhiyi/logs/collector     | collector\.log   | COLLECTOR     | COLLECTOR     | COLLECTOR     |

  Scenario: Agent添加Syslog数据源
    And I click the "Create" button
    And I click the "SyslogType" button
    And I click the "Next" button
    And I set the parameter "Listenaddress" with value "192.168.1.139:514"
    And I click the "Next" button
    And I click the "AddNewMap" button
    And I set the parameter "Syslogip" with value "192.168.1.139"
    And I set the parameter "Syslogappname" with value "autohekaSyslog"
    And I set the parameter "Syslogtag" with value "autohekaSyslog"
    And I click the "Next" button
    And I click the "Finish" button
    And I wait for loading invisible
    And I wait for "{'Addsuccessmsg':'添加成功'}" will be visible by xpath
    And I click the "CurrentConfiguration" button
    Given the data name "192.168.1.139:514" in table "SyslogTable" then i click the "更多" button
    And I click the "Delete" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible

  Scenario Outline: Agent添加数据源-脚本采集
    And I click the "Create" button
    And I wait for "ScriptType" will be visible
    And I click the "ScriptType" button
    And I click the "Next" button
    And I set the parameter "ScriptFile" with value "/sbin/service"
    And I set the parameter "Param" with value "rsyslog status"
    And I set the parameter "ChangeRowRule" with value "\n"
    And I set the parameter "Interval" with value "120"
    And I click the "Next" button
    And I wait for loading invisible
    And I set the parameter "Appname" with value "autohekascripttest"
    And I set the parameter "Tag" with value "autohekascripttest"
    And I choose the "<charsetKind>" from the "CharsetKind"
    And I click the "Next" button
    And I click the "Finish" button
    And I wait for loading invisible
    And I wait for "{'Addsuccessmsg':'添加成功'}" will be visible by xpath
    And I wait for "2000" millsecond
    And I click the "CurrentConfiguration" button
    Given the data name "/sbin/service" in table "ScriptTable" then i click the "更多" button
    And I click the "Delete" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible

    Examples:
      | charsetKind |
      | utf-8       |
      | utf-16      |
      | gbk         |