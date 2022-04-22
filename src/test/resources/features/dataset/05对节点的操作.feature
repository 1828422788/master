@dataset @datasetEditNode
Feature: 数据集_05对节点的操作

  Background:
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible

  Scenario: RZY-4493:新建一个数据集修改【数据集中根有一个子节点】
    When I click the "Create" button
    And I set the parameter "Name" with value "node_op_jnd"
    And I set the parameter "Alias" with value "op"
    And I set the parameter "Spl" with value "*"
    When I click the "Ensure" button
    Then I will see the "dataset.DetailPage" page
    And I click the "Root" button
    When I click the "AddNode" button
    And I set the parameter "NodeNameInTheTree" with value "无1"
    When I click the "Check" button
    And I set the value "tag:heka" to the textarea "Query"
    When I click the "Save" button
    And I will see the success message "添加数据集节点成功"

  Scenario: RZY-4119:修改节点名称
    When the data name is "{'column':'0','name':'node_op_jnd'}" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    When I click the "TopChild" button
    When I click the "Pencil" button
    And I set the parameter "NodeName" with value "after"
    When I click the "Check" button
    And I click the "Save" button
    And I wait for element "TopChild" change text to "after"

  Scenario: RZY-4494:修改节点的约束语句
    When the data name is "{'column':'0','name':'node_op_jnd'}" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    When I click the "TopChild" button
    And I set the value "appname:apache" to the textarea "Query"
    When I click the "Save" button
    And I refresh the website
    When I click the "TopChild" button
    Then I will see the text "appname:apache" exist in page

  Scenario: RZY-4495:删除节点
    When the data name is "{'column':'0','name':'node_op_jnd'}" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I click the "TopChild" button
    When I click the "DeleteNode" button
    When I click the "Ensure" button
    Then I will see the success message "删除数据集节点成功"