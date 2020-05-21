
@dataset("priority=1")
Feature: 数据集-新建


  Scenario Outline: 新建数据集必填项测试【父子行为无】
    Given open the "dataset.ListPage" page for uri "/dataset/"
    When I click the "Create" button

    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Alias" with value "<alias>"
    And I set the parameter "Spl" with value "<Spl>"

    And I click the "Save" button

    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible
   #返回列表页验证
    And I click the "backList" button

   And I wait for loading invisible
   Then I will see the data "{'column':'0','name':'JNDTest'}" values "{'column':'2','name':'jnd'}"
   And I will see the data "{'column':'0','name':'JNDTest'}" values "{'column':'3','name':'无'}"
   And I will see the data "{'column':'0','name':'JNDTest'}" values "{'column':'4','name':'无'}"
   And I will see the data "{'column':'0','name':'JNDTest'}" values "{'column':'5','name':'无'}"
#   And I will see the data "{'column':'0','name':'JNDTest'}" values "{'column':'6','name':'admin'}"

    Examples: 新建成功
      | name    | alias  | Spl  |
      |JNDTest |jnd     |*     |


  Scenario: 新建数据集选择分组和应用
    Given open the "dataset.ListPage" page for uri "/dataset/"
    When I click the "Create" button

    And I set the parameter "Name" with value "分组和应用"
    And I set the parameter "Alias" with value "groupApp"
    And I set the parameter "Spl" with value "*"

    And I choose the "无数集app之api全部测试用例" from the "appList"
    And I choose the "auto_package" from the "resourceGroup"

    And I click the "Save" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible
   #返回列表页验证
    And I click the "backList" button
    And I wait for loading invisible
    Then I will see the data "{'column':'0','name':'分组和应用'}" values "{'column':'2','name':'groupApp'}"
    And I will see the data "{'column':'0','name':'分组和应用'}" values "{'column':'3','name':'无'}"
    And I will see the data "{'column':'0','name':'分组和应用'}" values "{'column':'4','name':'无数集app之api全部测试用例'}"
    And I will see the data "{'column':'0','name':'分组和应用'}" values "{'column':'5','name':'auto_package'}"
#    And I will see the data "{'column':'0','name':'分组和应用'}" values "{'column':'6','name':'admin'}"




  Scenario: 父子行为为汇聚
    Given open the "dataset.ListPage" page for uri "/dataset/"
    When I click the "Create" button
    And I set the parameter "Name" with value "父子汇聚"
    And I set the parameter "Alias" with value "汇聚"

    And I click the "HuiJu" button

    And I set the parameter "Spl" with value "*"
    And I click the "Save" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible
     #以下步骤为验证
    And I click the "BackList" button
    And I wait for loading invisible
    #别名
    Then I will see the data "{'column':'0','name':'父子汇聚'}" values "{'column':'2','name':'汇聚'}"
    #父子行为
    And I will see the data "{'column':'0','name':'父子汇聚'}" values "{'column':'3','name':'汇聚'}"
   #所属应用
    And I will see the data "{'column':'0','name':'父子汇聚'}" values "{'column':'4','name':'无'}"
    #标签
    And I will see the data "{'column':'0','name':'父子汇聚'}" values "{'column':'5','name':'无'}"
    #创建者
#    And I will see the data "{'column':'0','name':'父子汇聚'}" values "{'column':'6','name':'admin'}"




  Scenario: 父子行为为继承
    Given open the "dataset.ListPage" page for uri "/dataset/"
    When I click the "Create" button
    And I set the parameter "Name" with value "父子继承"
    And I set the parameter "Alias" with value "继承"

    And I click the "inherit" button

    And I set the parameter "Spl" with value "*"
    And I click the "Save" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible
     #以下步骤为验证
    And I click the "BackList" button
    And I wait for loading invisible
    #别名
    Then I will see the data "{'column':'0','name':'父子继承'}" values "{'column':'2','name':'继承'}"
    #父子行为
    And I will see the data "{'column':'0','name':'父子继承'}" values "{'column':'3','name':'继承'}"
    #所属应用
    And I will see the data "{'column':'0','name':'父子继承'}" values "{'column':'4','name':'无'}"
    #标签
    And I will see the data "{'column':'0','name':'父子继承'}" values "{'column':'5','name':'无'}"
    #创建者
#    And I will see the data "{'column':'0','name':'父子继承'}" values "{'column':'6','name':'admin'}"





  Scenario: 新建数据集失败0
    Given open the "dataset.ListPage" page for uri "/dataset/"
    When I click the "Create" button


    And I click the "Save" button
    Then I will see the element "tipsName" name is "请输入数据集名称"
    Then I will see the element "tipsAlias" name is "请输入别名"
    Then I will see the element "tipsYuJu" name is "请输入约束语句"





  Scenario: 新建数据集失败1
    Given open the "dataset.ListPage" page for uri "/dataset/"
    When I click the "Create" button


    And I set the parameter "Name" with value "failOne"

    And I click the "Save" button
    Then I will see the element "tipsAlias" name is "请输入别名"
    Then I will see the element "tipsYuJu" name is "请输入约束语句"




  Scenario: 新建数据集失败2
    Given open the "dataset.ListPage" page for uri "/dataset/"
    When I click the "Create" button


    And I set the parameter "Name" with value "failTwo"
    And I set the parameter "Alias" with value "failAlias"

    And I click the "Save" button
    Then I will see the element "tipsYuJu" name is "请输入约束语句"