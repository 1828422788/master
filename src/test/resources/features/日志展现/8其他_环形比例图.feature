@all @logDisplay @logDisplayOther @logDisplayRing
Feature: 日志展现_8其他_环形比例图

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I drag the element "SearchPageSvg" to the "left" side

  @logDisplaySmoke
  Scenario Outline:  环形比例图(RZY-4198,4199)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "count_perc" from the "FieldValue"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Orange" button
    And I wait for "1000" millsecond
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "<chartType>Element_1" will be visible
    And I will see the element "<chartType>Element_1" contains "78%"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "<chartType>Element_1" will be visible
    And I will see the element "<chartType>Element_1" contains "78%"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/6其它_<chartType>_<caseNum>"
    Then I compare source image "actual/高级搜索视图/6其它_<chartType>_<caseNum>" with target image "expect/高级搜索视图/6其它_<chartType>_<caseNum>"

    Examples:
      |  chartType    |  caseNum  |   spl   |
      |   Ring        |  onefield |starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count, apache.clientip \|eval count_perc=ip_count/50 \| eval count2_perc=ip_count/200 \| limit 6 |

  Scenario Outline:  环形比例图(RZY-4200)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "count_perc" from the "FieldValue"
    And I click the "Compare" button
    And I choose the "count2_perc" from the "FieldValue"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "<chartType>Element_1" will be visible
    And I will see the element "<chartType>Element_1" contains "78%"
    And I will see the element "<chartType>Element_2" contains "20%"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/6其它_<chartType>_<caseNum>"
    Then I compare source image "actual/高级搜索视图/6其它_<chartType>_<caseNum>" with target image "expect/高级搜索视图/6其它_<chartType>_<caseNum>"

    Examples:
      |  chartType    |  caseNum  |   spl   |
      |   Ring        |  twofields|starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count, apache.clientip \|eval count_perc=ip_count/50 \| eval count2_perc=ip_count/200 \| limit 6 |

  Scenario Outline:  环形比例图_分面(RZY-4201)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" <spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "count_perc" from the "FieldValue"
    And I click the "Compare" button
    And I choose the "count2_perc" from the "FieldValue"
    And I click the "Facet" button
    And I choose the "apache.clientip" from the "FieldValue"
    And I set the parameter "RowNum" with value "<rows>"
    And I set the parameter "ColumnNum" with value "<columns>"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "<chartType>Element_1" will be visible
    And I will see the element "<chartType>Element_1" contains "78%"
    And I will see the element "<chartType>Element_2" contains "20%"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/6其它_<chartType>_<caseNum>"
    Then I compare source image "actual/高级搜索视图/6其它_<chartType>_<caseNum>" with target image "expect/高级搜索视图/6其它_<chartType>_<caseNum>"

    Examples:
      |  chartType    |    caseNum   | rows    |  columns  |   spl   |
      |   Ring        | table_3r_2c  |  3      |   2       | tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count, apache.clientip \|eval count_perc=ip_count/50 \| eval count2_perc=ip_count/200 \| limit 6 |
      |   Ring        | table_1r_4c  |  1      |   4       | tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count, apache.clientip \|eval count_perc=ip_count/50 \| eval count2_perc=ip_count/200 \| limit 6 |

  Scenario Outline:  环形比例图_颜色(RZY-4202)
    When I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "count_perc" from the "FieldValue"
    And I click the "Compare" button
    And I choose the "count2_perc" from the "FieldValue"
    And I click the "Facet" button
    And I choose the "apache.clientip" from the "FieldValue"
    And I set the parameter "RowNum" with value "<rows>"
    And I set the parameter "ColumnNum" with value "<columns>"
    And I click the "Exhibition" button
    And I click the "AccordingArea" button

    And I click the "AddRange" button
    And I set the parameter "MinRange" with value "0"
    And I set the parameter "MaxRange" with value "0.2"
    And I click the "AddColor" button
    And I click the "Red" button
    And I click the "AddRange" button

    And I set the parameter "MinRange" with value "0.2"
    And I set the parameter "MaxRange" with value "0.7"
    And I click the "AddColor" button
    And I click the "Yellow" button
    And I click the "AddRange" button

    And I set the parameter "MinRange" with value "0.7"
    And I set the parameter "MaxRange" with value "1"
    And I click the "AddColor" button
    And I click the "Green" button
    And I wait for "1000" millsecond

    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "<chartType>Element_1" will be visible
    And I will see the element "<chartType>Element_1" contains "78%"
    And I will see the element "<chartType>Element_2" contains "20%"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "<chartType>Element_1" will be visible
    And I will see the element "<chartType>Element_1" contains "78%"
    And I will see the element "<chartType>Element_2" contains "20%"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/6其它_<chartType>_<caseNum>"
    Then I compare source image "actual/高级搜索视图/6其它_<chartType>_<caseNum>" with target image "expect/高级搜索视图/6其它_<chartType>_<caseNum>"

    Examples:
      |  chartType    |    caseNum          | rows    |  columns  |   spl   |
      |   Ring        | table_1r_3c_colors  |  1      |   3       | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count, apache.clientip \|eval count_perc=ip_count/50 \| eval count2_perc=ip_count/200 \| limit 6 |

  Scenario Outline:  环形比例图_数据精度(RZY-4203)
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| stats count(apache.clientip) as ip_count by apache.clientip \| sort by ip_count, apache.clientip \|eval count_perc=ip_count/51 \| eval count2_perc=ip_count/204 \| limit 5 "
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I choose the "count_perc" from the "FieldValue"
    And I click the "Compare" button
    And I choose the "count2_perc" from the "FieldValue"
    And I click the "Facet" button
    And I choose the "apache.clientip" from the "FieldValue"
    And I set the parameter "RowNum" with value "2"
    And I set the parameter "ColumnNum" with value "3"
    And I click the "Exhibition" button
    And I choose the "<num>" from the "Precision"
    And I click the "Generate" button

    And I click the "Settings" button
    And I wait for "<chartType>Element_1" will be visible
    And I will see the element "<chartType>Element_1" contains "<num1>"
    And I will see the element "<chartType>Element_2" contains "<num2>"
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/6其它_<chartType>_<caseNum><num>"
    Then I compare source image "actual/高级搜索视图/6其它_<chartType>_<caseNum><num>" with target image "expect/高级搜索视图/6其它_<chartType>_<caseNum><num>"

    Examples:
      |  chartType    |  num |   caseNum       |  num1    |   num2   |
      |   Ring        |  1   |    Precision    | 76.5%    | 19.1%    |
      |   Ring        |  2   |    Precision    | 76.47%   | 19.12%   |
      |   Ring        |  3   |    Precision    | 76.471%  | 19.118%  |