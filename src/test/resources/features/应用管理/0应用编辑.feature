@all @app
Feature: 应用编辑

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"

  Scenario Outline:
    When the data name is "<name>" then i click the "编辑" button
    And I wait for loading invisible
    Then I will see the "app.CreatePage" page
    When I click the "AddMenuButton" button
    And I set the parameter "MenuName" with value "<menuName>"
    And I set the parameter "Url" with value "<url>"
    And I click the "SaveMenuButton" button
    And I choose the "<chooseMenuName>" from the "DefaultPage"
    And I click the "CurrentApp" button
    And I click the "SaveButton" button
    Then I will see the success message "<message>"

    Examples: 编辑失败
      | name        | menuName | url         | chooseMenuName | message |
      | AutoTestApp | 知识       | /knowledge/ |                | 请设置默认首页 |

  @smoke @appSmoke
    Examples: 编辑成功
      | name        | menuName | url         | chooseMenuName | message |
      | AutoTestApp | Auto仪表盘  | /dashboard/ | Auto仪表盘        | 保存成功    |

  Scenario Outline: 编辑失败（菜单同名校验）
    When the data name is "AutoTestApp" then i click the "编辑" button
    And I wait for loading invisible
    Then I will see the "app.CreatePage" page
    When I click the "AddMenuButton" button
    And I set the parameter "MenuName" with value "<menuName>"
    And I set the parameter "Url" with value "<url>"
    And I click the "SaveMenuButton" button
    Then I will see the error message "菜单栏中已存在同名的菜单，请修改名称"

    Examples:
      | menuName | url         |
      | 仪表盘      | /dashboard/ |

  @smoke @appSmoke
  Scenario: 更改资源范围
    When the data name is "AutoTestAppWithAllResources" then i click the "编辑" button
    And I wait for loading invisible
    Then I will see the "app.CreatePage" page
    And I click the "SourceConfig" button
    And I set the parameter "SearchSource" with value "AutoTest"
    And I click the "AllCheck" button
    And I click the "CloseDialog" button
    And I wait for "ResourceConfig" will be invisible
    And I click the "CurrentApp" button
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
