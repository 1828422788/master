Feature: 资源分组编辑

  Background:
    Given open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"

  @resourceGroups
  Scenario Outline:
    Given I wait for loading invisible
    When the data name is "<ResourceGroupName>" then i click the "编辑" button
    And I will see the "resourceGroups.EditPage" page
    Then I set the parameter "ResourceGroupName" with value "<NewResourceGroupName>"
    And I set the parameter "ResourceGroupDes" with value "<NewResourceGroupDes>"
    And I click the "SaveButton" button
    Then I will see the <Result>

  @all @smoke @resourceGroupsSmoke
    Examples:
      | ResourceGroupName | NewResourceGroupName | NewResourceGroupDes | Result                 |
      | AutoTestForTrend  | AutoTestNew          | NewDes              | success message "保存成功" |

  @all
    Examples:
      | ResourceGroupName    | NewResourceGroupName | NewResourceGroupDes | Result                                      |
      | AutoTestForKnowledge | AutoTestNew          | NewDes              | error message "保存失败: 资源组名称已存在\n错误码: FE_546" |
      | AutoTestForKnowledge |                      | NewDes              | error message "填写资源分组名称"                    |

