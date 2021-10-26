@reportTemplate
Feature: 报表模板_1_新建

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "TemplateManager" button under some element
    And I wait for "Loading" will be invisible
    Then I will see the "report.CreateTemplatePage" page
    And I click the "NewTemplate" button
    And I wait for "TemplateName" will be visible

  Scenario: 新建报表模板_名称为空格
    When I set the parameter "TemplateName" with value " "
    And I click the "Next" button
    And I wait for "TipText" will be visible
    Then I will see the element "TipText" contains "名称不能为空"

  Scenario Outline: 新建报表模板_检查提示
    When I set the parameter "TemplateName" with value "<name>"
    And I click the "Next" button
    And I wait for "TipText" will be visible
    Then I will see the element "TipText" contains "<tip>"

  Examples:
    | name  | tip           |
    |       | 名称不能为空  |
    | name  | 请上传模板文件|

  Scenario Outline: 新建报表模板_空
    When I set the parameter "TemplateName" with value "<name>"
    And I upload a file with name "/src/test/resources/testdata/reportTemplate/<name>.docx"
    And I wait for "UploadingProgress" will be invisible
    And I wait for "TipText" will be visible
    And I will see the element "TipText" contains "未检测到趋势图相关变量，请检查模板后重新上传"

  Examples:
    | name               |
    | empty_template     |