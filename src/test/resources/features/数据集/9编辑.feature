@dataset
Feature: 数据集-9编辑按钮是否可用

  Background:
    Given open the "dataset.ListPage" page for uri "/dataset/"

  Scenario: 编辑
    When the data name is "JNDTest" then i click the "编辑" button
    And I wait for title change text to "数据集详情"