Feature: 编辑数据库数据类型数据源

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    When I click the detail which column is "1" in agent page
    And switch to another window
    And I will see the "agent.CreatePage" page

  Scenario: 新建mysql数据库类型数据源
#    When I click the detail which name is "<ip>"
    And I click the "Create" button
    And I click the "DatabaseType" button
    And I click the "CreateLink" button
    And I set the parameter "LinkName" with value "autotestmysql"
    And I set the parameter "Username" with value "root"
    And I set the parameter "Password" with value "rizhiyi&2014"
    And I set the parameter "Host" with value "192.168.1.134"
    And I set the parameter "DataBaseName" with value "rizhiyi_system"
#    And I set the parameter "MaxLin" with value "1"
    And I click the "Save" button
    Then I will see the element "ChangeMemo" name is "保存成功"
    And I wait for loading invisible
    And I click the "MysqlDatabase" button
    And I click the "Next" button
    And I set the parameter "Sql" with value "Select * from Domain"
    And I click the "Preview" button
    And I set the parameter "Appname" with value "autotestmysql"
    And I set the parameter "Tag" with value "autotestmysql"
    And I click the "Next" button
    And I click the "Finish" button
    And I will see the element "Addsuccessmsg" name is "添加成功"

  Scenario: mysql数据库类型数据源禁用
    Given the data name "autotestmysql" in agent table "DatabaseTypeTable" then i click the "close" switch
    Then I wait for loading invisible
    Then I will see the element "DatabaseTypeSwitchStatus" name is "已禁用"

  Scenario: mysql数据库类型数据源启用
    Given the data name "autotestmysql" in agent table "DatabaseTypeTable" then i click the "open" switch
    Then I wait for loading invisible
    Then I will see the element "DatabaseTypeSwitchStatus" name is "已启用"


  Scenario:编辑Sql语句
    Given the data name "autotestmysql" in table "DatabaseTypeTable" then i click the "编辑" button
    And I set the parameter "EditSql" with value "Select * from AgentGroup"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"

  Scenario:编辑采集频率
    Given the data name "autotestmysql" in table "DatabaseTypeTable" then i click the "编辑" button
    And I set the parameter "EidtFrequency" with value "0 * * * * 1"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"

  Scenario:编辑增量字段
    Given the data name "autotestmysql" in table "DatabaseTypeTable" then i click the "编辑" button
    And I set the parameter "IncreaseData" with value "id"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"

  Scenario:编辑增量操作符
    Given the data name "autotestmysql" in table "DatabaseTypeTable" then i click the "编辑" button
    And I set the parameter "IncreaseSymbol" with value "<"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"

  Scenario:编辑每轮采集记录条数
    Given the data name "autotestmysql" in table "DatabaseTypeTable" then i click the "编辑" button
    And I set the parameter "RecordNumber" with value "1"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"

