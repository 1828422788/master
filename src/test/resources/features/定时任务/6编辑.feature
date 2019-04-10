@timedTask @all
Feature: 定时任务编辑（RZY-409、RZY-1205）

  Background:
    Given open the "timedTask.ListPage" page for uri "/schedule/"

  @second @timedTaskSmoke
  Scenario Outline: 编辑定时任务
    When the data name is "<dataName>" then i click the "编辑" button
    And I will see the "timedTask.EditPage" page
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "<describe>"
    And I choose the "<user>" from the "User"
    And I choose the "<resource>" from the "Resource"
    And I set the parameter "Textarea" with value "<textarea>"
    And I cancel selection "default_SavedSchedule" from the "TaskGroup"
    And I choose the "<taskGroup>" from the "TaskGroup"
    And I set the parameter "Period" with value "<period>"
    And I choose the "<unit>" from the "Unit"
    And I click the "SaveButton" button
    Then I will see the success message "<result>"

    Examples: 编辑成功
      | dataName                  | name            | describe | user      | resource         | textarea                                                                                                | taskGroup      | period | unit | result |
      | RZY-397:定时任务sample_昨天(副本) | RZY-398:定时任务_更新 | 更改描述信息   | api_usr_m | api_log_source_m | tag:sample04061424_chart \| stats count() as cnt \| eval icon=if(cnt>1000000,"thumbs-down","thumbs-up") | hunter_roles_m | 3      | 小时   | 保存成功   |

  @third @timedTaskSmoke
  Scenario Outline: RZY-399:定时任务_api_usr_m
    When the data name is "<dataName>" then i click the "编辑" button
    And I will see the "timedTask.EditPage" page
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "<describe>"
    And I choose the "<user>" from the "User"
    And I click the "SaveButton" button
    Then I will see the success message "<result>"

    Examples:
      | dataName                  | name                   | describe   | user      | result |
      | RZY-397:定时任务sample_昨天(副本) | RZY-399:运行用户_api_usr_m | AutoCreate | api_usr_m | 保存成功   |

  @third @timedTaskSmoke
  Scenario Outline: RZY-400:日志来源_api_log_source_m
    When the data name is "<dataName>" then i click the "编辑" button
    And I will see the "timedTask.EditPage" page
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "<describe>"
    And I choose the "<resource>" from the "Resource"
    And I click the "SaveButton" button
    Then I will see the success message "<result>"

    Examples:
      | dataName                  | name                          | describe   | resource         | result |
      | RZY-397:定时任务sample_昨天(副本) | RZY-400:日志来源_api_log_source_m | AutoCreate | api_log_source_m | 保存成功   |

  @third @timedTaskSmoke
  Scenario Outline: RZY-401:搜索内容
    When the data name is "<dataName>" then i click the "编辑" button
    And I will see the "timedTask.EditPage" page
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "<describe>"
    And I set the parameter "Textarea" with value "tag:sample04061424_chart | stats count() as cnt | eval icon=if(cnt>1000000,"thumbs-down","thumbs-up") "
    And I click the "SaveButton" button
    Then I will see the success message "<result>"

    Examples:
      | dataName                  | name         | describe   | result |
      | RZY-397:定时任务sample_昨天(副本) | RZY-401:搜索内容 | AutoCreate | 保存成功   |

  @third @timedTaskSmoke
  Scenario Outline: RZY-402:任务分组hunter_roles_m
    When the data name is "<dataName>" then i click the "编辑" button
    And I will see the "timedTask.EditPage" page
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "<describe>"
    And I cancel selection "default_SavedSchedule" from the "TaskGroup"
    And I choose the "<taskGroup>" from the "TaskGroup"
    And I click the "SaveButton" button
    Then I will see the success message "<result>"

    Examples:
      | dataName                  | name                       | describe   | taskGroup      | result |
      | RZY-397:定时任务sample_昨天(副本) | RZY-402:任务分组hunter_roles_m | AutoCreate | hunter_roles_m | 保存成功   |

  @second @timedTaskSmoke
  Scenario Outline: RZY-2696、2698 修改执行计划
    When the data name is "<name>" then i click the "编辑" button
    And I will see the "timedTask.EditPage" page
    And I set the parameter "Name" with value "<newName>"
    And I set the parameter "Period" with value "<period>"
    And I choose the "<unit>" from the "Unit"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

    Examples:
      | name                           | newName              | period | unit |
      | RZY-396:定时任务_sample_表格_近一天(副本) | RZY-2696:执行计划-定时_7小时 | 7      | 小时   |
      | RZY-396:定时任务_sample_表格_近一天(副本) | RZY-2698:执行计划-定时_2天  | 2      | 天    |

  @second @timedTaskSmoke
  Scenario Outline: RZY-2699、2700、2702 修改crontab
    When the data name is "<name>" then i click the "编辑" button
    And I will see the "timedTask.EditPage" page
    And I set the parameter "Name" with value "<newName>"
    And I set the parameter "CrontabInput" with value "<crontab>"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

    Examples:
      | name                           | newName                           | crontab              |
      | RZY-396:定时任务_sample_表格_近一天(副本) | RZY-2699:执行计划-crontab_每个月第15天开始   | 0 5 9 15/3 * ?       |
      | RZY-396:定时任务_sample_表格_近一天(副本) | RZY-2700_执行计划-crontab_每天9点整至9点30分 | 0 0-30/10 9 * * ?    |
      | RZY-396:定时任务_sample_表格_近一天(副本) | RZY-2702_执行计划-crontab_周一到周五       | 0 0/15 9 ? * MON-FRI |

  Scenario Outline: 成功编辑定时任务的结果处理方式（RZY-1205）
    Given the data name is "<dataName>" then i click the "编辑" button
    Then I will see the "timedTask.EditPage" page
    When I click the "ResultHandling" button
    And I click the "AddJDBC" button
    And I set the parameter "ConnectName" with value "<connectName>"
    And I set the parameter "UserName" with value "<userName>"
    And I set the parameter "Password" with value "<password>"
    And I set the parameter "Host" with value "<host>"
    And I set the parameter "Port" with value "<port>"
    And I choose the "<dbType>" from the "DbType"
    And I set the parameter "DbName" with value "<dbName>"
    And I set the parameter "TableName" with value "<tableName>"
    And I click the "Verify" button
    And I will see the alertErrorMessage "验证成功"
    And I set the parameter "FirstDataMapping" with value "<firstDataMapping>"
    And I set the parameter "SecondDataMapping" with value "<secondDataMapping>"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

#  @smoke @timedTaskSmoke
    Examples:
      | dataName    | connectName | userName | password     | host          | port | dbType | dbName         | tableName | firstDataMapping | secondDataMapping |
      | sxjAutoTest | sxjtest     | root     | rizhiyi&2014 | 192.168.1.134 | 3306 | mysql  | rizhiyi_system | tyf1128   | count            | percent           |

  Scenario Outline: 未成功编辑定时任务的结果处理方式
    When the data name is "<dataName>" then i click the "编辑" button
    Then I will see the "timedTask.EditPage" page
    Then I click the "ResultHandling" button
    When I click the "AddJDBC" button
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
      | dataName    | connectName | userName | password     | host          | port | dbType | dbName         | tableName | result                             |
      | sxjAutoTest |             |          |              |               |      |        |                |           | SCHEDULED.CONNECTION_NAME 不能为空     |
      | sxjAutoTest | sxj         |          |              |               |      |        |                |           | SCHEDULED.USERNAME 不能为空            |
      | sxjAutoTest | sxj         | root     |              |               |      |        |                |           | SCHEDULED.PASSWORD 不能为空            |
      | sxjAutoTest | sxj         | root     | rizhiyi&2014 |               |      |        |                |           | SCHEDULED.HOST 不能为空                |
      | sxjAutoTest | sxj         | root     | rizhiyi&2014 | 192.168.1.140 |      |        |                |           | SCHEDULED.PORT 不能为空                |
      | sxjAutoTest | sxj         | root     | rizhiyi&2014 | 192.168.1.140 | 3306 | mysql  |                |           | SCHEDULED.DATEBASE_NAME 不能为空       |
      | sxjAutoTest | sxj         | root     | rizhiyi&2014 | 192.168.1.140 | 3306 | mysql  | rizhiyi_system |           | SCHEDULED.DATEBASE_TABLE_NAME 不能为空 |