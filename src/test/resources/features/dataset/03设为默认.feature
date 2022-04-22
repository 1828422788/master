@dataset @datasetDefault
Feature: 数据集_03设为默认

  Scenario Outline: 新建进行默认操作的数据集
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    When I click the "Create" button
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Alias" with value "<alias>"
    And I set the parameter "Spl" with value "<Spl>"
    And I click the "Ensure" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible
    And I click the "Return" button

    Examples: 新建成功
      | name            | alias             | Spl |
      | JNDTest_default | JNDTest_default   | *   |

  Scenario: 设为默认-RZY-4077:设为默认
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    When the data name is "{'column':'0','name':'JNDTest_default'}" then i click the "设为默认" button in more menu
    Then I will see the success message "设置默认数据集成功"

  Scenario: 在搜索页验证默认数据集
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "ZhanKai" button
    Then I will see the "DataSetPosition" result will be "*"

  Scenario: 取消默认
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    And I choose the "取消默认" from the "CancelDefaultButtonList"
    Then I will see the success message "取消默认数据集成功"