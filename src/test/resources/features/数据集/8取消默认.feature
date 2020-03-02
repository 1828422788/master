@dataset
Feature: 取消默认jnd

  Background:
    Given open the "dataset.ListPage" page for uri "/dataset/"

  Scenario: 取消默认
    Given the data name is "jndceshi" then i click the "取消默认" button
    Then I will see the success message "取消默认数据集成功"
