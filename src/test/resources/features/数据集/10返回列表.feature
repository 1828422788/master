@dataset
Feature: 数据集-返回列表页面


  Scenario: 返回列表页面
    Given open the "dataset.ListPage" page for uri "/dataset/"
    When the data name is "JNDTest" then i click the "编辑" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible
    When I click the "BackList" button
    And I wait for title change text to "数据集"