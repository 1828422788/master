@all @resourceGroups
Feature: 资源分组导出

  Background:
    Given open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"

  Scenario: 不勾选任何资源时点击导出
    When I click the "DownloadButton" button
    And I click the "EnsureDownloadButton" button
    Then I will see the error message "请先选择资源分组，然后再重试导出"

