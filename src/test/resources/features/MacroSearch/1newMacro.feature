@searchMacro
Feature: 新建搜索宏

  Background:
    Given open the "macroSearch.ListPage" page for uri "/macro/"
    And I wait for loading invisible

  @searchMacroSmoke
  Scenario Outline:新建成功
    When I click the "CreateMacroButton" button
    Then I will see the "macroSearch.CreatePage" page
    And I wait for loading invisible
    When I set the parameter "MacroName" with value "<name>"
    And I set the parameter "Definition" with value "<definition>"
    And I set the parameter "MacroParam" with value "<macroParam>"
    And I set the parameter "ValidateExpression" with value "<validateExpression>"
    And I set the parameter "ValidateFalseInfo" with value "<validateFalseInfo>"
    And I click the "SaveMacroButton" button
    Then I will see the message "<message>"

    Examples:
      | name           | definition                                                                                                                  | macroParam | validateExpression   | validateFalseInfo      | message    |
      | UIAutoTest(1)  | tag:sample04061424 \| stats count() by apache.clientip, apache.version \| where apache.clientip==$x$                        | x          | isstr(x)             | 请输⼊字符串             | 保存成功    |
      | UIAutoTest(2)  | tag:sample04061424 \| stats count() by apache.clientip, apache.version \| where apache.clientip==$x$ && apache.version==$y$ | x,y        | isstr(x) && isstr(y) | 参数错误，请输⼊正确的参数 | 保存成功    |
      | UIAutoTest(3)  | "if(isstr($z$),$x$-$y$,$x$+$y$)"                                                                                            | x,y,z      |                      |                        | 保存成功    |
      | UIAutoTest1(1) | "substring($x$,2)"                                                                                                          | x          | isstr(x)             | 请输入字符串             | 保存成功    |

  Scenario:不输入名称直接点击保存提示"请输入宏的名称"
    When I click the "CreateMacroButton" button
    Then I will see the "macroSearch.CreatePage" page
    And I wait for loading invisible
    And I click the "SaveMacroButton" button
    Then I will see the text "请输入宏的名称" exist in page

  Scenario Outline: 创建宏，使用基于eval的定义，1个
    When I click the "CreateMacroButton" button
    Then I will see the "macroSearch.CreatePage" page
    And I wait for loading invisible
    When I set the parameter "MacroName" with value "<name>"
    And I set the parameter "Definition" with value "<definition>"
    And I click the "MacroEvalCheckbox" button
    And I set the parameter "MacroParam" with value "<macroParam>"
    And I set the parameter "ValidateExpression" with value "<validateExpression>"
    And I set the parameter "ValidateFalseInfo" with value "<validateFalseInfo>"
    And I click the "SaveMacroButton" button
    Then I will see the success message "保存成功"

    Examples:
      | name           | definition         | macroParam | validateExpression | validateFalseInfo |
      | me_substr_1(1) | "substring($x$,2)" | x          | isstr(x)           | 请 输入字符串       |

  Scenario Outline: 创建宏，使用基于eval的定义
    When I click the "CreateMacroButton" button
    Then I will see the "macroSearch.CreatePage" page
    And I wait for loading invisible
    When I set the parameter "MacroName" with value "<name>"
    And I set the parameter "Definition" with value "<definition>"
    And I click the "MacroEvalCheckbox" button
    And I set the parameter "MacroParam" with value "<macroParam>"
    And I click the "SaveMacroButton" button
    Then I will see the success message "保存成功"

    Examples: 新建成功
      | name            | definition                                   | macroParam | macroSearch                                              | query                                                                      |
      | me_if_2(2)      | "if(isstr(apache.method),$x$-$y$,$x$+$y$)"   | x,y        | tag:sample04061424 \| eval x=`me_if_2(1,2)` \| table x   | tag:sample04061424 \| eval x=`me_if_2(1,2)` \| table x                     |
      | me_if_excp_2(2) | if(isstr(apache.status),$x$-$y$,$x$+$y$)     | x,y        | tag:sample04061424 \| eval x=`me_if_excp_2(1,2)`         | tag:sample04061424 \| eval x=if(isstr(apache.status),1-2,1+2) \| table x   |
      | m1_eval_2(2)    | if(isstr(apache.clientip),$x$-$y$,$x$+$y$)   | x,y        | tag:sample04061424 \| eval x=`m1_eval_2(1,2)` \| table x | tag:sample04061424 \| eval x=if(isstr(apache.clientip),1-2,1+2) \| table x |
      | m2_eval_2(2)    | "if(isstr(apache.clientip),$x$-$y$,$x$+$y$)" | x,y        | tag:sample04061424 \| eval x=`m2_eval_2(1,2)` \| table x | tag:sample04061424 \| eval x="3" \| table x                                |

  Scenario Outline:创建宏，售前，1个
    When I click the "CreateMacroButton" button
    Then I will see the "macroSearch.CreatePage" page
    And I wait for loading invisible
    When I set the parameter "MacroName" with value "<name>"
    And I set the parameter "Definition" with value "<definition>"
    And I set the parameter "MacroParam" with value "<macroParam>"
    And I set the parameter "ValidateExpression" with value "<validateExpression>"
    And I set the parameter "ValidateFalseInfo" with value "<validateFalseInfo>"
    And I click the "SaveMacroButton" button
    Then I will see the success message "保存成功"

    Examples: 新建成功
      | name        | definition                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | macroParam | validateExpression | validateFalseInfo |
      | huanbi_2(2) | starttime="now/d" endtime="now/d+24h" tag:$arg1$ \| bucket timestamp span=1h as ts\|stats $arg2$() as count_ by ts\| eval hour=formatdate(tolong(ts),"HH")\|eval line="今天"\|append [[starttime="-1d/d" endtime="now/d" tag:$arg1$ \| bucket timestamp span=1h as ts\|stats $arg2$() as count_ by ts\| eval hour=formatdate(tolong(ts),"HH")\|eval line="昨天"]] \| append [[starttime="-7d/d" endtime="-6d/d" tag:$arg1$ \| bucket timestamp span=1h as ts\|stats $arg2$() as count_ by ts\| eval hour=formatdate(tolong(ts),"HH")\|eval line="一周前"]]\|rename count_ as "请求量" | arg1,arg2  |                    |                   |

  Scenario Outline:创建
    When I click the "CreateMacroButton" button
    Then I will see the "macroSearch.CreatePage" page
    And I wait for loading invisible
    When I set the parameter "MacroName" with value "<name>"
    And I set the parameter "Definition" with value "<definition>"
    And I set the parameter "MacroParam" with value "<macroParam>"
    And I set the parameter "ValidateExpression" with value "<validateExpression>"
    And I set the parameter "ValidateFalseInfo" with value "<validateFalseInfo>"
    And I click the "SaveMacroButton" button
    Then I will see the success message "保存成功"

    Examples: 新建成功
      | name                         | definition                                                                                                                                                                                                    | macroParam     | validateExpression | validateFalseInfo | ResultMessage          |
      | timechart_hour_1(1)          | tag:sample04061424 \| timechart span=$x$h count() as res_count \| where res_count>0 \| eval f_time=formatdate(_time)                                                                                          | x              | isnum(x)           |                   |                        |
      | one_param(1)                 | tag:sample04061424 \| stats count() by apache.clientip, apache.version \| where apache.clientip==$x$                                                                                                          | x              | isstr(x)           | 请输⼊字符串            | success message "保存成功" |
      | sub_tran_resp_len_1(1)       | tag: sample04061424 AND [[ $resp_len$ \| stats count(appname) by apache.resp_len \| fields apache.resp_len]] \| transaction apache.resp_len keepevicted=true contains="$resp_len$"                            | resp_len       |                    |                   |                        |
      | sub_tran_resp_len_param_1(1) | tag:sample04061424 AND [[ apache.resp_len:$param_resp_len$ \| stats count(appanme) by apache.resp_len \| fields apache.resp_len]] \| transaction apache.resp_len keepevicted=true contains="$param_resp_len$" | param_resp_len |                    |                   |                        |
      | sub_join_left_1(1)           | tag:"sample04061424" \| stats avg(apache.status) by $cip$ \| join type=left $cip$ [[ tag:"sample04061424" AND $cip$:23.166.125.53 \| stats sum(apache.status) by $cip$ ]]                                     | cip            |                    |                   |                        |
      | dup_names_1(1)               | tag:"sample04061424" \| stats avg(apache.status) by $cip$ \| join type=left $cip$ [[ tag:"sample04061424" AND $cip$:23.166.125.53 \| stats sum(apache.status) by $cip$ ]]                                     | cip            |                    |                   |                        |

  Scenario Outline:创建宏，20个
    When I click the "CreateMacroButton" button
    Then I will see the "macroSearch.CreatePage" page
    And I wait for loading invisible
    When I set the parameter "MacroName" with value "<name>"
    And I set the parameter "Definition" with value "<definition>"
    And I set the parameter "ValidateExpression" with value "<validateExpression>"
    And I set the parameter "ValidateFalseInfo" with value "<validateFalseInfo>"
    And I click the "SaveMacroButton" button
    Then I will see the success message "保存成功"

    Examples: 新建成功
      | name                                        | definition                                                                                                                                                                                                                                                                                                                             | validateExpression | validateFalseInfo |
      | lookup_stats                                | tag:sample04061424 \| stats count() by hostname \| lookup user,department /data/rizhiyi/spldata/lookup/host_user.csv on hostname = host                                                                                                                                                                                                |                    |                   |
      | mvcount                                     | tag:sample04061424 \| eval m_ips=split(apache.clientip, ".") \| eval m_paths=split(apache.request_path, "/") \| eval m_ips_count = mvcount(m_ips) \| eval m_paths_count = mvcount(m_paths)  \| table m_ips, m_paths,m_ips_count, m_paths_count                                                                                         |                    |                   |
      | noparam                                     | tag:sample04061424 \| stats count() by apache.clientip, apache.version \| where apache.clientip=="23.166.125.53"                                                                                                                                                                                                                       |                    |                   |
      | sub_nest_2                                  | starttime="-d/d" endtime="now/d" tag:sample04061424  \| append [[ starttime="-5h" endtime="now" tag:"sample04061424" apache.status:200 AND apache.method:"GET" \| append [[ tag:"sample04061424" \| stats count() as cnt by apache.status]] ]]                                                                                         |                    |                   |
      | makesession                                 | transaction apache.clientip keepevicted=true maxspan=30m                                                                                                                                                                                                                                                                               |                    |                   |
      | tran_count                                  | tag:sample04061424 \| `makesession` \| stats count(apache.clientip)                                                                                                                                                                                                                                                                    |                    |                   |
      | mvappend                                    | tag:sample04061424 \| eval m_ips=split(apache.clientip, ".") \| eval m_paths=split(apache.request_path, "/") \| eval m_ips_count = mvcount(m_ips) \| eval m_paths_count = mvcount(m_paths)  \| eval r_count_append=mvappend('m_ips_count', 'm_paths_count') \| table m_ips_count, m_paths_count, r_count_append                        |                    |                   |
      | preview1d_perhour_perip_precent_currenthour | starttime="-1d/d" endtime="now/d" logtype:apache \| bucket timestamp span=1h as ts \| stats count() as ip_count by apache.clientip,ts \| join type=left ts [[ logtype:apache \| bucket timestamp span=1h as ts \| stats count() as hour_count by ts ]] \| eval ippercent=100 * ip_count / hour_count                                   |                    |                   |
      | append_sample                               | starttime="-1d/d" endtime="now/d"  tag:sample04061424 \| stats avg(apache.resp_len) as avg_resp_len \| append [[ starttime="now/d" endtime="now" tag:"sample04061424" \| stats avg(apache.resp_len) as avg_resp_len]]                                                                                                                  |                    |                   |
      | fields_sample                               | starttime="now/d" endtime="now+d/d" tag:sample04061424 \| stats count() as count_res by appname,apache.clientip \| fields apache.clientip, count_res                                                                                                                                                                                   |                    |                   |
      | where_dc                                    | tag:sample04061424 \| where apache.status>400 \| stats dc(apache.status)                                                                                                                                                                                                                                                               |                    |                   |
      | where_logic_and                             | tag:sample04061424 \| where  apache.status > 200 && apache.status < 400                                                                                                                                                                                                                                         \| table apache.status |                    |                   |
      | parse_eval_stats                            | tag:sample04061424 \| parse field=apache.clientip "(?<ip_addr>\d+\.\d+\.\d+\.\d+)" \| eval ip_str = "ip:" + ip_addr  \| stats count(appname) by ip_str                                                                                                                                                                                 |                    |                   |
      | autoregress_sample                          | starttime="now/d" endtime="now/d+24h" tag:sample04061424_display \| bucket timestamp span=10m as ts \| stats count(appname) as count_app by ts \| eval time=formatdate(ts) \| autoregress count_app p=6                                                                                                                                |                    |                   |
      | top_sample_2                                | tag:sample04061424 \| top 11 apache.clientip countfield=clientip_count  percentfield=clientip_percent                                                                                                                                                                                                                                  |                    |                   |
      | stats_count                                 | tag:sample04061424 \| sort by +apache.status,+apache.resp_len \| table apache.status, apache.resp_len                                                                                                                                                                                                                                  |                    |                   |
      | dup_names_1                                 | tag:sample04061424 \| stats avg(apache.status) by apache.clientip \| join type=left apache.clientip [[ tag:"sample04061424" AND apache.clientip:23.166.125.53 \| stats sum(apache.status) by apache.clientip ]]                                                                                                                        |                    |                   |
      | dup_names_1                                 | tag:sample04061424 \| stats count(apache.status)                                                                                                                                                                                                                                                                                       |                    |                   |
      | save_stats_avg_ip                           | tag:sample04061424 \| stats avg(apache.resp_len) as status,count(apache.resp_len) by apache.clientip \| save /data/rizhiyi/spldata/apache_latency.csv                                                                                                                                                                                  |                    |                   |
      | spl_movingavg                               | tag:sample04061424 \|bucket timestamp span=1h as ts \| stats sum(apache.resp_len) as sum_resp_len by ts \| eval time=formatdate(ts)\| movingavg sum_resp_len,3 as moving_avg_resp_len                                                                                                                                                  |                    |                   |
      | alert_stats_len_avg                         | starttime="now/d" endtime="now/d+24h" tag:sample04061424 \| stats avg(apache.resp_len) as avg_len by apache.clientip \| sort by avg_len, apache.clientip                                                                                                                                                                               |                    |                   |



