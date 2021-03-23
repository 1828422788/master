@dataset @ddataset
Feature: 数据集-z删除所有

  Background:
    Given open the "dataset.ListPage" page for uri "/dataset/"

  @deldataset
  Scenario Outline: 删除数据集列表页面用例
#    Given the data name is "<name>" then i click the "删除" button
    When the data name is "{'column':'0','name':'<name>'}" then i click the "删除" button in more menu

    And I wait for "Ensure" will be visible
    When I click the "Ensure" button

    And I refresh the website
    Then I will see the search result "{'column':'0','name':'<name>','contains':'no'}"

    Examples:
      | name            |
      | JNDTest         |
      | node_op_jnd     |
      | edit            |
      | name_updated    |
      | have_root_field |
      | 父子无tree         |
      | 父子汇聚tree        |
      | 父子继承tree        |
      | rootname        |
      | JNDTest_default |
      | edit1 |
      | edit2 |
      | edit3 |
      | edit4 |
      | edit5 |