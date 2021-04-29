# new feature
# Tags: optional

@dictionary
Feature: 字典管理

  Background:
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible

  @dict1
  Scenario Outline: RZY-4136新建字典
    When I click the "UploadButton" button
    Then I wait for "PopUpWindow" will be visible
    And I upload a file with name "/src/test/resources/testdata/dictionary/wymtest1.csv"
    And I wait for "FileName" will be visible
    Then I set the parameter "Name" with value "<dictionaryNameWithOutCsv>"
    And I click the "EnsureUpload" button
    Then I wait for "Tip" will be visible
    Then I will see the success message "创建字典成功"
    Then I click the "EnsureButton" button

    Examples:
      | dictionaryNameWithOutCsv | dictionaryName    | totalItem | editOnlineArea                                                                                         |
      | wymtestcreate            | wymtestcreate.csv | 共 1 条         | bubble.test^archiver.process.conns\nbubble.test^archiver.process.cpu\nbubble.test^archiver.process.fds |

  @dict2
  Scenario Outline: RZY-4136新建字典
    Then I refresh the website
    And I wait for loading invisible
    Then I set the parameter "DictionaryFilter" with value "<dictionaryName>"
    Then I wait for loading invisible
    Then I will see the "TotalItem" result will be "<totalItem>"
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "编辑" button
    Then I will see the "dictionary.CreatePage" page
    And I wait for element "Name" value change text to "<dictionaryNameWithOutCsv>"
    Then I click the "EditOnline" button
    Then I will see the element "EditOnlineArea" name is "<editOnlineArea>"

    Examples:
      | dictionaryNameWithOutCsv | dictionaryName    | totalItem | editOnlineArea                                                                                         |
      | wymtestcreate            | wymtestcreate.csv | 共 1 条         | bubble.test^archiver.process.conns\nbubble.test^archiver.process.cpu\nbubble.test^archiver.process.fds |

  @dict2 @tc4137
  Scenario Outline: RZY-4137上传字典
    When I click the "UploadButton" button
    Then I wait for "PopUpWindow" will be visible
    And I upload a file with name "/src/test/resources/testdata/dictionary/wymtest1.csv"
    And I wait for "FileName" will be visible
    Then I set the parameter "Name" with value "<dictionaryNameWithOutCsv>"
    And I click the "EnsureUpload" button
    Then I wait for "Tip" will be visible
    Then I will see the success message "创建字典成功"
    Then I click the "EnsureButton" button

    Examples:
      | dictionaryNameWithOutCsv | dictionaryName      |
      | wymtestdownload          | wymtestdownload.csv |

  @dict3
  Scenario Outline: RZY-4137下载字典
    And I set the parameter "SearchNameInput" with value "<dictionaryName>"
    Given I wait for loading complete
    And I wait for "2000" millsecond
    When the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "下载" button in more menu
    Examples:
      | dictionaryNameWithOutCsv | dictionaryName      |
      | wymtestdownload          | wymtestdownload.csv |

  @dict4
  Scenario Outline: RZY-4140上传非同名文件
    When I click the "UploadButton" button
    Then I wait for "PopUpWindow" will be visible
    And I upload a file with name "/src/test/resources/testdata/dictionary/wymtest1.csv"
    And I wait for "FileName" will be visible
    Then I set the parameter "Name" with value "<dictionaryNameWithOutCsv>"
    And I click the "EnsureUpload" button
    Then I wait for "Tip" will be visible
    Then I will see the success message "创建字典成功"
    Then I click the "EnsureButton" button
    Then I refresh the website
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "编辑" button
    Then I will see the "dictionary.CreatePage" page
    Then I wait for element "Name" value change text to "<dictionaryNameWithOutCsv>"
    And I upload a file with name "/src/test/resources/testdata/dictionary/wymdoubletest1.csv"
    And I wait for "FileName" will be visible
    Then I click the "SaveButton" button
    Then I wait for "Tip" will be visible
    Then I will see the message "更新字典内容成功"
    Then I click the "EnsureButton" button
    Then I wait for loading invisible
    Then I will see the "dictionary.ListPage" page
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "编辑" button
    Then I will see the "dictionary.CreatePage" page
    Then I wait for element "Name" value change text to "<dictionaryNameWithOutCsv>"
    Then I click the "EditOnline" button
    Then I will see the element "EditOnlineArea" value is "<editOnlineArea>"

    Examples:
      | dictionaryNameWithOutCsv | dictionaryName     | editOnlineArea                                                                                                                                                                                                 |
      | wymtestdifname           | wymtestdifname.csv | bubble.test^archiver.process.conns\nbubble.test^archiver.process.cpu\nbubble.test^archiver.process.fds\nbubble.test^archiver.process.conns\nbubble.test^archiver.process.cpu\nbubble.test^archiver.process.fds |

  @dict5
  Scenario Outline: RZY-4141上传同名文件
    When I click the "UploadButton" button
    Then I wait for "PopUpWindow" will be visible
    And I upload a file with name "/src/test/resources/testdata/dictionary/wymtest1.csv"
    And I wait for "FileName" will be visible
    Then I set the parameter "Name" with value "<dictionaryNameWithOutCsv>"
    And I click the "EnsureUpload" button
    Then I wait for "Tip" will be visible
    Then I will see the success message "创建字典成功"
    Then I click the "EnsureButton" button
    Then I refresh the website
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "编辑" button
    Then I will see the "dictionary.CreatePage" page
    Then I wait for element "Name" value change text to "<dictionaryNameWithOutCsv>"
    And I upload a file with name "/src/test/resources/testdata/dictionary/test/wymtest1.csv"
    And I wait for "FileName" will be visible
    Then I click the "SaveButton" button
    Then I wait for "Tip" will be visible
    Then I will see the message "更新字典内容成功"
    Then I click the "EnsureButton" button
    Then I wait for loading invisible
    Then I will see the "dictionary.ListPage" page
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "编辑" button
    Then I will see the "dictionary.CreatePage" page
    Then I wait for element "Name" value change text to "<dictionaryNameWithOutCsv>"
    Then I click the "EditOnline" button
    Then I will see the element "EditOnlineArea" value is "<editOnlineArea>"


    Examples:
      | dictionaryNameWithOutCsv | dictionaryName      | editOnlineArea                                                       |
      | wymtestsamename          | wymtestsamename.csv | bubble.test^archiver.process.conns\nbubble.test^archiver.process.cpu |

  Scenario Outline: RZY-4144（在线编辑-撤销修改）
    When I click the "UploadButton" button
    Then I wait for "PopUpWindow" will be visible
    And I upload a file with name "/src/test/resources/testdata/dictionary/wymtest1.csv"
    And I wait for "FileName" will be visible
    Then I set the parameter "Name" with value "<dictionaryNameWithOutCsv>"
    And I click the "EnsureUpload" button
    Then I wait for "Tip" will be visible
    Then I will see the success message "创建字典成功"
    Then I click the "EnsureButton" button
    Then I refresh the website
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "编辑" button
    Then I will see the "dictionary.CreatePage" page
    Then I wait for element "Name" value change text to "<dictionaryNameWithOutCsv>"
    Then I click the "EditOnline" button
    Then I set the value "<edited>" to the textarea "EditOnlineArea"
    Then I click the "CancelButton" button
    Then I will see the element "EditOnlineArea" value is "<editOnlineArea>"

    Examples:
      | dictionaryNameWithOutCsv | dictionaryName        | editOnlineArea                                                       | edited |
      | wymtestcanceledit        | wymtestcanceledit.csv | bubble.test^archiver.process.conns\nbubble.test^archiver.process.cpu | 123456 |

  Scenario Outline: RZY-4143（在线编辑-保存修改）
    When I click the "UploadButton" button
    Then I wait for "PopUpWindow" will be visible
    And I upload a file with name "/src/test/resources/testdata/dictionary/wymtest1.csv"
    And I wait for "FileName" will be visible
    Then I set the parameter "Name" with value "<dictionaryNameWithOutCsv>"
    And I click the "EnsureUpload" button
    Then I wait for "Tip" will be visible
    Then I will see the success message "创建字典成功"
    Then I click the "EnsureButton" button
    Then I refresh the website
    And I wait for loading invisible
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "编辑" button
    Then I will see the "dictionary.CreatePage" page
    Then I wait for element "Name" value change text to "<dictionaryNameWithOutCsv>"
    Then I click the "EditOnline" button
    Then I set the value "<edited>" to the textarea "EditOnlineArea"
    Then I click the "SaveEdit" button
    Then I wait for "Tip" will be visible
    Then I will see the message "更新字典内容成功"
    Then I click the "EnsureButton" button
    Then I wait for loading invisible
    Then I will see the "dictionary.ListPage" page
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "编辑" button
    Then I will see the "dictionary.CreatePage" page
    Then I wait for element "Name" value change text to "<dictionaryNameWithOutCsv>"
    And I click the "EditOnline" button
    Then I will see the element "EditOnlineArea" value is "<edited>"

    Examples:
      | dictionaryName      | edited  | dictionaryNameWithOutCsv |
      | wymtestsaveedit.csv | rizhiyi | wymtestsaveedit          |

#  Scenario Outline: RZY-4145(列表页添加一个标签)
#
#    When I click the "UploadButton" button
#    Then I wait for "PopUpWindow" will be visible
#    And I upload a file with name "/src/test/resources/testdata/dictionary/wymtest1.csv"
#    And I wait for "FileName" will be visible
#    Then I set the parameter "Name" with value "<dictionaryNameWithOutCsv>"
#    And I click the "EnsureUpload" button
#    Then I wait for "Tip" will be visible
#    Then I will see the success message "创建字典成功"
#    Then I click the "EnsureButton" button
#    Then I refresh the website
#    And I wait for loading invisible
#    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "标签" button
#    Then I wait for "PopUpWindow" will be visible
##    Then I set the parameter "Tag" with value "tag"
#    And I choose the "<newTag>" from the "TagList" in config
#    Then I click the "EnsureButton" button
#    Then I wait for "Tip" will be visible
#    And I will see the success message "修改成功"
#    Then I click the "EnsureButton" button
#    Then I wait for "1000" millsecond
#    And I will see the data "{'column':'0','name':'<dictionaryName>'}" values "{'column':'3','name':'<newTag>'}"
#
#    Examples:
#      | dictionaryName                 | newTag  | dictionaryNameWithOutCsv   |
#      | wymtestaddonetagatlistpage.csv | wymtest | wymtestaddonetagatlistpage |
#
#  Scenario Outline: RZY-4146(列表页修改标签old->new)
#
#    When I click the "UploadButton" button
#    Then I wait for "PopUpWindow" will be visible
#    And I upload a file with name "/src/test/resources/testdata/dictionary/wymtest1.csv"
#    And I wait for "FileName" will be visible
#    Then I set the parameter "Name" with value "<dictionaryNameWithOutCsv>"
##    Then I set the parameter "GroupInput" with value "<oldTag>"
#    And I choose the "<oldTag>" from the "DictionaryTagList" in config
#    And I click the "EnsureUpload" button
#    Then I wait for "Tip" will be visible
#    Then I will see the success message "创建字典成功"
#    Then I click the "EnsureButton" button
#    Then I refresh the website
#    And I wait for loading invisible
#    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "标签" button
#    Then I wait for "PopUpWindow" will be visible
#    Then I click the "ClearIconOld" button
##    Then I set the parameter "Tag" with value "<newTag>"
#    And I choose the "<newTag>" from the "TagList" in config
#    Then I click the "EnsureButton" button
#    Then I wait for "Tip" will be visible
#    And I will see the success message "修改成功"
#    Then I click the "EnsureButton" button
#    And I wait for "1000" millsecond
#    And I will see the data "{'column':'0','name':'<dictionaryName>'}" values "{'column':'3','name':'<newTag>'}"
#
#    Examples:
#      | dictionaryName                 | newTag | dictionaryNameWithOutCsv   | oldTag |
#      | wymtestchangetagatlistpage.csv | new    | wymtestchangetagatlistpage | old    |
#

#  Scenario Outline: 按照标签搜索字典
#
#    When I click the "UploadButton" button
#    Then I wait for "PopUpWindow" will be visible
#    And I upload a file with name "/src/test/resources/testdata/dictionary/wymtest1.csv"
#    And I wait for "FileName" will be visible
#    Then I set the parameter "Name" with value "<dictionaryNameWithOutCsv>"
##    Then I set the parameter "GroupInput" with value "<dictionaryNameWithOutCsv>"
#    And I choose the "<dictionaryNameWithOutCsv>" from the "DictionaryTagList" in config
#    And I click the "EnsureUpload" button
#    Then I wait for "Tip" will be visible
#    Then I will see the success message "创建字典成功"
#    Then I click the "EnsureButton" button
#    Then I refresh the website
#    And I wait for loading invisible
#    And I choose the "<dictionaryNameWithOutCsv>" from the "ResourceDropdown" in config
#    And I wait for loading invisible
#    Then I will see the search result contains "{'column':'0','name':'<dictionaryName>'}"
#
#    Examples:
#      | dictionaryName | dictionaryNameWithOutCsv |
#      | wymtest.csv    | wymtest                  |
#
#
#  Scenario Outline: RZY-4147(列表页清空全部标签)
#
#    When I click the "UploadButton" button
#    Then I wait for "PopUpWindow" will be visible
#    And I upload a file with name "/src/test/resources/testdata/dictionary/wymtest1.csv"
#    And I wait for "FileName" will be visible
#    Then I set the parameter "Name" with value "<dictionaryNameWithOutCsv>"
#    And I choose the "<twoTag>" from the "DictionaryTagList" in config
#    And I click the "EnsureUpload" button
#    Then I wait for "Tip" will be visible
#    Then I will see the success message "创建字典成功"
#    Then I click the "EnsureButton" button
#    Then I refresh the website
#    And I wait for loading invisible
#    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "标签" button
#    Then I wait for "PopUpWindow" will be visible
#    Then I click the "ClearIconOld" button
#    Then I click the "ClearIconNew" button
#    Then I click the "EnsureButton" button
#    Then I wait for "Tip" will be visible
#    And I will see the success message "修改成功"
#    Then I click the "EnsureButton" button
#    Then I wait for loading invisible
#    And I will see the data "{'column':'0','name':'<dictionaryName>'}" values "{'column':'3','name':'<newTag>'}"
#
#    Examples:
#      | dictionaryName                | newTag | dictionaryNameWithOutCsv  | twoTag  |
#      | wymtestcleartagatlistpage.csv | 无      | wymtestcleartagatlistpage | old,new |
#
#
#  Scenario Outline: RZY-4151(授权页：添加用户权限-取消)
#
#    When I click the "UploadButton" button
#    Then I wait for "PopUpWindow" will be visible
#    And I upload a file with name "/src/test/resources/testdata/dictionary/wymtest1.csv"
#    And I wait for "FileName" will be visible
#    Then I set the parameter "Name" with value "<dictionaryNameWithOutCsv>"
#    And I click the "EnsureUpload" button
#    Then I wait for "Tip" will be visible
#    Then I will see the success message "创建字典成功"
#    Then I click the "EnsureButton" button
#    Then I refresh the website
#    And I wait for loading invisible
#    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "授权" button
#    And I wait for "PopUpWindow" will be visible
#    And I wait for loading invisible
#    Then I set the parameter "UserFilter" with value "<user>"
#    And I wait for loading invisible
#    Then I "checked" the label before "<user>" in the dictionary
#    Then I click the "AuthCancelButton" button
#    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "授权" button
#    Then I set the parameter "UserFilter" with value "<user>"
#    And I wait for loading invisible
#    Then I check the label "unchecked" status before "<user>" in the dictionary
#
#
#    Examples:
#      | dictionaryNameWithOutCsv | dictionaryName             | user |
#      | wymtestauthorizecancel   | wymtestauthorizecancel.csv | wym  |
#
#
#  Scenario Outline: RZY-4149(授权页：添加用户权限-保存)
#
#    When I click the "UploadButton" button
#    Then I wait for "PopUpWindow" will be visible
#    And I upload a file with name "/src/test/resources/testdata/dictionary/wymtest1.csv"
#    And I wait for "FileName" will be visible
#    Then I set the parameter "Name" with value "<dictionaryNameWithOutCsv>"
#    And I click the "EnsureUpload" button
#    Then I wait for "Tip" will be visible
#    Then I will see the success message "创建字典成功"
#    Then I click the "EnsureButton" button
#    Then I refresh the website
#    And I wait for loading invisible
#    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "授权" button
#    And I wait for "PopUpWindow" will be visible
#    And I wait for "1500" millsecond
#    Then I set the parameter "UserFilter" with value "<user>"
#    And I wait for "1500" millsecond
#    Then I "checked" the label before "<user>" in the dictionary
#    Then I click the "EnsureButton" button
#    Then I wait for "Tip" will be visible
#    Then I will see the success message "保存成功"
#    Then I click the "EnsureButton2" button
#    And I wait for "800" millsecond
#    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "授权" button
#    And I wait for "PopUpWindow" will be visible
#    And I wait for "1000" millsecond
#    Then I set the parameter "UserFilter" with value "<user>"
#    And I wait for loading invisible
#    Then I check the label "checked" status before "<user>" in the dictionary
#
#    Examples:
#      | dictionaryName           | user | dictionaryNameWithOutCsv |
#      | wymtestauthorizesave.csv | wym  | wymtestauthorizesave     |
#
#
#  Scenario Outline: RZY-4150(授权页：取消用户权限-取消)
#
#    When I click the "UploadButton" button
#    Then I wait for "PopUpWindow" will be visible
#    And I upload a file with name "/src/test/resources/testdata/dictionary/wymtest1.csv"
#    And I wait for "FileName" will be visible
#    Then I set the parameter "Name" with value "<dictionaryNameWithOutCsv>"
#    And I click the "EnsureUpload" button
#    Then I wait for "Tip" will be visible
#    Then I will see the success message "创建字典成功"
#    Then I click the "EnsureButton" button
#    Then I refresh the website
#    And I wait for loading invisible
#    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "授权" button
#    And I wait for "PopUpWindow" will be visible
#    And I wait for loading invisible
#    Then I set the parameter "UserFilter" with value "<user>"
#    And I wait for loading invisible
#    Then I "checked" the label before "<user>" in the dictionary
#    Then I click the "EnsureButton" button
#    Then I wait for "Tip" will be visible
#    Then I will see the success message "保存成功"
#    Then I click the "EnsureButton2" button
#    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "授权" button
#    Then I set the parameter "UserFilter" with value "<user>"
#    Then I wait for loading invisible
#    Then I "unchecked" the label before "<user>" in the dictionary
#    Then I click the "AuthCancelButton" button
#    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "授权" button
#    Then I set the parameter "UserFilter" with value "<user>"
#    Then I wait for loading invisible
#    Then I check the label "checked" status before "<user>" in the dictionary
#
#    Examples:
#      | dictionaryName            | user | dictionaryNameWithOutCsv |
#      | wymtestrevokeauthexit.csv | wym  | wymtestrevokeauthexit    |
#
#  Scenario Outline: RZY-4152(授权页：取消用户权限-保存)
#
#    When I click the "UploadButton" button
#    Then I wait for "PopUpWindow" will be visible
#    And I upload a file with name "/src/test/resources/testdata/dictionary/wymtest1.csv"
#    And I wait for "FileName" will be visible
#    Then I set the parameter "Name" with value "<dictionaryNameWithOutCsv>"
#    And I click the "EnsureUpload" button
#    Then I wait for "Tip" will be visible
#    Then I will see the success message "创建字典成功"
#    Then I click the "EnsureButton" button
#    Then I refresh the website
#    And I wait for loading invisible
#    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "授权" button
#    And I wait for "PopUpWindow" will be visible
#    And I wait for loading invisible
#    Then I set the parameter "UserFilter" with value "<user>"
#    And I wait for loading invisible
#    Then I "checked" the label before "<user>" in the dictionary
#    Then I click the "EnsureButton" button
#    Then I wait for "Tip" will be visible
#    Then I will see the success message "保存成功"
#    Then I click the "EnsureButton2" button
#    Then I wait for "200" millsecond
#    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "授权" button
#    Then I set the parameter "UserFilter" with value "<user>"
#    Then I wait for loading invisible
#    Then I "unchecked" the label before "<user>" in the dictionary
#    Then I click the "EnsureButton" button
#    Then I wait for "Tip" will be visible
#    Then I will see the success message "保存成功"
#    Then I click the "EnsureButton2" button
#    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "授权" button
#    Then I wait for loading invisible
#    Then I set the parameter "UserFilter" with value "<user>"
#    Then I wait for loading invisible
#    Then I check the label "unchecked" status before "<user>" in the dictionary
#
#
#    Examples:
#      | dictionaryName            | user | dictionaryNameWithOutCsv |
#      | wymtestrevokeauthsave.csv | wym  | wymtestrevokeauthsave    |
#
#  Scenario Outline: RZY-4160(授权页：自定义有效期-当前日期)
#    When I click the "UploadButton" button
#    Then I wait for "PopUpWindow" will be visible
#    And I upload a file with name "/src/test/resources/testdata/dictionary/wymtest1.csv"
#    And I wait for "FileName" will be visible
#    Then I set the parameter "Name" with value "<dictionaryNameWithOutCsv>"
#    And I click the "EnsureUpload" button
#    Then I wait for "Tip" will be visible
#    Then I will see the success message "创建字典成功"
#    Then I click the "EnsureButton" button
#    Then I refresh the website
#    And I wait for loading invisible
#    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "授权" button
#    Then I set the parameter "UserFilter" with value "<user>"
#    Then I wait for "2000" millsecond
#    Then I "checked" the label before "<user>" in the dictionary
#    Then I click the "Indefinitely" button
#    Then I click the "Customize" button
#    And I click the "TimeSelector" button
#    Then I click the "DateNow" button
#    And I click the "DateSelectConfirm" button
#    Then I click the "EnsureButton" button
#    Then I wait for "1000" millsecond
#    Then I will see the success message "请选择合理的有效期限"
#    Then I click the "EnsureButton2" button
#    Then I wait for "1000" millsecond
#    Then I click the "AuthCancelButton" button
#    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "授权" button
#    Then I set the parameter "UserFilter" with value "<user>"
#    Then I wait for "2000" millsecond
#    Then I check the label "unchecked" status before "<user>" in the dictionary
#    Then I will see the "DeadLine" result will be "无限期"
#
#    Examples:
#      | dictionaryName         | user | dictionaryNameWithOutCsv |
#      | wymtestcurrentdate.csv | wym  | wymtestcurrentdate       |
#
