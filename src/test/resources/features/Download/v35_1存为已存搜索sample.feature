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
      | AutoTest | default_SavedSearch | starttime=\"-2d/w\" endtime=\"now\" tag:ty*  |
      |	扩展chart	| default_SavedSearch |	starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| chart count() as cnt over apache.resp_len span=\"500\"	|
      |	spark_count	| default_SavedSearch |	starttime=\"now/M\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| stats count() as cnt by apache.clientip	|
      |	base_sample	| default_SavedSearch |	starttime=\"now/M\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| stats count() as cnt by apache.clientip	|
      |	spark_dataset	| default_SavedSearch |	tag:spark OR tag:c* \| stats count() as cnt by apache.clientip	|
      |	where与	| default_SavedSearch |	starttime=\"now/M\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| stats count() as cnt by apache.clientip \| where cnt>17&& cnt<33	|
      |	where或	| default_SavedSearch |	starttime=\"now/M\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| stats count() as cnt by apache.clientip \| where cnt>17 \|\| cnt<33	|
      |	GET	| default_SavedSearch |	GET	|
      |	极简模式200status	| default_SavedSearch |	starttime=\"now/M\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| stats count() as cnt by apache.clientip	|
      |	200status_continuous_spark	| default_SavedSearch |	tag:continuous	|
      |	app_spark_count_byip_sort_授权	| default_SavedSearch |	tag:spark OR tag:c* \| stats count() as cnt by apache.clientip \| sort by cnt	|
      |	offlinetask_sample	| default_SavedSearch |	* \| transaction apache.status maxspan=1h	|




  @savedsample
  Scenario: new监控
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I click the "CreateAlert" button
    And I will see the "alert.CreatePage" page
    When I set the parameter "AlertName" with value "AutoTest18"
    And I choose1 the "观察易-服务总览-曲线图" from the "SavedSearch"
