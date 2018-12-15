@backup @all
Feature: 备份恢复新增

  Background:
    Given open the "backup.ListPage" page for uri "/backup/"

  Scenario Outline: 新增appname
    Given I set the parameter "AppNameInput" with value "<appName>"
    When I click the "AddButton" button
    Then I will see the search result without paging contains "{'column':'0','name':'<appName>'}"

  @smoke
    Examples: 添加成功
      | appName |
      | iis     |

  Scenario Outline: 新增appname
    Given I set the parameter "AppNameInput" with value "<appName>"
    When I click the "AddButton" button
    Then I will see the error message "<message>"

    Examples: 添加失败
      | appName | message               |
      |         | appname 不能为空          |
      | 字       | appname只能由数字,字母和下划线组成 |
