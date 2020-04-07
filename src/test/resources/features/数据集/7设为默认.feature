@dataset
Feature: 设为默认jndjnd

  Background:
    Given open the "dataset.ListPage" page for uri "/dataset/"

  Scenario: 设为默认
    Given the data name is "jndceshi" then i click the "设为默认" button
    Then I will see the success message "设置默认数据集成功"