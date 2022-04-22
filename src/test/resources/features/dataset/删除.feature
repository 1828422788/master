@cleanDataset
Feature: 数据集_删除

  Scenario Outline: 删除定时任务
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I set the parameter "SearchName" with value "<name>"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button in more menu
    When I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
      |    name      |
      | 父子行为继承 |
      | 父子行为汇聚 |
      | 父子行为无   |

  Scenario Outline: 删除趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When I set the parameter "SearchName" with value "<name>"
    And I wait for loading invisible
    When  the data name is "{'column':'0','name':'<name>'}" then i click the "删除" button in more menu
    When I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
      |    name      |
      | 父子行为继承 |
      | 父子行为汇聚 |
      | 父子行为无   |

  Scenario Outline: 删除数据集
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I set the parameter "SearchName" with value "<name>"
    And I wait for loading invisible
    When the data name is "{'column':'0','name':'<name>'}" then i click the "删除" button in more menu
    When I click the "Ensure" button
    Then I will see the success message "删除数据集成功"

    Examples:
       | name           |
       | JNDTest        |
       | JNDTest_default|
       | new_name       |
       | node_op_jnd    |
       | 父子无tree     |
       | 父子汇聚tree   |
       | 父子继承tree   |
       | have_root_field|