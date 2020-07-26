@dataset @datasetc @dataset1
Feature: 数据集-c设为默认

  Scenario: 设为默认-RZY-4077:设为默认
    Given open the "dataset.ListPage" page for uri "/dataset/"
    Given the data name is "JNDTest" then i click the "设为默认" button
    Then I will see the success message "设置默认数据集成功"


  Scenario: 在搜索页验证默认数据集
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "zhanKai" button
    And I wait for loading invisible
    Then I will see the "dataSetPosition" result will be "*"



  Scenario: 取消默认
    Given open the "dataset.ListPage" page for uri "/dataset/"
    Given the data name is "JNDTest" then i click the "取消默认" button
    Then I will see the success message "取消默认数据集成功"