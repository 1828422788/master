@resourceGroup @all
Feature: 日志来源编辑

  Background:
    Given open the "sourceGroup.ListPage" page for uri "/sources/sourcegroups/"

  Scenario Outline:
    Given the data name is "<oldName>" then i click the "编辑" button
    Then I will see the "sourceGroup.CreatePage" page
    Then I set the parameter "Name" with value "<name>"
    Then I set the parameter "Describe" with value "<describe>"
    Then I choose the "<sourceGroup>" from the "SourceGroup"
    Then I set the parameter "Hostname" with value "<hostname>"
    Then I set the parameter "Appname" with value "<appname>"
    Then I set the parameter "Tag" with value "<tag>"
    Then I set the parameter "Spl" with value "<spl>"
    Then I click the "EnsureCreateButton" button
    Then I will see the success message "<message>"

  @smoke @resourceGroupsSmoke
    Examples: 编辑成功
      | oldName     | name          | describe | sourceGroup         | hostname | appname | tag     | spl                               | message |
      | sxjautotest | sunxjautotest | change   | default_SourceGroup | 192*     | apache* | apache* | tag:apache* AND NOT logtype:other | 更新成功    |

    Examples: 编辑失败
      | oldName       | name | describe | sourceGroup | hostname | appname | tag | spl | message |
      | sunxjautotest |      |          |             |          |         |     |     | 名称 不能为空 |
