Feature: 新建collect使用索引

  Background:
    Given open the "index.ListPage" page for uri "/indexsettings/"

  @delcollect0
  Scenario Outline:
    Given the data name is "{'column':'0','name':'<name>'}" then i click the "删除" button
    And I click the "Ensure" button

    Examples:
      | name       |
      | collectone |
      | collecttocollect |
      | collecttwo  |
      | collectmodefalse  |
      | collectmodetrue  |
      | collectmulti  |
      | collectdelete  |
