@dataset @datasetf @dataset1
Feature: 数据集-f构建树形结构

  @datasetf1
  Scenario Outline: 新建3个数据集进行测试
    Given open the "dataset.ListPage" page for uri "/dataset/"
    When I click the "Create" button
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Alias" with value "<alias>"
    And I click the "<typeButton>" button
    And I set the parameter "Spl" with value "<spl>"

    And I click the "Save" button
    Then I wait for title change text to "数据集详情"

    Examples: 新建成功
      | name     | alias  | spl | typeButton |
      | 父子无tree  | 无tree  | *   | 无          |
      | 父子汇聚tree | 汇聚tree | *   | HuiJu      |
#      | 父子继承tree | 继承tree | *   | inherit    |

  @datasetf2 @tc4085
  Scenario: RZY-4085:父子行为-无
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for "2000" millsecond
    When the data name is "{'column':'0','name':'父子无tree'}" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading complete
    #构建第二层节点"B"
    And I click the "root" button
    And I wait for "2000" millsecond
    And I click the "rootAdd" button
    And I set the parameter "BInputName" with value "无1"
    And I click the "BRightDuiHao" button
    And I set the parameter "sentenceInput" with value "tag:sample*"
    And I click the "SaveDetail" button

    And I wait for "3000" millsecond
    #构建第三层节点"C"
    And I click the "TopChild" button
    And I wait for "2000" millsecond
    And I click the "BAdd" button
    And I set the parameter "CInputName" with value "无2"
    And I click the "CRightDuiHao" button
    And I set the parameter "sentenceInput" with value "tag:beyond4"
    And I click the "SaveDetail" button
    And I wait for "2000" millsecond
    #构建"D"
    And I click the "TopChild" button
    And I wait for "2000" millsecond
    And I click the "BAdd" button
    And I set the parameter "DInputName" with value "无11"
    And I click the "DRightDuiHao" button
    And I set the parameter "sentenceInput" with value "appname:apache"
    And I click the "SaveDetail" button
    And I wait for "2000" millsecond

  @datasetf3
  Scenario: RZY-4083:父子行为-汇聚
#选择汇聚
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for "2000" millsecond
    When the data name is "{'column':'0','name':'父子汇聚tree'}" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading complete
      #构建第二层节点"B"
    And I click the "root" button
    And I click the "rootAdd" button
    And I set the parameter "BInputName" with value "汇聚1"
    And I click the "BRightDuiHao" button
    And I set the parameter "sentenceInput" with value "tag:sample*"
    And I click the "SaveDetail" button
    And I wait for "3000" millsecond
      #构建第三层节点"C"
    And I click the "TopChild" button
    And I click the "BAdd" button
    And I set the parameter "CInputName" with value "汇聚2"
    And I click the "CRightDuiHao" button
    And I set the parameter "sentenceInput" with value "tag:beyond4"
    And I click the "SaveDetail" button
    And I wait for "3000" millsecond
      #构建"D"
    And I click the "TopChild" button
    And I click the "BAdd" button
    And I set the parameter "DInputName" with value "汇聚11"
    And I click the "DRightDuiHao" button
    And I set the parameter "sentenceInput" with value "appname:apache"
    And I click the "SaveDetail" button
    And I wait for "2000" millsecond

  @fatherson
  Scenario: RZY-4084:父子行为-继承
#选择继承
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for "2000" millsecond
    When the data name is "{'column':'0','name':'父子继承tree'}" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading complete
      #构建第二层节点"B"
    And I click the "root" button
    And I click the "rootAdd" button
    And I set the parameter "BInputName" with value "继承1"
    And I click the "BRightDuiHao" button
    And I set the parameter "sentenceInput" with value "tag:sample*"
    And I click the "SaveDetail" button
    And I wait for "3000" millsecond
      #构建第三层节点"C"
    And I click the "TopChild" button
    And I click the "BAdd" button
    And I set the parameter "CInputName" with value "继承2"
    And I click the "CRightDuiHao" button
    And I set the parameter "sentenceInput" with value "tag:beyond4"
    And I click the "SaveDetail" button
    And I wait for "3000" millsecond
      #构建"D"
    And I click the "TopChild" button
    And I click the "BAdd" button
    And I set the parameter "DInputName" with value "继承11"
    And I click the "DRightDuiHao" button
    And I set the parameter "sentenceInput" with value "appname:apache"
    And I click the "SaveDetail" button
    And I wait for "2000" millsecond


  @y4085
  Scenario: 验证：RZY-4085:父子行为-无
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading complete
    Then I will see the data "{'column':'0','name':'父子无tree'}" values "{'column':'1','name':'无tree'}"
    And I will see the data "{'column':'0','name':'父子无tree'}" values "{'column':'2','name':'无'}"
#    And I will see the data "{'column':'0','name':'父子无tree'}" values "{'column':'5','name':'无'}"
#    And I will see the data "{'column':'0','name':'父子无tree'}" values "{'column':'6','name':'无'}"
#    And I will see the data "{'column':'0','name':'父子无tree'}" values "{'column':'6','name':'admin'}"

  @y4083
  Scenario: 验证：RZY-4083
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading complete
      #别名
    Then I will see the data "{'column':'0','name':'父子汇聚tree'}" values "{'column':'1','name':'汇聚tree'}"
      #父子行为
    And I will see the data "{'column':'0','name':'父子汇聚tree'}" values "{'column':'2','name':'汇聚'}"
#    And I will see the data "{'column':'0','name':'父子汇聚tree'}" values "{'column':'5','name':'无'}"
#    And I will see the data "{'column':'0','name':'父子汇聚tree'}" values "{'column':'6','name':'无'}"
#    And I will see the data "{'column':'0','name':'父子汇聚tree'}" values "{'column':'6','name':'admin'}"

  @y4084
  Scenario: 验证：RZY-4084:父子行为-继承
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading complete
      #别名
    Then I will see the data "{'column':'0','name':'父子继承tree'}" values "{'column':'1','name':'继承tree'}"
      #父子行为
    And I will see the data "{'column':'0','name':'父子继承tree'}" values "{'column':'2','name':'继承'}"
      #所属应用
#    And I will see the data "{'column':'0','name':'父子继承tree'}" values "{'column':'5','name':'无'}"
#      #标签
#    And I will see the data "{'column':'0','name':'父子继承tree'}" values "{'column':'6','name':'无'}"
      #创建者
#    And I will see the data "{'column':'0','name':'父子继承tree'}" values "{'column':'6','name':'admin'}"




















