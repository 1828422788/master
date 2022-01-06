Feature: 新建collect使用索引

  Background:
    Given open the "index.ListPage" page for uri "/indexsettings/"

  @delcollect0
  Scenario Outline:
    Given the data name is "{'column':'0','name':'<name>'}" then i click the "删除" button
    And I click the "Ensure" button

    Examples:
      | name       |
      | collectone |
      | collecttocollect |
      | collecttwo  |
      | collectmodefalse  |
      | collectmodetrue  |
      | collectmulti  |
      | collectdelete  |


  @delapiindex
  Scenario Outline:
    When I set the parameter "SearchInput" with value "<name>"
    And I wait for loading complete
    And I wait for "1000" millsecond
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button in more menu
    And I wait for loading complete
    And I click the "Ensure" button

    Examples:
      | name       |
      |	wym_collect_pre	|
      |	wym_collect	|
      |	wym_top	|
      |	wym_autoregress	|
      |	wym_esma	|
      |	wym_jpath	|
      |	wym_kvextract	|
      |	wym_transaction	|
      |	wym_filldown	|
      |	wym_stats_avg	|
      |	wym_join	|
      |	wym_outputlookup	|
      |	wym_sort	|
      |	wym_fillnull	|
      |	wym_mvcombine	|
      |	wym_append	|
      |	wym_chart	|
      |	wym_parse	|
      |	wym_transpose	|
      |	wym_movingavg	|
      |	wym_lookup	|
      |	wym_eventstats	|
      |	wym_basic_query	|
      |	wym_rollingstd	|
      |	wym_mvexpand	|
      |	wym_map	|
      |	wym_rare	|
      |	wym_stats_early	|
      |	wym_bucket	|
      |	wym_table	|
      |	wym_fields	|
      |	wym_appendcols	|
      |	wym_geostats	|
      |	wym_rename	|
      |	wym_stats_sparkline	|
      |	wym_stats_distinct	|
      |	wym_stats_list	|
      |	wym_addinfo	|
      |	wym_where	|
      |	wym_timewrap	|
      |	wym_stats_eval	|