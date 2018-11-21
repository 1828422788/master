@resourceGroups @all
Feature: 日志来源新建

  Background:
    Given open the "sourceGroup.ListPage" page for uri "/sources/sourcegroups/"

  Scenario Outline:
    Then I click the "CreateButton" button
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
    Examples: 新建成功
      | name        | describe | sourceGroup         | hostname | appname | tag     | spl                               | message |
      | sxjautotest | autotest | default_SourceGroup | 192*     | apache* | apache* | tag:apache* AND NOT logtype:other | 创建成功    |

    Examples: 新建失败
      | name | describe | sourceGroup | hostname | appname | tag | spl | message |
      |      |          |             |          |         |     |     | 名称 不能为空 |
