@dataset @datasetb @dataset1
Feature: 数据集-b删除

  Background:
    #新建一个数据集再删除
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for "2000" millsecond

  Scenario: 新建删除数据集
    When I click the "Create" button
    And I set the parameter "Name" with value "deleteceshi"
    And I set the parameter "Alias" with value "delete"
    And I set the parameter "Spl" with value "*"
    And I click the "Save" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible
   #返回列表页
    And I click the "BackList" button
    And I wait for loading invisible

  @deleteceshi
  Scenario Outline: RZY-4079:删除数据集
#    Given the data name is "<name>" then i click the "删除" button
    And I wait for "2000" millsecond
    And  the data name is "{'column':'0','name':'<name>'}" then i click the "删除" button in more menu
    Then I will see the message "确定删除该数据集?"
    And I wait for "Ensure" will be visible
    When I click the "Ensure" button

    And I refresh the website
    Then I will see the search result "{'column':'0','name':'<name>','contains':'no'}"

    Examples:
      |name       |
      |deleteceshi|