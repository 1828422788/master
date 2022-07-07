@configs @configsJsonXml
Feature: 字段提取Json、xml解析

  Scenario: 修改manager中logriver配置log_parser.json_parse_extract_limit为10
    Given curl update url "module=logriver&key=log_parser.json_parse_extract_limit&value=10"
    Given curl update url "module=logriver&key=log_parser.xml_parse_extract_limit&value=10"
    And curl restart url "modulename=logriver"


  Scenario Outline: RZY-3076：无extract_limit，manager配置为10
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<log>"
    And I click the "AddRule" button
    And I choose the "<rule>" from the "ParseRule"
    Then I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField"
    Then I wait for "1000" millsecond
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    And I will see the field extraction result "<result>"

    Examples:
      | log                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | rule   | result                               |
      | {"name":"用户操作按menuId","application":"www.dz.sdboss.com","type":"PAGE_ACTION","timestamp":"2018-08-09 09:00:55.972+0800","purePathId":"PT\\u003d85817305;PA\\u003d1069222345;PS\\u003d-1350680648","startTime":"2015-09-22 13:41:40.794+0800","dimensions":{"cookie CURRENT_MENUID":"CollectHistory_WEB","cookie Login Cookie":"d110U003","IP":"134.36.139.53"},"measures":{"Server_Contribution":3.562864303588867,"Network_Contribution":0.04063353204625707},"failed":false,"visitId":4323763,"actionName":"click on \\"查 询\\"","url":"http://www.dz.sdboss.com/custcare/charge/commonbusiness/FeeHistoryQueryTab/FeeHistoryQueryTab.do?act\\u003dinitPages\\u0026ywjkEnterMenu\\u003d123456\\u0026currentTabID\\u003dCollectHistory_WEB","responseTime":48.3828125,"duration":48.3828125,"execTime":48.3828125,"clientErrors":0}                                                                                                                                                                                                      | JSON解析 | {'name':'用户操作按menuId'}          |


  Scenario Outline: RZY-3079：无extract_limit，manager配置为10
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<log>"
    And I click the "AddRule" button
    And I choose the "<rule>" from the "ParseRule"
    Then I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField"
    Then I wait for "1000" millsecond
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the field extraction result "{'name':'用户操作按menuId','raw_message':'<log>'}"

    Examples:
      | log                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | rule   |
      | <root><name>用户操作按menuId</name><application>www.dz.sdboss.com</application><type>PAGE_ACTION</type><timestamp>2018-08-09 09:00:55.972+0800</timestamp><purePathId>PT=85817305;PA=1069222345;PS=-1350680648</purePathId><startTime>2015-09-22 13:41:40.794+0800</startTime><dimensions><cookie_CURRENT_MENUID>CollectHistory_WEB</cookie_CURRENT_MENUID><cookie_Login_Cookie>d110U003</cookie_Login_Cookie><IP>134.36.139.53</IP></dimensions><measures><Server_Contribution>3.562864303588867</Server_Contribution><Network_Contribution>0.04063353204625707</Network_Contribution></measures><failed>false</failed><visitId>4323763</visitId><actionName>click on &quot;查 询&quot;</actionName><url>http://www.dz.sdboss.com/custcare/charge/commonbusiness/FeeHistoryQueryTab/FeeHistoryQueryTab.do?act=initPages&amp;ywjkEnterMenu=123456&amp;currentTabID=CollectHistory_WEB</url><responseTime>48.3828125</responseTime><duration>48.3828125</duration><execTime>48.3828125</execTime><clientErrors>0</clientErrors></root> | XML解析  |


  Scenario Outline: RZY-3077、3079：有extract_limit且设置为200
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<log>"
    And I click the "AddRule" button
    And I choose the "<rule>" from the "ParseRule"
    And I click the "ChangeToJson" button
    And I set the parameter "{"source": "raw_message","paths": [],"add_fields": [],"extract_limit" :200}" to json editor in field parsing
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    And I will see the field extraction result "<result>"

    Examples:
      | log                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | rule   | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
      | {"name":"用户操作按menuId","application":"www.dz.sdboss.com","type":"PAGE_ACTION","timestamp":"2018-08-09 09:00:55.972+0800","purePathId":"PT\u003d85817305;PA\u003d1069222345;PS\u003d-1350680648","startTime":"2015-09-22 13:41:40.794+0800","dimensions":{"cookie CURRENT_MENUID":"CollectHistory_WEB","cookie Login Cookie":"d110U003","IP":"134.36.139.53"},"measures":{"Server_Contribution":3.562864303588867,"Network_Contribution":0.04063353204625707},"failed":false,"visitId":4323763,"actionName":"click on \"查 询\"","url":"http://www.dz.sdboss.com/custcare/charge/commonbusiness/FeeHistoryQueryTab/FeeHistoryQueryTab.do?act\u003dinitPages\u0026ywjkEnterMenu\u003d123456\u0026currentTabID\u003dCollectHistory_WEB","responseTime":48.3828125,"duration":48.3828125,"execTime":48.3828125,"clientErrors":0}                                                                                                                                                                                                      | JSON解析 | {'application':'www.dz.sdboss.com','name':'用户操作按menuId','purePathId':'PT=85817305;PA=1069222345;PS=-1350680648','startTime':'2015-09-22 13:41:40.794+0800','type':'PAGE_ACTION','timestamp':'2018-08-09 09:00:55.972+0800'}  |
      | <root><name>用户操作按menuId</name><application>www.dz.sdboss.com</application><type>PAGE_ACTION</type><timestamp>2018-08-09 09:00:55.972+0800</timestamp><purePathId>PT=85817305;PA=1069222345;PS=-1350680648</purePathId><startTime>2015-09-22 13:41:40.794+0800</startTime><dimensions><cookie_CURRENT_MENUID>CollectHistory_WEB</cookie_CURRENT_MENUID><cookie_Login_Cookie>d110U003</cookie_Login_Cookie><IP>134.36.139.53</IP></dimensions><measures><Server_Contribution>3.562864303588867</Server_Contribution><Network_Contribution>0.04063353204625707</Network_Contribution></measures><failed>false</failed><visitId>4323763</visitId><actionName>click on &quot;查 询&quot;</actionName><url>http://www.dz.sdboss.com/custcare/charge/commonbusiness/FeeHistoryQueryTab/FeeHistoryQueryTab.do?act=initPages&amp;ywjkEnterMenu=123456&amp;currentTabID=CollectHistory_WEB</url><responseTime>48.3828125</responseTime><duration>48.3828125</duration><execTime>48.3828125</execTime><clientErrors>0</clientErrors></root> | XML解析  | {'application':'www.dz.sdboss.com','name':'用户操作按menuId','type':'PAGE_ACTION','timestamp':'2018-08-09 09:00:55.972+0800'} |


  Scenario Outline: RZY-3077、3079：有extract_limit且设置为0
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<log>"
    And I click the "AddRule" button
    And I choose the "<rule>" from the "ParseRule"
    And I click the "ChangeToJson" button
    And I set the parameter "{"source": "raw_message","paths": [],"add_fields": [],"extract_limit" :0}" to json editor in field parsing
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    And I will see the field extraction result "<result>"

    Examples:
      | log                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | rule   | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
      | {"name":"用户操作按menuId","application":"www.dz.sdboss.com","type":"PAGE_ACTION","timestamp":"2018-08-09 09:00:55.972+0800","purePathId":"PT\u003d85817305;PA\u003d1069222345;PS\u003d-1350680648","startTime":"2015-09-22 13:41:40.794+0800","dimensions":{"cookie CURRENT_MENUID":"CollectHistory_WEB","cookie Login Cookie":"d110U003","IP":"134.36.139.53"},"measures":{"Server_Contribution":3.562864303588867,"Network_Contribution":0.04063353204625707},"failed":false,"visitId":4323763,"actionName":"click on \"查 询\"","url":"http://www.dz.sdboss.com/custcare/charge/commonbusiness/FeeHistoryQueryTab/FeeHistoryQueryTab.do?act\u003dinitPages\u0026ywjkEnterMenu\u003d123456\u0026currentTabID\u003dCollectHistory_WEB","responseTime":48.3828125,"duration":48.3828125,"execTime":48.3828125,"clientErrors":0}                                                                                                                                                                                                      | JSON解析 | {'actionName':'click on "查 询"','application':'www.dz.sdboss.com','clientErrors':'0','dimensions.IP':'134.36.139.53','dimensions.cookie CURRENT_MENUID':'CollectHistory_WEB','dimensions.cookie Login Cookie':'d110U003','duration':'48.38281','execTime':'48.38281','failed':'false','measures.Network_Contribution':'0.04063','measures.Server_Contribution':'3.56286','name':'用户操作按menuId','purePathId':'PT=85817305;PA=1069222345;PS=-1350680648','responseTime':'48.38281','startTime':'2015-09-22 13:41:40.794+0800','type':'PAGE_ACTION','url':'http://www.dz.sdboss.com/custcare/charge/commonbusiness/FeeHistoryQueryTab/FeeHistoryQueryTab.do?act=initPages&ywjkEnterMenu=123456&currentTabID=CollectHistory_WEB','visitId':'4323763','timestamp':'2018-08-09 09:00:55.972+0800'}|
      | <root><name>用户操作按menuId</name><application>www.dz.sdboss.com</application><type>PAGE_ACTION</type><timestamp>2018-08-09 09:00:55.972+0800</timestamp><purePathId>PT=85817305;PA=1069222345;PS=-1350680648</purePathId><startTime>2015-09-22 13:41:40.794+0800</startTime><dimensions><cookie_CURRENT_MENUID>CollectHistory_WEB</cookie_CURRENT_MENUID><cookie_Login_Cookie>d110U003</cookie_Login_Cookie><IP>134.36.139.53</IP></dimensions><measures><Server_Contribution>3.562864303588867</Server_Contribution><Network_Contribution>0.04063353204625707</Network_Contribution></measures><failed>false</failed><visitId>4323763</visitId><actionName>click on &quot;查 询&quot;</actionName><url>http://www.dz.sdboss.com/custcare/charge/commonbusiness/FeeHistoryQueryTab/FeeHistoryQueryTab.do?act=initPages&amp;ywjkEnterMenu=123456&amp;currentTabID=CollectHistory_WEB</url><responseTime>48.3828125</responseTime><duration>48.3828125</duration><execTime>48.3828125</execTime><clientErrors>0</clientErrors></root> | XML解析  | {'actionName':'click on "查 询"','application':'www.dz.sdboss.com','clientErrors':'0','dimensions.IP':'134.36.139.53','dimensions.cookie_CURRENT_MENUID':'CollectHistory_WEB','dimensions.cookie_Login_Cookie':'d110U003','duration':'48.3828125','execTime':'48.3828125','failed':'false','measures.Network_Contribution':'0.04063353204625707','measures.Server_Contribution':'3.562864303588867','name':'用户操作按menuId','purePathId':'PT=85817305;PA=1069222345;PS=-1350680648','responseTime':'48.3828125','startTime':'2015-09-22 13:41:40.794+0800','type':'PAGE_ACTION','url':'http://www.dz.sdboss.com/custcare/charge/commonbusiness/FeeHistoryQueryTab/FeeHistoryQueryTab.do?act=initPages&ywjkEnterMenu=123456&currentTabID=CollectHistory_WEB','visitId':'4323763','timestamp':'2018-08-09 09:00:55.972+0800'} |


  Scenario Outline: RZY-3077、3079：有extract_limit且设置为-1
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<log>"
    And I click the "AddRule" button
    And I choose the "<rule>" from the "ParseRule"
    And I click the "ChangeToJson" button
    And I set the parameter "{"source": "raw_message","paths": [],"add_fields": [],"extract_limit" :-1}" to json editor in field parsing
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    And I will see the field extraction result "<result>"
    And I will see the text "www.dz.sdboss.com" is not existed in page

    Examples:
      | log                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | rule   | result                                  |
      | {"name":"用户操作按menuId","application":"www.dz.sdboss.com","type":"PAGE_ACTION","timestamp":"2018-08-09 09:00:55.972+0800","purePathId":"PT\u003d85817305;PA\u003d1069222345;PS\u003d-1350680648","startTime":"2015-09-22 13:41:40.794+0800","dimensions":{"cookie CURRENT_MENUID":"CollectHistory_WEB","cookie Login Cookie":"d110U003","IP":"134.36.139.53"},"measures":{"Server_Contribution":3.562864303588867,"Network_Contribution":0.04063353204625707},"failed":false,"visitId":4323763,"actionName":"click on \"查 询\"","url":"http://www.dz.sdboss.com/custcare/charge/commonbusiness/FeeHistoryQueryTab/FeeHistoryQueryTab.do?act\u003dinitPages\u0026ywjkEnterMenu\u003d123456\u0026currentTabID\u003dCollectHistory_WEB","responseTime":48.3828125,"duration":48.3828125,"execTime":48.3828125,"clientErrors":0}                                                                                                                                                                                                      | JSON解析 |  {'name':'用户操作按menuId'}          |
      | <root><name>用户操作按menuId</name><application>www.dz.sdboss.com</application><type>PAGE_ACTION</type><timestamp>2018-08-09 09:00:55.972+0800</timestamp><purePathId>PT=85817305;PA=1069222345;PS=-1350680648</purePathId><startTime>2015-09-22 13:41:40.794+0800</startTime><dimensions><cookie_CURRENT_MENUID>CollectHistory_WEB</cookie_CURRENT_MENUID><cookie_Login_Cookie>d110U003</cookie_Login_Cookie><IP>134.36.139.53</IP></dimensions><measures><Server_Contribution>3.562864303588867</Server_Contribution><Network_Contribution>0.04063353204625707</Network_Contribution></measures><failed>false</failed><visitId>4323763</visitId><actionName>click on &quot;查 询&quot;</actionName><url>http://www.dz.sdboss.com/custcare/charge/commonbusiness/FeeHistoryQueryTab/FeeHistoryQueryTab.do?act=initPages&amp;ywjkEnterMenu=123456&amp;currentTabID=CollectHistory_WEB</url><responseTime>48.3828125</responseTime><duration>48.3828125</duration><execTime>48.3828125</execTime><clientErrors>0</clientErrors></root> | XML解析  | {'name':'用户操作按menuId'}     |


  Scenario Outline: RZY-3078、3079:使用jsonpath不受长度限制影响
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<log>"
    And I click the "AddRule" button
    And I choose the "<rule>" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "PathInput" with value "dimensions"
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    And I will see the field extraction result "<result>"
    And I will see the text "用户操作按menuId" is not existed in page

    Examples:
      | log                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | rule   | result                                                                                                   |
      | {"name":"用户操作按menuId","application":"www.dz.sdboss.com","type":"PAGE_ACTION","timestamp":"2018-08-09 09:00:55.972+0800","purePathId":"PT\u003d85817305;PA\u003d1069222345;PS\u003d-1350680648","startTime":"2015-09-22 13:41:40.794+0800","dimensions":{"cookie CURRENT_MENUID":"CollectHistory_WEB","cookie Login Cookie":"d110U003","IP":"134.36.139.53"},"measures":{"Server_Contribution":3.562864303588867,"Network_Contribution":0.04063353204625707},"failed":false,"visitId":4323763,"actionName":"click on \"查 询\"","url":"http://www.dz.sdboss.com/custcare/charge/commonbusiness/FeeHistoryQueryTab/FeeHistoryQueryTab.do?act\u003dinitPages\u0026ywjkEnterMenu\u003d123456\u0026currentTabID\u003dCollectHistory_WEB","responseTime":48.3828125,"duration":48.3828125,"execTime":48.3828125,"clientErrors":0}                                                                                                                                                                                                      | JSON解析 | {'dimensions.IP':'134.36.139.53','dimensions.cookie CURRENT_MENUID':'CollectHistory_WEB','dimensions.cookie Login Cookie':'d110U003'}|
      | <root><name>用户操作按menuId</name><application>www.dz.sdboss.com</application><type>PAGE_ACTION</type><timestamp>2018-08-09 09:00:55.972+0800</timestamp><purePathId>PT=85817305;PA=1069222345;PS=-1350680648</purePathId><startTime>2015-09-22 13:41:40.794+0800</startTime><dimensions><cookie_CURRENT_MENUID>CollectHistory_WEB</cookie_CURRENT_MENUID><cookie_Login_Cookie>d110U003</cookie_Login_Cookie><IP>134.36.139.53</IP></dimensions><measures><Server_Contribution>3.562864303588867</Server_Contribution><Network_Contribution>0.04063353204625707</Network_Contribution></measures><failed>false</failed><visitId>4323763</visitId><actionName>click on &quot;查 询&quot;</actionName><url>http://www.dz.sdboss.com/custcare/charge/commonbusiness/FeeHistoryQueryTab/FeeHistoryQueryTab.do?act=initPages&amp;ywjkEnterMenu=123456&amp;currentTabID=CollectHistory_WEB</url><responseTime>48.3828125</responseTime><duration>48.3828125</duration><execTime>48.3828125</execTime><clientErrors>0</clientErrors></root> | XML解析  | {'dimensions.IP':'134.36.139.53','dimensions.cookie_CURRENT_MENUID':'CollectHistory_WEB','dimensions.cookie_Login_Cookie':'d110U003'}|

  Scenario: 修改log_parser.json_parse_extract_limit和xml_parse_extract_limit为5000
    Given curl update url "module=logriver&key=log_parser.json_parse_extract_limit&value=5000"
    And curl update url "module=logriver&key=log_parser.xml_parse_extract_limit&value=5000"
    And curl update url "module=logriver&key=log_parser.switch_delete_timestamp&value=false"
    And curl restart url "modulename=logriver"