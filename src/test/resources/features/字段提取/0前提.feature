@configsSmoke
Feature: 字段提取前提条件

  Scenario: 修改log_parser.json_parse_extract_limit和xml_parse_extract_limit为5000,log_parser.switch_delete_timestamp为false
    Given curl update url "module=logriver&key=log_parser.json_parse_extract_limit&value=5000"
    And curl update url "module=logriver&key=log_parser.xml_parse_extract_limit&value=5000"
    And curl update url "module=logriver&key=log_parser.switch_delete_timestamp&value=false"
    And curl restart url "modulename=logriver"
    And curl restart url "modulename=logparserserver"

  Scenario: 新建搜索权限
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    And I click the "Create" button
    And I set the parameter "Name" with value "AutoTest搜索权限"
    And I set the parameter "Tag" with value "*"
    And I click the "Ensure" button

  Scenario: 授权搜索权限
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    When the data name is "{'column':'1','name':'AutoTest搜索权限'}" then i click the "授权" button
    And I wait for "ModalContent" will be visible
    And I "check" the checkbox which name is "__user_AutoTest__" in tiny table
    And I click the "Ensure" button
    Then I wait for "SuccessMessage" will be visible

  Scenario: RZY-2829:设置用户权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "可查看敏感内容"
    Then I click the "SaveButton" button

  Scenario Outline: 上传字典管理文件
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When I click the "UploadButton" button
    And I set the parameter "GroupInput" with value "字典标签"
    And I choose the "字典标签" from the "Group"
    And I upload a file with name "/src/test/resources/testdata/dictionary/<name>"
    And I wait for "FileName" will be visible
    And I click the "EnsureUpload" button
    Then I will see the success message "创建字典成功"
    And I refresh the website
    Then I will see the search result contains "{'column':'0','name':'<name>'}"

    Examples:
      | name         |
      | AutoTest.csv |

  Scenario: 选择标签
    Given open the "configs.ListPage" page for uri "/configs/"
    When the data name is "{'column':'1','name':'RZY3417多值字段'}" then i click the "标签" button
    And I set the parameter "TagInput" with value "自动化测试标签"
    And I choose the "自动化测试标签" from the "Group"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"

  Scenario: 验证资源搜索是否正确
    Given open the "configs.ListPage" page for uri "/configs/"
    And I choose the "自动化测试标签" from the "ResourceDropdown"
    Then I will see the search result contains "{'column':'1','name':'RZY3417多值字段'}"

  Scenario: 取消标签
    Given open the "configs.ListPage" page for uri "/configs/"
    When the data name is "{'column':'1','name':'RZY3417多值字段'}" then i click the "标签" button
    And I cancel selection "自动化测试标签" from the "TagGroup"
    And I click the "Ensure" button
    Then I will see the success message "修改成功"

  Scenario: 验证标签取消成功
    Given open the "configs.ListPage" page for uri "/configs/"
    And I choose the "自动化测试标签" from the "ResourceDropdown"
    Then I will see the search result "{'column':'1','name':'RZY3417多值字段','contains':'no'}"

  Scenario Outline: 1542、1543
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "{"Name": "John Smith ", "Age": 23, "Employed": true, "Address": {"Street": "324 Chrome St", "City": "Portland, New York,Los Angeles ", "Country": "United States"}}"
    And I click the "AddRule" button
    And I choose the "JSON解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "<element>" with value "<path>"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"

    Examples:
      | element   | path | result                                                                                                                                                                                                                                                                                                                                        |
      |           |      | Object\nAddress:Object\nCity:"Portland, New York,Los Angeles "\nCountry:"United States"\nStreet:"324 Chrome St"\nAge:23\nEmployed:true\nName:"John Smith "\nraw_message:"{"Name": "John Smith ", "Age": 23, "Employed": true, "Address": {"Street": "324 Chrome St", "City": "Portland, New York,Los Angeles ", "Country": "United States"}}" |
      | PathInput | Age  | Object\nAge:23\nraw_message:"{"Name": "John Smith ", "Age": 23, "Employed": true, "Address": {"Street": "324 Chrome St", "City": "Portland, New York,Los Angeles ", "Country": "United States"}}"                                                                                                                                             |

  Scenario Outline: RZY-3076:配置里无extract_limit
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<log>"
    And I click the "AddRule" button
    And I choose the "JSON解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"

    Examples:
      | log                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
      | {"name":"用户操作按menuId","application":"www.dz.sdboss.com","type":"PAGE_ACTION","timestamp":"2018-08-09 09:00:55.972+0800","purePathId":"PT\u003d85817305;PA\u003d1069222345;PS\u003d-1350680648","startTime":"2015-09-22 13:41:40.794+0800","dimensions":{"cookie CURRENT_MENUID":"CollectHistory_WEB","cookie Login Cookie":"d110U003","IP":"134.36.139.53"},"measures":{"Server_Contribution":3.562864303588867,"Network_Contribution":0.04063353204625707},"failed":false,"visitId":4323763,"actionName":"click on \"查 询\"","url":"http://www.dz.sdboss.com/custcare/charge/commonbusiness/FeeHistoryQueryTab/FeeHistoryQueryTab.do?act\u003dinitPages\u0026ywjkEnterMenu\u003d123456\u0026currentTabID\u003dCollectHistory_WEB","responseTime":48.3828125,"duration":48.3828125,"execTime":48.3828125,"clientErrors":0} | Object\nactionName:"click on "查 询""\napplication:"www.dz.sdboss.com"\nclientErrors:0\ndimensions:Object\nIP:"134.36.139.53"\ncookie CURRENT_MENUID:"CollectHistory_WEB"\ncookie Login Cookie:"d110U003"\nduration:48.38281\nexecTime:48.38281\nfailed:false\nmeasures:Object\nNetwork_Contribution:0.04063\nServer_Contribution:3.56286\nname:"用户操作按menuId"\npurePathId:"PT=85817305;PA=1069222345;PS=-1350680648"\nresponseTime:48.38281\nstartTime:"2015-09-22 13:41:40.794+0800"\ntimestamp:"2018-08-09 09:00:55.972+0800"\ntype:"PAGE_ACTION"\nurl:"http://www.dz.sdboss.com/custcare/charge/commonbusiness/FeeHistoryQueryTab/FeeHistoryQueryTab.do?act=initPages&ywjkEnterMenu=123456&currentTabID=CollectHistory_WEB"\nvisitId:4323763\nraw_message:"{"name":"用户操作按menuId","application":"www.dz.sdboss.com","type":"PAGE_ACTION","timestamp":"2018-08-09 09:00:55.972+0800","purePathId":"PT\\\u003d85817305;PA\\\u003d1069222345;PS\\\u003d-1350680648","startTime":"2015-09-22 13:41:40.794+0800","dimensions":{"cookie CURRENT_MENUID":"CollectHistory_WEB","cookie Login Cookie":"d110U003","IP":"134.36.139.53"},"measures":{"Server_Contribution":3.562864303588867,"Network_Contribution":0.04063353204625707},"failed":false,"visitId":4323763,"actionName":"click on \\\"查 询\\\"","url":"http://www.dz.sdboss.com/custcare/charge/commonbusiness/FeeHistoryQueryTab/FeeHistoryQueryTab.do?act\\\u003dinitPages\\\u0026ywjkEnterMenu\\\u003d123456\\\u0026currentTabID\\\u003dCollectHistory_WEB","responseTime":48.3828125,"duration":48.3828125,"execTime":48.3828125,"clientErrors":0}" |

  Scenario Outline: RZY-3076、3079
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<log>"
    And I click the "AddRule" button
    And I choose the "<rule>" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"

    Examples:
      | log                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | rule   | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
      | {"name":"用户操作按menuId","application":"www.dz.sdboss.com","type":"PAGE_ACTION","timestamp":"2018-08-09 09:00:55.972+0800","purePathId":"PT\u003d85817305;PA\u003d1069222345;PS\u003d-1350680648","startTime":"2015-09-22 13:41:40.794+0800","dimensions":{"cookie CURRENT_MENUID":"CollectHistory_WEB","cookie Login Cookie":"d110U003","IP":"134.36.139.53"},"measures":{"Server_Contribution":3.562864303588867,"Network_Contribution":0.04063353204625707},"failed":false,"visitId":4323763,"actionName":"click on \"查 询\"","url":"http://www.dz.sdboss.com/custcare/charge/commonbusiness/FeeHistoryQueryTab/FeeHistoryQueryTab.do?act\u003dinitPages\u0026ywjkEnterMenu\u003d123456\u0026currentTabID\u003dCollectHistory_WEB","responseTime":48.3828125,"duration":48.3828125,"execTime":48.3828125,"clientErrors":0}                                                                                                                                                                                                      | JSON解析 | Object\nactionName:"click on "查 询""\napplication:"www.dz.sdboss.com"\nclientErrors:0\ndimensions:Object\nIP:"134.36.139.53"\ncookie CURRENT_MENUID:"CollectHistory_WEB"\ncookie Login Cookie:"d110U003"\nduration:48.38281\nexecTime:48.38281\nfailed:false\nmeasures:Object\nNetwork_Contribution:0.04063\nServer_Contribution:3.56286\nname:"用户操作按menuId"\npurePathId:"PT=85817305;PA=1069222345;PS=-1350680648"\nresponseTime:48.38281\nstartTime:"2015-09-22 13:41:40.794+0800"\ntimestamp:"2018-08-09 09:00:55.972+0800"\ntype:"PAGE_ACTION"\nurl:"http://www.dz.sdboss.com/custcare/charge/commonbusiness/FeeHistoryQueryTab/FeeHistoryQueryTab.do?act=initPages&ywjkEnterMenu=123456&currentTabID=CollectHistory_WEB"\nvisitId:4323763\nraw_message:"{"name":"用户操作按menuId","application":"www.dz.sdboss.com","type":"PAGE_ACTION","timestamp":"2018-08-09 09:00:55.972+0800","purePathId":"PT\\\u003d85817305;PA\\\u003d1069222345;PS\\\u003d-1350680648","startTime":"2015-09-22 13:41:40.794+0800","dimensions":{"cookie CURRENT_MENUID":"CollectHistory_WEB","cookie Login Cookie":"d110U003","IP":"134.36.139.53"},"measures":{"Server_Contribution":3.562864303588867,"Network_Contribution":0.04063353204625707},"failed":false,"visitId":4323763,"actionName":"click on \\\"查 询\\\"","url":"http://www.dz.sdboss.com/custcare/charge/commonbusiness/FeeHistoryQueryTab/FeeHistoryQueryTab.do?act\\\u003dinitPages\\\u0026ywjkEnterMenu\\\u003d123456\\\u0026currentTabID\\\u003dCollectHistory_WEB","responseTime":48.3828125,"duration":48.3828125,"execTime":48.3828125,"clientErrors":0}"                                                                                                                                                                                                                              |
      | <root><name>用户操作按menuId</name><application>www.dz.sdboss.com</application><type>PAGE_ACTION</type><timestamp>2018-08-09 09:00:55.972+0800</timestamp><purePathId>PT=85817305;PA=1069222345;PS=-1350680648</purePathId><startTime>2015-09-22 13:41:40.794+0800</startTime><dimensions><cookie_CURRENT_MENUID>CollectHistory_WEB</cookie_CURRENT_MENUID><cookie_Login_Cookie>d110U003</cookie_Login_Cookie><IP>134.36.139.53</IP></dimensions><measures><Server_Contribution>3.562864303588867</Server_Contribution><Network_Contribution>0.04063353204625707</Network_Contribution></measures><failed>false</failed><visitId>4323763</visitId><actionName>click on &quot;查 询&quot;</actionName><url>http://www.dz.sdboss.com/custcare/charge/commonbusiness/FeeHistoryQueryTab/FeeHistoryQueryTab.do?act=initPages&amp;ywjkEnterMenu=123456&amp;currentTabID=CollectHistory_WEB</url><responseTime>48.3828125</responseTime><duration>48.3828125</duration><execTime>48.3828125</execTime><clientErrors>0</clientErrors></root> | XML解析  | Object\nactionName:"click on "查 询""\napplication:"www.dz.sdboss.com"\nclientErrors:"0"\ndimensions:Object\nIP:"134.36.139.53"\ncookie_CURRENT_MENUID:"CollectHistory_WEB"\ncookie_Login_Cookie:"d110U003"\nduration:"48.3828125"\nexecTime:"48.3828125"\nfailed:"false"\nmeasures:Object\nNetwork_Contribution:"0.04063353204625707"\nServer_Contribution:"3.562864303588867"\nname:"用户操作按menuId"\npurePathId:"PT=85817305;PA=1069222345;PS=-1350680648"\nresponseTime:"48.3828125"\nstartTime:"2015-09-22 13:41:40.794+0800"\ntimestamp:"2018-08-09 09:00:55.972+0800"\ntype:"PAGE_ACTION"\nurl:"http://www.dz.sdboss.com/custcare/charge/commonbusiness/FeeHistoryQueryTab/FeeHistoryQueryTab.do?act=initPages&ywjkEnterMenu=123456&currentTabID=CollectHistory_WEB"\nvisitId:"4323763"\nraw_message:"<root><name>用户操作按menuId</name><application>www.dz.sdboss.com</application><type>PAGE_ACTION</type><timestamp>2018-08-09 09:00:55.972+0800</timestamp><purePathId>PT=85817305;PA=1069222345;PS=-1350680648</purePathId><startTime>2015-09-22 13:41:40.794+0800</startTime><dimensions><cookie_CURRENT_MENUID>CollectHistory_WEB</cookie_CURRENT_MENUID><cookie_Login_Cookie>d110U003</cookie_Login_Cookie><IP>134.36.139.53</IP></dimensions><measures><Server_Contribution>3.562864303588867</Server_Contribution><Network_Contribution>0.04063353204625707</Network_Contribution></measures><failed>false</failed><visitId>4323763</visitId><actionName>click on &quot;查 询&quot;</actionName><url>http://www.dz.sdboss.com/custcare/charge/commonbusiness/FeeHistoryQueryTab/FeeHistoryQueryTab.do?act=initPages&amp;ywjkEnterMenu=123456&amp;currentTabID=CollectHistory_WEB</url><responseTime>48.3828125</responseTime><duration>48.3828125</duration><execTime>48.3828125</execTime><clientErrors>0</clientErrors></root>" |

  Scenario Outline: 1542、1543
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "{"Name": "John Smith ", "Age": 23, "Employed": true, "Address": {"Street": "324 Chrome St", "City": "Portland, New York,Los Angeles ", "Country": "United States"}}"
    And I click the "AddRule" button
    And I choose the "JSON解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "<element>" with value "<path>"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"

    Examples:
      | element   | path | result                                                                                                                                                                                                                                                                                                                                        |
      |           |      | Object\nAddress:Object\nCity:"Portland, New York,Los Angeles "\nCountry:"United States"\nStreet:"324 Chrome St"\nAge:23\nEmployed:true\nName:"John Smith "\nraw_message:"{"Name": "John Smith ", "Age": 23, "Employed": true, "Address": {"Street": "324 Chrome St", "City": "Portland, New York,Los Angeles ", "Country": "United States"}}" |
      | PathInput | Age  | Object\nAge:23\nraw_message:"{"Name": "John Smith ", "Age": 23, "Employed": true, "Address": {"Street": "324 Chrome St", "City": "Portland, New York,Los Angeles ", "Country": "United States"}}"                                                                                                                                             |

  Scenario Outline: XML解析（RZY-1546）
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<root><test><a>1</a><a>2</a></test><test>3</test></root>"
    And I click the "AddRule" button
    And I choose the "XML解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"

    Examples:
      | result                                                                                                                                        |
      | Object\ntest:Array[1]\n0:"3"\ntest[]:Object\na:Array[2]\n0:"1"\n1:"2"\nraw_message:"<root><test><a>1</a><a>2</a></test><test>3</test></root>" |

  Scenario: RZY-2824：最大匹配长度（步骤1）
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""
    And I click the "AddRule" button
    And I choose the "时间戳识别" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "TimeFormat" with value "dd/MMM/yyyy:HH:mm:ss Z"
    And I set the parameter "TimestampPrefix" with value "\["
    And I set the parameter "MaxMatchLength" with value "44"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    Then I will see the error message contains "解析失败"

  Scenario: 修改manager中logriver配置log_parser.json_parse_extract_limit为10
    Given curl update url "module=logriver&key=log_parser.json_parse_extract_limit&value=10"
    Given curl update url "module=logriver&key=log_parser.xml_parse_extract_limit&value=10"
    And curl restart url "modulename=logriver"
    And curl restart url "modulename=logparserserver"