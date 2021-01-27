@vdlmacro @autoui03
Feature: 验证宏

  Background:
    Given open the "macroSearch.ListPage" page for uri "/macro/"

#  @vdlmacro1
#  Scenario Outline:
#    Then I compare source file "<name>.json" with target macro files "macro_<name>.json"
#
#    Examples:
#      | name                      | macroSearch                       | splQuery1                                                                                                                                                                                 |
#      | sub_tran_resp_len_1       | `sub_tran_resp_len_1(1955)`       | tag:sample04061424 AND [[ 1955 \| stats count(appanme) by apache.resp_len \| fields apache.resp_len]]  \| transaction apache.resp_len keepevicted=true contains=\"1955\"                  |
#      | sub_tran_resp_len_param_1 | `sub_tran_resp_len_param_1(1955)` | tag: sample04061424 AND [[ apache.resp_len:1955 \| stats count(appname) by apache.resp_len \| fields apache.resp_len ]] \| transaction apache.resp_len keepevicted=true contains=\"1955\" |

  @vdlmacro2
  Scenario Outline:
    Then I compare source file "<name>.csv" with target macro files "macro_<name>.csv"

    Examples:
      | name                                        | macroSearch                                                                                                                                                                                                                                                                                                                              | splQuery1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
      | me_substr_1                                 | tag:sample04061424 \| eval x=`me_substr_1(\"VendorLongitude\")` \| table x                                                                                                                                                                                                                                                               | tag:sample04061424 \| eval x=substring(\"VendorLongitude\",2) \| table x                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
      | m1_2                                        | tag:sample04061424 \| eval x=`m1_2(1,2)` \| table x                                                                                                                                                                                                                                                                                      | tag:sample04061424 \| eval x=if(isstr(apache.clientip),1-2,1+2) \| table x                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
      | m2_2                                        | tag:sample04061424 \| eval x=`m2_2(1,2)` \| table x                                                                                                                                                                                                                                                                                      | tag:sample04061424 \| eval x=\"if(isstr(apache.clientip),1-2,1+2)\" \| table x                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
      | me_if_2                                     | tag:sample04061424 \| eval x=`me_if_2(1,2)` \| table x                                                                                                                                                                                                                                                                                   | tag:sample04061424 \| eval x=`me_if_3(1,2,3)` \| table x                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
      | mne_if_2                                    | tag:sample04061424 \| eval x=`mne_if_2(1,2)` \| table x                                                                                                                                                                                                                                                                                  | tag:sample04061424 \| eval x="if(isstr(3),1-2,1+2)" \| table x                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
      | two_param                                   | `two_param("23.166.125.53", "1.1")`                                                                                                                                                                                                                                                                                                      | tag:sample04061424 \| stats count() as ip_cnt by apache.clientip, apache.version \| where apache.clientip==\"23.166.125.53\" && apache.version==\"1.1\"                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
      | map_opt_count_2                             | `map_opt_count_2("count", "count")`                                                                                                                                                                                                                                                                                                      | tag:\"sample04061424\" \| eval txt=\"count\"\| limit 1 \| table txt \| map \" tag:\"sample04061424\" \| stats count(timestamp) \"                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
      | map_eval_resplen_stats_count_2              | `map_eval_resplen_stats_count_2("count",69)`                                                                                                                                                                                                                                                                                             | tag:\"sample04061424\" \| eval resp_len=$int_resp_len$ \| limit 1 \| table resp_len \| map \" tag:\"sample04061424\" \| stats $fun_name$() \"                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
      | app_permission_sample_two_param             | `app_permission_sample_two_param(\"23.166.125.53\", \"1.1\")`                                                                                                                                                                                                                                                                            | tag:sample04061424 \| stats count() as ip_cnt by apache.clientip, apache.version \| where apache.clientip==\"23.166.125.53\" && apache.version==\"1.1\"                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
      | huanbi_2                                    | `huanbi_2("apache",count)`                                                                                                                                                                                                                                                                                                               | starttime=\"now/d\" endtime=\"now\" appname:apache \| bucket timestamp span=1h as ts \|stats count() as count_ by ts\| eval hour=formatdate(tolong(ts),\"HH\")\|eval line=\"今天\"\|append [[starttime=\"-1d/d\" endtime=\"now/d\" appname:apache \| bucket timestamp span=1h as ts\|stats count() as count_ by ts\| eval hour=formatdate(tolong(ts),\"HH\")\|eval line=\"昨天\"]] \| append [[starttime=\"-7d/d\" endtime=\"-6d/d\" appname:apache \| bucket timestamp span=1h as ts\|stats count() as count_ by ts\| eval hour=formatdate(tolong(ts),"\HH\")\|eval line=\"一周前\"]] \| rename count_ as \"请求量\" |
      | timechart_hour_1                            | `timechart_hour_1(1)`                                                                                                                                                                                                                                                                                                                    | tag:sample04061424 \| timechart span=1h count() as res_count \| where res_count>0 \| eval f_time=formatdate(_time)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
      | one_param                                   | `one_param("23.166.125.53")`                                                                                                                                                                                                                                                                                                             | tag:sample04061424 \| stats count() by apache.clientip, apache.version \| where apache.clientip==\"23.166.125.53\"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
      | sub_join_left_1                             | `sub_join_left_1(apache.clientip)`                                                                                                                                                                                                                                                                                                       | tag:sample04061424 \| stats avg(apache.status) by apache.clientip \| join type=left apache.clientip [[ tag:sample04061424 AND apache.clientip:23.166.125.53 \| stats sum(apache.status) by apache.clientip ]]                                                                                                                                                                                                                                                                                                                                                                                               |
      | dup_names_1                                 | `dup_names_1("apache.clientip")`                                                                                                                                                                                                                                                                                                         | tag:\"sample04061424\" \| stats avg(apache.status) by apache.clientip \| join type=left apache.clientip [[ tag:\"sample04061424\" AND apache.clientip:23.166.125.53 \| stats sum(apache.status) by apache.clientip ]]                                                                                                                                                                                                                                                                                                                                                                                       |
      | lookup_stats                                | tag:"sample04061424" \| stats count() by hostname \| lookup user,department /data/rizhiyi/share/host_user.csv on hostname = host                                                                                                                                                                                                         |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | mvcount                                     | tag:"sample04061424" \| eval m_ips=split(apache.clientip, ".") \| eval m_paths=split(apache.request_path, "/") \| eval m_ips_count = mvcount(m_ips) \| eval m_paths_count = mvcount(m_paths)  \| table m_ips, m_paths,m_ips_count, m_paths_count                                                                                         |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | noparam                                     | tag:sample04061424 \| stats count() by apache.clientip, apache.version \| where apache.clientip=="23.166.125.53"                                                                                                                                                                                                                         |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | sub_nest_2                                  | starttime="-d/d" endtime="now/d" tag:"sample04061424"  \| append [[ starttime="-5h" endtime="now" tag:"sample04061424" apache.status:200 AND apache.method:"GET" \| append [[ tag:"sample04061424" \| stats count() as cnt by apache.status]] ]]                                                                                         |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | tran_count                                  | tag:sample04061424 \| `makesession` \| stats count(apache.clientip)                                                                                                                                                                                                                                                                      |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | mvappend                                    | tag:"sample04061424" \| eval m_ips=split(apache.clientip, ".") \| eval m_paths=split(apache.request_path, "/") \| eval m_ips_count = mvcount(m_ips) \| eval m_paths_count = mvcount(m_paths)  \| eval r_count_append=mvappend('m_ips_count', 'm_paths_count') \| table m_ips_count, m_paths_count, r_count_append                        |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | preview1d_perhour_perip_precent_currenthour | starttime="-1d/d" endtime="now/d" logtype:apache \| bucket timestamp span=1h as ts \| stats count() as ip_count by apache.clientip,ts \| join type=left ts [[ logtype:apache \| bucket timestamp span=1h as ts \| stats count() as hour_count by ts ]] \| eval ippercent=100 * ip_count / hour_count                                     |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | append_sample                               | starttime="-1d/d" endtime="now/d"  tag:"sample04061424" \| stats avg(apache.resp_len) as avg_resp_len \| append [[ starttime="now/d" endtime="now" tag:"sample04061424" \| stats avg(apache.resp_len) as avg_resp_len]]                                                                                                                  |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | fields_sample                               | starttime="now/d" endtime="now+d/d" tag:"sample04061424" \| stats count() as count_res by appname,apache.clientip \| fields apache.clientip, count_res                                                                                                                                                                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | where_dc                                    | tag:"sample04061424" \| where apache.status>400 \| stats dc(apache.status)                                                                                                                                                                                                                                                               |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | where_logic_and                             | tag:"sample04061424" \| where  apache.status > 200 && apache.status < 400                                                                                                                                                                                                                                         \| table apache.status |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | parse_eval_stats                            | tag:"sample04061424" \| parse field=apache.clientip "(?<ip_addr>\d+\.\d+\.\d+\.\d+)" \| eval ip_str = "ip:" + ip_addr  \| stats count(appname) by ip_str                                                                                                                                                                                 |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | autoregress_sample                          | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_display \| bucket timestamp span=10m as ts \| stats count(appname) as count_app by ts \| eval time=formatdate(ts) \| autoregress count_app p=6                                                                                                                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | top_sample_2                                | tag:"sample04061424" \| top 11 apache.clientip countfield=clientip_count  percentfield=clientip_percent                                                                                                                                                                                                                                  |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | stats_count                                 | tag:"sample04061424" \| sort by +apache.status,+apache.resp_len \| table apache.status, apache.resp_len                                                                                                                                                                                                                                  |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | dup_names_1                                 | tag:"sample04061424" \| stats avg(apache.status) by apache.clientip \| join type=left apache.clientip [[ tag:"sample04061424" AND apache.clientip:23.166.125.53 \| stats sum(apache.status) by apache.clientip ]]                                                                                                                        |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | dup_names_1                                 | tag:"sample04061424" \| stats count(apache.status)                                                                                                                                                                                                                                                                                       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | save_stats_avg_ip                           | tag:"sample04061424" \| stats avg(apache.resp_len) as status,count(apache.resp_len) by apache.clientip \| save /data/rizhiyi/spldata/apache_latency.csv                                                                                                                                                                                  |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | spl_movingavg                               | tag:"sample04061424"\|bucket timestamp span=1h as ts \| stats sum(apache.resp_len) as sum_resp_len by ts \| eval time=formatdate(ts)\| movingavg sum_resp_len,3 as moving_avg_resp_len                                                                                                                                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |