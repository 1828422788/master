@all @searchMacro @tmacro
Feature: 搜索宏新建

  @newmacro2
  Scenario Outline:创建宏_3个参数，2个
    Given open the "macroSearch.ListPage" page for uri "/macro/"
    When I click the "CreateMacroButton" button
    Then I will see the "macroSearch.CreatePage" page
    When I set the parameter "MacroName" with value "<name>"
#    And I choose the "1pre_package" from the "MacroResTag"
#    And I choose the "无数集app之api全部测试用例" from the "BelongToApps"
    And I set the parameter "Definition" with value "<definition>"
    And I set the parameter "MacroParam" with value "<oneparam>"
    And I set the parameter "ValidateExpression" with value "<validateExpression>"
    And I set the parameter "ValidateFalseInfo" with value "<validateFalseInfo>"

    And I click the "SaveMacroButton" button
#    Then I will see the success message "保存成功"

    Examples: 新建成功
      | name        | definition                       | oneparam | validateExpression | validateFalseInfo |
      | mne_if_3(3) | "if(isstr($z$),$x$-$y$,$x$+$y$)" | x,y,z    |                    |                   |
      | me_if_3(3)  | "if(isstr($z$),$x$-$y$,$x$+$y$)" | x,y,z    |                    |                   |
    # | macrosample_3param(3)  | "if(isstr($z$),$x$-$y$,$x$+$y$)"  | x,y,z |    |      |

  @newmacro3
  Scenario Outline:创建宏_1个参数、两个参数
    Given open the "macroSearch.ListPage" page for uri "/macro/"
    When I click the "CreateMacroButton" button
    Then I will see the "macroSearch.CreatePage" page
    When I set the parameter "MacroName" with value "<name>"
#    And I choose the "1pre_package" from the "MacroResTag"
#    And I choose the "无数集app之api全部测试用例" from the "BelongToApps"
    And I set the parameter "Definition" with value "<definition>"
    And I set the parameter "MacroParam" with value "<param>"
    And I set the parameter "ValidateExpression" with value "<validateExpression>"
    And I set the parameter "ValidateFalseInfo" with value "<validateFalseInfo>"

    And I click the "SaveMacroButton" button
    Then I will see the "<ResultMessage>"

    @smoke @searchMacroSmoke
    Examples: 新建成功
      | name                  | definition                                                                                                                  | param | validateExpression   | validateFalseInfo | ResultMessage          |
      | macrosample_1param(1) | tag:sample04061424 \| stats count() by apache.clientip, apache.version \| where apache.clientip==$x$                        | x     | isstr(x)             | 请输⼊字符串            | success message "保存成功" |
      | macrosample_2param(2) | tag:sample04061424 \| stats count() by apache.clientip, apache.version \| where apache.clientip==$x$ && apache.version==$y$ | x,y   | isstr(x) && isstr(y) | 参数错误，请输⼊正确的参数     | success message "保存成功" |

    Examples: 新建失败
      | name | definition | param | validateExpression | validateFalseInfo | ResultMessage          |
      |      |            |       |                    |                   | error message "名称不能为空" |

  @newmacro4
  Scenario Outline:创建宏_2个参数
    Given open the "macroSearch.ListPage" page for uri "/macro/"
    When I click the "CreateMacroButton" button
    Then I will see the "macroSearch.CreatePage" page
    When I set the parameter "MacroName" with value "<name>"
#    And I choose the "1pre_package" from the "MacroResTag"
#    And I choose the "无数集app之api全部测试用例" from the "BelongToApps"
    And I set the parameter "Definition" with value "<definition>"
#    And I click the "MacroEvalCheckbox" button
    And I set the parameter "MacroParam" with value "<twoparam>"
    And I set the parameter "ValidateExpression" with value "<validateExpression>"
    And I set the parameter "ValidateFalseInfo" with value "<validateFalseInfo>"

    And I click the "SaveMacroButton" button
#    Then I will see the success message "保存成功"

    Examples: 新建成功
      | name                               | definition                                                                                                                  | twoparam    | validateExpression   | validateFalseInfo |
      | map_opt_count_2(2)                 | tag:"sample04061424" \| eval txt=$p_count$\| limit 1 \| table txt \| map " tag:"sample04061424" \| stats $txt$(timestamp) " | p_count,txt | isstr(p_count)       | 输入参数需要字符串         |
      #有bug
      |	me_if_excp_2(2)	|	if($x$-$y$,$x$+$y$)	|	x,y	|		|		|
      | app_permission_sample_two_param(2) | tag:sample04061424 \| stats count() by apache.clientip, apache.version \| where apache.clientip==$x$ && apache.version==$y$ | x,y         | isstr(x) && isstr(y) | 参数错误，请输入正确的参数     |
      | two_param(2)                       | tag:sample04061424 \| stats count() by apache.clientip, apache.version \| where apache.clientip==$x$ && apache.version==$y$ | x,y         | isstr(x) && isstr(y) | 参数错误，请输入正确的参数     |
       #有bug
       |	huanbi_2(2)	|	starttime="now/d" endtime="now" appname:$arg1$ \| bucket timestamp span=1h as ts\|stats $arg2$() as count_ by ts\| eval hour=formatdate(tolong(ts),"HH")\|eval line="今天"\|append [[starttime="-1d/d" endtime="now/d" appname:$arg1$ \| bucket timestamp span=1h as ts\|stats $arg2$() as count_ by ts\| eval hour=formatdate(tolong(ts),"HH")\|eval line="昨天"]] \| append [[starttime="-7d/d" endtime="-6d/d" appname:$arg1$ \| bucket timestamp span=1h as ts\|stats $arg2$() as count_ by ts\| eval hour=formatdate(tolong(ts),"HH")\|eval line="一周前"]]\|rename count_ as "请求量"	|	arg1,arg2	|		|		|

  @newmacro5
  Scenario Outline:创建宏_1个参数，7个
    Given open the "macroSearch.ListPage" page for uri "/macro/"
    When I click the "CreateMacroButton" button
    Then I will see the "macroSearch.CreatePage" page
    When I set the parameter "MacroName" with value "<name>"
#    And I choose the "1pre_package" from the "MacroResTag"
#    And I choose the "无数集app之api全部测试用例" from the "BelongToApps"
    And I set the parameter "Definition" with value "<definition>"
#    And I click the "MacroEvalCheckbox" button
    And I set the parameter "MacroParam" with value "<oneparam>"
    And I set the parameter "ValidateExpression" with value "<validateExpression>"
    And I set the parameter "ValidateFalseInfo" with value "<validateFalseInfo>"

    And I click the "SaveMacroButton" button
    Then I will see the success message "保存成功"

    Examples: 新建成功
      | name                         | definition                                                                                                                                                                                   | oneparam       | validateExpression | validateFalseInfo |
      | timechart_hour_1(1)          | tag:sample04061424 \| timechart span=$x$h count() as res_count \| where res_count>0 \| eval f_time=formatdate(_time)                                                                         | x              | isint(x)           |                   |
      | one_param(1)                 | tag:sample04061424 \| stats count() by apache.clientip, apache.version \| where apache.clientip==$x$                                                                                         | x              | isstr(x)           | 参数格式错误111         |
      | sub_tran_resp_len_1(1)       | tag: sample04061424 AND [[ $resp_len$ \| stats count(appname) by apache.resp_len \| fields apache.resp_len]] \| transaction apache.resp_len contains="$resp_len$"                            | resp_len       |                    |                   |
      | sub_tran_resp_len_param_1(1) | tag:sample04061424 AND [[ apache.resp_len:$param_resp_len$ \| stats count(appanme) by apache.resp_len \| fields apache.resp_len]] \| transaction apache.resp_len contains="$param_resp_len$" | param_resp_len |                    |                   |
      | sub_join_left_1(1)           | tag:"sample04061424" \| stats avg(apache.status) by $cip$ \| join type=left $cip$ [[ tag:"sample04061424" AND $cip$:23.166.125.53 \| stats sum(apache.status) by $cip$ ]]                    | cip            |                    |                   |
      | dup_names_1(1)               | tag:"sample04061424" \| stats avg(apache.status) by $cip$ \| join type=left $cip$ [[ tag:"sample04061424" AND $cip$:23.166.125.53 \| stats sum(apache.status) by $cip$ ]]                    | cip            |                    |                   |

  @newmacro
  Scenario Outline:创建宏_无参数，21
    Given open the "macroSearch.ListPage" page for uri "/macro/"
    When I click the "CreateMacroButton" button
    Then I will see the "macroSearch.CreatePage" page
    When I set the parameter "MacroName" with value "<name>"
#    And I choose the "1pre_package" from the "MacroResTag"
#    And I choose the "无数集app之api全部测试用例" from the "BelongToApps"
    And I set the parameter "Definition" with value "<definition>"
#    And I click the "MacroEvalCheckbox" button
    And I set the parameter "ValidateExpression" with value "<validateExpression>"
    And I set the parameter "ValidateFalseInfo" with value "<validateFalseInfo>"

    And I click the "SaveMacroButton" button
#    Then I will see the success message "保存成功"

    Examples: 新建成功
      | name                                        | definition                                                                                                                                                                                                                                                                                                                               | validateExpression | validateFalseInfo |
      | lookup_stats                                | tag:"sample04061424" \| stats count() by hostname \| lookup user,department /data/rizhiyi/share/host_user.csv on hostname = host                                                                                                                                                                                                         |                    |                   |
      | mvcount                                     | tag:"sample04061424" \| eval m_ips=split(apache.clientip, ".") \| eval m_paths=split(apache.request_path, "/") \| eval m_ips_count = mvcount(m_ips) \| eval m_paths_count = mvcount(m_paths)  \| table m_ips, m_paths,m_ips_count, m_paths_count                                                                                         |                    |                   |
      | noparam                                     | tag:sample04061424 \| stats count() by apache.clientip, apache.version \| where apache.clientip=="23.166.125.53"                                                                                                                                                                                                                         |                    |                   |
      | sub_nest_2                                  | starttime="-d/d" endtime="now/d" tag:"sample04061424"  \| append [[ starttime="-5h" endtime="now" tag:"sample04061424" apache.status:200 AND apache.method:"GET" \| append [[ tag:"sample04061424" \| stats count() as cnt by apache.status]] ]]                                                                                         |                    |                   |
      | tran_count                                  | tag:sample04061424 \| `makesession` \| stats count(apache.clientip)                                                                                                                                                                                                                                                                      |                    |                   |
      | mvappend                                    | tag:"sample04061424" \| eval m_ips=split(apache.clientip, ".") \| eval m_paths=split(apache.request_path, "/") \| eval m_ips_count = mvcount(m_ips) \| eval m_paths_count = mvcount(m_paths)  \| eval r_count_append=mvappend('m_ips_count', 'm_paths_count') \| table m_ips_count, m_paths_count, r_count_append                        |                    |                   |
      | preview1d_perhour_perip_precent_currenthour | starttime="-1d/d" endtime="now/d" logtype:apache \| bucket timestamp span=1h as ts \| stats count() as ip_count by apache.clientip,ts \| join type=left ts [[ logtype:apache \| bucket timestamp span=1h as ts \| stats count() as hour_count by ts ]] \| eval ippercent=100 * ip_count / hour_count                                     |                    |                   |
      | append_sample                               | starttime="-1d/d" endtime="now/d"  tag:"sample04061424" \| stats avg(apache.resp_len) as avg_resp_len \| append [[ starttime="now/d" endtime="now" tag:"sample04061424" \| stats avg(apache.resp_len) as avg_resp_len]]                                                                                                                  |                    |                   |
      | fields_sample                               | starttime="now/d" endtime="now+d/d" tag:"sample04061424" \| stats count() as count_res by appname,apache.clientip \| fields apache.clientip, count_res                                                                                                                                                                                   |                    |                   |
      | where_dc                                    | tag:"sample04061424" \| where apache.status>400 \| stats dc(apache.status)                                                                                                                                                                                                                                                               |                    |                   |
      | where_logic_and                             | tag:"sample04061424" \| where  apache.status > 200 && apache.status < 400                                                                                                                                                                                                                                         \| table apache.status |                    |                   |
      | parse_eval_stats                            | tag:"sample04061424" \| parse field=apache.clientip "(?<ip_addr>\d+\.\d+\.\d+\.\d+)" \| eval ip_str = "ip:" + ip_addr  \| stats count(appname) by ip_str                                                                                                                                                                                 |                    |                   |
      | autoregress_sample                          | starttime="-5h/h" endtime="now" tag:"sample04061424" \| bucket timestamp span=10m as ts \| stats count(appname) as count_app by ts \| eval time=formatdate(ts) \| autoregress count_app p=6                                                                                                                                              |                    |                   |
      | makesession                                 | transaction apache.clientip maxspan=30m                                                                                                                                                                                                                                                                                                  |                    |                   |
      | top_sample_2                                | tag:"sample04061424" \| top 11 apache.clientip countfield=clientip_count  percentfield=clientip_percent                                                                                                                                                                                                                                  |                    |                   |
      | stats_count                                 | tag:"sample04061424" \| sort by +apache.status,+apache.resp_len \| table apache.status, apache.resp_len                                                                                                                                                                                                                                  |                    |                   |
      | dup_names_1                                 | tag:"sample04061424" \| stats avg(apache.status) by apache.clientip \| join type=left apache.clientip [[ tag:"sample04061424" AND apache.clientip:23.166.125.53 \| stats sum(apache.status) by apache.clientip ]]                                                                                                                        |                    |                   |
      | dup_names_1                                 | tag:"sample04061424" \| stats count(apache.status)                                                                                                                                                                                                                                                                                       |                    |                   |
      | save_stats_avg_ip                           | tag:"sample04061424" \| stats avg(apache.resp_len) as status,count(apache.resp_len) by apache.clientip \| save /data/rizhiyi/spldata/apache_latency.csv                                                                                                                                                                                  |                    |                   |
      | spl_movingavg                               | tag:"sample04061424"\|bucket timestamp span=1h as ts \| stats sum(apache.resp_len) as sum_resp_len by ts \| eval time=formatdate(ts)\| movingavg sum_resp_len,3 as moving_avg_resp_len                                                                                                                                                   |                    |                   |
