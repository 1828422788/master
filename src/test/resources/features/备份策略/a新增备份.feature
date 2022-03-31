@backup
Feature: 备份策略新增（RZY-1500）

  Background:
    Given open the "backup.ListPage" page for uri "/backup/"

  @backupSmoke
  Scenario Outline: 新增成功_appname
    Given I set the parameter "AppNameInput" with value "<appName>"
    When I click the "AddButton" button
    And I will see the element "HelpMessage" name is "<HelpMessage>"
    And I refresh the website
    And I wait for "1000" millsecond
    Then I will see the search result contains "{'column':'0','name':'<appName>'}"

    Examples: 添加成功
      | appName        | HelpMessage    |
      | testbackup     | 添加策略成功     |
      | testln          | 添加策略成功     |
      | TESTBACK       | 添加策略成功     |
      | ln*            | 添加策略成功     |
      | _name          | 添加策略成功     |
      | testnyt        | 添加策略成功     |

  Scenario Outline: 新增失败_appname
    Given I set the parameter "AppNameInput" with value "<appName>"
    When I click the "AddButton" button
    And I will see the element "HelpMessage" name is "<HelpMessage>"
    Examples: 添加失败
      | appName         | HelpMessage             |
      |                 | 无效appname               |
      | 中文            | 无效appname                |
      | _na&*(&me       | 无效appname               |
      | *               | 无效appname               |


