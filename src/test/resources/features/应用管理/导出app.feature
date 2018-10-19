@all @smoke @app
Feature: 应用导出

  Background:
    Given delete file "/target/download-files/AutoTest.tar"
    And open the "app.ListPage" page for uri "/app/list/"

  Scenario:
    When the data name is "AutoTest" then i click the "导出" button
    And I will see the "app.CreatePage" page
    And I wait for loading invisible
    And I click the "ExportButton" button
    Then I will see the success message "导出成功，请等待下载完成。"

