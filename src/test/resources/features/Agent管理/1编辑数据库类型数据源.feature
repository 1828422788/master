@agent_database @agent2
Feature: Agent编辑数据库数据类型数据源

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    When I click the detail which column is "1" in agent page
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible
    And I will see the "agent.CreatePage" page

  Scenario: 新建mysql数据库类型数据源
    And I click the "Create" button
    And I click the "DatabaseType" button
    And I wait for loading invisible
    And I click the "CreateLink" button
    And I set the parameter "LinkName" with value "autotestmysql"
    And I set the parameter "Username" with value "root"
    And I set the parameter "Password" with value "rizhiyi&2014"
    And I set the parameter "Host" with value "192.168.1.134"
    And I set the parameter "DataBaseName" with value "rizhiyi_system"
    And I wait for loading invisible
    And I click the "Save" button
    And I click the "MysqlDatabase" button
    And I click the "Next" button
    And I wait for loading invisible
    And I set the parameter "Sql" with value "Select * from Domain"
    And I click the "Preview" button
    And I wait for loading invisible
    And I set the parameter "Appname" with value "autotestmysql"
    And I set the parameter "Tag" with value "autotestmysql"
    And I click the "Next" button
    And I wait for loading invisible
    And I click the "Next" button
    And I will see the element "Addsuccessmsg" name is "添加成功"


  Scenario: mysql数据库类型数据源禁用
    Given the data name "autotestmysql" in agent table "DatabaseTypeTable" then i click the "close" switch
    Then I wait for loading invisible
    And I wait for element "DatabaseTypeSwitchStatus" change text to "已禁用"



  Scenario: mysql数据库类型数据源启用
    Given the data name "autotestmysql" in agent table "DatabaseTypeTable" then i click the "open" switch
    Then I wait for loading invisible
    And I wait for element "DatabaseTypeSwitchStatus" change text to "已启用"


  Scenario:编辑Sql语句
    Given the data name "autotestmysql" in table "DatabaseTypeTable" then i click the "编辑" button
    And I wait for loading invisible
    And I set the parameter "EditSql" with value "Select * from AgentGroup"
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible
    Then I will see the element value in json "{'ChangeMemo':'修改 Agent 配置成功。'}"


  Scenario:编辑采集频率
    Given the data name "autotestmysql" in table "DatabaseTypeTable" then i click the "编辑" button
    And I wait for loading invisible
    And I set the parameter "EidtFrequency" with value "0 * * * * 1"
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible
    Then I will see the element value in json "{'ChangeMemo':'修改 Agent 配置成功。'}"


  Scenario:编辑增量字段
    Given the data name "autotestmysql" in table "DatabaseTypeTable" then i click the "编辑" button
    And I wait for loading invisible
    And I set the parameter "IncreaseData" with value "id"
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible
    Then I will see the element value in json "{'ChangeMemo':'修改 Agent 配置成功。'}"


  Scenario:编辑增量操作符
    Given the data name "autotestmysql" in table "DatabaseTypeTable" then i click the "编辑" button
    And I wait for loading invisible
    And I set the parameter "IncreaseSymbol" with value ">="
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible
    Then I will see the element value in json "{'ChangeMemo':'修改 Agent 配置成功。'}"

  Scenario:编辑每轮采集记录条数
    Given the data name "autotestmysql" in table "DatabaseTypeTable" then i click the "编辑" button
    And I wait for loading invisible
    And I set the parameter "RecordNumber" with value "1"
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible
    Then I will see the element value in json "{'ChangeMemo':'修改 Agent 配置成功。'}"

  Scenario Outline: 数据库数据源修改appname成功
    Given the data name "autotestmysql" in table "DatabaseTypeTable" then i click the "编辑" button
    And I wait for loading invisible
    And I set the parameter "Appname" with value "<appnamekind>"
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible
    Then I will see the element value in json "{'ChangeMemo':'修改 Agent 配置成功。'}"

    Examples:
      | appnamekind |
      |   changemysqlappname    |
      |   changemysqlappname2    |
      |   change_mysqlappname    |

  Scenario Outline: 数据库数据源修改appname失败
    Given the data name "autotestmysql" in table "DatabaseTypeTable" then i click the "编辑" button
    And I wait for loading invisible
    And I set the parameter "Appname" with value "<appnamekind>"
    And I click the "Ensure" button
    Then I will see the element "PreviewMessage" name is "请以字母或数字下划线为元素"

    Examples:
      | appnamekind |
      |   中文    |
      |   #.。，   |

  Scenario Outline: 数据库数据源修改tag成功
    Given the data name "autotestmysql" in table "DatabaseTypeTable" then i click the "编辑" button
    And I wait for loading invisible
    And I set the parameter "Tag" with value "<tagkind>"
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible
    Then I will see the element value in json "{'ChangeMemo':'修改 Agent 配置成功。'}"

    Examples:
      | tagkind |
      |   changemysqltag    |
      |   changemysqltag,changemysqltag2    |
      |   change_mysqltag                    |

  Scenario Outline: 数据库数据源修改tag失败
    Given the data name "autotestmysql" in table "DatabaseTypeTable" then i click the "编辑" button
    And I wait for loading invisible
    And I set the parameter "Tag" with value "<tagkind>"
    And I click the "Ensure" button
    Then I will see the element value in json "{'PreviewMessage':'请以字母、数字、中文或下划线为元素,tags 之间可用 "," 分隔。'}"

    Examples:
      | tagkind |
      |   s，s    |
      |   #￥%…&*   |

  Scenario: 数据库数据源删除
    Given the data name "autotestmysql" in table "DatabaseTypeTable" then i click the "删除" button
    And I wait for loading invisible
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible
    Then I will see the element "ChangeMemo" name is "删除 Agent 配置成功。"


  Scenario: 编辑mysql数据库类型数据库链接
    And I click the "Create" button
    And I click the "DatabaseType" button
    And I click the "MysqlDatabase" button
    And I click the "EditMysql" button
    And I wait for loading invisible
    And I set the parameter "Password" with value "rizhiyi&2014"
    And I click the "Save" button
#    And I wait for "ChangeMemo" will be visible
#    Then I will see the element "ChangeMemo" name is "修改成功"

  Scenario: 编辑mysql数据库类型数据库名
    And I click the "Create" button
    And I click the "DatabaseType" button
    And I click the "MysqlDatabase" button
    And I click the "EditMysql" button
    And I wait for loading invisible
    And I set the parameter "Password" with value "rizhiyi&2014"
    And I set the parameter "DataBaseName" with value "rizhiyi_yottaweb"
    And I click the "Save" button
#    And I wait for "ChangeMemo" will be visible
#    Then I will see the element "ChangeMemo" name is "修改成功"

  Scenario: 编辑mysql数据库类型端口
    And I click the "Create" button
    And I click the "DatabaseType" button
    And I click the "MysqlDatabase" button
    And I click the "EditMysql" button
    And I wait for loading invisible
    And I set the parameter "Password" with value "rizhiyi&2014"
    And I set the parameter "MysqlPort" with value "3307"
    And I set the parameter "DataBaseName" with value "mysql"
    And I wait for loading invisible
    And I click the "Save" button
#    And I wait for "ChangeMemo" will be visible
#    Then I will see the element "ChangeMemo" name is "修改成功"

  Scenario: 编辑mysql数据库类型最大连接数
    And I click the "Create" button
    And I click the "DatabaseType" button
    And I click the "MysqlDatabase" button
    And I click the "EditMysql" button
    And I wait for loading invisible
    And I set the parameter "Password" with value "rizhiyi&2014"
    And I set the parameter "MaxLink" with value "5"
    And I wait for loading invisible
    And I click the "Save" button
#    And I wait for "ChangeMemo" will be visible
#    Then I will see the element "ChangeMemo" name is "修改成功"

  Scenario: 复制mysql数据库类型
    And I click the "Create" button
    And I click the "DatabaseType" button
    And I click the "MysqlDatabase" button
    And I click the "CopyMysql" button
    And I wait for loading invisible
    And I set the parameter "Password" with value "rizhiyi&2014"
    And I set the parameter "LinkName" with value "autotestmysql139"
    And I wait for loading invisible
    And I click the "Save" button
#    And I wait for "ChangeMemo" will be visible
#    Then I will see the element "ChangeMemo" name is "保存成功"

  Scenario: 删除mysql数据库类型
    And I click the "Create" button
    And I click the "DatabaseType" button
    And I click the "MysqlDatabase" button
    And I click the "DeleteMysql" button
    And I wait for loading invisible
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible
    And I wait for loading invisible
    And I click the "MysqlDatabase139" button
    And I wait for loading invisible
    And I click the "DeleteMysql139" button
    And I wait for loading invisible
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible
    Then I will see the element "ChangeMemo" name is "删除连接成功。"
