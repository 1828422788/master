@machineLearning @all
Feature: 机器学习模型管理导出

  Background:
    Given open the "machineLearning.ModelManagerPage" page for uri "/app/machine_learning/model_manager/"
    And I wait for loading invisible

  Scenario: 不选择任何模型进行导出
    When I click the "ImportAndExportButton" button
    And I click the "ExportButton" button
    And I click the "EnsureExportButton" button
    Then I will see the error message "请先选择模型！"

  Scenario Outline: 选择所有模型导出
    When I click the "ImportAndExportButton" button
    And I click the "ExportButton" button
    And I click the "CheckAllButton" button
    And I click the "EnsureExportButton" button
    And I set the parameter "ModelName" with value "<modelName>"
    And I click the "EnsureButton" button
    And I wait for "2000" millsecond
    Then I will see the <message>

  @smoke @machineLearningSmoke
    Examples:
      | modelName | message                         |
      | 机器学习模型    | success message "导出成功，请等待下载完成。" |

    Examples:
      | modelName | message                 |
      |           | error message "无模型包名称！" |