@dataset
Feature: 编辑根事件jnd

  Background:
    Given open the "dataset.ListPage" page for uri "/dataset/"

    @dataset
      Scenario: 新建一个数据集进行编辑
      When I click the "Create" button

      And I set the parameter "Name" with value "edit"
      And I set the parameter "Alias" with value "editRootTest"
      And I set the parameter "Yuju" with value "*"

      And I click the "Save" button
      Then I wait for title change text to "数据集详情"

     # Then I will see the "dataset.DetailPage" page
     # And I wait for loading invisible
   #返回列表页
    #  And I click the "Backlist" button
    #  And I wait for loading invisible
    #  When the data name is "edit" then i click the "编辑" button
    #  Then I will see the "dataset.DetailPage" page
   #   And I wait for loading invisible


  @dataset
  Scenario: 修改根别名

    When the data name is "edit" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible

    When I click the "Editevent" button
    And I set the parameter "Editalias" with value "rootalias"
    And I click the "Rootsave" button
    And I wait for loading invisible
    Then I will see the "Afteralias" result will be "rootalias"

  @dataset
  Scenario: 修改约束语句
    When the data name is "edit" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible


    When I click the "Editevent" button
    And I set the parameter "Edityuju" with value "tag:heka"
    And I click the "Rootsave" button
    And I wait for loading invisible
    Then I will see the "Afteryuju" result will be "tag:heka"


  @dataset
  Scenario: 修改父子行为为汇聚
    When the data name is "edit" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible


    When I click the "Editevent" button

    And I click the "Edithuiju" button

    And I click the "Rootsave" button
    And I wait for loading invisible

    Then I will see the "AfterFatherChild" result will be "汇聚"


  @dataset
  Scenario: 修改父子行为为继承
    When the data name is "edit" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible


    When I click the "Editevent" button
    And I click the "Editjicheng" button
    And I click the "Rootsave" button
    And I wait for loading invisible
    And I will see the "AfterFatherChild" result will be "继承"

  @dataset
  Scenario: 修改父子行为为无
    When the data name is "edit" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible


    When I click the "Editevent" button
    And I click the "Editwu" button
    And I click the "Rootsave" button
    And I wait for loading invisible
    And I will see the "AfterFatherChild" result will be "无"


  @dataset
  Scenario: 修改应用和分组
    When the data name is "edit" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible

    When I click the "Editevent" button
    And I set the parameter "Edityuju" with value "appname:apache"
    And I choose the "EventApp" from the "rootAppList"
    And I choose the "auto_package" from the "rootResourceGroup"
    And I click the "Rootsave" button
    And I wait for loading invisible
   #验证
    And I click the "Backlist" button
    Then I will see the "dataset.ListPage" page
    And I wait for loading invisible
    Then I will see the data "{'column':'0','name':'edit'}" values "{'column':'4','name':'EventApp'}"
    And I will see the data "{'column':'0','name':'edit'}" values "{'column':'5','name':'auto_package'}"



  @dataset
  Scenario: 修改根名称(最后测试修改名称)
    When the data name is "edit" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible

    When I click the "Editevent" button
    And I set the parameter "Editname" with value "rootname"
    And I click the "Rootsave" button
    And I wait for loading invisible
    Then I will see the "Aftername" result will be "rootname"


