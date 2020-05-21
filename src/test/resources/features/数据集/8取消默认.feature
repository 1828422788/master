@dataset
Feature: 数据集-8取消默认
  Background:
    Given open the "dataset.ListPage" page for uri "/dataset/"


  Scenario: 取消默认
    Given the data name is "JNDTest" then i click the "取消默认" button
    Then I will see the success message "取消默认数据集成功"
