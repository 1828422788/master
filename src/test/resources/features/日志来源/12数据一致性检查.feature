@logSource @logSourceSmoke
Feature: 数据一致性检查（RZY-6324）

  Scenario Outline: 数据一致性检查

    Given open the "localUpload.ListPage" page for uri "/sources/input/os/"

    When I upload files "<filename>" for "<counts>" and "Tag" with "<tag>" "AppName" with"<appname>"
    And I wait for "4000" millsecond   #等待数据入库


    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the Parameter "SearchInput" with randomvalue "tag:<tag> AND appname:<appname>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "EventNumbers" change text to "<text>"


    Examples:
      | filename                                         | counts |tag                 |appname|text       |
      | /src/test/resources/testdata/log/2w.txt          |1       |ConsistencyCheck    |apache |事件(20000) |
      | /src/test/resources/testdata/log/2w.txt          |4       |ConsistencyCheck    |apache |事件(100000) |