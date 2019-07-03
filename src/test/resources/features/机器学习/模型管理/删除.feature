@machineLearningSmoke
Feature: 机器学习模型管理搜索

  Background:
    Given open the "machineLearning.ModelManagerPage" page for uri "/app/machine_learning/model_manager/"
    And I wait for loading invisible

  Scenario:
    When the data name is "{'column':'1','name':'AutoTest1'}" then i click the "删除" button