@dashboard @dashboardSmoke
Feature: 仪表盘搜索（RZY-216）

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"

  Scenario Outline:
    Given search "<searchData>" and I will see the column number "<columnNum>" contains "<name>"

    Examples:
      | searchData                         | columnNum | name                   |
      | {'input':'autotest'}               | 1         | autotest               |