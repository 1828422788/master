@dataset @datasetk @dataset2
Feature: 数据集-k预定义字段列表

  @datasetk1
  Scenario Outline: 新建3个数据集进行测试
#    Given open the "dataset.ListPage" page for uri "/dataset/"
    When I click the "Create" button
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Alias" with value "<alias>"
    And I set the parameter "Spl" with value "<spl>"

    When I click the "fieldAdd" button
    And I set the parameter "firstFieldName" with value "apache.status"
#    And I choose the "数值" from the "FirstFieldType"
    When I click the "FirstFieldType" button
    When I click the "number" button
    And I wait for "3000" millsecond
    And I wait for loading complete
#    And I click the "fieldLowAdd" button

    When I click the "fieldAdd" button
    And I set the parameter "secondFieldName" with value "appname"
    And I choose the "字符串" from the "SecondFieldTypeList"
#    And I click the "secondFieldType" button
#    And I click the "字符串" button
    And I wait for "3000" millsecond
    And I wait for loading complete

    When I click the "Save" button
    Then I wait for title change text to "数据集详情"

    Examples: 新建成功
      | name            | alias   | spl |
      | have_root_field | hrfield | *   |

  @datasetk2
  Scenario Outline: RZY-4291:新建数据集，对根事件添加字段
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for "2000" millsecond
    When the data name is "{'column':'0','name':'<name>'}" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page

    Given I wait for loading complete
    And I wait for "5000" millsecond
    #验证添加的字段
    Then I will see the "firstName" result will be "apache.status"
    Then I will see the "secondName" result will be "appname"

    Examples: 新建成功
      | name            | alias   | spl |
      | have_root_field | hrfield | *   |

  @datasetk3
  Scenario: RZY-4491:在编辑根事件中添加字段
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading complete
#    When the data name is "have_root_field" then i click the "编辑" button
    When the data name is "{'column':'0','name':'have_root_field'}" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading complete

    When I click the "editEvent" button
    And I click the "fieldAdd" button
    And I set the parameter "thirdFieldName" with value "ip"
    And I choose the "字符串" from the "ThirdFieldTypeList"
#    And I click the "thirdFieldType" button
#    And I click the "strType" button

    And I click the "rootSave" button
    And I wait for loading complete
    Then I will see the "thirdName" result will be "ip"

  @datasetk4
  Scenario: RZY-4492:在编辑根事件中删除字段
    Given open the "dataset.ListPage" page for uri "/dataset/"
    When the data name is "have_root_field" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading complete

    When I click the "editEvent" button
    When I click the "deleteField" button
    When I click the "rootSave" button
    And I wait for loading complete
    Then I will see the "firstName" result will be "apache.status"
    Then I will see the "secondName" result will be "appname"

  @datasetk5
  Scenario: RZY-4292:新建数据集，对子节点添加字段
    Given open the "dataset.ListPage" page for uri "/dataset/"
#    When the data name is "have_root_field" then i click the "编辑" button
    When the data name is "{'column':'0','name':'have_root_field'}" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading complete
      #构建一个子节点
    When I click the "root" button
    When I click the "rootAdd" button
    And I set the parameter "BInputName" with value "child1"
    When I click the "BRightDuiHao" button
    And I set the parameter "sentenceInput" with value "logtype:apache"
#     And I click the "save" button
    And I wait for "2000" millsecond

    When I click the "ChildFieldAdd" button
    And I set the parameter "Child_first_name" with value "timestamp"
    And I choose the "时间" from the "child_first_typeList"
#    When I click the "child_first_type" button
#    When I click the "time" button

    When I click the "ChildFieldAdd" button
    And I set the parameter "Child_second_name" with value "apache.resp_len"
    And I choose the "数值" from the "child_second_typeList"
#    When I click the "Child_second_type" button
#    When I click the "number" button

    When I click the "ChildFieldAdd" button
    And I set the parameter "Child_third_name" with value "hostname"
    And I choose the "字符串" from the "Child_third_typeList"
#    When I click the "Child_third_type" button
#    When I click the "strType" button

    When I click the "SaveDetail" button

  @datasetk6
  Scenario: RZY-4293:对子节点字段的操作-删除第三个子节点的字段
    Given open the "dataset.ListPage" page for uri "/dataset/"
#    When the data name is "have_root_field" then i click the "编辑" button
    When the data name is "{'column':'0','name':'have_root_field'}" then i click the "编辑" button

    Then I will see the "dataset.DetailPage" page
    And I wait for loading complete

    When I click the "TopChild" button
    When I click the "ChildThirdDeleteField" button
    When I click the "SaveDetail" button

  @datasetk7
  Scenario: RZY-4293:对子节点字段的操作-批量删除子节点的字段
    Given open the "dataset.ListPage" page for uri "/dataset/"
#    When the data name is "have_root_field" then i click the "编辑" button
    When the data name is "{'column':'0','name':'have_root_field'}" then i click the "编辑" button

    Then I will see the "dataset.DetailPage" page
    And I wait for loading complete

    When I click the "TopChild" button
    When I click the "batchOperation" button
#    And I "checked" the checkbox which name is "全选"
    When I click the "AllCheck" button
    When I click the "allDelete" button
    When I click the "SaveDetail" button

  @datasetk8
  Scenario: RZY-4496:数据集字段在搜索页面的应用
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I drag the element "SearchPageSvg" to the fixed side

    When I click the "hrField" button

    When I click the "DateEditor" button
    When I click the "RecentSevenDay" button
    When I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
  #验证字段
    Then I will see the "fieldOne" result will be "apache.status"
    Then I will see the "fieldTwo" result will be "appname"