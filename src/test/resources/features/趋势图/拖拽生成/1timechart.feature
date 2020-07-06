@dragAndDrop @dragAndDropTimechart
Feature: 拖拽生成趋势图_timechart

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page


  Scenario Outline: drag_and_drop_timechart
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    Then I wait for "CheckBox" will be visible
    When I "checked" the checkbox which name is "timestamp" in trend page
    And I wait for "CheckBox" will be visible
    And I "checked" the checkbox which name is "apache.clientip" in trend page
    And I wait for "CheckBox" will be visible
    Then I click the "NextButton" button

    When I will see the "trend.DragAndDropPage" page
    And I wait for "Dimensions" will be visible
    And I drag the element "Timestamp" to the "Dimensions"
    And I drag the element "Clientip" to the "Values"
    And I click the "<chartType>" button
    And I wait for "2000" millsecond
    Then I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    When I click the "ElementInDimensions" button
    And I set the parameter "Span" with value "<span>"
    And I set the parameter "MinSpan" with value "<minspan>"
    And I set the parameter "Bins" with value "<bins>"
    And I hide the element "Panel"
    And I wait for "ElementInValues" will be visible
    And I click the "CompareButton" button
    And I wait for "1000" millsecond
    And I wait for "Chart" will be visible
    And I wait for "ElementInValues" will be visible
    When I click the "ElementInValues" button
    And I wait for "Min" will be visible
    And I click the "<button>" button
    And I set the parameter "Unit" with value "<unit>"
    And I set the parameter "Min" with value "<min>"
    And I set the parameter "Max" with value "<max>"
    And I click the "CompareField" button
    And I click the "<comparePeriod>" button
    And I click the "Timestamp" button

    And I wait for "1500" millsecond
    And I wait for "AddColor" will be visible
    And I click the "AddColor" button
    And I wait for "<color>" will be visible
    And I wait for "1500" millsecond
    And I click the "<color>" button
    And I wait for "3000" millsecond
    And I wait for "Chart" will be visible

    And I click the "CheckSPL" button
    And I will see the element "SPL" contains "<SPLcheck>"
    When I click the "CloseSPL" button
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/<chartType>_timechart"
    And I click the "NextButton" button

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>_timechart"
    And I set the parameter "DescribeInput" with value "<comparePeriod>_<button>_<unit>_<min>_<max>_<color>"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType | span  |  minspan | bins | comparePeriod | button           | unit | min | max | color  | SPLcheck |
      |  Line      | 1h    |  20m     | 24   | Yesterday     | Smooth           |  个  | 0.5 | 80  | Orange | starttime="now/d" endtime="now" tag:sample04061424_chart \| timechart span=1h minspan=20m bins=24 count(apache.clientip)\| eval hour=formatdate(_time, "dd-hh")\| eval _compare="当前" \| append [[ starttime="now/d-1d" endtime="now-1d" tag:sample04061424_chart \| timechart span=1h minspan=20m bins=24 count(apache.clientip)\| eval hour=formatdate(_time, "dd-hh")\| eval _compare="环比" ]] |
      |  Area      | 20m   |          |      | LastWeek      | ConnectEmptyData | pcs. |     | 28  | Yellow | starttime="now/d" endtime="now" tag:sample04061424_chart \| timechart span=20m count(apache.clientip)\| eval minute=formatdate(_time, "hh:mm")\| eval _compare="当前" \| append [[ starttime="now/d-1w" endtime="now-1w" tag:sample04061424_chart \| timechart span=20m count(apache.clientip)\| eval minute=formatdate(_time, "hh:mm")\| eval _compare="同比一周" ]] |
      |  Scatter   | 40m   |          |      | LastMonth     |                  |      |     |     | Red    | starttime="now/d" endtime="now" tag:sample04061424_chart \| timechart span=40m count(apache.clientip)\| eval minute=formatdate(_time, "hh:mm")\| eval _compare="当前" \| append [[ starttime="now/d-1M" endtime="now-1M" tag:sample04061424_chart \| timechart span=40m count(apache.clientip)\| eval minute=formatdate(_time, "hh:mm")\| eval _compare="同比一月" ]] |
      |  Column    | 1h    |  1h      | 24   | LastYear      |                  | r.   | 1   |     | Orange | starttime="now/d" endtime="now" tag:sample04061424_chart \| timechart span=1h minspan=1h bins=24 count(apache.clientip)\| eval hour=formatdate(_time, "dd-hh")\| eval _compare="当前" \| append [[ starttime="now/d-1y" endtime="now-1y" tag:sample04061424_chart \| timechart span=1h minspan=1h bins=24 count(apache.clientip)\| eval hour=formatdate(_time, "dd-hh")\| eval _compare="同比一年" ]] |
