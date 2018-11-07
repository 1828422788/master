@spl @all @test
Feature: 已存搜索重名校验

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"

  Scenario Outline:
    When I click the "SearchButton" button
    And I click the "SaveAsReport" button
    And I click the "SavedSearch" button
    And I set the parameter "OfflineTaskName" with value "<name>"
    And I choose the "<group>" from the "GroupComboBox"
    And I click the "EnsureCreateSavedSearch" button
    Then I will see the success message "<message>"

    Examples: 保存成功
      | name          | group               | message |
      | sunxjautotest | default_SavedSearch | 创建成功    |
      | 11            | default_SavedSearch | 创建成功    |
      | test          | default_SavedSearch | 创建成功    |
      | 1test         | default_SavedSearch | 创建成功    |
      | 1重名           | default_SavedSearch | 创建成功    |
      | test重名        | default_SavedSearch | 创建成功    |
      | test重名12      | default_SavedSearch | 创建成功    |

