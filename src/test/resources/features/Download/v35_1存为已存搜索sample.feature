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
    Then I will see the success message "创建成功"

    @smoke @splSmoke
    Examples: 保存成功
      | name     | group              | splQuery                                  |
      | AutoTest | auto_ui | starttime=\"-2d/w\" endtime=\"now\" tag:ty*  |
      |	page_扩展chart	| auto_ui |	starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| chart count() as cnt over apache.resp_len span=\"500\"	|
      |	page_spark_count	| auto_ui |	starttime=\"now/M\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| stats count() as cnt by apache.clientip	|
      |	page_base_sample	| auto_ui |	starttime=\"now/M\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| stats count() as cnt by apache.clientip	|
      |	page_spark_dataset	| auto_ui |	tag:spark OR tag:c* \| stats count() as cnt by apache.clientip	|
      |	page_where与	| auto_ui |	starttime=\"now/M\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| stats count() as cnt by apache.clientip \| where cnt>17&& cnt<33	|
      |	page_where或	| auto_ui |	starttime=\"now/M\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| stats count() as cnt by apache.clientip \| where cnt>17 \|\| cnt<33	|
      |	page_GET	| auto_ui |	GET	|
      |	page_极简模式200status	| auto_ui |	starttime=\"now/M\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| stats count() as cnt by apache.clientip	|
      |	page_200status_continuous_spark	| auto_ui |	tag:continuous	|
      |	page_app_spark_count_byip_sort_授权	| auto_ui |	tag:spark OR tag:c* \| stats count() as cnt by apache.clientip \| sort by cnt	|
      |	page_offlinetask_sample	| auto_ui |	* \| transaction apache.status maxspan=1h |

  @savedsample
  Scenario: new监控
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I click the "CreateAlert" button
    And I will see the "alert.CreatePage" page
    When I set the parameter "AlertName" with value "AutoTest18"
    And I choose1 the "观察易-服务总览-曲线图" from the "SavedSearch"
