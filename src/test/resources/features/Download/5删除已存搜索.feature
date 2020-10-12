@spl @all
Feature: 已存搜索删除（RZY-154）

  Background:

  @delsaved @splSmoke
  Scenario Outline:
    Given open the "splSearch.SearchPage" page for uri "/search/"
#    When I click the "OpenSavedSearchButton" button
    And I choose1 the "打开列表" from the "SavedSearch"
    Then "" the data "<name>" in columnNum "1"
    Then I click the "DeleteSavedSearch" button

    Examples:
      | name     |
      | AutoTest |

  @delsaved1 @splSmoke
  Scenario Outline: 在列表页删除
    Given open the "splSearch.SavedSearchPage" page for uri "/savedsearches/"
    And the data name is "<name>" then i click the "删除" button
    And I click the "EnsureDelete" button

    Examples:
      | name                                                   |
      | {'column':'1','name':'扩展chart'}                      |
      | {'column':'1','name':'spark_count'}                  |
      | {'column':'1','name':'base_sample'}                  |
      | {'column':'1','name':'spark_dataset'}                |
      | {'column':'1','name':'GET'}                          |
      | {'column':'1','name':'where或'}                       |
      | {'column':'1','name':'极简模式200status'}                |
      | {'column':'1','name':'200status_continuous_spark'}   |
      | {'column':'1','name':'app_spark_count_byip_sort_授权'} |
      | {'column':'1','name':'offlinetask_sample'}           |

  @clean
  Scenario:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    When I click the "OpenSavedSearchButton" button
    Then "删除" the data "alertSavedSearch" in columnNum "1"
    Then I click the "DeleteSavedSearch" button

