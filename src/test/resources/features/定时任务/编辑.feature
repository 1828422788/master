@timedTask @all
Feature: 定时任务编辑

  Background:
    Given I delete from "SavedSchedule" where "{'name':'sxjAutoTest'}"
    Given I insert into table "SavedSchedule" with "{'name':'sxjAutoTest','domain_id':'1','owner_id':'1','request_method':'GET','vis_type':'STATS_NEW','chart_type':'table','last_run_timestamp':'0','start_trigger_time':'1535614615','check_interval':'1','request':'yField=&owner_name=owner&defaultColor=%2319B8FF&xAxisRotate=&byStacks=&toLongitudeField=&sid=&legendPosition=&fromLongitudeField=&toLatitudeField=&time_range=now/d%2Cnow&yCharts=&ySmooths=&cur_ByField=&outlierField=&query=tag%3A%22sample04061424%22%20%7C%20top%201%20apache.resp_len&filter_field=&fromField=&size=20000&category=events&yFields=&colorValues=&cur_ByFields=&source_group=all&lowerField=&upperField=&legendEllipsis=&page=0&field=&token=1f0d166ab3e82d812fa2ed26aebdb0ac&yRanges=&mapType=&toField=&act=search&weightField=&labelField=&xField=&usetable=true&fromLatitudeField=&order=desc&xAxisSort=&owner_id=1','category':'1','crontab':'0','enabled':'1','group':'default_SavedSchedule'}"
    And open the "timedTask.ListPage" page for uri "/schedule/"

  Scenario Outline: 编辑定时任务
    When the data name is "<dataName>" then i click the "编辑" button
    Then I will see the "timedTask.EditPage" page
    Then I set the parameter "Name" with value "<name>"
    Then I set the parameter "Describe" with value "<describe>"
    Then I choose the "<user>" from the "User"
    Then I choose the "<resource>" from the "Resource"
    Then I choose the "<taskGroup>" from the "TaskGroup"
    Then I set the parameter "Period" with value "<period>"
    Then I set the parameter "StartTime" with value "<startTime>"
    Then I click the "EnsureButton" button
    Then I click the "SaveButton" button
    Then I will see the success message "<result>"

  @smoke
    Examples: 编辑成功
      | dataName | name | describe | user | resource | taskGroup | period | startTime | result |
#      | sxjAutoTest | sxjAutoTest | first    | owner | all_     |           | 10     | 16:37:55  | 保存成功   |
#      | sxjAutoTest | sxjAutoTest |          | owner | all_     |           | 10     | 16:37:55  | 保存成功   |

    Examples: 编辑失败
      | dataName | name | describe | user | resource | taskGroup | period | startTime | result |
#      | sxjAutoTest |      |          |      |          |           |        |           | 名称 不能为空 |


  Scenario Outline: 成功编辑定时任务的结果处理方式
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

  @smoke
    Examples:
      | dataName    | connectName | userName | password     | host          | port | dbType | dbName         | tableName | firstDataMapping | secondDataMapping |
      | sxjAutoTest | sxjtest     | root     | rizhiyi&2014 | 192.168.1.200 | 3306 | mysql  | rizhiyi_system | tyf       | count            | percent           |

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






