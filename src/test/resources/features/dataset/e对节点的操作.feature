@dataset @datasete @dataset1
Feature: 数据集-e对节点的操作

  @datasete1
  Scenario: RZY-4493:新建一个数据集修改【数据集中根有一个子节点】
    Given open the "dataset.ListPage" page for uri "/dataset/"
    When I click the "Create" button
    And I set the parameter "Name" with value "node_op_jnd"
    And I set the parameter "Alias" with value "op"
    And I set the parameter "Spl" with value "*"
    When I click the "Save" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible
    #构建第二层节点
    And I click the "root" button
    And I wait for "2000" millsecond
    When I click the "rootAdd" button
    And I set the parameter "BInputName" with value "无1"
    When I click the "BRightDuiHao" button
    And I set the parameter "sentenceInput" with value "tag:heka"
    When I click the "SaveDetail" button
    And I wait for loading complete

  @datasete2
  Scenario: RZY-4119:修改节点名称
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading complete
    And I wait for "2000" millsecond
    When the data name is "{'column':'0','name':'node_op_jnd'}" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    Given I wait for loading complete

    When I click the "TopChild" button
    And I wait for loading complete
    When I click the "pencil" button
    And I set the parameter "ModifyNode" with value "after"
    When I click the "duiHao" button
    When I click the "SaveDetail" button
    Given I wait for loading complete
    And I wait for "2000" millsecond
    Then I will see the "TopChild" result will be "after"

  @datasete3
  Scenario: RZY-4494:修改节点的约束语句
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading complete
    And I wait for "2000" millsecond
#    When the data name is "node_op_jnd" then i click the "编辑" button
    When the data name is "{'column':'0','name':'node_op_jnd'}" then i click the "编辑" button
#    And the data name is "{'column':'0','name':'node_op_jnd'}" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading complete
    When I click the "TopChild" button
    And I wait for loading complete

    And I wait for "modifyNodeSentence" will be visible

    When I click the "SaveDetail" button
    And I wait for "1000" millsecond
    #验证
    And I refresh the website
    When I click the "TopChild" button
    Then I will see the "modifyNodeSentence" result will be "appname:apache"

  @dataset @Override
  @tc4495
  Scenario: RZY-4495:删除节点
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading complete
    And I wait for "2000" millsecond
#    When the data name is "node_op_jnd" then i click the "编辑" button
    When the data name is "{'column':'0','name':'node_op_jnd'}" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading complete
    When I click the "TopChild" button
    When I click the "delete" button
    And I wait for loading complete
    When I click the "ensure" button
    Then I will see the success message "删除数据集节点成功"
