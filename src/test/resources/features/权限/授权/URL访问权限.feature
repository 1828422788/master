Feature: 角色授权URL访问

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"

  @authorization @all
  Scenario Outline:
    Given the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "{'TabButton':'URL 访问'}" button
    When I check "<URLName>" from the "UrlCheckboxes"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

    Examples:
      | URLName |
      | 资源分组    |
      | 告警插件    |

  @authorization @all @smoke
  Scenario:
    Given the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "{'TabButton':'URL 访问'}" button
    When I click the "ChooseAllCheckBoxes" button
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "<usernameValue>"
    And I set the parameter "Password" with value "<passwordValue>"
    And I click the "LoginButton" button