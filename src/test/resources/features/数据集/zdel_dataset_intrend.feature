@datasettmp  @ddataset
Feature: 清理数据集用例

  @ddatasettrend
  Scenario Outline: 删除数据集相关的趋势图用例
    Given open the "trend.ListPage" page for uri "/trend/"
    When I set the parameter "SearchInput" with value "<name>"
    And I wait for "2000" millsecond
    And the data name is "{'column':'0','name':'<name>'}" then i click the "删除" button
    Then I will see the message "确认删除 [<name>] ?"
    When I click the "EnsureButton" button
    Then I will see the success message "删除成功"

    Examples:
      | name    |
      | 父子继承 |
      | 父子汇聚 |
      | 父子无 |
      | 父子继承 |
      | 父子汇聚 |
      | 父子无 |
      | 父子继承 |
      | 父子汇聚 |
      | 父子无 |