@topology @all
Feature: 拓扑图重命名

  Background:
    Given I insert into table "Topology" with "{'name':'sxjautotest','domain_id':'1','creator_id':'1','category':'0','group':'default_Topology'}"
    Then I insert into table "Topology" with "{'name':'sunxjautotest','domain_id':'1','creator_id':'1','category':'0','group':'default_Topology'}"
    And I delete from "Topology" where "{'name':'autotest','group':'default_Topology'}"
    Then open the "topology.ListPage" page for uri "/topology/"

  Scenario Outline:
    Given the data name is "<name>" then i click the "重命名" button
    Then I set the parameter "NameInput" with value "<newName>"
    Then I click the "EnsureButton" button
    Then I will see the <message>

  @smoke @topologySmoke
    Examples: 重命名成功
      | name        | newName  | message                |
      | sxjautotest | autotest | success message "保存成功" |

    Examples: 重命名失败
      | name        | newName | message                  |
      | sxjautotest |         | error message "请输入拓扑图名称" |

