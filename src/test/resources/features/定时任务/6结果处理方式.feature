@all @timedTask @JDBCtimedTask
Feature: 定时任务_结果处理方式

  Scenario Outline: create_schedule
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | top 5 apache.resp_len"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "TimedTask" button
    And I wait for element "SelectedUser" change text to "ctest"
    And I set the parameter "TaskName" with value "<name>_<caseNum>"
    And I set the parameter "Describe" with value "testing"

    And I click the "Crontab" button
    And I set the parameter "CrontabInput" with value "0 */30 * * * ?"
    And I click the "EnsureButton" button
    Then I will see the success message "保存成功"

    Examples:
    |    name     |   caseNum    |
    |  oracle     |  3301        |
    |  mysql      |  3357        |
    |  sql_server |  3358        |

  Scenario Outline: add_jdbc_fields
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    When the data name is "{'column':'2','name':'oracle_3301'}" then i click the "编辑" button
    And I will see the "timedTask.EditPage" page
    When I click the "ResultHandling" button
    And I click the "AddJDBC" button
    And I click the "Jdbc" button

    Then I set the parameter "ConnectName" with value "<connectName>"
    Then I set the parameter "UserName" with value "<userName>"
    Then I set the parameter "Password" with value "<password>"
    Then I set the parameter "Host" with value "<host>"
    Then I set the parameter "Port" with value "<port>"
    Then I choose the "<dbType>" from the "DbType"
    Then I set the parameter "DbName" with value "<dbName>"
    Then I set the parameter "TableName" with value "<tableName>"
    Then I click the "Verify" button
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
      | mysqlrzy    | root     | rizhiyi&2014 | 192.168.1.139 | 3306 | mysql  | rizhiyi_system | atable    | 验证成功              |

# add steps to fill up the fields and save the schedule after bug is fixed
  Scenario Outline: add_jdbc
      Given open the "timedTask.ListPage" page for uri "/schedule/"
      When the data name is "{'column':'2','name':'<name>_<caseNum>'}" then i click the "编辑" button
      And I will see the "timedTask.EditPage" page
      When I click the "ResultHandling" button
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
      Then I will see the success message "验证成功"

      Examples:
        |    name     | caseNum | connectName | userName | password    | host          | port | dbName         | tableName |
        |  oracle     |  3301   | oraclerzy   | system   | oracle      | 192.168.1.88  | 1521 | XE             | DATAAJ    |
        |  mysql      |  3357   | mysqlrzy    | root     | rizhiyi&2014| 192.168.1.139 | 3306 | rizhiyi_system | atable    |
        |  sql_server |  3358   | sqlserverrzy| sa       | rizhiyi&2014| 192.168.1.156 | 1433 | rizhiyijdbc    | tableb    |


