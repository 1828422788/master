@topology @all
Feature: 拓扑图分组

  Background:
    Given I insert into table "Topology" with "{'name':'AutoTestForDuplicateName','domain_id':'1','creator_id':'1','category':'0','group':'default_Topology'}"
    Given I insert into table "Topology" with "{'name':'11','domain_id':'1','creator_id':'1','category':'0','group':'default_Topology'}"
    Given I insert into table "Topology" with "{'name':'test','domain_id':'1','creator_id':'1','category':'0','group':'default_Topology'}"
    Given I insert into table "Topology" with "{'name':'1test','domain_id':'1','creator_id':'1','category':'0','group':'default_Topology'}"
    Given I insert into table "Topology" with "{'name':'1重名','domain_id':'1','creator_id':'1','category':'0','group':'default_Topology'}"
    Given I insert into table "Topology" with "{'name':'test重名','domain_id':'1','creator_id':'1','category':'0','group':'default_Topology'}"
    Given I insert into table "Topology" with "{'name':'test重名12','domain_id':'1','creator_id':'1','category':'0','group':'default_Topology'}"
    Then open the "topology.ListPage" page for uri "/topology/"

  Scenario Outline:
    Given I click the "CreateButton" button
    Then I set the parameter "NameInput" with value "<name>"
    Then I choose the "<group>" from the "GroupInput"
    Then I click the "EnsureButton" button
    Then I will see the success message "<message>"

    Examples: 成功新建拓扑图
      | name                     | group            | message |
      | AutoTestForDuplicateName | default_Topology | 创建成功    |
      | 11                       | default_Topology | 创建成功    |
      | test                     | default_Topology | 创建成功    |
      | 1test                    | default_Topology | 创建成功    |
      | 1重名                      | default_Topology | 创建成功    |
      | test重名                   | default_Topology | 创建成功    |
      | test重名12                 | default_Topology | 创建成功    |

  Scenario:
    Given I delete from "Topology" where "{'name':['AutoTestForDuplicateName','11','test','1test','1重名','test重名','test重名12']}"
