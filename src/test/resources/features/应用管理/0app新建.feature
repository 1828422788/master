@app
Feature: 应用新建（RZY-1899）

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"
    And I click the "CreateButton" button
    Then I will see the "app.CreatePage" page

  Scenario Outline: 新建失败（为空校验）
    When I set the parameter "NameInput" with value "<name>"
    And I click the "CreateButton" button
    And I wait for "ErrorMessage" will be visible
    Then I will see the error message "<message>"

    Examples:
      | name | message   |
      |      | 请确保输入完整正确 |
      | test | 请确保输入完整正确 |

  Scenario Outline: 新建失败（菜单栏校验）
    When I click the "AddMenuButton" button
    And I set the parameter "MenuName" with value "<menuName>"
    And I set the parameter "Url" with value "<url>"
    And I click the "SaveMenuButton" button
    Then I will see the element "<messageElement>" name contains "<message>"
    Examples:
      | menuName                                                         | url   | messageElement | message                   |
      |                                                                  |       | NameMessage    | 请输入名称                     |
      | test                                                             |       | UrlMessage     | 请输入url                    |
      | test                                                             | test  | UrlMessage     | URL不合法，请以/或http:或https:开头 |
      | 我有三十个字不管你信不信反正我有三十个字不管你信不信反正我信了呢我有三十个字不管你信不信反正我有三十个字不管你信不信反正我信了呢 | /app/ | NameMessage    | 菜单栏名称过长，请小于60个字符          |

  Scenario: 新建失败（上传logo失败）
    When I upload a file "LogoInput" with name "/src/test/resources/testdata/resourceGroups/testLogo.jpg"
    And I wait for "ErrorMessage" will be visible
    Then I will see the error message "文件过大"

  Scenario: 新建拓扑图资源
    Given open the "topology.ListPage" page for uri "/topology/"
    When I click the "Create" button
    And I set the parameter "NameInput" with value "app所选资源"
    And I click the "Ensure" button

  @smoke @appSmoke
  Scenario Outline: 新建App
    Given delete file "/target/download-files/<name>.tar"
    When I set the parameter "NameInput" with value "<name>"
    And I click the "AddResource" button
    And I set the parameter "SearchResourceInput" with value "app所选资源"
    And I wait for "SearchLoading" will be invisible
    And I "check" the checkbox which name is "app所选资源" in tiny table
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "限额"
    And I set the parameter "Url" with value "/account/usage/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "搜索"
    And I set the parameter "Url" with value "/search/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "Agent"
    And I set the parameter "Url" with value "/sources/input/agent/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "路由"
    And I set the parameter "Url" with value "/indexsettings/indexmatchrule/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "入库优先级"
    And I set the parameter "Url" with value "/ingestpriority/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "上传"
    And I set the parameter "Url" with value "/sources/input/os/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "备份"
    And I set the parameter "Url" with value "/backup/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "下载"
    And I set the parameter "Url" with value "/download/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "离线任务"
    And I set the parameter "Url" with value "/offlinetask/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "定时任务"
    And I set the parameter "Url" with value "/schedule/"
    And I click the "SaveMenuButton" button
    And I choose the "搜索" from the "DefaultPage"
    And I click the "CurrentApp" button
    And I click the "ColorPicker" button
    And I set the parameter "ColorValue" with value "#68E632"
    And I click the "CreateButton" button under some element
    And I will see the "app.ListPage" page
    Then I wait for "CreateButton" will be visible

    Examples:
      | name                        |
      | AutoTestAppWithAllResources |

  Scenario Outline: 新建权限应用
    Given delete file "/target/download-files/<name>.tar"
    When I set the parameter "NameInput" with value "<name>"
    And I click the "AddResource" button
    And I set the parameter "SearchResourceInput" with value "app所选资源"
    And I wait for "SearchLoading" will be invisible
    And I "check" the checkbox which name is "app所选资源" in tiny table
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "角色权限"
    And I set the parameter "Url" with value "/account/roles/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "用户分组"
    And I set the parameter "Url" with value "/account/usergroups/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "用户管理"
    And I set the parameter "Url" with value "/account/users/"
    And I click the "SaveMenuButton" button
    And I choose the "角色权限" from the "DefaultPage"
    And I click the "CurrentApp" button
    And I click the "ColorPicker" button
    And I set the parameter "ColorValue" with value "#68E632"
    And I click the "CreateButton" button under some element
    And I will see the "app.ListPage" page
    Then I wait for "CreateButton" will be visible

    Examples:
      | name    |
      | AuthApp |