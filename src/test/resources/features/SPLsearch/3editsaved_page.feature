@editsaved @searchpage @editsaved2
Feature: 已存搜索界面

  @editsaved21
  Scenario Outline: 另存为
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    Given I wait for loading complete

    #加载
    And I set the parameter "TextFilter" with value "<name>"
    Given I wait for loading complete
    And I wait for "1000" millsecond
    Given I click the which saved name is "<name>" on saved page

    And switch to window "搜索"
    And I close all tabs except main tab
    Then I will see the "splSearch.SearchPage" page

    Then I will see the input element "SearchInput" value will be "<expect_spl>"
    And I wait for element "SearchStatus" change text to "搜索完成!"

    And I wait for loading complete
    And I choose the "另存为" from the "SavedSearchList"
    And I wait for loading complete

    And I click the "resourceTagDiv" button
    When I wait for loading complete
    And I click the "resourceTagDiv" button
    When I wait for loading complete
    And I set the parameter "SavedSearchName" with value "<name>_new"
    And I set the parameter "ResourceTagInput" with value "org.saved.savedas"
    And I choose the "org.saved.savedas" from the "ResourceGroupList"
    And I click the "EnsureCreateSavedSearch" button
    And I wait for loading complete

    Then I will see the success message "创建成功"

    Examples:
      | name      | expect_spl                                                                                          |
      | spark_cnt | tag:"sample04061424" \| stats count() as cnt, max(apache.status) as r_max_status by apache.clientip |

  @editsaved22
  Scenario Outline: 更新
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    Given I wait for loading complete

    #加载
    And I set the parameter "TextFilter" with value "<name>"
    Given I wait for loading complete
    And I wait for "1000" millsecond

    Given I click the which saved name is "<name>" on saved page

    And switch to window "搜索"
    And I close all tabs except main tab
    Then I will see the "splSearch.SearchPage" page

    Then I will see the input element "SearchInput" value will be "<expect_spl>"
    And I wait for element "SearchStatus" change text to "搜索完成!"

    And I wait for loading complete
    When I set the parameter "SearchInput" with value "tag:sample04061424"
    And I choose the "更新" from the "SavedSearchList"
    And I wait for loading complete
    Then I will see the success message "更新成功"

    #验证更新内容
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    Given I wait for loading complete
    And I set the parameter "TextFilter" with value "<name>"
    Given I wait for loading complete
    And I wait for "1000" millsecond

    Given I click the which saved name is "<name>" on saved page

    And switch to window "搜索"
    And I close all tabs except main tab
    Then I will see the "splSearch.SearchPage" page

    Then I will see the input element "SearchInput" value will be "tag:sample04061424"

    Examples:
      | name      | expect_spl                                                                                          |
      | spark_cnt | tag:"sample04061424" \| stats count() as cnt, max(apache.status) as r_max_status by apache.clientip |
