@topology @all
Feature: 拓扑图重命名（RZY-352）

  Background:
    Given open the "topology.ListPage" page for uri "/topology/"

  Scenario Outline:
    Given the data name is "<name>" then i click the "重命名" button
    Then I set the parameter "NameInput" with value "<newName>"
    Then I click the "EnsureButton" button
    Then I will see the <message>

  @smoke @topologySmoke
    Examples: 重命名成功
      | name        | newName | message                |
      | sxjautotest | 八种布局方式  | success message "保存成功" |

    Examples: 重命名失败
      | name   | newName | message                  |
      | 八种布局方式 |         | error message "请输入拓扑图名称" |

