@all @extra
Feature: 已存搜索加载（RZY-153）

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  @editsaved1
  Scenario Outline:
    And I wait for loading complete
    Then I choose1 the "打开列表" from the "SavedSearchList"
    And I wait for loading invisible
    And "加载" the data "<name>" in tiny saved search

    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I will see the input element "SearchInput" value will be "<spl>"

    And I wait for loading complete
#    When I set the parameter "SearchInput" with value "tag:sample04061424"
    Then I choose1 the "另存为" from the "SavedSearchList"
    And I wait for loading complete

    And I set the parameter "SavedSearchName" with value "<name>_new"
#    And I choose the "<searchResName>" from the "GroupComboBox"
    And I click the "EnsureCreateSavedSearch" button
    And I wait for loading complete

    Then I will see the success message "创建成功"

    Examples:
      | name                    | spl                                       |
      | page_offlinetask_sample | * \| transaction apache.status maxspan=1h |
#      | test_load               | * tag:sample04061424                      |

  @editsaved2
  Scenario Outline: 从已存搜索列表加载
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And I set the parameter "SearchInput" with value "<name>"
    And I wait for loading invisible
    Then I will see the search result "{'column':'1','name':'<name>'}"
    And the data name is "{'column':'1','name':'<name>'}" then i click the "加载" button

    And switch to window "搜索"
    Then I will see the "splSearch.SearchPage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"
#    Then I will see the input element "SearchInput" value will be "<expect_spl>"

    And I wait for loading complete
    When I set the parameter "SearchInput" with value "tag:sample04061424"
    Then I choose1 the "更新" from the "SavedSearchList"
    And I wait for loading complete

    Then I will see the success message "更新成功"

    Examples:
      | name      | expect_spl                                                                                            |
      | spark_cnt | tag:\"sample04061424\" \| stats count() as cnt, max(apache.status) as r_max_status by apache.clientip |
