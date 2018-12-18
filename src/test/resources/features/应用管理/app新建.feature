@all @app
Feature: 应用新建（RZY-1899）

  Background:
    Given delete file "/target/download-files/AutoTestApp.tar"
    And open the "app.ListPage" page for uri "/app/list/"
    And I click the "CreateButton" button
    Then I will see the "app.CreatePage" page

  Scenario Outline: 新建失败（为空校验）
    When I set the parameter "NameInput" with value "<name>"
    And I click the "CreateButton" button
    Then I will see the error message "<message>"

    Examples:
      | name | message |
      |      | 请输入名称   |
      | test | 请设置默认首页 |

  Scenario Outline: 新建失败（名称长度校验）
    When I set the parameter "NameInput" with value "<name>"
    And I click the "AddMenuButton" button
    And I set the parameter "MenuName" with value "<menuName>"
    And I set the parameter "Url" with value "<url>"
    And I click the "SaveMenuButton" button
    And I choose the "<menuName>" from the "DefaultPage"
    And I click the "CreateButton" button
    Then I will see the error message "<message>"

    Examples:
      | name                             | menuName | url   | message          |
      | 我有三十个字不管你信不信反正我有三十个字不管你信不信反正我信了呢 | test     | /app/ | APP名称过长，请小于60个字符 |


  Scenario Outline: 新建失败（菜单栏校验）
    When I click the "AddMenuButton" button
    And I set the parameter "MenuName" with value "<menuName>"
    And I set the parameter "Url" with value "<url>"
    And I click the "SaveMenuButton" button
    Then I will see the error message "<message>"
    Examples:
      | menuName                                                         | url   | message                   |
      |                                                                  |       | 请输入名称和URL                 |
      | test                                                             |       | 请输入名称和URL                 |
      | test                                                             | test  | URL不合法，请以/或http:或https:开头 |
      | 我有三十个字不管你信不信反正我有三十个字不管你信不信反正我信了呢我有三十个字不管你信不信反正我有三十个字不管你信不信反正我信了呢 | /app/ | 菜单栏名称过长，请小于60个字符          |

  Scenario: 新建失败（上传logo失败）
    When I upload a file "LogoInput" with name "/src/test/resources/testdata/resourceGroups/testcase.txt"
    Then I will see the error message "文件类型不符"

  @smoke @appSmoke
  Scenario Outline: 新建（资源为系统内选择）
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "<describe>"
    And I click the "ChoiceButton" button
    And I click the "ChooseFromSystemButton" button
    And I set the parameter "SearchSource" with value "<sourceName>"
#    And I click the "AllCheck" button
    And I click the "TmpCheckBox" button
    And I click the "CloseDialog" button
    And I wait for "ResourceConfig" will be invisible
    And I click the "AddMenuButton" button
    And I set the parameter "MenuName" with value "<menuName>"
    And I set the parameter "Url" with value "<url>"
    And I click the "SaveMenuButton" button
    And I wait for "1000" millsecond
    And I click the "AddMenuButton" button
    And I set the parameter "MenuName" with value "<menuName1>"
    And I set the parameter "Url" with value "<url1>"
    And I click the "SaveMenuButton" button
    And I choose the "<menuName>" from the "DefaultPage"
    And I click the "ColorPicker" button
    And I set the parameter "ColorValue" with value "<color>"
    And I click the "EnsureColourButton" button
    And I click the "CreateButton" button
    Then I will see the success message "新建成功，请等待下载完成。"

    Examples:
      | name        | describe | sourceName | menuName | url         | menuName1 | url1                           | color   |
      | AutoTestApp | AutoTest | AutoTest   | 仪表盘      | /dashboard/ | URL校验     | http://192.168.1.134/topology/ | #F9C7EB |




