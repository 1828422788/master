@resourceGroups @all
Feature: 资源分组新建

  Background:
    Given I delete from "ResourceGroup" where "{'name':'sunxjautotest'}"
    And insert with sql "insert into ResourceGroup(domain_id, name, memo, creator_id, category) select d.id, 'AutoInsertTest', 'memo', a.id, 'DashBoardGroup' from Account a left join Domain d on a.domain_id=d.id where d.name='ops' and a.name='owner'"
    And open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"

  Scenario Outline: 为指定角色创建资源分组
    Given I click the "CreateResourceGroup" button
    Then I will see the "resourceGroups.CreatePage" page
    When I set the parameter "ResourceGroupName" with value "<name>"
    And I choose the "<type>" from the "ResourceGroupType"
    And I set the parameter "ResourceGroupDes" with value "<des>"
#    And I choose the "<app>" from the "App"
    And I choose the "<owner>" from the "ResourceGroupOwner"
    And I click the "CreateButton" button
    Then I will see the <result>

  @smoke
    Examples: 创建资源分组成功
      | name          | type | des | app | owner | result                 |
      | sunxjautotest | 趋势图  | UI  |     | admin | success message "创建成功" |

    Examples: 创建资源分组失败
      | name           | type | des | app | owner | result                                      |
      | AutoInsertTest | 仪表盘  |     |     | admin | error message "保存失败: 资源组名称已存在\n错误码: FE_546" |
      |                |      |     |     |       | error message "填写资源分组名称"                    |
      | test           |      |     |     |       | error message "请选择分组类型"                     |
      | test           | 仪表盘  |     |     |       | error message "请分配角色"                       |

  Scenario Outline: 新建资源分组并添加资源成员
    Given I click the "CreateResourceGroup" button
    Then I will see the "resourceGroups.CreatePage" page
    When I set the parameter "ResourceGroupName" with value "<name>"
    And I choose the "<type>" from the "ResourceGroupType"
    And I set the parameter "ResourceGroupDes" with value "<des>"
#    And I choose the "<app>" from the "App"
    And I choose the "<owner>" from the "ResourceGroupOwner"
    And I click the "AddResourceMemberButton" button
    And I click the "<resourceMember>" checkbox
    And I click the "EnsureButton" button
    And I click the "CreateButton" button
    Then I will see the <result>

  @smoke
    Examples: 创建资源分组成功
      | name          | type | des | app | owner | resourceMember | result                 |
      | sunxjautotest | 趋势图  | UI  |     | admin | sp_line        | success message "创建成功" |

