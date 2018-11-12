Feature: 仪表盘重名校验

  Background:
#    Given I insert into table "DashBoardGroup" with "{'name':'sxjautotest','domain_id':'1','creator_id':'1','group':'default_DashBoardGroup'}"
#    And I insert into table "DashBoardGroup" with "{'name':'11','domain_id':'1','creator_id':'1','group':'default_DashBoardGroup'}"
#    And I insert into table "DashBoardGroup" with "{'name':'自动化测试','domain_id':'1','creator_id':'1','group':'default_DashBoardGroup'}"
#    And I insert into table "DashBoardGroup" with "{'name':'11test','domain_id':'1','creator_id':'1','group':'default_DashBoardGroup'}"
#    And I insert into table "DashBoardGroup" with "{'name':'11自动化','domain_id':'1','creator_id':'1','group':'default_DashBoardGroup'}"
#    And I insert into table "DashBoardGroup" with "{'name':'自动化test','domain_id':'1','creator_id':'1','group':'default_DashBoardGroup'}"
    Then open the "dashboard.ListPage" page for uri "/dashboard/"

  Scenario Outline:
    Given I click the "CreateButton" button
    Then I set the parameter "DashBoardName" with value "<name>"
    Then I choose the "<group>" from the "DashBoardGroup"
    Then I click the "EnsureCreateButton" button
    Then I will see the success message "仪表盘新建成功"

    Examples:
      | name        | group                  |
      | sxjautotest | default_DashBoardGroup |
      | 11          | default_DashBoardGroup |
      | 自动化测试       | default_DashBoardGroup |
      | 11test      | default_DashBoardGroup |
      | 11自动化       | default_DashBoardGroup |
      | 自动化test     | default_DashBoardGroup |

  Scenario:
#    Given I delete from "DashBoardGroup" where "{'name':['sxjautotest','11','自动化测试','11test','11自动化','自动化test']}"





