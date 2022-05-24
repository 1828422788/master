@dataset @datasetFields
Feature: 数据集_10预定义字段列表

  Scenario Outline: 新建数据集
    Given open the "dataset.ListPage" page for uri "/dataset/"
    When I click the "Create" button
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Alias" with value "<alias>"
    And I set the parameter "Spl" with value "<spl>"
    When I click the "FieldAdd" button
    And I set the parameter "FieldName" with value "apache.status"
    And I choose the "数值" from the "FieldType"
    When I click the "FieldAdd" button
    And I wait for element "FieldName" change text to ""
    And I set the parameter "FieldName" with value "appname"
    And I choose the "字符串" from the "FieldType"
    When I click the "Ensure" button
    Then I wait for title change text to "数据集详情"

    Examples:
      | name            | alias   | spl |
      | have_root_field | hrfield | *   |

  Scenario Outline: RZY-4291:新建数据集，对根事件添加字段
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    When the data name is "{'column':'0','name':'<name>'}" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible
    And I will see the element "FieldsDetail" contains "apache.status"
    And I will see the element "FieldsDetail" contains "appname"

    Examples:
      | name            |
      | have_root_field |

  Scenario: RZY-4496:数据集字段在搜索页面的应用
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I drag the element "SearchPageSvg" to the fixed side
    When I click the Element with text "hrfield"
    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I will see the element "FieldOne" contains "apache.status"
    And I will see the element "FieldTwo" contains "appname"

  Scenario: RZY-4491:在编辑根事件中添加字段
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    When the data name is "{'column':'0','name':'have_root_field'}" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    When I choose the "编辑根事件" from the "MoreList"
    And I click the "FieldAdd" button
    And I set the parameter "FieldName" with value "ip"
    And I choose the "字符串" from the "FieldType"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be invisible
    And I will see the element "FieldsDetail" contains "ip"

  Scenario: RZY-4492:在编辑根事件中删除字段
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    When the data name is "have_root_field" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    When I choose the "编辑根事件" from the "MoreList"
    When I click the "DeleteField" button
    When I click the "Ensure" button
    And I wait for "SuccessMessage" will be invisible
    And I will see the text "ip" is not existed in page

  Scenario: RZY-4292:新建数据集，对子节点添加字段
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    When the data name is "{'column':'0','name':'have_root_field'}" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
      #构建一个子节点
    When I click the "Root" button
    When I click the "AddNode" button
    And I set the parameter "NodeNameInTheTree" with value "child1"
    When I click the "Check" button
    And I set the parameter "Query" with value "logtype:apache"
    And I click the "Save" button
    And I will see the success message "添加数据集节点成功"
    And I wait for "SuccessMessage" will be invisible

    When I click the "FieldAdd" button
    And I set the parameter "FieldName" with value "timestamp"
    And I choose the "时间" from the "FieldType"
    When I click the "FieldAdd" button
    And I wait for element "FieldName" change text to ""
    And I set the parameter "FieldName" with value "apache.resp_len"
    And I choose the "数值" from the "FieldType"

    When I click the "FieldAdd" button
    And I wait for element "FieldName" change text to ""
    And I set the parameter "FieldName" with value "hostname"
    And I choose the "字符串" from the "FieldType"
    When I click the "Save" button
    And I will see the success message "更新数据集节点成功"

  Scenario: RZY-4293:对子节点字段的操作-删除第三个子节点的字段
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    When the data name is "{'column':'0','name':'have_root_field'}" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    When I click the "TopChild" button
    And I wait for "Query" will be visible
    When I click the "DeleteField" button
    When I click the "Save" button
    And I will see the success message "更新数据集节点成功"

  Scenario: RZY-4293:对子节点字段的操作-批量删除子节点的字段
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    When the data name is "{'column':'0','name':'have_root_field'}" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    When I click the "TopChild" button
    And I click the Element with text "批量操作"
    And I "checked" the checkbox which name is "全选"
    When I click the "BatchDelete" button
    When I click the "Save" button
    And I will see the success message "更新数据集节点成功"
    And I wait for "SuccessMessage" will be invisible
    And I will see the text "apache.resp_len" is not existed in page
    And I will see the text "timestamp" is not existed in page