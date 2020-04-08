@dataset
Feature: 数据集对节点的操作

    Scenario: 新建一个数据集修改【数据集中根有一个子节点】
    Given open the "dataset.ListPage" page for uri "/dataset/"
    When I click the "Create" button
    And I set the parameter "Name" with value "node_op_jnd"
    And I set the parameter "Alias" with value "op"
    And I set the parameter "Spl" with value "*"
    And I click the "Save" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible
    #构建第二层节点
    And I click the "root" button
    And I click the "rootAdd" button
    And I set the parameter "BInputName" with value "无1"
    And I click the "BRightDuiHao" button
    And I set the parameter "sentenceInput" with value "tag:heka"
    And I click the "save" button
    And I wait for loading invisible


  Scenario: 修改节点名称
    Given open the "dataset.ListPage" page for uri "/dataset/"
    When the data name is "node_op_jnd" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible

    When I click the "B" button
    And I click the "pencil" button
    And I set the parameter "ModifyNode" with value "after"
    And I click the "duiHao" button
    And I click the "save" button
    Then I will see the "B" result will be "after"


  @dataset
  Scenario: 修改节点的约束语句
    Given open the "dataset.ListPage" page for uri "/dataset/"
    When the data name is "node_op_jnd" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible
    When I click the "B" button

    And I wait for "modifyNodeSentence" will be visible

    And I click the "save" button
    And I wait for "1000" millsecond
#验证
    And I refresh the website
    And I click the "B" button
    Then I will see the "modifyNodeSentence" result will be "appname:apache"



  @dataset @Override
  Scenario: 删除节点
    Given open the "dataset.ListPage" page for uri "/dataset/"
    When the data name is "node_op_jnd" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible
    When I click the "B" button
    And I click the "delete" button
    And I click the "ensure" button
    Then I will see the success message "删除数据集节点成功"
