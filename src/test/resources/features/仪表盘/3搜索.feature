@dashboard @all @smoke @dashboardSmoke
Feature: 仪表盘搜索

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"

  Scenario Outline:
    Given search "<searchData>" and I will see the column number "<columnNum>" contains "<name>"

    Examples:
      | searchData                         | columnNum | name                   |
      | {'group':'default_DashBoardGroup'} | 2         | default_DashBoardGroup |
      | {'input':'autotest'}               | 1         | autotest               |