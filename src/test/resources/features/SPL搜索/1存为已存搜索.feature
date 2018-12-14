@spl @all
Feature: 已存搜索新建

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"

  Scenario Outline: 新建已存搜索
    When I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I click the "SavedSearch" button
    And I wait for loading invisible
    And I set the parameter "OfflineTaskName" with value "<name>"
    And I choose the "<group>" from the "GroupComboBox"
    And I click the "EnsureCreateSavedSearch" button
    Then I will see the success message "<message>"

  @smoke @splSmoke
    Examples: 保存成功
      | splQuery                                | name        | group               | message |
      | starttime="-2d/w" endtime="now" tag:ty* | AutoTest    | default_SavedSearch | 创建成功    |
      | starttime="-2d/w" endtime="now" tag:ty* | AutoTest重名1 | default_SavedSearch | 创建成功    |

    Examples: 保存失败
      | splQuery                                | name | group               | message                    |
      | starttime="-2d/w" endtime="now" tag:ty* |      |                     | 请选择分组                      |
      | starttime="-2d/w" endtime="now" tag:ty* | test |                     | 请选择分组                      |
      | starttime="-2d/w" endtime="now" tag:ty* |      | default_SavedSearch | 没有参数, 参数：[name]\n错误码: FE_3 |

