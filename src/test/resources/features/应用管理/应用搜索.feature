@all @smoke @app @appSmoke
Feature: 应用搜索

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"

  Scenario Outline:
    When search "{'input':'<appName>'}" and I will see the column number "1" contains "<appName>"

    Examples:
      | appName  |
      | AutoTest |
