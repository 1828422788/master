Feature: 报表所需趋势图新建

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page

  Scenario Outline: 趋势图sample0
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
#    Then I will see "<rowNum>" rows and "<columnNum>" columns in the table
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I click the "Save" button
    Then I will see the success message "创建成功"

  @second
    Examples:
      | name         | spl                                                                                                                                                                                                                                                                                           | rowNum | columnNum |
      | 饼状图sample0   | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10                                                                                                                                                                                                                  | 10     | 3         |
      | 多Y轴sample0   | tag:*display \| stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status \| limit 10                                                                                                               | 5      | 7         |
      | 热力地图sample0  | tag:sample04061424 \| stats count() by apache.geo.city                                                                                                                                                                                                                                        |        | 2         |
      | 攻击地图sample0  | tag:sample04061424 \| parse field=apache.request_query "^gw_address=(?<gw_address>\d+\.\d+\.\d+\.\d+)" \| stats count() as cnt, min(apache.geo.latitude) as client_lat, min(apache.geo.longitude) as client_lon by apache.clientip, gw_address \| eval gw_lat=39.5427 \| eval gw_lon=116.2317 |        | 7         |
      | 区划地图sample0  | tag:sample04061424 \| stats count() by apache.geo.country,apache.geo.province,apache.geo.city                                                                                                                                                                                                 |        | 4         |
      | 单值sample0    | tag:*display \| stats avg(apache.status) as a_\|eval icon=if(a_>300,"thumbs-down","thumbs-up")                                                                                                                                                                                                | 1      | 2         |
      | 水球图sample0   | tag:*display \| stats count() by apache.clientip \| limit 10                                                                                                                                                                                                                                  | 10     | 2         |
      | 字符云图sample0  | tag:*display \| stats count() by apache.clientip \| limit 10                                                                                                                                                                                                                                  | 10     | 2         |
      | 循序图sample0   | tag:seq_test \| table timestamp,sequence.from,sequence.to,sequence.relatemsg,sequence.msgid                                                                                                                                                                                                   | 10     | 5         |
      | 漏斗图sample0   | tag:*display \| stats count() by apache.clientip \| limit 8                                                                                                                                                                                                                                   | 8      | 2         |
      | 矩阵热力图sample0 | tag:*display \| stats count() by apache.clientip \| limit 8                                                                                                                                                                                                                                   | 8      | 2         |
      | 玫瑰图sample0   | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10                                                                                                                                                                                                                  |        |           |
      | 条形图sample0   | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10                                                                                                                                                                                                                  | 10     | 3         |
      | 旭日图sample0   | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10                                                                                                                                                                                                                  |        |           |
      | 调用链sample0   | tag:gf_dapper* AND dapper.msg.traceId:"511f8756ce1d0b8a" dapper.msg.duration:>0 \| table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp,dapper.msg.binaryAnnotations[].value, collector_recv_timestamp                                           |        |           |

  @all @smoke @reportSmoke @report
    Examples:
      | name       | spl                                                                                                                                                                                                            | rowNum | columnNum |
      | 面积图sample0 | tag:*display \| bucket timestamp span = 30m as ts \| stats count()  as cnt by apache.status,ts \|sort by cnt \| limit 20                                                                                       | 20     | 3         |
      | 柱状图sample0 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10                                                                                                                                   | 10     | 3         |
      | 和弦图sample0 | tag:*display \| stats count() by apache.clientip,apache.x_forward,apache.resp_len,apache.method \| rename apache.clientip as apache.x_forward_group\| rename apache.method as apache.resp_len_group\| limit 20 | 20     | 5         |
      | 桑基图sample0 | tag:*display \| stats count() by apache.clientip,apache.x_forward,apache.resp_len,apache.method \| rename apache.clientip as apache.x_forward_group\| rename apache.method as apache.resp_len_group\| limit 20 | 20     | 5         |
      | 力图sample0  | tag:*display \| stats count() by apache.clientip,apache.x_forward,apache.resp_len,apache.method \| rename apache.clientip as apache.x_forward_group\| rename apache.method as apache.resp_len_group\| limit 20 | 20     | 5         |
      | 区间图sample0 | tag:*display \| bucket timestamp span=1h as ts \| stats count('apache.status') as 'count' by ts \| esma count timefield=ts                                                                                     |        | 5         |

  @first
    Examples:
      | name       | spl                                                                          | rowNum | columnNum |
      | 曲线图sample0 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10 | 10     | 3         |
      | 散点图sample0 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10 | 10     | 3         |
      | 雷达图sample0 | tag:*display \| stats count() by apache.clientip,apache.status \| limit 10   | 10     | 3         |
