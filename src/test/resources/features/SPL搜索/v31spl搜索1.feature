
Feature: SPL语句执行chart部分

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"

#  @smoke @spl @all
  @v31tcspl1
  Scenario Outline: V3.1版本SPL用例、截图
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I wait for "1000" millsecond
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    #And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "5000" millsecond
    Then take a screenshot with name "<splcasename>"

    Examples:
      |splcasename| splQuery|
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
| timechart_sample | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart count() \| eval f_time = formatdate(_time,\"HH:mm:SS\") |
| timechart_sample_count_span1h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h max(apache.resp_len) as cnt |
| timechart_sample_count_span1h_bystatus | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h count() as cnt by apache.status |
| timechart_sample_avg_span1h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h avg(apache.resp_len) as avg_len |
| timechart_sep_byip_span1h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart AND ('apache.clientip':221.226.97.92 OR 'apache.clientip':117.136.79.162)  \| timechart sep=\":\" span=1h count() as cnt max(apache.resp_len) by apache.clientip |
| timechart_sep_bydomain_span1h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart AND ('apache.clientip':221.226.97.92 OR 'apache.clientip':117.136.79.162)  \| timechart sep=\":\" span=1h count() as cnt max(apache.resp_len) by apache.referer_domain |
| timechart_sep_bystatus_span1h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart sep=\":\" span=1h count() as cnt max(apache.resp_len) by apache.status |
| timechart_format | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart sep=\"-sep分格-\" format=\"$VAL\|分格2\|$AGG\" span=1h count() as cnt by apache.status |
| timechart_format1 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart sep=\"-sep分格-\" format=\"$VAL\|分格2\|$AGG\" span=1h count() as cnt max(apache.resp_len) as ma by apache.status |
| timechart_limit_by_one | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| timechart span=1h limit=5 count() max(apache.resp_len) by apache.status |
| timechart_limit_by_two | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| timechart span=1h limit=5 count() max(apache.resp_len) by apache.status, apache.method |
| timechart_bins_sample | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| timechart bins=10 span=30m count() |
| timechart_span30m_bins3 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=30m bins=3 count() max(apache.resp_len) by apache.status |
| timechart_minspan2h_bins40 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart minspan=2h bins=40 count() |
| timechart_minspan30m_bins40 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart minspan=30m bins=40 count() |
| timechart_minspan30m_bins4 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart minspan=30m bins=4 count() |
| timechart_bins100_bymethod | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h bins=100 count() max(apache.resp_len) by apache.method |
| timechart_startindex_endindex | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| timechart bins=8 span=30m startindex=1 endindex=8 count() max(apache.status) |
| timechart_startindex_endindex1 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| timechart bins=10 span=30m startindex=1 endindex=8 count() max(apache.status) by apache.resp_len |
| timechart_sample_all_params | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| timechart sep=\":\" format=\"$VAL--$AGG\" cont=true span=30m bins=100 startindex=1 endindex=8 limit=5 count() min(apache.resp_len) by apache.status |
| timechart_sample_all_params1 | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424\"  \| eval x=len(tostring(apache.request_path)) \| timechart sep=\",\" format=\"$VAL**$AGG\" cont=true limit=5 bins=10 minspan=1m span=10m max(x) as ma count() as cnt |
| timechart_cont_true | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart cont=true span=1h count() |
| timechart_cont_false | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart cont=false span=1h count() |
| timechart_cont_bystatus_true | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart sep=\":\" span=30m cont=false count() by apache.status |
| timechart_cont_bystatus_false | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart sep=\":\" span=30m cont=false count() by apache.status |
| timechart_rendertype_line | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| timechart sep=\",\" format=\"$VAL**$AGG\" limit=3 rendertype=\"line\" bins=200 minspan=1m span=10m max(apache.resp_len) as ma count() as cnt by apache.clientip |
| timechart_rendertype_area | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| timechart sep=\"-sep分格-\" format=\"$VAL-分格2-$AGG\" cont=true span=30m bins=100 startindex=1 endindex=8 limit=5 rendertype=\"area\"  count() min(apache.resp_len) by apache.status |
| timechart_rendertype_scatter | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| timechart sep=\"-sep分格-\" format=\"$VAL-分格2-$AGG\" cont=true span=30m bins=100 startindex=1 endindex=8 limit=5 rendertype=\"scatter\"  count() min(apache.resp_len) by apache.status |
| timechart_rendertype_column | starttime=\"now/d\" endtime=\"now/d+24h\" tag:\"sample04061424_display\" \| timechart sep=\"-sep分格-\" format=\"$VAL-分格2-$AGG\" cont=true span=30m bins=100 startindex=1 endindex=8 limit=5 rendertype=\"column\" count() min(apache.resp_len) by apache.status |
| timechart_timewrap_8h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h count() as cnt \| timewrap 8h |
| timechart_timewrap_10h | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h count() as cnt \| timewrap 10h |
| timechart_timewrap_series_short | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h count() as cnt \| timewrap 8h series=short |
| timechart_timewrap_timeformat | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h count() as cnt \| timewrap 8h series=exact timeformat=\"H\" |
| timechart_timewrap_align_end | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h count() as cnt \| timewrap 8h align=end |
| timechart_timewrap_align_now | starttime=\"now/d\" endtime=\"now\" tag:sample04061424_display \| timechart span=1h count() as cnt \| timewrap 8h align=now |
| timechart_timewrap_formatedate | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h count() as cnt \| timewrap 8h \| eval f_time = formatdate(_time,\"HH:mm:SS\") |
| timechart_span12h_timewrap_1d | starttime=\"now-7d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=12h count() as cnt  \| timewrap 1d |
| timechart_span1d_timewrap_1w | starttime=\"now-30d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1d count() as cnt \| timewrap 1w |
| timechart_span1h_timewrap_1d | starttime=\"now-3d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h count() as cnt \| timewrap 1d |
| timechart_span1h_timewrap_3d | starttime=\"now-7d\" endtime=\"now/d+24h\" tag:sample04061424_display \| timechart span=1h count() as cnt max(apache.resp_len) as max_len by apache.status \| timewrap 3d |