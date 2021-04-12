@dataset @ddataset @ddatasetref
Feature: 清理数据集与定时任务关联用例

  @deldatasettask
  Scenario Outline: 删除3个定时任务用例
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I set the parameter "SearchNameInput" with value "<name>"
    Given I wait for loading complete
    And I wait for "1000" millsecond
#    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button in more menu
    When I click the "Ensure" button under some element
    Then I will see the success message "删除成功"

    Examples:
    |    name    |
    | 父子行为继承 |
    | 父子行为汇聚 |
    | 父子行为无 |