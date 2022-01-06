@clear_remote_index
Feature: 清除远端索引


  Scenario Outline:
    Given open the "remoteIndex.ListPage" page for uri "/remoteindex/"

#    When I set the parameter "SearchNameInput" with value "<dbLookupName>"
    When the data name is "{'column':'1','name':'<clusterName>':'<remoteIndexName>'}" then i click the "删除" button in more menu

    And I wait for "1000" millsecond
    And I click the "EnsureButton" button

    Examples: 新建成功
      | clusterName | remoteIndexName  |
      | beaver184   | collectone       |
      | beaver184   | collecttocollect |
      | beaver184   | collecttwo       |
      | beaver184   | collectmodefalse |
      | beaver184   | collectmodetrue  |
      | beaver184   | collectmulti     |
      | beaver184   | collectdelete    |
      | beaver184   | iflink1          |
      | beaver184   | iflink2          |
