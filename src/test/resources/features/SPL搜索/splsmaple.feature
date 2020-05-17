Feature: 验证SPL搜索

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  @v33events
  Scenario Outline: 验证事件个数
    Given I set the parameter "SearchInput" with value "<splQuery>"
    #Given I set the parameter "SearchInput" with value "tag:sample04061424 | where apache.status>400 | stats dc(apache.status) as ret_dc"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "2000" millsecond
#   Then I will see the number of log is "<eventsum>" when search "<splQuery>"
    And I wait for element "splStatsNum" change text to "<eventsum>"

    Examples:
      | eventsum | splQuery|
      | 12    | tag:sample04061424 AND logtype:apache AND (NOT apache.request_query:*) \|dedup appname,apache.request_query  keepempty = true |
  
  @v33spls
  Scenario Outline: 验证事件个数,统计表格行数
    Given I set the parameter "SearchInput" with value "<splQuery>"
    #Given I set the parameter "SearchInput" with value "tag:sample04061424 | where apache.status>400 | stats dc(apache.status) as ret_dc"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "2000" millsecond
#   Then I will see the number of log is "<eventsum>" when search "<splQuery>"
    And I wait for element "splStatsNum" change text to "<splStatsNum>"
    And I wait for element "splEventNum" change text to "<splEventNum>"

    Examples:
      | splEventNum | splStatsNum | splQuery|
      | 12 | 6    | tag:sample04061424 \| stats count() as cnt, max(apache.status) as r_max by apache.clientip \| stats max(cnt) as max_cnt by r_max \| sort by r_max |
      | 12 | 1    | tag:sample04061424 \| where apache.status>400 \| stats dc(apache.status) |

  @v33spl0
  Scenario Outline:样例1
    Given I set the parameter "SearchInput" with value "<splQuery>"
    #Given I set the parameter "SearchInput" with value "tag:sample04061424 | where apache.status>400 | stats dc(apache.status) as ret_dc"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "2000" millsecond
    Then I will see the top "<rowNum>" of "<columnName>" is "<value>" when search "<splQuery>"

    Examples:
      | rowNum | splQuery                                                                        | columnName          | value           |
      | 1      | tag:sample04061424 \| stats count() as cnt, max(apache.status) as r_max by apache.clientip \| stats max(cnt) as max_cnt by r_max \| sort by r_max | r_max,max_cnt  | 502,4 |
      |        | tag:sample04061424 \| where apache.status>400 \| stats dc(apache.status)      | dc(apache.status)   | 4    |

  @v33spl1
  Scenario Outline: 验证统计表格
    When open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I will see the "SearchResult" of "<splQuery>" will between "<range>"
    And I will see "<rowNum>" rows and "<columnNum>" columns of "<splQuery>" in the table
    Then take a screenshot

    Examples:
      | range     | rowNum | columnNum | splQuery  |
      | 23        |        |          | tag:sample04061424 AND (NOT apache.status:200) \| eval status = apache.status \| stats top(status,10)  |
      | 200,300   |        |          | index=yott* ERROR AND tag:sample04061424*                                                                |
      | 72        |        | 2        | index=yott* starttime="-5h/h" endtime="now" tag:sample04061424 \| eval time = formatdate(timestamp, "HH") \| stats avg(apache.status) by time \| join type=left time [[ index=machine* starttime="-1000d" endtime="now" appname:houses  \| eval time = tolong(floor(json.median_house_value)) \| stats avg(json.property_tax_rate) by time]] |
      | 72        | 2      | 3        | tag:sample04061424 \| eval is_resplen_empty=empty(apache.resp_len) \| eval res_str=if(is_resplen_empty,"repslen_empty","resplen_non_null") \| table apache.resp_len, is_resplen_empty, res_str \| where is_resplen_empty==true   |
      | 70        | 70     | 3        | tag:sample04061424 AND apache.resp_len:* \| eval res_mul=apache.resp_len*apache.status*0 - apache.resp_len*apache.status/apache.status%1000 \| eval r_add=apache.resp_len+apache.status*10-apache.resp_len-9*apache.status \| eval res_concat = appname + apache.clientip + apache.geo.city \| table res_mul, r_add, res_concat  |
      | 2         | 2      |          | tag:sample04061424 AND NOT apache.resp_len:* \| eval a = coalesce(apache.resp_len,apache.status) \| eval b = coalesce(apache.status,apache.resp_len) \| table a, b   |

  Scenario Outline: 根据生成的字段值进行判断
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the top "<rowNum>" of "<columnName>" is "<value>" when search "<splQuery>"

    Examples:
      | rowNum | splQuery                                                                                                                                | columnName                      | value |
      | 3      | tag:sample04061424 \| stats count() as cnt, max(apache.status) as r_max_status by apache.clientip \| top 3 r_max_status                 | r_max_status,count,percent      | 200,13,48.148148148148145,404,5,18.51851851851852,500,5,18.51851851851852 |
      |        | tag:sample04061424 \| stats count() by hostname \| lookup user,department /data/rizhiyi/share/host_user.csv on hostname = host          | host,user,department            | 192.168.1.26,syd_test,ete     |
      | 2      | tag:sample04061424\| stats count(apache.clientip) by apache.clientip, apache.method \| limit 2 \| fields apache.clientip apache.method  | apache.clientip,apache.method   | 23.166.125.53,GET,71.221.121.107,GET    |
      | 4      | tag:sample04061424 \| eval len=if(empty(apache.resp_len),0,1) \| stats top(len,10)                                                      | top(len)                        | 1,70,0,2    |


  Scenario Outline: 根据生成的日志条数进行判断
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the number of log is "<num>" when search "<splQuery>"

    Examples:
      | splQuery                                                                                                                       | num |
      | tag:sample04061424 AND logtype:apache AND (NOT apache.request_query:*) \|dedup appname,apache.request_query  keepempty = true  | 17  |
      | tag:sample04061424 AND logtype:apache AND (NOT apache.request_query:*) \| dedup appname,apache.request_query keepempty = false | 17  |
      | tag:sample04061424 \| transaction apache.resp_len \| where _count==4                                                           | 2   |
      | tag:sample04061424 \| transaction apache.resp_len \| where _duration==1                                                        | 4   |
      | tag:sample04061424 \| transaction apache.clientip endswith=eval(apache.status == 200) maxevents=10 contains="Dalvik"           | 4   |
      | tag:sample04061424 AND logtype:apache AND (NOT apache.request_query:*) \|dedup appname,apache.request_query  keepempty = true  | 17  |
      | tag:sample04061424 AND logtype:apache AND (NOT apache.request_query:*) \| dedup appname,apache.request_query keepempty = false | 17  |
      | tag:sample04061424 \| dedup 3 apache.status,appname keepevents = false \|sort by timestamp                                     | 14  |
      | tag:sample04061424\| limit 10                                                                                                  | 10  |
      | tag:sample04061424 \| transaction apache.resp_len \| sort by apache.resp_len                                                   | 29  |


  Scenario Outline: 判断是否排序
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the result order by "<columnName>" when search "<splQuery>"

    Examples:
      | splQuery                                                                                                                                 | columnName                      |
      | tag:sample04061424 \| sort by +apache.status,+apache.resp_len\| table apache.status, apache.resp_len                                     | +apache.status,+apache.resp_len |
      | tag:sample04061424 \| stats count() as cnt, max(apache.status) as r_max by apache.clientip \| top 3 cnt                                  | +cnt                            |
      | tag:sample04061424 \| stats avg(apache.resp_len) as avg_length, count(apache.clientip) as ip_count by apache.status \| sort by ip_count  | -ip                             |
      | index=* starttime="-50h" endtime="now" * \| top 10 appname \| limit 10 \|sort by count                                                   | +count                          |
      | index=* starttime="-50h" endtime="now" * \| stats count() as ct by appname \| limit 10 \| sort by +ct                                    | +ct                             |

#  @all @apl @smoke
  Scenario Outline: 查询无结果
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait element "SearchStatus" change text to "搜索完成!"
    Then I will see the "NoDataInfo" result will be "查询无结果。"

    Examples:
      | splQuery            |
      | no_result0123456789 |
