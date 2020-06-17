@createEssentialData
Feature: 新建用户

  Background:
    Given open the "users.ListPage" page for uri "/account/users/"

  Scenario: new_user_logdisplay
    And I click the "CreateUser" button
    And I will see the "users.CreatePage" page
    When I set the parameter "UserName" with value "logdisplay"
    And I set the parameter "FullName" with value "logdisplay"
    And I set the parameter "Email" with value "logdisplay@t.cn"
    And I set the parameter "Password" with value "All#123456"
    And I choose the "__admin__" from the "Role"
    And I click the "CreateButton" button
    Then I wait for "SuccessMessage" will be visible