@resourceGroups @all
Feature: 资源分组新建

  Background:
    Given open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"

  Scenario Outline: 为指定角色创建资源分组
    Given I click the "CreateResourceGroup" button
    Then I will see the "resourceGroups.CreatePage" page
    When I set the parameter "ResourceGroupName" with value "<name>"
    And I choose the "<type>" from the "ResourceGroupType"
    And I set the parameter "ResourceGroupDes" with value "<des>"
    And I choose the "<owner>" from the "ResourceGroupOwner"
    And I click the "CreateButton" button
    Then I will see the <result>

  @smoke @resourceGroupsSmoke
    Examples: 创建资源分组成功
      | name             | type | des  | owner | result                 |
      | AutoTestForTrend | 趋势图  | test | admin | success message "创建成功" |

  @fail
    Examples: 创建资源分组失败
      | name             | type | des | owner | result                                      |
      | AutoTestForTrend | 趋势图  |     | admin | error message "保存失败: 资源组名称已存在\n错误码: FE_546" |
      |                  |      |     |       | error message "填写资源分组名称"                    |
      | test             |      |     |       | error message "请选择分组类型"                     |
      | test             | 仪表盘  |     |       | error message "请分配角色"                       |

  Scenario Outline: 新建资源分组并添加资源成员（RZY-1183）
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I click the "CreateKnowledge" button
    When I set the parameter "EventCode" with value "<resourceMember>"
    And I set the parameter "Describe" with value "AutoTest"
    And I click the "Confirm" button
    And open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"
    And I click the "CreateResourceGroup" button
    Then I will see the "resourceGroups.CreatePage" page
    When I set the parameter "ResourceGroupName" with value "<name>"
    And I choose the "<type>" from the "ResourceGroupType"
    And I set the parameter "ResourceGroupDes" with value "<des>"
    And I choose the "<owner>" from the "ResourceGroupOwner"
    And I click the "AddResourceMemberButton" button
    And I click the "<resourceMember>" checkbox
    And I click the "EnsureButton" button
    And I click the "CreateButton" button
    Then I will see the <result>

  @smoke @resourceGroupsSmoke
    Examples: 创建资源分组成功
      | name                 | type | des | owner | resourceMember    | result                 |
      | AutoTestForKnowledge | 知识   | UI  | admin | AutoTestKnowledge | success message "创建成功" |

  Scenario Outline:
    Given I click the "CreateResourceGroup" button
    Then I will see the "resourceGroups.CreatePage" page
    When I set the parameter "ResourceGroupName" with value "<name>"
    And I choose the "<type>" from the "ResourceGroupType"
    And I set the parameter "ResourceGroupDes" with value "<des>"
    And I choose the "<owner>" from the "ResourceGroupOwner"
    And I click the "CreateButton" button

  @createEssentialData
    Examples:
      | name     | type | des  | owner        |
      | AutoTest | 知识   | test | AutoTestRole |