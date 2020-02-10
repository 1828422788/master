@dataset
Feature: 对节点的操作【数据集中根有一个子节点】

  Background:
    Given open the "dataset.ListPage" page for uri "/dataset/"
    When the data name is "node_op_jnd" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible


  Scenario: 修改节点名称
    When I click the "node" button
    And I click the "pencil" button
    And I set the parameter "ModifyNode" with value "after"
    And I click the "duiHao" button
    And I click the "save" button
    Then I will see the "node" result will be "after"


  @dataset @Override
  Scenario Outline: 修改节点的约束语句[set不进去值]
    When I click the "node" button

    And I set the parameter "modifyNodeSentence" with value "<sentence>"

    And I click the "save" button
     # Then I will see the success message "更新数据集节点成功"
    Examples:
      |sentence|
      |tag:heka|


  @dataset @Override
  Scenario: 删除节点
    When I click the "node" button
    And I click the "delete" button
    And I click the "ensure" button
    Then I will see the success message "删除数据集节点成功"
