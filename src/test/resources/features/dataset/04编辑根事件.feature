@dataset @datasetEdit
Feature: 数据集_04编辑根事件

  Background:
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible

  Scenario Outline: 新建一个数据集进行编辑
    When I click the "Create" button
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Alias" with value "<alias>"
    And I set the parameter "Spl" with value "*"
    When I click the "Ensure" button
    Then I wait for title change text to "数据集详情"

    Examples: 新建成功
      | name          | alias      |
      | edit          | edit_alias |

  Scenario: RZY-4122:修改别名
    When the data name is "edit" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    When I click the "EditEvent" button
    And I set the parameter "Alias" with value "new_alias"
    When I click the "Ensure" button
    And I will see the success message "修改成功"
    And I wait for element "PageSubtitle" change text to "new_alias"

  Scenario: RZY-4123:修改约束语句
    When the data name is "edit" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    When I click the "EditEvent" button
    And I set the parameter "Spl" with value "tag:heka"
    And I click the "Ensure" button
    And I will see the success message "修改成功"
    And I wait for element "SplDetail" change text to "tag:heka"

  Scenario: RZY-4124:修改所属应用和分组
    When the data name is "edit" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    When I click the "EditEvent" button
    And I choose the "test_app" from the "AppField"
    And I set the parameter "Spl" with value "*"
    And I choose the "auto_package" from the "TagField"
    And I click the "Ensure" button
    When I click the "Return" button
    Then I will see the "dataset.ListPage" page
    And I wait for loading invisible
    Then I will see the data "{'column':'0','name':'edit'}" values "{'column':'4','name':'test_app'}"
    And the data name is "{'column':'0','name':'edit'}" then I "expand" the item
    And I will see the element "ExpandedRow" contains "资源标签..............auto_package"

  Scenario: 修改父子行为为汇聚-RZY-4125:修改父子行为
    When the data name is "edit" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    When I click the "EditEvent" button
    And I click the Element with text "汇聚"
    And I click the "Ensure" button
    And I will see the success message "修改成功"
    And I wait for element "BehaviourDetail" change text to "汇聚"
    
  Scenario: 修改父子行为为继承-RZY-4125:修改父子行为
    When the data name is "edit" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    When I click the "EditEvent" button
    And I click the Element with text "继承"
    When I click the "Ensure" button
    And I will see the success message "修改成功"
    And I wait for element "BehaviourDetail" change text to "继承"

  Scenario: 修改父子行为为无-RZY-4125:修改父子行为
    When the data name is "edit" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    When I click the "EditEvent" button
    And I click the Element with text "无"
    When I click the "Ensure" button
    And I will see the success message "修改成功"
    And I wait for element "BehaviourDetail" change text to "无"

  Scenario: RZY-4121:修改名称(最后测试修改名称)
    When the data name is "edit" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    When I click the "EditEvent" button
    And I set the parameter "Name" with value "new_name"
    When I click the "Ensure" button
    And I will see the success message "修改成功"
    And I wait for element "PageTitle" change text to "new_name"