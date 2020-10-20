@db1
Feature: 新建下载任务

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"

  @v35dbchart
  Scenario Outline: 新建下载任务3个
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "2000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"

    And I wait for "2000" millsecond
    Then I click the "downloadButton" button
    Then I set the parameter "DownloadName" with value "<name>"
    Then I set the parameter "MaxLineNum" with value "100"
#    Then I choose the "<unit>" from the "MaxLineDropdown"
    Then I choose the "CSV" from the "DocumentTypeList"
    Then I choose the "UTF" from the "DocumentEncodeList"
    Then I click the "CreateDownloadTask" button
    And I wait for "2000" millsecond
    Then I will see the success message "提交成功，请到设置-下载管理页查看下载状态！"

    #下载到本地
    Given open the "splSearch.OfflineTaskPage" page for uri "/download/#"
    When I set the parameter "DbListPageSearchInput" with value "<name>"
    And I wait for "2000" millsecond
    Given the data name is "<name>.csv" then i click the "下载" button
    And I wait for "2000" millsecond
    And I download file "<name>.csv" to local
    Then I compare source download file "expect/<name>.csv" with target download files "<name>.csv"

    Examples: 新建成功
      | name                                         | splQuery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
      | chart_sample_noparam | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| chart max(apache.status) as ma count() as cnt |
      | chart_sample_over_status | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| chart count() as cnt over apache.status span=\"50\" |
      | chart_sample_over_resp_len | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| chart count() over apache.resp_len span=\"500\" by apache.method |
      | chart_over_timestamp_span1h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display  \| chart count() over timestamp span=\"1h\" |
      | chart_over_timestamp_span1d | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| chart count() over timestamp span=\"1d\" |
      | chart_cont_false_overstatus_span50 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| chart cont=false count() as cnt over apache.status span=\"50\" |
      | chart_cont_true_overstatus_span50 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| chart cont=true count() as cnt over apache.status span=\"50\" |
      | chart_cont_false_overstatus_span50_bymethod | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| chart cont=false count() as cnt over apache.status span=\"50\" by apache.method |
      | chart_cont_true_overstatus_span50_bymethod | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| chart cont=true count() as cnt over apache.status span=\"50\" by apache.method |
      | chart_bins3_span1h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| chart count() over timestamp bins=3 span=\"1h\" |
      | chart_bins24_span1h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| chart count() over timestamp bins=24 span=\"1h\" |
      | chart_overresplen_bins10_span50 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| chart sep=\"-sep分格-\" format=\"$AGG\|format分格\|$VAL\" cont=true count() as cnt over apache.resp_len bins=10 span=\"50\" |
      | chart_sep_sample | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| chart sep=\"-sep分格-\" count() max(apache.resp_len) over timestamp span=\"1h\" by apache.status |
      | chart_sep_format | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| chart sep=\"-sep分格-\" format=\"$AGG\|format分格\|$VAL\" count() max(apache.resp_len) over timestamp span=\"1h\" by apache.status |
      | chart_sep_format1 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| chart sep=\"-sep分格-\" format=\"$VAL\|format分格\|$AGG\" count() max(apache.resp_len) over timestamp span=\"1h\" by apache.status |
      | chart_bins10_span30m | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| chart count() max(apache.resp_len) over timestamp bins=10 span=\"30m\" |
      | chart_bins10_span30m_startindex2_endindex7 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| chart count() max(apache.resp_len) over timestamp bins=10 span=\"30m\" |
      | chart_bins10_span30m_startindex4_endindex7 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| chart count() max(apache.resp_len) over timestamp bins=10 span=\"1h\" startindex=4 endindex=7 |
      | chart_bins10_span30m_startindex4_endindex7_bystatus | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| chart count() max(apache.resp_len) over timestamp bins=10 span=\"1h\" startindex=4 endindex=7 by apache.status |
      | chart_limit_one_field | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| chart limit=5 count() max(apache.resp_len) over timestamp span=\"1h\" by apache.status |
      | chart_limit_two_field | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| chart limit=5 count() max(apache.resp_len) over timestamp span=\"1h\"  by apache.status, apache.method |
      | chart_multi_params_by_clientip | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| chart sep=\"-sep分格-\" format=\"$AGG\|format分格\|$VAL\" limit=5 cont=false count() as cnt max(apache.resp_len) over timestamp span=\"1h\" bins=4 startindex=1 endindex=4 by apache.clientip bins=3 |
      | chart_multi_params_by_status_bins1 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| chart sep=\"-sep分格-\" format=\"$AGG\|format分格\|$VAL\" limit=5 cont=false count() as cnt max(apache.resp_len) over timestamp span=\"1h\" bins=4 startindex=1 endindex=4 by apache.status bins=1 |
      | chart_multi_params_by_resplen_bins3 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| chart sep=\"-sep分格-\" format=\"$AGG\|format分格\|$VAL\" limit=5 cont=false count() as cnt max(apache.status) over timestamp span=\"1h\" bins=4 startindex=1 endindex=4 by apache.resp_len bins=3 |
      | chart_multi_params_by_resplen_span1000_bins5_endindex2 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| chart count() over apache.status span=\"200\" by apache.resp_len span=\"1000\"  bins=5  startindex=0 endindex=2 |
      | chart_rendertype_pie_overstatus_contfalse_span50 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| chart cont=false rendertype=\"pie\" count(apache.x_forward) as cnt over apache.status span=\"50\" |
      | chart_rendertype_pie_overdomain | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| chart cont=true rendertype=\"pie\" count(apache.resp_len) as cnt over apache.referer_domain |
      | chart_rendertype_pie_overclientip | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424 \| chart cont=true rendertype=\"pie\" count(apache.resp_len) as cnt over apache.clientip |
      | chart_rendertype_rose_overresplen_span500_contfalse | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| chart cont=false rendertype=\"pie\" count(apache.clientip) as cnt over apache.resp_len span=\"500\" |
      | chart_rendertype_rose_overresplen_span500 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| chart cont=false rendertype=\"rose\" min(apache.status) as min_status over apache.resp_len span=\"500\" |
      | chart_rendertype_bar_overresplen_span500_limit20 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| chart  cont=false rendertype=\"bar\" min(apache.status) as min_status over apache.resp_len span=\"500\" \| limit 20 |
      | chart_rendertype_sunburst_overresplen_span500_bydomain | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| chart sep=\"无效sep\" format=\"$AGG\|format分格\|$VAL\" cont=false rendertype=\"sunburst\" avg(apache.status) as avg_status over apache.resp_len span=\"500\" by apache.referer_domain |
      | chart_rendertype_sunburst_overresplen_span500_bydomain_limit3 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\" \| chart sep=\"无效sep\" format=\"$AGG\|format分格\|$VAL\" cont=false rendertype=\"sunburst\" avg(apache.status) as avg_status over apache.resp_len span=\"500\" by apache.referer_domain \| limit 3 |
      | chart_rendertype_sankey_overresplen_span500_byip | tag:\"sample04061424\" AND (apache.clientip:2* OR apache.clientip:8* ) \| chart sep=\"无效sep\" format=\"$AGG\|format分格\|$VAL\" cont=false rendertype=\"sankey\" count() as cnt over apache.resp_len span=\"1000\" by apache.clientip |
      | chart_rendertype_force_overresplen_span500_byip | tag:\"sample04061424\" AND (apache.clientip:2* OR apache.clientip:8* ) \| chart sep=\"无效sep\" format=\"$AGG\|format分格\|$VAL\" cont=false rendertype=\"force\" count() as cnt over apache.resp_len span=\"1000\" by apache.clientip |
      | chart_rendertype_chord_overresplen_span500_byip | tag:\"sample04061424\" AND (apache.clientip:2* OR apache.clientip:8* ) \| chart sep=\"无效sep\" format=\"$AGG\|format分格\|$VAL\" cont=false rendertype=\"chord\" count() as cnt over apache.resp_len span=\"1000\" by apache.clientip |
      | chart_heatmap_overgeo | tag:sample04061424_display \| chart rendertype=\"heatmap\" count() as cnt by apache.geo.city |
      | chart_wordcloud_overresplen_span100 | tag:\"sample04061424\" \| chart sep=\"无效sep\" format=\"$VAL\|分格2\|$AGG\" cont=false rendertype=\"wordcloud\" count() as cnt over apache.resp_len span=\"100\" \| limit 10 |
