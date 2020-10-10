@newsaved
Feature: 已存搜索新建（RZY-150）

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  @newsaved
  Scenario Outline: 新建已存搜索
    When I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I choose1 the "新建" from the "SavedSearch"
    And I wait for loading invisible
    And I set the parameter "SavedSearchName" with value "<name>"
    And I choose the "<group>" from the "GroupComboBox"
    And I click the "EnsureCreateSavedSearch" button
    Then I will see the success message "<message>"

    @smoke @splSmoke
    Examples: 保存成功
      | splQuery                                    | name     | group               | message |
      | starttime=\"-2d/w\" endtime=\"now\" tag:ty* | AutoTest | default_SavedSearch | 创建成功    |

  @savedsample
  Scenario: new监控
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I click the "CreateAlert" button
    And I will see the "alert.CreatePage" page
    When I set the parameter "AlertName" with value "AutoTest18"
    And I choose1 the "观察易-服务总览-曲线图" from the "SavedSearch"
