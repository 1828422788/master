@stress @pdataset1
Feature: 数据集-a新建

  Background:
    And I zoom the browse to full screen

#################################### 插播几条查询的case，依赖与上一条case的新建
  @pdataset1a
  Scenario Outline: 测试页面加载速度
    Given open the "dataset.ListPage" page for uri "/dataset/"
    Given I wait for loading complete
    When I set the parameter "SearchNameInput" with value "<dsname>"
    And I click the "Search" button
    And I wait for "2000" millsecond
    Given I wait for loading complete
    Then I will see the data "{'column':'0','name':'<dsname>'}" values "{'column':'2','name':'<alias>'}"
    And I will see the data "{'column':'0','name':'<dsname>'}" values "{'column':'3','name':'无'}"
    And I will see the data "{'column':'0','name':'<dsname>'}" values "{'column':'4','name':'app之api全部用例'}"

    Examples: 新建成功
      | dsname  | alias |
      | JNDTest | jnd   |
