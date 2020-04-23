@dataset
Feature: 数据集-编辑根事件

  Background:
    Given open the "dataset.ListPage" page for uri "/dataset/"


      Scenario: 新建一个数据集进行编辑
      When I click the "Create" button

      And I set the parameter "Name" with value "edit"
      And I set the parameter "Alias" with value "editRootTest"
      And I set the parameter "Spl" with value "*"

      And I click the "Save" button
      Then I wait for title change text to "数据集详情"


  Scenario: 修改根别名

    When the data name is "edit" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible

    When I click the "editEvent" button
    And I set the parameter "editAlias" with value "rootalias"
    And I click the "rootSave" button
    And I wait for loading invisible
    Then I will see the "afterAlias" result will be "rootalias"


  Scenario: 修改约束语句
    When the data name is "edit" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible

    When I click the "editEvent" button
    And I set the parameter "editYuJu" with value "tag:heka"
    And I click the "rootSave" button
    And I wait for loading invisible
    Then I will see the "AfterYuJu" result will be "tag:heka"



  Scenario: 修改父子行为为汇聚
    When the data name is "edit" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible

    When I click the "editEvent" button

    And I click the "editHuiJu" button

    And I click the "rootSave" button
    And I wait for loading invisible

    Then I will see the "AfterFatherChild" result will be "汇聚"



  Scenario: 修改父子行为为继承
    When the data name is "edit" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible


    When I click the "editEvent" button
    And I click the "editJiCheng" button
    And I click the "rootSave" button
    And I wait for loading invisible
    And I will see the "AfterFatherChild" result will be "继承"


  Scenario: 修改父子行为为无
    When the data name is "edit" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible


    When I click the "editEvent" button
    And I click the "editWu" button
    And I click the "rootSave" button
    And I wait for loading invisible
    And I will see the "AfterFatherChild" result will be "无"



  Scenario: 修改应用和分组
    When the data name is "edit" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible
    When I click the "editEvent" button
    And I choose the "TrendApp" from the "rootAppList"
    And I choose the "auto_package" from the "rootResourceGroup"
    And I click the "rootSave" button
    And I wait for loading invisible
   #验证
    And I click the "backList" button
    Then I will see the "dataset.ListPage" page
    And I wait for loading invisible
    Then I will see the data "{'column':'0','name':'edit'}" values "{'column':'4','name':'TrendApp'}"
    And I will see the data "{'column':'0','name':'edit'}" values "{'column':'5','name':'auto_package'}"




  Scenario: 修改根名称(最后测试修改名称)
    When the data name is "edit" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible

    When I click the "editEvent" button
    And I set the parameter "editName" with value "rootname"
    And I click the "rootSave" button
    And I wait for loading invisible
    Then I will see the "afterName" result will be "rootname"


