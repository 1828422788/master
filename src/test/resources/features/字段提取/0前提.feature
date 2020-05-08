@configsSmoke
Feature: 字段提取前提条件

  Scenario: 确认log_parser.json_parse_extract_limit和xml_parse_extract_limit为5000,log_parser.switch_delete_timestamp为false
    Given curl update url "module=logriver&key=log_parser.json_parse_extract_limit&value=5000"
    And curl update url "module=logriver&key=log_parser.xml_parse_extract_limit&value=5000"
    And curl update url "module=logriver&key=log_parser.switch_delete_timestamp&value=false"
    And curl restart url "modulename=logriver"
    And curl restart url "modulename=logparserserver"
    Then I wait for "60000" millsecond

  Scenario: 新建搜索权限
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    Then I wait for loading invisible
    And I click the "Create" button
    And I set the parameter "Name" with value "AutoTest搜索权限"
    And I set the parameter "Tag" with value "*"
    And I click the "Ensure" button
    Then I will see the success message "操作成功"
    Then I refresh the website
    Then I wait for loading invisible
    When the data name is "{'column':'0','name':'AutoTest搜索权限'}" then i click the "删除" button
    And I click the "Ensure" button
    Then I wait for "1000" millsecond
    Then I will see the success message "删除成功"


  Scenario: 授权搜索权限
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    Then I wait for loading invisible
    And I click the "Create" button
    And I set the parameter "Name" with value "AutoTest搜索权限"
    And I set the parameter "Tag" with value "*"
    And I click the "Ensure" button
    Then I will see the success message "操作成功"
    Then I refresh the website
    Then I wait for loading invisible
    When the data name is "{'column':'0','name':'AutoTest搜索权限'}" then i click the "授权" button
    And I wait for "ModalContent" will be visible
    And I "check" the checkbox which name is "wym" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"

  Scenario: RZY-2829:设置用户权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_wym__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I wait for loading invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "可查看敏感内容"
    Then I click the "SaveButton" button

#  Scenario: 设置索引配置
#    Given open the "roles.ListPage" page for uri "/account/roles/"
#    And the data name is "__user_wym__" then i click the "授权" button
#    And I will see the "roles.AuthorizationPage" page
#    Then I wait for "2000" millsecond
#    Then I click the "{'TabButton':'索引配置'}" button
#    And I wait for "Loading" will be invisible
#    And I "checked" the label before "yotta"
#    Then I click the "SaveButton" button


  Scenario Outline: 1542、1543
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "{"Name": "John Smith ", "Age": 23, "Employed": true, "Address": {"Street": "324 Chrome St", "City": "Portland, New York,Los Angeles ", "Country": "United States"}}"
    And I click the "AddRule" button
    Then I wait for "1000" millsecond
    And I choose the "JSON解析" from the "ParseRule" in config
    Then I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "1000" millsecond
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


  Scenario Outline: RZY-3076、3079：无extract_limit，manager配置为5000
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<log>"
    And I click the "AddRule" button
    And I choose the "<rule>" from the "ParseRule" in config
    Then I wait for "2000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "2000" millsecond
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"

    Examples:
      | log                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | rule   | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
      | {"name":"用户操作按menuId","application":"www.dz.sdboss.com","type":"PAGE_ACTION","timestamp":"2018-08-09 09:00:55.972+0800","purePathId":"PT\u003d85817305;PA\u003d1069222345;PS\u003d-1350680648","startTime":"2015-09-22 13:41:40.794+0800","dimensions":{"cookie CURRENT_MENUID":"CollectHistory_WEB","cookie Login Cookie":"d110U003","IP":"134.36.139.53"},"measures":{"Server_Contribution":3.562864303588867,"Network_Contribution":0.04063353204625707},"failed":false,"visitId":4323763,"actionName":"click on \"查 询\"","url":"http://www.dz.sdboss.com/custcare/charge/commonbusiness/FeeHistoryQueryTab/FeeHistoryQueryTab.do?act\u003dinitPages\u0026ywjkEnterMenu\u003d123456\u0026currentTabID\u003dCollectHistory_WEB","responseTime":48.3828125,"duration":48.3828125,"execTime":48.3828125,"clientErrors":0}                                                                                                                                                                                                      | JSON解析 | Object\nactionName:"click on "查 询""\napplication:"www.dz.sdboss.com"\nclientErrors:0\ndimensions:Object\nIP:"134.36.139.53"\ncookie CURRENT_MENUID:"CollectHistory_WEB"\ncookie Login Cookie:"d110U003"\nduration:48.38281\nexecTime:48.38281\nfailed:false\nmeasures:Object\nNetwork_Contribution:0.04063\nServer_Contribution:3.56286\nname:"用户操作按menuId"\npurePathId:"PT=85817305;PA=1069222345;PS=-1350680648"\nresponseTime:48.38281\nstartTime:"2015-09-22 13:41:40.794+0800"\ntimestamp:"2018-08-09 09:00:55.972+0800"\ntype:"PAGE_ACTION"\nurl:"http://www.dz.sdboss.com/custcare/charge/commonbusiness/FeeHistoryQueryTab/FeeHistoryQueryTab.do?act=initPages&ywjkEnterMenu=123456&currentTabID=CollectHistory_WEB"\nvisitId:4323763\nraw_message:"{"name":"用户操作按menuId","application":"www.dz.sdboss.com","type":"PAGE_ACTION","timestamp":"2018-08-09 09:00:55.972+0800","purePathId":"PT\\\u003d85817305;PA\\\u003d1069222345;PS\\\u003d-1350680648","startTime":"2015-09-22 13:41:40.794+0800","dimensions":{"cookie CURRENT_MENUID":"CollectHistory_WEB","cookie Login Cookie":"d110U003","IP":"134.36.139.53"},"measures":{"Server_Contribution":3.562864303588867,"Network_Contribution":0.04063353204625707},"failed":false,"visitId":4323763,"actionName":"click on \\\"查 询\\\"","url":"http://www.dz.sdboss.com/custcare/charge/commonbusiness/FeeHistoryQueryTab/FeeHistoryQueryTab.do?act\\\u003dinitPages\\\u0026ywjkEnterMenu\\\u003d123456\\\u0026currentTabID\\\u003dCollectHistory_WEB","responseTime":48.3828125,"duration":48.3828125,"execTime":48.3828125,"clientErrors":0}"                                                                                                                                                                                                                              |
      | <root><name>用户操作按menuId</name><application>www.dz.sdboss.com</application><type>PAGE_ACTION</type><timestamp>2018-08-09 09:00:55.972+0800</timestamp><purePathId>PT=85817305;PA=1069222345;PS=-1350680648</purePathId><startTime>2015-09-22 13:41:40.794+0800</startTime><dimensions><cookie_CURRENT_MENUID>CollectHistory_WEB</cookie_CURRENT_MENUID><cookie_Login_Cookie>d110U003</cookie_Login_Cookie><IP>134.36.139.53</IP></dimensions><measures><Server_Contribution>3.562864303588867</Server_Contribution><Network_Contribution>0.04063353204625707</Network_Contribution></measures><failed>false</failed><visitId>4323763</visitId><actionName>click on &quot;查 询&quot;</actionName><url>http://www.dz.sdboss.com/custcare/charge/commonbusiness/FeeHistoryQueryTab/FeeHistoryQueryTab.do?act=initPages&amp;ywjkEnterMenu=123456&amp;currentTabID=CollectHistory_WEB</url><responseTime>48.3828125</responseTime><duration>48.3828125</duration><execTime>48.3828125</execTime><clientErrors>0</clientErrors></root> | XML解析  | Object\nactionName:"click on "查 询""\napplication:"www.dz.sdboss.com"\nclientErrors:"0"\ndimensions:Object\nIP:"134.36.139.53"\ncookie_CURRENT_MENUID:"CollectHistory_WEB"\ncookie_Login_Cookie:"d110U003"\nduration:"48.3828125"\nexecTime:"48.3828125"\nfailed:"false"\nmeasures:Object\nNetwork_Contribution:"0.04063353204625707"\nServer_Contribution:"3.562864303588867"\nname:"用户操作按menuId"\npurePathId:"PT=85817305;PA=1069222345;PS=-1350680648"\nresponseTime:"48.3828125"\nstartTime:"2015-09-22 13:41:40.794+0800"\ntimestamp:"2018-08-09 09:00:55.972+0800"\ntype:"PAGE_ACTION"\nurl:"http://www.dz.sdboss.com/custcare/charge/commonbusiness/FeeHistoryQueryTab/FeeHistoryQueryTab.do?act=initPages&ywjkEnterMenu=123456&currentTabID=CollectHistory_WEB"\nvisitId:"4323763"\nraw_message:"<root><name>用户操作按menuId</name><application>www.dz.sdboss.com</application><type>PAGE_ACTION</type><timestamp>2018-08-09 09:00:55.972+0800</timestamp><purePathId>PT=85817305;PA=1069222345;PS=-1350680648</purePathId><startTime>2015-09-22 13:41:40.794+0800</startTime><dimensions><cookie_CURRENT_MENUID>CollectHistory_WEB</cookie_CURRENT_MENUID><cookie_Login_Cookie>d110U003</cookie_Login_Cookie><IP>134.36.139.53</IP></dimensions><measures><Server_Contribution>3.562864303588867</Server_Contribution><Network_Contribution>0.04063353204625707</Network_Contribution></measures><failed>false</failed><visitId>4323763</visitId><actionName>click on &quot;查 询&quot;</actionName><url>http://www.dz.sdboss.com/custcare/charge/commonbusiness/FeeHistoryQueryTab/FeeHistoryQueryTab.do?act=initPages&amp;ywjkEnterMenu=123456&amp;currentTabID=CollectHistory_WEB</url><responseTime>48.3828125</responseTime><duration>48.3828125</duration><execTime>48.3828125</execTime><clientErrors>0</clientErrors></root>" |


  Scenario Outline: XML解析（RZY-1546）
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<root><test><a>1</a><a>2</a></test><test>3</test></root>"
    And I click the "AddRule" button
    And I choose the "XML解析" from the "ParseRule" in config
    And I choose the "raw_message" from the "SourceField" in config
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"

    Examples:
      | result                                                                                                                                        |
      | Object\ntest:Array[1]\n0:"3"\ntest[]:Object\na:Array[2]\n0:"1"\n1:"2"\nraw_message:"<root><test><a>1</a><a>2</a></test><test>3</test></root>" |


  Scenario: 修改manager中logriver配置log_parser.json_parse_extract_limit为10
    Given curl update url "module=logriver&key=log_parser.json_parse_extract_limit&value=10"
    Given curl update url "module=logriver&key=log_parser.xml_parse_extract_limit&value=10"
    And curl restart url "modulename=logriver"
    And curl restart url "modulename=logparserserver"
    Then I wait for "60000" millsecond