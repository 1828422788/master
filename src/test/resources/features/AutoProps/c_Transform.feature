@autoprops @transform @autopropsSmoke @extract
Feature: 字段转换
  #  详细功能参见testlink中RZY-5373隶属文件夹【字段转换】及RZY-5407隶属文件夹【字段萃取】-》【字段转换】中的配置

  Background:
    Given open the "autoProps.ListPage" page for uri "/fieldconfig/"

  Scenario: 添加字段转换_分隔符
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I wait for "Transform" will be visible
    And I click the "Transform" button
    And I wait for "AddTransform" will be visible

    And I click the "AddTransform" button
    And I set the parameter "TransformName" with value "AutoTransform"
    And I choose the "分隔符" from the "ConvertRule"
    And I set the parameter "SourceField" with value "apache.request_query"
    And I set the parameter "Separator" with value "="
    And I set the parameter "FieldList" with value "ADDRESS"
    And I click the "SavedButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    And I wait for element "AutoTransformRule" change text to "分隔符"
    And I wait for element "AutoTransformFieldSource" change text to "apache.request_query"

  Scenario Outline: 添加字段转换_正则解析
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I wait for "Transform" will be visible
    And I click the "Transform" button
    And I wait for "AddTransform" will be visible

    And I click the "AddTransform" button
    And I set the parameter "TransformName" with value "<Transformname>"
    And I choose the "正则解析" from the "ConvertRule"
    And I set the parameter "RegexSourceField" with value "<Sourcefield>"
    And I set the parameter "CanonicalParse" with value "<Canonicalparse>"
    And I set the parameter "TransformFormat" with value "<Transformformat>"
    And I click the "SavedButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    And I wait for element "<TransformationRule>" change text to "正则解析"
    And I wait for element "<FieldSource>" change text to "<FieldsourceText>"

    Examples:
      | Transformname      | Sourcefield      | Canonicalparse          | Transformformat                                                      |  TransformationRule  | FieldSource            | FieldsourceText |
      | AutoTransformNum   | raw_message      | (\d+)                   | AutoTransformNum::$1                                                |  AutoTransformNumRule| AutoTransformNumSource| raw_message        |
      | AutoTransformQu    | raw_message      | .*                      | key::$1                                                             |  AutoTransformQuRule | AutoTransformQuSource | raw_message        |
      | AutoTransformInNum | raw_message      | [[AutoTransformNum]]    | AutoTransFormInNum::$1                                              |  AutoTransformInNumRule| AutoTransformInNumSource| raw_message    |
      | AutoTransformInQu  | raw_message      | gw_address=([[AutoTransformQu]])&gw_port=([[AutoTransformQu]])&gw_id| GW_ADDR::$1 GW_PORT::$2|  AutoTransformInQuRule | AutoTransformInQuSource| raw_message     |
      | AutoChange         | raw_message      | (\w+)                                                                | AutoChange::$1         |  AutoChangeRule        | AutoChangeSource        |   raw_message  |

  Scenario Outline: 添加字段转换失败
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I wait for "Transform" will be visible
    And I click the "Transform" button
    And I wait for "AddTransform" will be visible

    And I click the "AddTransform" button
    And I set the parameter "TransformName" with value "<name>"
    And I choose the "正则解析" from the "ConvertRule"
    And I set the parameter "RegexSourceField" with value "raw_message"
    And I set the parameter "CanonicalParse" with value "(\d+)"
    And I set the parameter "TransformFormat" with value "test::$1"
    And I click the "SavedButton" button
    And I will see the element "WarningInfo" name is "<warning>"

    Examples:
      | name | warning        |
      |      | 请输入转换名称        |
      |AutoTransform|名称重复        |
      | 中文  | 名称由字母、数字和下划线组成 |
      | #%autotest| 名称由字母、数字和下划线组成 |
      | auto_te st | 名称由字母、数字和下划线组成 |

  Scenario: 添加字段转换到字段萃取
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I wait for "Extract" will be visible
    And I click the "Extract" button
    And I wait for "AddExtract_ts" will be visible

    And I click the "AddExtract_ts" button
    And I set the parameter "Extract_ts_name" with value "AutoTest"
    And I choose the "AutoTransformNum" from the "FieldConvertRule"
    And I wait for "AutoTransformInNum_ch" will be visible
    And I click the "AutoTransformInNum_ch" button
    And I wait for "AutoTransformInQu_ch" will be visible
    And I click the "AutoTransformInQu_ch" button
    And I wait for "AutoChange_ch" will be visible
    And I click the "AutoChange_ch" button
    And I wait for "AutoTransform_ch" will be visible
    And I click the "AutoTransform_ch" button
    And I wait for "Save" will be visible
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"

  Scenario: 验证字段转换
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "tag:sample04061424_apache_50 appname:apache"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "EventsTitle" change text to "事件列表"
    And I click the "RightIcon" button
    Then I will see the field "AutoChange:" exist
    Then I will see the field "ADDRESS:" exist
    Then I will see the field "AutoTransformNum:" exist
    Then I will see the field "AutoTransFormInNum:" exist
    Then I will see the field "GW_ADDR:" exist
    Then I will see the field "GW_PORT:" exist
    And I wait for "SearchInput" will be visible
    And I set the parameter "SearchInput" with value "* | parse \"(?<messageNum>[[AutoTransformNum]])\" max_match=2"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "EventsTitle" change text to "事件列表"
    And I click the "RightIcon" button
    Then I will see the field "messageNum:" exist

  Scenario: 编辑字段转换
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I wait for "Transform" will be visible
    And I click the "Transform" button
    And I wait for "AddTransform" will be visible

    When the data name is "AutoTransform" then i click the "编辑" button
    And I set the parameter "SourceField" with value "raw_message"
    And I set the parameter "Separator" with value " :"
    And I set the parameter "FieldList" with value ""
    And I click the "SavedButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    And I wait for element "AutoTransformRule" change text to "分隔符"
    And I wait for element "AutoTransformFieldSource" change text to "raw_message"

  Scenario: 上传多值字段数据和需清理字段名称数据
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "MultiValueField"
    And I set the parameter "Tag" with value "MultiValueField"
    And I upload a file with name "/src/test/resources/testdata/log/MultiValueField.txt"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"

  Scenario: 验证编辑后的字段转换
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "appname:MultiValueField"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "EventsTitle" change text to "事件列表"
    And I click the "RightIcon" button
    Then I will see the field "City城市:" exist
    Then I will see the spl search result "{'C国家':'CHINA'}"
    Then I will see the field "IP地址:" exist
    Then I will see the field "M方法:" exist

  Scenario: 开启多值字段
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I wait for "Transform" will be visible
    And I click the "Transform" button
    And I wait for "AddTransform" will be visible

    When the data name is "AutoTransform" then i click the "编辑" button
    And I wait for "MultiValueText" will be visible
    And I click the "MultiValueSwitch" button
    And I click the "SavedButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    And I wait for element "AutoTransformRule" change text to "分隔符"
    And I wait for element "AutoTransformFieldSource" change text to "raw_message"

  Scenario: 验证多值字段
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "appname:MultiValueField"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "EventsTitle" change text to "事件列表"
    And I click the "RightIcon" button
    Then I will see the field "City城市:" exist
    Then I will see the spl search result "{'C国家':'中国'}"
    Then I will see the field "IP地址:" exist
    Then I will see the field "M方法:" exist

  Scenario: 开启自动清理字段名称
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I wait for "Transform" will be visible
    And I click the "Transform" button
    And I wait for "AddTransform" will be visible

    When the data name is "AutoTransform" then i click the "编辑" button
    Then I wait for "ClearFieldText" will be visible
    And I click the "ClearFieldSwitch" button
    And I click the "SavedButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    And I wait for element "AutoTransformRule" change text to "分隔符"
    And I wait for element "AutoTransformFieldSource" change text to "raw_message"

  Scenario: 验证自动清理字段名称
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "appname:MultiValueField"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "EventsTitle" change text to "事件列表"
    And I click the "RightIcon" button
    Then I will see the spl search result "{'C______':'中国'}"
    Then I will see the field "City______:" exist
    Then I will see the field "IP______:" exist
    Then I will see the field "M______:" exist

  Scenario: 开启全局共享
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I wait for "Extract" will be visible
    And I click the "Extract" button
    And I wait for "AddExtract_ts" will be visible
    And I click the "AutoTransformGlobalShared" button
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"

  Scenario: 验证全局共享_页面验证
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "AppFieldConfig" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I click the "FieldConfig" button
    And I wait for "FieldExtract" will be visible
    And I click the "FieldExtract" button
    And I wait for element "AutoTestGlobal" change text to "来自"

    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "app之api全部用例" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I click the "FieldConfig" button
    And I wait for "FieldExtract" will be visible
    And I click the "FieldExtract" button
    And I wait for element "AutoTestGlobal" change text to "来自"

    Given open the "autoProps.ListPage" page for uri "/fieldconfig/"
    When the data name is "AppFieldConfig" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page
    And I wait for "Extract" will be visible
    And I click the "Extract" button
    And I wait for "AddExtract_ts" will be visible
    And I wait for element "AutoTestGlobal" change text to "来自"

  Scenario: 验证全局共享_搜索验证
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "AppFieldConfig"
    Then I will see the "splSearch.SearchPage" page
    And I set the parameter "SearchInput" with value "* | stats count() by appname,'City______'"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "StatsNum" change text to "统计(1)"

    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "app之api全部用例"
    Then I will see the "splSearch.SearchPage" page
    And I click the "Search" button
    Given open the "app.ListPage" page for uri "/app/1/search/"
    Then I will see the "splSearch.SearchPage" page
    And I set the parameter "SearchInput" with value "* | stats count() by appname,'M______'"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "StatsNum" change text to "统计(1)"

    And I wait for "SearchInput" will be visible
    And I set the parameter "SearchInput" with value "tag:sample04061424_apache_50 appname:apache"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "EventsTitle" change text to "事件列表"
    And I click the "RightIcon" button
    Then I will see the field "AutoChange:" exist
    Then I will see the field "AutoTransformNum:" exist
    Then I will see the field "AutoTransFormInNum:" exist
    Then I will see the field "GW_ADDR:" exist
    Then I will see the field "GW_PORT:" exist

    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "* | stats count() by appname,'M______'"
    And I click the "DateEditor" button
    And I click the "WholeTime" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "StatsNum" change text to "统计(1)"

  Scenario: 关闭多值与清理字段
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I wait for "Transform" will be visible
    And I click the "Transform" button
    And I wait for "AddTransform" will be visible

    When the data name is "AutoTransform" then i click the "编辑" button
    And I wait for "MultiValueText" will be visible
    And I click the "MultiValueSwitch" button
    Then I wait for "ClearFieldText" will be visible
    And I click the "ClearFieldSwitch" button
    And I click the "SavedButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    And I wait for element "AutoTransformRule" change text to "分隔符"
    And I wait for element "AutoTransformFieldSource" change text to "raw_message"

  Scenario: 关闭全局共享
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I wait for "Extract" will be visible
    And I click the "Extract" button
    And I wait for "AddExtract_ts" will be visible
    And I click the "AutoTransformGlobalShared" button
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"

  Scenario: 验证关闭全局和多值与清理字段
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "AppFieldConfig"
    Then I will see the "splSearch.SearchPage" page
    And I set the parameter "SearchInput" with value "* | stats count() by appname,'City城市'"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "StatsNum" change text to "统计(0)"

    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "app之api全部用例"
    Then I will see the "splSearch.SearchPage" page
    And I click the "Search" button
    Given open the "app.ListPage" page for uri "/app/1/search/"
    Then I will see the "splSearch.SearchPage" page
    And I set the parameter "SearchInput" with value "* | stats count() by appname,'M______'"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "StatsNum" change text to "统计(0)"

    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "* | where 'M方法' == "GET" | stats count() by appname,'M方法'"
    And I click the "DateEditor" button
    And I click the "WholeTime" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "StatsNum" change text to "统计(1)"

  Scenario: 删除字段转换
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I click the "Transform" button
    And I wait for "AddTransform" will be visible

    Given the data name is "{'column':'0','name':'AutoChange'}" then i click the "删除" button
    And I wait for "EnsureText" will be visible
    And I click the "EnsureDelete" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "删除成功"

  Scenario: 删除字段转换_字段萃取
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I wait for "Extract" will be visible
    And I click the "Extract" button
    And I wait for "AutoTestDelete" will be visible
    And I click the "AutoTestDelete" button
    And I wait for "Save" will be visible
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"











