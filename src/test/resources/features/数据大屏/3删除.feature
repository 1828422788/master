Feature: 数据大屏删除

  Background:
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"

  @third
  Scenario: RZY-2963:模板管理
    And I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Test" button
    And I click the "Delete" button
    And I click the "EnsureDelete" button
    Then I will see the success message "删除成功！"

  @clean
  Scenario: 删除模版
    And I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Test" button
    And I click the "Delete" button
    And I click the "EnsureDelete" button
    Then I will see the success message "删除成功！"

  @clean
  Scenario Outline: 删除大屏
    And I click the "<name>" button
    Then I click the "Ensure" button

    Examples:
      | name              |
      | DeleteGalaxeeTest |
      | DeleteGalaxeeTest |
