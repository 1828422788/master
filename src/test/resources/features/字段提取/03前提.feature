@configs @configs03
Feature: 字段提取前提条件

  Scenario: 确认log_parser.json_parse_extract_limit和xml_parse_extract_limit为5000,log_parser.switch_delete_timestamp为false
    Given curl update url "module=logriver&key=log_parser.json_parse_extract_limit&value=5000"
    And curl update url "module=logriver&key=log_parser.xml_parse_extract_limit&value=5000"
    And curl update url "module=logriver&key=log_parser.switch_delete_timestamp&value=false"
    And curl restart url "modulename=logriver"
#    And curl restart url "modulename=logparserserver"
    Then I wait for "180000" millsecond

  Scenario Outline: 1542、1543
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "{"Name": "John Smith ", "Age": 23, "Employed": true, "Address": {"Street": "324 Chrome St", "City": "Portland, New York,Los Angeles ", "Country": "United States"}}"
    And I click the "AddRule" button
    Then I wait for "1000" millsecond
    And I choose the "JSON解析" from the "ParseRule" in config
    And I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I set the parameter "<element>" with value "<path>"
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the field extraction result "<result>"

    Examples:
      | element   | path | result                                                                                                                                                                                                                                                                                                                                        |
      |           |      | {'City':'"Portland, New York,Los Angeles "','Country':'"United States"','Street':'"324 Chrome St"','Age':'23','Employed':'true','Name':'"John Smith "','raw_message':'"{"Name": "John Smith ", "Age": 23, "Employed": true, "Address": {"Street": "324 Chrome St", "City": "Portland, New York,Los Angeles ", "Country": "United States"}}"'} |
      | PathInput | Age  | {'Age':'23','raw_message':'"{"Name": "John Smith ", "Age": 23, "Employed": true, "Address": {"Street": "324 Chrome St", "City": "Portland, New York,Los Angeles ", "Country": "United States"}}"'}                                                                                                                                            |


  Scenario Outline: RZY-3076、3079：无extract_limit，manager配置为5000
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<log>"
    And I click the "AddRule" button
    And I choose the "<rule>" from the "ParseRule" in config
    Given I wait for loading complete
    And I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "2000" millsecond
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the field extraction result "<result>"

    Examples:
      | log                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | rule   | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
      | {"name":"用户操作按menuId","application":"www.dz.sdboss.com","type":"PAGE_ACTION","timestamp":"2018-08-09 09:00:55.972+0800","purePathId":"PT\u003d85817305;PA\u003d1069222345;PS\u003d-1350680648","startTime":"2015-09-22 13:41:40.794+0800","dimensions":{"cookie CURRENT_MENUID":"CollectHistory_WEB","cookie Login Cookie":"d110U003","IP":"134.36.139.53"},"measures":{"Server_Contribution":3.562864303588867,"Network_Contribution":0.04063353204625707},"failed":false,"visitId":4323763,"actionName":"click on \"查 询\"","url":"http://www.dz.sdboss.com/custcare/charge/commonbusiness/FeeHistoryQueryTab/FeeHistoryQueryTab.do?act\u003dinitPages\u0026ywjkEnterMenu\u003d123456\u0026currentTabID\u003dCollectHistory_WEB","responseTime":48.3828125,"duration":48.3828125,"execTime":48.3828125,"clientErrors":0}                                                                                                                                                                                                      | JSON解析 | {'actionName':'"click on "查 询""','application':'"www.dz.sdboss.com"','clientErrors':'0','IP':'"134.36.139.53"','cookie CURRENT_MENUID':'"CollectHistory_WEB"','cookie Login Cookie':'"d110U003"','duration':'48.38281','execTime':'48.38281','failed':'false','Network_Contribution':'0.04063','Server_Contribution':'3.56286','name':'"用户操作按menuId"','purePathId':'"PT=85817305;PA=1069222345;PS=-1350680648"','responseTime':'48.38281','startTime':'"2015-09-22 13:41:40.794+0800"','timestamp':'"2018-08-09 09:00:55.972+0800"','type':'"PAGE_ACTION"','url':'"http://www.dz.sdboss.com/custcare/charge/commonbusiness/FeeHistoryQueryTab/FeeHistoryQueryTab.do?act=initPages&ywjkEnterMenu=123456&currentTabID=CollectHistory_WEB"','visitId':'4323763'}       |
      | <root><name>用户操作按menuId</name><application>www.dz.sdboss.com</application><type>PAGE_ACTION</type><timestamp>2018-08-09 09:00:55.972+0800</timestamp><purePathId>PT=85817305;PA=1069222345;PS=-1350680648</purePathId><startTime>2015-09-22 13:41:40.794+0800</startTime><dimensions><cookie_CURRENT_MENUID>CollectHistory_WEB</cookie_CURRENT_MENUID><cookie_Login_Cookie>d110U003</cookie_Login_Cookie><IP>134.36.139.53</IP></dimensions><measures><Server_Contribution>3.562864303588867</Server_Contribution><Network_Contribution>0.04063353204625707</Network_Contribution></measures><failed>false</failed><visitId>4323763</visitId><actionName>click on &quot;查 询&quot;</actionName><url>http://www.dz.sdboss.com/custcare/charge/commonbusiness/FeeHistoryQueryTab/FeeHistoryQueryTab.do?act=initPages&amp;ywjkEnterMenu=123456&amp;currentTabID=CollectHistory_WEB</url><responseTime>48.3828125</responseTime><duration>48.3828125</duration><execTime>48.3828125</execTime><clientErrors>0</clientErrors></root> | XML解析  | {'actionName':'"click on "查 询""','application':'"www.dz.sdboss.com"','clientErrors':'"0"','IP':'"134.36.139.53"','cookie_CURRENT_MENUID':'"CollectHistory_WEB"','cookie_Login_Cookie':'"d110U003"','duration':'"48.3828125"','execTime':'"48.3828125"','failed':'"false"','Network_Contribution':'"0.04063353204625707"','Server_Contribution':'"3.562864303588867"','name':'"用户操作按menuId"','purePathId':'"PT=85817305;PA=1069222345;PS=-1350680648"','responseTime':'"48.3828125"','startTime':'"2015-09-22 13:41:40.794+0800"','timestamp':'"2018-08-09 09:00:55.972+0800"','type':'"PAGE_ACTION"','url':'"http://www.dz.sdboss.com/custcare/charge/commonbusiness/FeeHistoryQueryTab/FeeHistoryQueryTab.do?act=initPages&ywjkEnterMenu=123456&currentTabID=CollectHistory_WEB"','visitId':'"4323763"'}|


  Scenario Outline: XML解析（RZY-1546）
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<root><test><a>1</a><a>2</a></test><test>3</test></root>"
    And I click the "AddRule" button
    And I choose the "XML解析" from the "ParseRule" in config
    And I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the field extraction result "<result>"

    Examples:
      | result                                                                                                                                        |
      | {'1':'"2"','raw_message':'"<root><test><a>1</a><a>2</a></test><test>3</test></root>"'} |


  Scenario: 修改manager中logriver配置log_parser.json_parse_extract_limit为10
    Given curl update url "module=logriver&key=log_parser.json_parse_extract_limit&value=10"
    Given curl update url "module=logriver&key=log_parser.xml_parse_extract_limit&value=10"
    And curl restart url "modulename=logriver"
#    And curl restart url "modulename=logparserserver"
    Then I wait for "180000" millsecond