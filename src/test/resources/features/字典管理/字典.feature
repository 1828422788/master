# new feature
# Tags: optional

@dictionary
Feature: 字典管理

  Scenario Outline: RZY-4136新建字典
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When I click the "UploadButton" button
    And I set the parameter "GroupInput" with value "wymtest1"
    And I choose the "wymtest1" from the "Group"
    And I upload a file with name "/src/test/resources/testdata/dictionary/wymtest1.csv"
    And I wait for "FileName" will be visible
    And I click the "EnsureUpload" button
    Then I will see the success message "创建字典成功"
    Then I click the "EnsureButton" button
    Then I set the parameter "DictionaryFilter" with value "<dictionaryName>"
    Then I wait for "2000" millsecond
    Then I will see the "TotalItem" result will be "<totalItem>"
    Then I wait for "1000" millsecond
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "编辑" button
    Then I will see the "dictionary.CreatePage" page
    Then I will see the element "GroupInput" value is "wymtest1"
    Then I click the "EditOnline" button
    Then I will see the element "EditOnlineArea" value is "<editOnlineArea>"

    Examples:
      | dictionaryName | totalItem | editOnlineArea                                                                                         |
      | wymtest1.csv   | 1         | bubble.test^archiver.process.conns\nbubble.test^archiver.process.cpu\nbubble.test^archiver.process.fds |

  Scenario Outline: RZY-4137下载字典
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "下载" button

    Examples:
      | dictionaryName |
      | wymtest1.csv   |

  Scenario Outline: RZY-4139修改标签(wymtest1->wymtest2)
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "编辑" button
    Then I will see the "dictionary.CreatePage" page
    Then I click the "ClearIcon1" button
    Then I set the parameter "GroupInput" with value "wymtest2"
    And I choose the "wymtest2" from the "Group"
    Then I click the "SaveButton" button
    Then I will see the message "更新字典内容成功"
    Then I click the "EnsureButton" button
    Then I will see the "dictionary.ListPage" page
    And I will see the data "{'column':'0','name':'<dictionaryName>'}" values "{'column':'3','name':'<newTag>'}"

    Examples:
      | dictionaryName | newTag   |
      | wymtest1.csv   | wymtest2 |

  Scenario Outline: RZY-4156增加标签(wymtest1)
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "编辑" button
    Then I will see the "dictionary.CreatePage" page
    Then I set the parameter "GroupInput" with value "wymtest1"
    And I choose the "wymtest1" from the "Group"
    Then I click the "SaveButton" button
    Then I will see the message "更新字典内容成功"
    Then I click the "EnsureButton" button
    Then I will see the "dictionary.ListPage" page
    And I will see the data "{'column':'0','name':'<dictionaryName>'}" values "{'column':'3','name':'<newTag>'}"

    Examples:
      | dictionaryName | newTag             |
      | wymtest1.csv   | wymtest1, wymtest2 |

  Scenario Outline: RZY-4138清空全部标签
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "编辑" button
    Then I will see the "dictionary.CreatePage" page
    Then I click the "ClearIcon1" button
    Then I click the "ClearIcon2" button
    Then I click the "SaveButton" button
    Then I will see the message "更新字典内容成功"
    Then I click the "EnsureButton" button
    Then I will see the "dictionary.ListPage" page
    And I will see the data "{'column':'0','name':'<dictionaryName>'}" values "{'column':'3','name':'<newTag>'}"

    Examples:
      | dictionaryName | newTag |
      | wymtest1.csv   | 无      |

  Scenario Outline: RZY-4140上传非同名文件
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "编辑" button
    Then I will see the "dictionary.CreatePage" page
    And I upload a file with name "/src/test/resources/testdata/dictionary/wymdoubletest1.csv"
    And I wait for "FileName" will be visible
    Then I click the "SaveButton" button
    Then I will see the message "更新字典文件必须和原字典文件同名"
    Then I click the "EnsureButton" button
    Then I click the "EditOnline" button
    Then I will see the element "EditOnlineArea" value is "<editOnlineArea>"

    Examples:
      | dictionaryName | editOnlineArea                                                                                         |
      | wymtest1.csv   | bubble.test^archiver.process.conns\nbubble.test^archiver.process.cpu\nbubble.test^archiver.process.fds |

  Scenario Outline: RZY-4142删除非同名文件
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "编辑" button
    Then I will see the "dictionary.CreatePage" page
    And I upload a file with name "/src/test/resources/testdata/dictionary/wymdoubletest1.csv"
    And I wait for "FileName" will be visible
    Then I click the "SaveButton" button
    Then I will see the message "更新字典文件必须和原字典文件同名"
    Then I click the "EnsureButton" button
    Then I click the "DeleteIcon1" button
    And I click the "SaveButton" button
    Then I will see the message "更新字典内容成功"
    Then I click the "EnsureButton" button
    Then I will see the "dictionary.ListPage" page
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "编辑" button
    Then I will see the "dictionary.CreatePage" page
    And I wait for "1000" millsecond
    Then I click the "EditOnline" button
    Then I will see the element "EditOnlineArea" value is "<editOnlineArea>"

    Examples:
      | dictionaryName | editOnlineArea                                                                                         |
      | wymtest1.csv   | bubble.test^archiver.process.conns\nbubble.test^archiver.process.cpu\nbubble.test^archiver.process.fds |

  Scenario Outline: RZY-4141上传同名文件
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "编辑" button
    Then I will see the "dictionary.CreatePage" page
    And I upload a file with name "/src/test/resources/testdata/dictionary/test/wymtest1.csv"
    And I wait for "FileName" will be visible
    Then I click the "SaveButton" button
    Then I will see the message "更新字典内容成功"
    Then I click the "EnsureButton" button
    Then I will see the "dictionary.ListPage" page
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "编辑" button
    Then I will see the "dictionary.CreatePage" page
    Then I click the "EditOnline" button
    Then I will see the element "EditOnlineArea" value is "<editOnlineArea>"

    Examples:
      | dictionaryName | editOnlineArea                                                       |
      | wymtest1.csv   | bubble.test^archiver.process.conns\nbubble.test^archiver.process.cpu |

  Scenario Outline: RZY-4144（在线编辑-撤销修改）
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "编辑" button
    Then I will see the "dictionary.CreatePage" page
    Then I click the "EditOnline" button
    Then I set the value "<edited>" to the textarea "EditOnlineArea"
    Then I click the "CancelButton" button
    Then I will see the element "EditOnlineArea" value is "<editOnlineArea>"

    Examples:
      | dictionaryName | editOnlineArea                                                       | edited |
      | wymtest1.csv   | bubble.test^archiver.process.conns\nbubble.test^archiver.process.cpu | 123456 |

  Scenario Outline: RZY-4143（在线编辑-保存修改）
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "编辑" button
    Then I will see the "dictionary.CreatePage" page
    Then I click the "EditOnline" button
    Then I set the value "<edited>" to the textarea "EditOnlineArea"
    Then I click the "SaveEdit" button
    Then I wait for "2000" millsecond
    Then I will see the message "更新字典内容成功"
    Then I click the "EnsureButton" button
    Then I will see the "dictionary.ListPage" page
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "编辑" button
    Then I will see the "dictionary.CreatePage" page
    Then I wait for "2000" millsecond
    And I click the "EditOnline" button
    Then I will see the element "EditOnlineArea" value is "<edited>"

    Examples:
      | dictionaryName | edited  |
      | wymtest1.csv   | rizhiyi |

  Scenario Outline: RZY-4145(列表页首次添加标签)
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "标签" button
    Then I set the parameter "Tag" with value "wymtest1"
    And I choose the "wymtest1" from the "Group"
    Then I click the "EnsureButton" button
    And I will see the success message "修改成功"
    Then I click the "EnsureButton" button
    And I will see the data "{'column':'0','name':'<dictionaryName>'}" values "{'column':'3','name':'<newTag>'}"

    Examples:
      | dictionaryName | newTag   |
      | wymtest1.csv   | wymtest1 |

  Scenario Outline: RZY-4146(列表页修改标签wymtest1->wymtest2)
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "标签" button
    Then I wait for "1000" millsecond
    Then I click the "ClearIcon1" button
    Then I set the parameter "Tag" with value "wymtest2"
    And I choose the "wymtest2" from the "Group"
    Then I click the "EnsureButton" button
    And I will see the success message "修改成功"
    Then I click the "EnsureButton" button
    And I wait for "1000" millsecond
    And I will see the data "{'column':'0','name':'<dictionaryName>'}" values "{'column':'3','name':'<newTag>'}"

    Examples:
      | dictionaryName | newTag   |
      | wymtest1.csv   | wymtest2 |

  Scenario Outline: RZY-4157(列表页增加标签wymtest1)
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "标签" button
    Then I set the parameter "Tag" with value "wymtest1"
    And I choose the "wymtest1" from the "Group"
    Then I click the "EnsureButton" button
    And I will see the success message "修改成功"
    Then I click the "EnsureButton" button
    And I wait for "2000" millsecond
    And I will see the data "{'column':'0','name':'<dictionaryName>'}" values "{'column':'3','name':'<newTag>'}"

    Examples:
      | dictionaryName | newTag             |
      | wymtest1.csv   | wymtest1, wymtest2 |

  Scenario: 按照标签搜索字典
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    And I choose the "wymtest1" from the "ResourceDropdown"
    And I wait for loading invisible
    Then I will see the search result contains "{'column':'0','name':'wymtest1.csv'}"

  Scenario Outline: RZY-4147(列表页清空全部标签)
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "标签" button
    And I wait for "2000" millsecond
    Then I click the "ClearIcon1" button
    Then I click the "ClearIcon2" button
    Then I click the "EnsureButton" button
    And I will see the success message "修改成功"
    Then I click the "EnsureButton" button
    And I will see the data "{'column':'0','name':'<dictionaryName>'}" values "{'column':'3','name':'<newTag>'}"

    Examples:
      | dictionaryName | newTag |
      | wymtest1.csv   | 无      |

  Scenario Outline: RZY-4151(授权页：添加用户权限-取消)
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "授权" button
    Then I set the parameter "UserFilter" with value "<user>"
    Then I wait for "2000" millsecond
    Then I "checked" the label before "<user>" in the dictionary
    Then I click the "AuthCancelButton" button
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "授权" button
    Then I set the parameter "UserFilter" with value "<user>"
    Then I wait for "2000" millsecond
    Then I check the label "unchecked" status before "<user>" in the dictionary

    Examples:
      | dictionaryName | user |
      | wymtest1.csv   | wym  |


  Scenario Outline: RZY-4149(授权页：添加用户权限-保存)
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "授权" button
    Then I set the parameter "UserFilter" with value "<user>"
    Then I wait for "2000" millsecond
    Then I "checked" the label before "<user>" in the dictionary
    Then I click the "EnsureButton" button
    Then I will see the success message "保存成功"
    Then I click the "EnsureButton2" button
    Then I check the label "checked" status before "<user>" in the dictionary

    Examples:
      | dictionaryName | user |
      | wymtest1.csv   | wym  |


  Scenario Outline: RZY-4150(授权页：取消用户权限-取消)
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "授权" button
    Then I set the parameter "UserFilter" with value "<user>"
    Then I wait for "2000" millsecond
    Then I "unchecked" the label before "<user>" in the dictionary
    Then I click the "AuthCancelButton" button
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "授权" button
    Then I set the parameter "UserFilter" with value "<user>"
    Then I wait for "2000" millsecond
    Then I check the label "checked" status before "<user>" in the dictionary

    Examples:
      | dictionaryName | user |
      | wymtest1.csv   | wym  |

  Scenario Outline: RZY-4152(授权页：取消用户权限-保存)
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "授权" button
    Then I set the parameter "UserFilter" with value "<user>"
    Then I wait for "2000" millsecond
    Then I "unchecked" the label before "<user>" in the dictionary
    Then I click the "EnsureButton" button
    Then I will see the success message "保存成功"
    Then I click the "EnsureButton2" button
    Then I check the label "unchecked" status before "<user>" in the dictionary

    Examples:
      | dictionaryName | user |
      | wymtest1.csv   | wym  |

  Scenario Outline: RZY-4160(授权页：自定义有效期-当前日期)
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "授权" button
    Then I set the parameter "UserFilter" with value "<user>"
    Then I wait for "2000" millsecond
    Then I "checked" the label before "<user>" in the dictionary
    Then I click the "Indefinitely" button
    Then I click the "Customize" button
    And I click the "TimeSelector" button
    Then I click the "DateNow" button
    And I click the "DateSelectConfirm" button
    Then I click the "EnsureButton" button
    Then I will see the success message "请选择合理的有效期限"
    Then I click the "EnsureButton2" button
    Then I wait for "1000" millsecond
    Then I click the "AuthCancelButton" button
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "授权" button
    Then I set the parameter "UserFilter" with value "<user>"
    Then I wait for "2000" millsecond
    Then I check the label "unchecked" status before "<user>" in the dictionary
    Then I will see the "DeadLine" result will be "无限期"

    Examples:
      | dictionaryName | user |
      | wymtest1.csv   | wym  |


  Scenario Outline: RZY-4160(授权页：自定义有效期-当前日期的下一天)
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "授权" button
    Then I set the parameter "UserFilter" with value "<user>"
    Then I wait for "2000" millsecond
    Then I "checked" the label before "<user>" in the dictionary
    Then I click the "Indefinitely" button
    Then I click the "Customize" button
    And I click the "TimeSelector" button
    Then I click the "DateNext" button
    And I click the "DateSelectConfirm" button
    Then I click the "EnsureButton" button
    Then I will see the success message "保存成功"
    Then I click the "EnsureButton2" button
    Then I wait for "1000" millsecond
    Then I click the "AuthCancelButton" button
    Then I wait for "1000" millsecond
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "授权" button
    Then I set the parameter "UserFilter" with value "<user>"
    Then I wait for "2000" millsecond
    Then I check the label "checked" status before "<user>" in the dictionary
    And I will see the element "DeadLine" contains "<customizeDate>"


    Examples:
      | dictionaryName | user | customizeDate |
      | wymtest1.csv   | wym  | 2020          |


  Scenario Outline: RZY-4162(授权页：自定义有效期-当前日期23时59分59秒)
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "授权" button
    Then I set the parameter "UserFilter" with value "<user>"
    Then I wait for "1000" millsecond
    Then I click the "DeadLine" button
    Then I wait for "1000" millsecond
    And I click the "TimeSelector" button
    Then I click the "DateNow" button
    Then I click the "SearchTime" button
    Then I click the "Hour23" button
    Then I click the "minute59" button
    Then I click the "second59" button
    And I click the "TimeSelectConfirm" button
    Then I click the "EnsureButton" button
    Then I will see the success message "保存成功"
    Then I click the "EnsureButton2" button
    Then I wait for "1000" millsecond
    Then I click the "AuthCancelButton" button
    Then I wait for "1000" millsecond
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "授权" button
    Then I set the parameter "UserFilter" with value "<user>"
    Then I wait for "2000" millsecond
    Then I check the label "checked" status before "<user>" in the dictionary
    And I will see the element "DeadLine" contains "<customizeDate>"

    Examples:
      | dictionaryName | user | customizeDate |
      | wymtest1.csv   | wym  | 23:59:59      |


  Scenario Outline: RZY-4161(授权页：自定义改为无限期)
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "授权" button
    Then I set the parameter "UserFilter" with value "<user>"
    Then I wait for "1000" millsecond
    Then I click the "DeadLine" button
    Then I wait for "1000" millsecond
    And I click the "UnCustomize" button
    Then I click the "EnsureButton" button
    Then I will see the success message "保存成功"
    Then I click the "EnsureButton2" button
    Then I wait for "1000" millsecond
    Then I click the "AuthCancelButton" button
    Then I wait for "1000" millsecond
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "授权" button
    Then I set the parameter "UserFilter" with value "<user>"
    Then I wait for "1000" millsecond
    Then I check the label "checked" status before "<user>" in the dictionary
    Then I will see the "DeadLine" result will be "无限期"
    Examples:
      | dictionaryName | user |
      | wymtest1.csv   | wym  |


  Scenario Outline: RZY-4158删除字典
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then I set the parameter "DictionaryFilter" with value "<dictionaryName>"
    Then I wait for "1000" millsecond
    Then I will see the "TotalItem" result will be "<totalItem>"
    Then I wait for "1000" millsecond
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "删除" button
    Then I will see the success message "确认删除 [wymtest1.csv] ?"
    Then I click the "EnsureButton" button
    Then I wait for "1000" millsecond
    Then I will see the success message "删除成功"
    Then I click the "EnsureButton" button
    Then I set the parameter "DictionaryFilter" with value "<dictionaryName>"
    Then I wait for "1000" millsecond
    Then I will see the message "暂无数据"

    Examples:
      | dictionaryName | totalItem |
      | wymtest1.csv   | 1         |
