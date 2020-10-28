# new feature
# Tags: optional

@cleanDictionary
Feature: 清理字典用例

  Scenario Outline: RZY-4158删除字典

    Then I set the parameter "DictionaryFilter" with value "<dictionaryName>"
    Then I wait for loading invisible
    Then I will see the "TotalItem" result will be "<totalItem>"
    Then the data name is "{'column':'0','name':'<dictionaryName>'}" then i click the "删除" button
    Then I wait for "1000" millsecond
    Then I will see the success message "确认删除 [<dictionaryName>] ?"
    Then I click the "EnsureButton" button
    Then I wait for "2000" millsecond
    Then I will see the success message "删除成功"
    Then I click the "EnsureButton" button


    Examples:
      | dictionaryName                  | totalItem |
      | wymtestcreate.csv               | 1         |
      | wymtestdownload.csv             | 1         |
      | wymtestchangetag.csv            | 1         |
      | wymtestauthorizecancel.csv      | 1         |
      | wymtestrevokeauthsave.csv       | 1         |
      | wymtestrevokeauthexit.csv       | 1         |
      | wymtestdifname.csv              | 1         |
      | wymtestsamename.csv             | 1         |
      | wymtestcanceledit.csv           | 1         |
      | wymtestsaveedit.csv             | 1         |
      | wymtestaddonetagatlistpage.csv  | 1         |
      | wymtestchangetagatlistpage.csv  | 1         |
      | wymtestaddmoretagatlistpage.csv | 1         |
      | wymtestauthorizesave.csv        | 1         |
      | wymtestcleartagatlistpage.csv   | 1         |
      | wymtest.csv                     | 1         |
      | wymtestcurrentdate.csv          | 1         |
      | wymtestnextday.csv              | 1         |