@dataset @datasetTree
Feature: 数据集_06构建树形结构

  Background:
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible

  Scenario Outline: 新建3个数据集进行测试
    When I click the "Create" button
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Alias" with value "<alias>"
    And I click the "<button>" button
    And I set the parameter "Spl" with value "*"
    And I click the "Ensure" button
    Then I wait for title change text to "数据集详情"

    Examples: 新建成功
      | name         | alias    | button     |
      | 父子无tree   | 无tree   | Nothing    |
      | 父子汇聚tree | 汇聚tree | Convergence|
      | 父子继承tree | 继承tree | Inherit    |

  Scenario: RZY-4085:父子行为-无
    When I set the parameter "SearchInput" with value "父子无tree"
    And I wait for loading invisible
    When the data name is "{'column':'0','name':'父子无tree'}" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    #构建第二层节点"B"
    And I click the "Root" button
    And I click the "AddNode" button
    And I set the parameter "NodeNameInTheTree" with value "无1"
    And I click the "Check" button
    And I set the parameter "Query" with value "tag:sample*"
    And I click the "Save" button
    And I will see the success message "添加数据集节点成功"
    And I wait for "SuccessMessage" will be invisible
    #构建第三层节点"C"
    And I click the "TopChild" button
    And I click the "AddNodeThirdLayer" button
    And I set the parameter "NodeNameInTheTree" with value "无2"
    And I click the "Check" button
    And I set the parameter "Query" with value "tag:beyond4"
    And I click the "Save" button
    And I will see the success message "添加数据集节点成功"
    And I wait for "SuccessMessage" will be invisible
    #构建"D"
    And I click the "TopChild" button
    And I click the "AddNodeThirdLayer" button
    And I set the parameter "NodeNameInTheTree" with value "无11"
    And I click the "Check" button
    And I set the parameter "Query" with value "appname:apache"
    And I click the "Save" button
    And I will see the success message "添加数据集节点成功"

  Scenario: RZY-4083:父子行为-汇聚
    When I set the parameter "SearchInput" with value "父子汇聚tree"
    And I wait for loading invisible
    When the data name is "{'column':'0','name':'父子汇聚tree'}" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I click the "Root" button
    And I click the "AddNode" button
    And I set the parameter "NodeNameInTheTree" with value "汇聚1"
    And I click the "Check" button
    And I set the parameter "Query" with value "tag:sample*"
    And I click the "Save" button
    And I will see the success message "添加数据集节点成功"
    And I wait for "SuccessMessage" will be invisible
      #构建第三层节点"C"
    And I click the "TopChild" button
    And I click the "AddNodeThirdLayer" button
    And I set the parameter "NodeNameInTheTree" with value "汇聚2"
    And I click the "Check" button
    And I set the parameter "Query" with value "tag:beyond4"
    And I click the "Save" button
    And I will see the success message "添加数据集节点成功"
    And I wait for "SuccessMessage" will be invisible
      #构建"D"
    And I click the "TopChild" button
    And I click the "AddNodeThirdLayer" button
    And I set the parameter "NodeNameInTheTree" with value "汇聚11"
    And I click the "Check" button
    And I set the parameter "Query" with value "appname:apache"
    And I click the "Save" button
    And I will see the success message "添加数据集节点成功"

  Scenario: RZY-4084:父子行为-继承
    When I set the parameter "SearchInput" with value "父子继承tree"
    And I wait for loading invisible
    When the data name is "{'column':'0','name':'父子继承tree'}" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
      #构建第二层节点"B"
    And I click the "Root" button
    And I click the "AddNode" button
    And I set the parameter "NodeNameInTheTree" with value "继承1"
    And I click the "Check" button
    And I set the parameter "Query" with value "tag:sample*"
    And I click the "Save" button
    And I will see the success message "添加数据集节点成功"
    And I wait for "SuccessMessage" will be invisible
      #构建第三层节点"C"
    And I click the "TopChild" button
    And I click the "AddNodeThirdLayer" button
    And I set the parameter "NodeNameInTheTree" with value "继承2"
    And I click the "Check" button
    And I set the parameter "Query" with value "tag:beyond4"
    And I click the "Save" button
    And I will see the success message "添加数据集节点成功"
    And I wait for "SuccessMessage" will be invisible
      #构建"D"
    And I click the "TopChild" button
    And I click the "AddNodeThirdLayer" button
    And I set the parameter "NodeNameInTheTree" with value "继承11"
    And I click the "Check" button
    And I set the parameter "Query" with value "appname:apache"
    And I click the "Save" button
    And I will see the success message "添加数据集节点成功"

  Scenario Outline: 验证：RZY-4083,RZY-4084,RZY-4085
    And I set the parameter "SearchInput" with value "<name>"
    And I wait for loading invisible
    Then I will see the data "{'column':'0','name':'<name>'}" values "{'column':'2','name':'<alias>'}"
    Then I will see the data "{'column':'0','name':'<name>'}" values "{'column':'3','name':'<behaviour>'}"

  Examples:
    | name         | alias    | behaviour |
    | 父子无tree   | 无tree   | 无        |
    | 父子汇聚tree | 汇聚tree | 汇聚      |
    | 父子继承tree | 继承tree | 继承      |