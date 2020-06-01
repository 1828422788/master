@dataset
Feature: 数据集-f构建树形结构


  Scenario: RZY-4085:父子行为-无
      #新建
    Given open the "dataset.ListPage" page for uri "/dataset/"
    When I click the "Create" button
    And I set the parameter "Name" with value "父子无tree"
    And I set the parameter "Alias" with value "无tree"
    And I set the parameter "Spl" with value "*"
    And I click the "Save" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible
      #构建第二层节点"B"
    And I click the "root" button
    And I click the "rootAdd" button
    And I set the parameter "BInputName" with value "无1"
    And I click the "BRightDuiHao" button
    And I set the parameter "sentenceInput" with value "tag:sample*"
    And I click the "save" button

    And I wait for "3000" millsecond
      #构建第三层节点"C"
    And I click the "B" button
    And I click the "BAdd" button
    And I set the parameter "CInputName" with value "无2"
    And I click the "CRightDuiHao" button
    And I set the parameter "sentenceInput" with value "tag:beyond4"
    And I click the "save" button
    And I wait for "2000" millsecond
      #构建"D"
    And I click the "B" button
    And I click the "BAdd" button
    And I set the parameter "DInputName" with value "无11"
    And I click the "DRightDuiHao" button
    And I set the parameter "sentenceInput" with value "appname:apache"
    And I click the "save" button
    And I wait for "3000" millsecond

   #返回列表页验证
    And I click the "BackList" button
    And I wait for loading invisible
    Then I will see the data "{'column':'0','name':'父子无tree'}" values "{'column':'2','name':'无tree'}"
    And I will see the data "{'column':'0','name':'父子无tree'}" values "{'column':'3','name':'无'}"
    And I will see the data "{'column':'0','name':'父子无tree'}" values "{'column':'4','name':'无'}"
    And I will see the data "{'column':'0','name':'父子无tree'}" values "{'column':'5','name':'无'}"
#    And I will see the data "{'column':'0','name':'父子无tree'}" values "{'column':'6','name':'admin'}"



  Scenario: RZY-4083:父子行为-汇聚
      #新建
    Given open the "dataset.ListPage" page for uri "/dataset/"
    When I click the "Create" button
    And I set the parameter "Name" with value "父子汇聚tree"
    And I set the parameter "Alias" with value "汇聚tree"
#选择汇聚
    And I click the "HuiJu" button

    And I set the parameter "Spl" with value "*"
    And I click the "Save" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible
      #构建第二层节点"B"
    And I click the "root" button
    And I click the "rootAdd" button
    And I set the parameter "BInputName" with value "汇聚1"
    And I click the "BRightDuiHao" button
    And I set the parameter "sentenceInput" with value "tag:sample*"
    And I click the "save" button
    And I wait for "3000" millsecond
      #构建第三层节点"C"
    And I click the "B" button
    And I click the "BAdd" button
    And I set the parameter "CInputName" with value "汇聚2"
    And I click the "CRightDuiHao" button
    And I set the parameter "sentenceInput" with value "tag:beyond4"
    And I click the "save" button
    And I wait for "3000" millsecond
      #构建"D"
    And I click the "B" button
    And I click the "BAdd" button
    And I set the parameter "DInputName" with value "汇聚11"
    And I click the "DRightDuiHao" button
    And I set the parameter "sentenceInput" with value "appname:apache"
    And I click the "save" button
    And I wait for "3000" millsecond
   #返回列表页验证
    And I click the "BackList" button
    And I wait for loading invisible
      #别名
    Then I will see the data "{'column':'0','name':'父子汇聚tree'}" values "{'column':'2','name':'汇聚tree'}"
      #父子行为
    And I will see the data "{'column':'0','name':'父子汇聚tree'}" values "{'column':'3','name':'汇聚'}"
      #所属应用
    And I will see the data "{'column':'0','name':'父子汇聚tree'}" values "{'column':'4','name':'无'}"
      #标签
    And I will see the data "{'column':'0','name':'父子汇聚tree'}" values "{'column':'5','name':'无'}"
      #创建者
#    And I will see the data "{'column':'0','name':'父子汇聚tree'}" values "{'column':'6','name':'admin'}"



  Scenario: RZY-4084:父子行为-继承
      #新建
    Given open the "dataset.ListPage" page for uri "/dataset/"
    When I click the "Create" button
    And I set the parameter "Name" with value "父子继承tree"
    And I set the parameter "Alias" with value "继承tree"
#选择继承
    And I click the "inherit" button

    And I set the parameter "Spl" with value "*"
    And I click the "Save" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible
      #构建第二层节点"B"
    And I click the "root" button
    And I click the "rootAdd" button
    And I set the parameter "BInputName" with value "继承1"
    And I click the "BRightDuiHao" button
    And I set the parameter "sentenceInput" with value "tag:sample*"
    And I click the "save" button
    And I wait for "3000" millsecond
      #构建第三层节点"C"
    And I click the "B" button
    And I click the "BAdd" button
    And I set the parameter "CInputName" with value "继承2"
    And I click the "CRightDuiHao" button
    And I set the parameter "sentenceInput" with value "tag:beyond4"
    And I click the "save" button
    And I wait for "3000" millsecond
      #构建"D"
    And I click the "B" button
    And I click the "BAdd" button
    And I set the parameter "DInputName" with value "继承11"
    And I click the "DRightDuiHao" button
    And I set the parameter "sentenceInput" with value "appname:apache"
    And I click the "save" button
    And I wait for "3000" millsecond
   #返回列表页验证
    And I click the "BackList" button
    And I wait for loading invisible
      #别名
    Then I will see the data "{'column':'0','name':'父子继承tree'}" values "{'column':'2','name':'继承tree'}"
      #父子行为
    And I will see the data "{'column':'0','name':'父子继承tree'}" values "{'column':'3','name':'继承'}"
      #所属应用
    And I will see the data "{'column':'0','name':'父子继承tree'}" values "{'column':'4','name':'无'}"
      #标签
    And I will see the data "{'column':'0','name':'父子继承tree'}" values "{'column':'5','name':'无'}"
      #创建者
#    And I will see the data "{'column':'0','name':'父子继承tree'}" values "{'column':'6','name':'admin'}"





















