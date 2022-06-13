@dashboardChart
Feature: 仪表盘_0_新建仪表盘和趋势图

  Scenario Outline: 上传日志
    Given open the "localUpload.ListPage" page for uri "/sources/input/os/"
    When I set the parameter "AppName" with value "<tag>"
    And I set the parameter "Tag" with value "<tag>"
    And I upload a file with name "/src/test/resources/testdata/log/<tag>.txt"
    And I click the "UploadButton" button
    And I wait for "VerifyText" will be visible
    And I will see the element "VerifyText" contains "上传完成"
    And I wait for "5000" millsecond

    Examples:
      | tag      |
      | geostats |
      | zipkin   |

  Scenario Outline: 新建趋势图
    And open the "trend.ListPage" page for uri "/trend/"
    And I wait for loading invisible
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for loading invisible
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "仪表盘<name>"
    And I click the "Complete" button
    And I wait for "SuccessCreate" will be visible

    @dashboardChartSmoke
    Examples:
      | name       | spl |
      | 曲线图     | tag:sample04061424_display \| stats count() by apache.clientip,apache.resp_len |
      | 饼状图     | tag:sample04061424_display \| stats count() by apache.clientip,apache.resp_len \| limit 10 |
      | 表格       | tag:sample04061424_chart \|stats count() by 'apache.geo.city'|
      | 单值       | tag:sample04061424_display \| stats avg(apache.status) as a_\|eval icon=if(a_>300,\"thumbs-down\",\"thumbs-up\")|

    Examples:
      | name       | spl |
      | 面积图     | tag:sample04061424_display \| bucket timestamp span=30m as ts \| stats count() as cnt by apache.status,ts \| sort by cnt \| limit 20 |
      | 散点图     | tag:sample04061424_display \| stats count() by apache.clientip,apache.resp_len \| limit 10                 |
      | 柱状图     | tag:sample04061424_display \| stats count() by apache.clientip,apache.resp_len  |
      | 玫瑰图     | tag:sample04061424_display \| stats count() by apache.clientip,apache.resp_len \| limit 10 |
      | 条形图     | tag:sample04061424_display \| stats count() by apache.clientip,apache.resp_len \| limit 10 |
      | 旭日图     | tag:sample04061424_display \| stats count() by apache.clientip,apache.resp_len \| limit 10 |
      | 火焰图     | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart AND (apache.status:200) AND NOT (apache.geo.city:黔东南苗族侗族自治州) AND NOT (apache.geo.city:南京市)   \| stats count() as cnt by apache.method, apache.status, apache.geo.province, apache.geo.city \| sort by apache.method, apache.status, apache.geo.province, apache.geo.city |
      | 和弦图     | tag:sample04061424_display \| stats count() by apache.clientip,apache.x_forward,apache.resp_len,apache.method \| rename apache.clientip as apache.x_forward_group\| rename apache.method as apache.resp_len_group\| limit 20|
      | 桑基图     | tag:sample04061424_display \| stats count() by apache.clientip,apache.x_forward,apache.resp_len,apache.method \| rename apache.clientip as apache.x_forward_group\| rename apache.method as apache.resp_len_group\| limit 20 \| sort by +apache.x_forward |
      | 力图       | tag:*display \| stats count() by apache.clientip,apache.x_forward,apache.resp_len,apache.method \| rename apache.clientip as apache.x_forward_group\| rename apache.method as apache.resp_len_group\| limit 20               |
      | 区间图     | tag:sample04061424_display \| bucket timestamp span=1h as ts \| stats count('apache.status') as 'count' by ts \| esma count timefield=ts                                                             |
      | 多Y轴图    | tag:sample04061424_display \| stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status \| limit 10|
      | 热力地图   | appname:apache \| stats count() by apache.geo.city                                                                                                                                  |
      | 攻击地图   | tag:sample04061424_chart \| parse field=apache.request_query \"^gw_address=(?<gw_address>\\\d+\\\.\\\d+\\\.\\\d+\\\.\\\d+)\" \| stats count() as cnt, min(apache.geo.latitude) as client_lat, min(apache.geo.longitude) as client_lon by apache.clientip, gw_address \| eval gw_lat=39.5427 \| eval gw_lon=116.2317 |
      | 区划地图   | tag:sample04061424 \| stats count() by apache.geo.country,apache.geo.province,apache.geo.city |
      | 统计地图   | appname:geostats \| parse \"^(?<raw>.*)$\" \| eval array=split(raw, \",\") \| eval lon=todouble(mvindex(array, 3)) \| eval lat=todouble(mvindex(array, 4)) \| eval cnt=tolong(mvindex(array, 2)) \| eval group=mvindex(array, 7) \| geostats latfield=lat longfield=lon count() by group |
      | 环形比例图 | appname:huawei \| stats count() as num \| eval p = num/28000                 |
      | 水球图     | tag:sample04061424_display \| stats count() by apache.clientip \| limit 10 |
      | 字符云图   | tag:sample04061424_display \| stats count() by apache.clientip, apache.resp_len \| limit 10|
      | 循序图     | tag:sample04061424_chart \|sort by +apache.clientip\| stats count() by hostname,apache.clientip \|limit 5  |
      | 雷达图     | tag:sample04061424_display \| stats count() by apache.clientip,apache.status \| limit 10 |
      | 漏斗图     | tag:sample04061424_display \| stats count() by apache.clientip \| limit 8 |
      | 矩阵热力图 | tag:sample04061424_display \| stats count() by apache.clientip \| limit 8 |
      | 调用链     | appname:zipkin \| parse \"^(?<datetime>\\\d{4}\/\\\d\\\d\/\\\d\\\d \\\d\\\d:\\\d\\\d:\\\d\\\d.\\\d{3})\\\s\\\[(?<threadname>\\\S+)\\\]\\\s(?<level>\\\S+)\\\s+(?<functionname>\\\S+)\\\s\\\S+\\\s\\\S+\\\s(?<jsonstring>.*)\" \| jpath input=jsonstring output=traceid path=\"traceId\" \| jpath input=jsonstring output=spanid path=\"id\" \| jpath input=jsonstring output=parentid path=\"parentId\" \| jpath input=jsonstring output=binnaryannotations path=\"binaryAnnotations[*].value\" \| jpath input=jsonstring output=duration path=\"duration\" \| jpath input=jsonstring output=modulename path=\"name\" \| where mvindex(duration, 0)>0 && mvindex(traceid,0)==\"511f8756ce1d0b8a\" \| jpath input=jsonstring output=timestamp path=\"timestamp\" \| table spanid, parentid, duration, timestamp, binnaryannotations, modulename |
      | 网络节点图 | tag:sample04061424_chart \| stats count() as cnt by apache.method, apache.geo.province, apache.geo.city \| sort by +apache.geo.province, cnt, apache.go.city \| limit 10 |


  Scenario Outline: 新建仪表盘，添加第一个标签页，添加图表
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the "Create" button
    When I set the parameter "DashBoardName" with value "仪表盘<name>"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"
    And I wait for "SuccessMessage" will be invisible
    And I click the detail which name is "仪表盘<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "<name>"
    And I click the "Ensure" button
    And I wait for loading invisible
    And I click the "SettingIcon" button
    And I switch the dashboard "OpenEdit" button to "enable"
    And I click the "SettingIcon" button
    And I wait for "SuccessMessage" will be invisible
    And I choose the "添加图表" from the "AddItemMenu"
    And I wait for loading invisible
    And I set the parameter "SearchChartInput" with value "仪表盘<name>"
    And I wait for loading invisible
    And I click the "{'Checkbox':'仪表盘<name>'}" button
    And I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "添加成功"

    @dashboardChartSmoke
    Examples:
      | name      |
      | 曲线图    |
      | 饼状图    |
      | 表格      |
      | 单值      |

    Examples:
      | name      |
      | 面积图    |
      | 散点图    |
      | 柱状图    |
      | 玫瑰图    |
      | 条形图    |
      | 旭日图    |
      | 火焰图    |
      | 和弦图    |
      | 桑基图    |
      | 力图      |
      | 区间图    |
      | 多Y轴图   |
      | 热力地图  |
      | 攻击地图  |
      | 区划地图  |
      | 统计地图  |
      | 环形比例图|
      | 水球图    |
      | 字符云图  |
      | 循序图    |
      | 雷达图    |
      | 漏斗图    |
      | 矩阵热力图|
      | 调用链    |
      | 网络节点图|