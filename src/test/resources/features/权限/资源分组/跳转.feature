@all @resourceGroups @smoke
Feature: 资源分组跳转

  Background:
    Given open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"

  Scenario Outline:
    Given the data name is "AutoInsertTest" then i click the "跳转" button
    Then the page's title will be "<PageTitle>"

    Examples:
      | PageTitle |
      | 列表 \| 仪表盘 |
