@machineLearningSmoke
Feature: 机器学习模型管理搜索

  Background:
    Given open the "machineLearning.ModelManagerPage" page for uri "/app/machine_learning/model_manager/"
    And I wait for loading invisible

  Scenario:
    When I set the parameter "SearchInput" with value "AutoTest"
    Then I will see the search result "{'column':'1','name':'AutoTest'}"