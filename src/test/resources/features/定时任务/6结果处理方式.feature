@all @JDBCtimedTask
Feature: 定时任务_结果处理方式

  @timedTask
  Scenario Outline: create_schedule
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | top 5 apache.resp_len"
    And I click the "DateEditor" button under some element
    And I click the "Today" button
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "TaskName" with value "<name>_<caseNum>"
    And I set the parameter "Describe" with value "testing"

    And I click the "Crontab" button
    And I set the parameter "CrontabInput" with value "0 */30 * * * ?"
    And I click the "EnsureButton" button
    And I wait for "TimeTaskEnsure" will be visible
    Then I will see the success message "保存成功"

    Examples:
      |    name     |   caseNum    |
      |  oracle     |  3301        |
      |  mysql      |  3357        |
      |  sql_server |  3358        |

  @timedTask
  Scenario Outline: add_jdbc_fields
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    When the data name is "{'column':'1','name':'oracle_3301'}" then i click the "编辑" button
    And I will see the "timedTask.EditPage" page
    And I wait for "5000" millsecond
    And I wait for loading complete
    And I wait for "ResultHandling" will be visible
    When I click the "ResultHandling" button under some element
    And I wait for "AddJDBC" will be visible
    And I click the "AddJDBC" button under some element
    And I click the "Jdbc" button under some element
    And I wait for "2000" millsecond
    And I wait for "ConnectName" will be visible
    And I will see the input element "ConnectName" value will be ""

    Then I set the parameter "ConnectName" with value "<connectName>"
    Then I set the parameter "UserName" with value "<userName>"
    Then I set the parameter "Password" with value "<password>"
    Then I set the parameter "Host" with value "<host>"
    Then I set the parameter "Port" with value "<port>"
    Then I choose the "<dbType>" from the "DbType"
    Then I set the parameter "DbName" with value "<dbName>"
    Then I set the parameter "TableName" with value "<tableName>"
    Then I click the "Verify" button under some element
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "<result>"

    Examples:
      | connectName | userName | password     | host          | port | dbType | dbName         | tableName | result               |
      |             |          |              |               |      |        |                |           | 连接名称 不能为空     |
      | mysqlrzy    |          |              |               |      |        |                |           | 用户名 不能为空       |
      | mysqlrzy    | root     |              |               |      |        |                |           | 密码 不能为空         |
      | mysqlrzy    | root     | rizhiyi&2014 |               |      |        |                |           | 主机 不能为空         |
      | mysqlrzy    | root     | rizhiyi&2014 | 192.168.1.139 |      |        |                |           | 端口 不能为空         |
      | mysqlrzy    | root     | rizhiyi&2014 | 192.168.1.139 | 3306 | mysql  |                |           | 数据库名 不能为空     |
      | mysqlrzy    | root     | rizhiyi&2014 | 192.168.1.139 | 3306 | mysql  | rizhiyi_system |           | 数据库表名称 不能为空  |

  Scenario Outline: add_jdbc
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    When the data name is "{'column':'1','name':'<name>_<caseNum>'}" then i click the "编辑" button
    And I will see the "timedTask.EditPage" page
    And I wait for "5000" millsecond
    And I wait for loading complete
    And I wait for "ResultHandling" will be visible
    When I click the "ResultHandling" button
    And I wait for "AddJDBC" will be visible
    And I click the "AddJDBC" button
    And I click the "Jdbc" button

    Then I set the parameter "ConnectName" with value "<connectName>"
    Then I set the parameter "UserName" with value "<userName>"
    Then I set the parameter "Password" with value "<password>"
    Then I set the parameter "Host" with value "<host>"
    Then I set the parameter "Port" with value "<port>"
    Then I choose the "<name>" from the "DbType"
    Then I set the parameter "DbName" with value "<dbName>"
    Then I set the parameter "TableName" with value "<tableName>"
    Then I click the "Verify" button
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "验证成功"
    And I click the "EnsureButton" button
    And I wait for "Count" will be visible
    When I set the parameter "Count" with value "count"
    And I set the parameter "Percent" with value "percent"
    And I set the parameter "Resplen" with value "apache.resp_len"
    And I click the "Save" button under some element
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"


    Examples:
      |    name     | caseNum | connectName | userName | password    | host          | port | dbName         | tableName |
      |  oracle     |  3301   | oraclerzy   | system   | oracle      | 192.168.1.88  | 1521 | XE             | DATAAJ    |
      |  mysql      |  3357   | mysqlrzy    | root     | rizhiyi&2014| 192.168.1.139 | 3306 | rizhiyi_system | atable    |
      |  sql_server |  3358   | sqlserverrzy| sa       | rizhiyi&2014| 192.168.1.156 | 1433 | rizhiyijdbc    | tableb    |
