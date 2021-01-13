Feature: 导入交易日

  @extra00 @trandate
  Scenario:执行导入
    When open the "system.CustomConfigs" page for uri "/system/"
    And I wait for loading complete
    When I upload a file "uploadTranDate" with name "/src/test/resources/testdata/app/trandatefiles/01tran.csv"
