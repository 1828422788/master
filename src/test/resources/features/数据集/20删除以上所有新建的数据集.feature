#@dataset
#  Feature: 数据集-删除所有
#  Background:
#    Given open the "dataset.ListPage" page for uri "/dataset/"
#
#  Scenario Outline: 删除数据集
#    Given the data name is "<name>" then i click the "删除" button
#    And I wait for "Ensure" will be visible
#    When I click the "Ensure" button
#
#    And I refresh the website
#    Then I will see the search result "{'column':'0','name':'<name>','contains':'no'}"
#
#    Examples:
#      |name           |
#      |have_root_field|
#      |JNDTest       |
#      |node_op_jnd    |
#      |rootname       |
#      |分组和应用       |
#      |父子无tree        |
#      |父子汇聚           |
#      |父子汇聚tree       |
#      |父子继承           |
#      |父子继承tree       |
