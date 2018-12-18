@resourceGroups @all @resourceGroupsSmoke @smoke
Feature: 资源分组搜索（RZY-534）

  Background:
    Given open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"

  Scenario Outline:
    Given search "<searchInfo>" and I will see the column number "<num>" contains "<name>"

    Examples:
      | searchInfo       | num | name |
      | {'group':'仪表盘'}  | 2   | 仪表盘  |
      | {'input':'auto'} | 1   | auto |
