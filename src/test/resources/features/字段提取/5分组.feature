@all @smoke @configs @configsSmoke
Feature: 字段提取分组

  Background:
    Given open the "configs.ListPage" page for uri "/configs/"

  Scenario Outline:
    When the data name is "AutoTest" then i click the "分组" button
    And I <group>
    And I click the "Ensure" button
    And I will see the success message "保存成功"

    Examples:
      | group                                                  |
      | cancel selection "default_ParserRule" from the "Group" |
      | choose the "default_ParserRule" from the "Group"       |
