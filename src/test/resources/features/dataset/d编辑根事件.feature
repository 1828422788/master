@dataset @datasetd @dataset1
Feature: 数据集-d编辑根事件

  Background:
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for "2000" millsecond
    
  @datasetd1
  Scenario Outline: 新建一个数据集进行编辑
    When I click the "Create" button
    And I wait for loading invisible

    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Alias" with value "<alias>"
    And I set the parameter "Spl" with value "<spl>"

    And I click the "Save" button
    Then I wait for title change text to "数据集详情"

    Examples: 新建成功
      | name          | alias         | spl |
      | edit          | editRootTest  | *   |
      | edit1         | edit1  | *   |
      | edit2         | edit2  | *   |
      | edit3         | edit3  | *   |
      | edit4         | edit4  | *   |
      | edit5         | edit5  | *   |
      | name_toupdate | name_toupdate | *   |

  @4122
  Scenario: RZY-4122:修改别名
    When the data name is "edit" then i click the "编辑" button
#    And  the data name is "{'column':'0','name':'<name>'}" then i click the "删除" button in more menu
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible

    When I click the "editEvent" button
    And I set the parameter "editAlias" with value "rootalias"
    And I click the "rootSave" button
    And I wait for loading invisible
    Then I will see the "afterAlias" result will be "rootalias"

  @4123
  Scenario: RZY-4123:修改约束语句
    When the data name is "edit1" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible

    When I click the "editEvent" button
    And I set the parameter "editYuJu" with value "tag:heka"
    And I click the "rootSave" button
    And I wait for loading invisible
    Then I will see the "AfterYuJu" result will be "tag:heka"

  @tc4124
  Scenario: RZY-4124:修改所属应用和分组
    When the data name is "edit2" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible
    When I click the "editEvent" button
    And I set the parameter "editYuJu" with value "tag:heka"
    And I choose the "app之api全部用例" from the "rootAppList"
    And I choose the "auto_package" from the "rootResourceGroup"
    And I click the "rootSave" button
    And I wait for loading invisible
   #验证
    And I click the "backList" button
    And I wait for loading invisible
    Then I will see the "dataset.ListPage" page
    Then I will see the data "{'column':'0','name':'edit2'}" values "{'column':'4','name':'app之api全部用例'}"
#    And I will see the data "{'column':'0','name':'edit'}" values "{'column':'6','name':'auto_package'}"


  Scenario: RZY-4121:修改名称(最后测试修改名称)
    When the data name is "name_toupdate" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible

    When I click the "editEvent" button
    And I set the parameter "editName" with value "name_updated"
    And I click the "rootSave" button
    And I wait for loading invisible
    Then I will see the "afterName" result will be "name_updated"

  @4125hj
  Scenario: 修改父子行为为汇聚-RZY-4125:修改父子行为
    When the data name is "edit3" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible

    When I click the "editEvent" button
    And I click the "editHuiJu" button
    And I click the "rootSave" button
    And I wait for loading invisible

    Then I will see the "AfterFatherChild" result will be "汇聚"

  @4125jc
  Scenario: 修改父子行为为继承-RZY-4125:修改父子行为
    When the data name is "edit4" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible

    When I click the "editEvent" button
    And I click the "editJiCheng" button
    And I click the "rootSave" button
    And I wait for loading invisible
    And I will see the "AfterFatherChild" result will be "继承"

  @4125wu
  Scenario: 修改父子行为为无-RZY-4125:修改父子行为
    When the data name is "edit5" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible

    When I click the "editEvent" button
    And I click the "editWu" button
    And I click the "rootSave" button
    And I wait for loading invisible
    And I will see the "AfterFatherChild" result will be "无"