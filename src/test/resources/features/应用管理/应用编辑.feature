@all @app
Feature: 应用编辑

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"
    And the data name is "AutoTest" then i click the "编辑" button
    And I wait for loading invisible
    Then I will see the "app.CreatePage" page

  @smoke
  Scenario Outline:
    When I click the "AddMenuButton" button
    And I set the parameter "MenuName" with value "<menuName>"
    And I set the parameter "Url" with value "<url>"
    And I click the "SaveMenuButton" button
    And I click the "AddSubmenu" button
    And I set the parameter "MenuName" with value "<SubmenuName>"
    And I set the parameter "Url" with value "<SubUrl>"
    And I click the "SaveMenuButton" button
    And I choose the "<chooseMenuName>" from the "DefaultPage"
    And I click the "CurrentApp" button
    And I click the "SaveButton" button
    Then I will see the success message "<message>"

    Examples: 编辑失败
      | menuName | url         | SubmenuName | SubUrl  | chooseMenuName | message |
#      | 仪表盘      | /dashboard/ | Auto趋势图     | /trend/ |                | 请设置默认首页 |

    Examples: 编辑成功
      | menuName | url | SubmenuName | SubUrl | chooseMenuName | message |
      | Auto仪表盘  | /dashboard/ | Auto趋势图     | /trend/ | Auto仪表盘        | 保存成功    |

  Scenario Outline: 编辑失败（菜单同名校验）
    When I click the "AddMenuButton" button
    And I set the parameter "MenuName" with value "<menuName>"
    And I set the parameter "Url" with value "<url>"
    And I click the "SaveMenuButton" button
    Then I will see the error message "菜单栏中已存在同名的菜单，请修改名称"

    Examples:
      | menuName | url         |
      | Auto仪表盘  | /dashboard/ |