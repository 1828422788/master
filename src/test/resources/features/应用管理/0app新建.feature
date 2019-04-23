@all @app
Feature: 应用新建（RZY-1899）

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"
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
  Scenario Outline: 新建（资源范围为本app）
    Given delete file "/target/download-files/<name>.tar"
    And I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "<describe>"
    And I click the "ChoiceButton" button
    And I click the "ChooseFromSystemButton" button
#    And I set the parameter "SearchSource" with value "<sourceName>"
    And I click the "TmpCheckBox" button
    And I click the "CloseDialog" button
    And I wait for "ResourceConfig" will be invisible
    And I click the "AddMenuButton" button
    And I set the parameter "MenuName" with value "<menuName>"
    And I set the parameter "Url" with value "<url>"
    And I click the "SaveMenuButton" button
    And I wait for "1000" millsecond
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "<menuName1>"
    And I set the parameter "Url" with value "<url1>"
    And I click the "SaveMenuButton" button
    And I choose the "<menuName>" from the "DefaultPage"
    And I click the "ColorPicker" button
    And I set the parameter "ColorValue" with value "<color>"
    And I click the "EnsureColourButton" button
    And I click the "CreateButton" button
    Then I will see the success message "请等待下载开始后，点击确定返回列表页，然后等待下载完成"

    Examples:
      | name        | describe | sourceName | menuName | url         | menuName1 | url1                           | color   |
      | AutoTestApp | AutoTest | AutoTest   | 仪表盘      | /dashboard/ | URL校验     | http://192.168.1.134/topology/ | #F9C7EB |

  @smoke @appSmoke
  Scenario Outline: 新建App，资源范围为全局
    Given delete file "/target/download-files/<name>.tar"
    When I set the parameter "NameInput" with value "<name>"
    And I click the "ChoiceButton" button
    And I click the "ChooseFromSystemButton" button
    And I set the parameter "SearchSource" with value "AutoTestRoleWithAllResource"
    And I click the "AllCheck" button
    And I click the "CloseDialog" button
    And I wait for "ResourceConfig" will be invisible
    And I click the "AddMenuButton" button
    And I set the parameter "MenuName" with value "监控"
    And I set the parameter "Url" with value "/alerts/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "使用限额"
    And I set the parameter "Url" with value "/account/usage/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "报表"
    And I set the parameter "Url" with value "/reports/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "拓扑图"
    And I set the parameter "Url" with value "/topology/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "搜索"
    And I set the parameter "Url" with value "/search/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "仪表盘"
    And I set the parameter "Url" with value "/dashboard/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "定时任务"
    And I set the parameter "Url" with value "/schedule/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "趋势图"
    And I set the parameter "Url" with value "/trend/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "知识"
    And I set the parameter "Url" with value "/knowledge/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "搜索宏"
    And I set the parameter "Url" with value "/macro/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "字段提取"
    And I set the parameter "Url" with value "/configs/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "事件操作"
    And I set the parameter "Url" with value "/event/action/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "日志来源"
    And I set the parameter "Url" with value "/sources/sourcegroups/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "Agent管理"
    And I set the parameter "Url" with value "/sources/input/agent/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "路由配置"
    And I set the parameter "Url" with value "/indexsettings/indexmatchrule/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "入库优先级"
    And I set the parameter "Url" with value "/ingestpriority/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "本地上传"
    And I set the parameter "Url" with value "/sources/input/os/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "备份策略"
    And I set the parameter "Url" with value "/backup/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "下载管理"
    And I set the parameter "Url" with value "/download/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "离线任务"
    And I set the parameter "Url" with value "/offlinetask/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "角色权限"
    And I set the parameter "Url" with value "/account/roles/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "资源分组管理"
    And I set the parameter "Url" with value "/account/resourcegroups/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "用户分组"
    And I set the parameter "Url" with value "/account/usergroups/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "用户管理"
    And I set the parameter "Url" with value "/account/users/"
    And I click the "SaveMenuButton" button
    And I choose the "仪表盘" from the "DefaultPage"
    And I click the "ColorPicker" button
    And I set the parameter "ColorValue" with value "#68E632"
    And I click the "EnsureColourButton" button
    And I click the "OverallSituation" button
    And I click the "CreateButton" button
    Then I will see the success message "请等待下载开始后，点击确定返回列表页，然后等待下载完成"

    Examples:
      | name                        |
      | AutoTestAppWithAllResources |