@resourceGroups @all
Feature: 日志来源新建（RZY-365）

  Background:
    Given open the "sourceGroup.ListPage" page for uri "/sources/sourcegroups/"

  Scenario Outline:
    When I click the "CreateButton" button
    And I will see the "sourceGroup.CreatePage" page
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "<describe>"
    And I choose the "<sourceGroup>" from the "SourceGroup"
    And I set the parameter "Hostname" with value "<hostname>"
    And I set the parameter "Appname" with value "<appname>"
    And I set the parameter "Tag" with value "<tag>"
    And I set the parameter "Spl" with value "<spl>"
    And I click the "EnsureCreateButton" button
    Then I will see the success message "<message>"

  @smoke @resourceGroupsSmoke
    Examples: 新建成功
      | name        | describe | sourceGroup         | hostname | appname | tag     | spl                               | message |
      | sxjautotest | autotest | default_SourceGroup | 192*     | apache* | apache* | tag:apache* AND NOT logtype:other | 创建成功    |
      | temptest    |          |                     |          |         |         |                                   | 创建成功    |

    Examples: 新建失败
      | name | describe | sourceGroup | hostname | appname | tag | spl | message |
      |      |          |             |          |         |     |     | 名称 不能为空 |

  @createEssentialData
  Scenario Outline: 创建日志来源以备其他资源使用
    When I click the "CreateButton" button
    And I will see the "sourceGroup.CreatePage" page
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Appname" with value "*"
    And I click the "EnsureCreateButton" button
    Then I wait for "SuccessMessage" will be visible

    Examples: 新建成功
      | name              |
      | AutoTestLogSource |

  @createEssentialData
  Scenario:
    Given the data name is "AutoTestLogSource" then i click the "设为默认" button
