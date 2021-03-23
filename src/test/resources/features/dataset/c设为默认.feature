@dataset @datasetc @dataset1
Feature: 数据集-c设为默认

  @tc4082_1
  Scenario Outline: 新建进行默认操作的数据集
    Given open the "dataset.ListPage" page for uri "/dataset/"
    When I click the "Create" button

    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Alias" with value "<alias>"
    And I set the parameter "Spl" with value "<Spl>"

    And I choose the "app之api全部用例" from the "appList"
    And I choose the "auto_package" from the "resourceGroup"

    And I click the "Save" button

    Then I will see the "dataset.DetailPage" page
    And I wait for loading complete
   #返回列表页验证
    And I click the "backList" button

    Examples: 新建成功
      | name    | alias | Spl |
      | JNDTest_default | jnd   | *   |

  Scenario: 设为默认-RZY-4077:设为默认
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading complete
#    Given the data name is "JNDTest_default" then i click the "设为默认" button
    And  the data name is "{'column':'0','name':'JNDTest_default'}" then i click the "设为默认" button in more menu

    Then I will see the success message "设置默认数据集成功"

  Scenario: 在搜索页验证默认数据集
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "zhanKai" button
    And I wait for loading invisible
    Then I will see the "dataSetPosition" result will be "*"

  Scenario: 取消默认
    Given open the "dataset.ListPage" page for uri "/dataset/"
#    Given the data name is "JNDTest_default" then i click the "取消默认" button
    And  the data name is "{'column':'0','name':'JNDTest_default'}" then i click the "取消默认" button in more menu
    Then I will see the success message "取消默认数据集成功"