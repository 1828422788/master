Feature: 日志来源编辑（RZY-1563至1569）

  Background:
    Given open the "sourceGroup.ListPage" page for uri "/sources/sourcegroups/"

  Scenario Outline:
    Given the data name is "<oldName>" then i click the "编辑" button
    Then I will see the "sourceGroup.CreatePage" page
    Then I set the parameter "Name" with value "<name>"
    Then I set the parameter "Describe" with value "<describe>"
    Then I set the parameter "Appname" with value "<appname>"
    Then I set the parameter "Tag" with value "<tag>"
    Then I click the "EnsureCreateButton" button
    Then I will see the success message "<message>"

  @smoke @logSource
    Examples: 编辑成功
      | oldName     | name          | describe | appname         | tag         | message |
      | sxjautotest | sunxjautotest | change   | AutoTestAppname | AutoTestTag | 更新成功    |

    Examples: 编辑失败
      | oldName       | name | describe | appname | tag | message |
      | sunxjautotest |      |          |         |     | 名称 不能为空 |
