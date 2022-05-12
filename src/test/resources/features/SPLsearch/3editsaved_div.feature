@editsaved @searchpage @editsaved1
Feature: 已存搜索弹框界面

  @editsaved11
  Scenario Outline:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for loading complete
    Then I choose the "打开列表" from the "SavedSearchList"
    And I wait for loading complete

    And I set the parameter "SavedSearchInput" with value "<name>"
    Given I wait for loading complete
    And I wait for "2000" millsecond

    Given I click the which saved name is "<name>"
    Then I will see the input element "SearchInput" value will be "<spl>"
    And I wait for element "SearchStatus" change text to "搜索完成!"

    And I wait for loading complete
    And I choose the "另存为" from the "SavedSearchList"
    And I wait for loading complete

    And I click the "resourceTagDiv" button
    When I wait for loading complete
    And I click the "resourceTagDiv" button
    When I wait for loading complete
    And I set the parameter "SavedSearchName" with value "<name>_new"
    And I set the parameter "ResourceTagInput" with value "org.saved.rename"
    And I choose the "org.saved.rename" from the "ResourceGroupList"
    And I click the "EnsureCreateSavedSearch" button
    And I wait for loading complete

    Then I will see the success message "创建成功"

    Then I choose the "打开列表" from the "SavedSearchList"
    And I wait for loading complete
    And I set the parameter "SavedSearchInput" with value "<name>_new"
    Given I wait for loading complete
    And I wait for "2000" millsecond

    Given I click the which saved name is "<name>_new"
    Then I will see the input element "SearchInput" value will be "<spl>"

    Examples:
      | name      | spl                  |
      | test_load | * tag:sample04061424 |
