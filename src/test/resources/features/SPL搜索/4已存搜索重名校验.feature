@spl @all @test @splSmoke @smoke
Feature: 已存搜索重名校验

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"

  Scenario Outline:
    When I click the "SavedSearch" button
    And I set the parameter "OfflineTaskName" with value "<name>"
    And I choose the "<group>" from the "GroupComboBox"
    And I click the "EnsureCreateSavedSearch" button
    Then I will see the success message "<message>"

    Examples: 保存成功
      | name        | group               | message |
      | AutoTest重名1 | default_SavedSearch | 创建成功    |

