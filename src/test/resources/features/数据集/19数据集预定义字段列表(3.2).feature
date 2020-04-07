@dataset
Feature: 数据集预定义字段列表

  @dataset
  Scenario Outline: 新建数据集，对根事件添加字段 RZY-4291
    Given open the "dataset.ListPage" page for uri "/dataset/"
    When I click the "Create" button
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Alias" with value "<alias>"
    And I set the parameter "YuJu" with value "<yuJu>"

    And I click the "fieldAdd" button
    And I set the parameter "firstFieldName" with value "apache.status"
    And I choose the "数值" from the "FirstFieldType"

    And I click the "fieldLowAdd" button
    And I set the parameter "secondFieldName" with value "appname"
    And I choose the "字符串" from the "secondFieldType"

    And I click the "Save" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible
    #验证添加的字段
    Then I will see the "firstName" result will be "apache.status"
    Then I will see the "secondName" result will be "appname"

    Examples: 新建成功
      | name           | alias      | yuJu  |
      |have_root_field |hrfield     |*      |


   @dataset
     Scenario: 在编辑根事件中添加字段
     Given open the "dataset.ListPage" page for uri "/dataset/"
     When the data name is "have_root_field" then i click the "编辑" button
     Then I will see the "dataset.DetailPage" page
     And I wait for loading invisible

     When I click the "editEvent" button
     And I click the "childFieldAdd" button
     And I set the parameter "thirdFieldName" with value "ip"
     And I choose the "字符串" from the "thirdFieldType"

     And I click the "rootSave" button
     And I wait for loading invisible
     Then I will see the "thirdName" result will be "ip"


  @dataset
  Scenario: 在编辑根事件中删除字段
    Given open the "dataset.ListPage" page for uri "/dataset/"
    When the data name is "have_root_field" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible

    When I click the "editEvent" button
    And I click the "deleteField" button
    And I click the "rootSave" button
    And I wait for loading invisible
    Then I will see the "firstName" result will be "apache.status"
    Then I will see the "secondName" result will be "appname"



   @dataset
   Scenario: 对子节点添加字段RZY-4292
     Given open the "dataset.ListPage" page for uri "/dataset/"
     When the data name is "have_root_field" then i click the "编辑" button
     Then I will see the "dataset.DetailPage" page
     And I wait for loading invisible
      #构建一个子节点
     And I click the "root" button
     And I click the "rootAdd" button
     And I set the parameter "BInputName" with value "child1"
     And I click the "BRightDuiHao" button
     And I set the parameter "sentenceInput" with value "logtype:apache"
     And I click the "save" button
     And I wait for "2000" millsecond

     And I click the "childFieldAdd" button
     And I set the parameter "child_first_name" with value "timestamp"
     And I choose the "时间" from the "child_first_type"

     And I click the "childFieldAdd" button
     And I set the parameter "child_second_name" with value "apache.resp_len"
     And I choose the "数值" from the "child_second_type"

     And I click the "childFieldAdd" button
     And I set the parameter "child_third_name" with value "hostname"
     And I choose the "字符串" from the "child_third_type"
     And I click the "save" button


     @dataset
     Scenario: 删除第三个子节点的字段
       Given open the "dataset.ListPage" page for uri "/dataset/"
       When the data name is "have_root_field" then i click the "编辑" button
       Then I will see the "dataset.DetailPage" page
       And I wait for loading invisible

       And I click the "B" button
       And I click the "childDeleteField" button
       And I click the "save" button


  @dataset
  Scenario: 批量删除子节点的字段
    Given open the "dataset.ListPage" page for uri "/dataset/"
    When the data name is "have_root_field" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible

    And I click the "B" button
    And I click the "batchOperation" button
    And I "checked" the checkbox which name is "全选"
    And I click the "allDelete" button
    And I click the "save" button

