Feature: Test spl fail cases

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  @v33fail
  Scenario Outline: spl fail
    Given I set the parameter "SearchInput" with value "<splQuery>"
    #When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count | limit 2"
    #And I wait for "1000" millsecond
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    #And I wait for "4000" millsecond
    #Then take a screenshot with name "<splcasename>"
    And I wait for "SplStatsRetTable" will be visible
    And I drag the scroll bar to the element "SplStatsRetTable"
    And I wait for "2000" millsecond
    And take part of "SplStatsRetTable" with name "actual/<splcasename>"
    Then I compare source image "expect/<splcasename>" with target image "actual/<splcasename>"

    Examples:
      |splcasename| splQuery|
  |dbxoutput_output_sample |tag:sample04061424_chart | sort by apache.x_forward | limit 10 | table apache.x_forward, apache.resp_len, apache.referer_domain, apache.geo.city | dbxoutput output="outsample"
  |dbxoutput_output_u_sample | tag:sample04061424_chart | sort by apache.x_forward | limit 10 | table apache.x_forward, apache.resp_len, apache.referer_domain, apache.geo.city | dbxoutput output="outsample_u"
  |dbxoutput_limit_output_sample | tag:sample04061424_chart | table apache.x_forward, apache.resp_len, apache.referer_domain, apache.geo.city | limit 10 | dbxoutput output="outsample"

#      | geostats_sample_count | tag:vendors_461 \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt \| limit 15 |
#      | geostats_outputlatfield_outputlongfield_count | tag:vendors_461 \| geostats outputlatfield=res_latfield outputlongfield=res_longfield latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt \| limit 15 |
#      | geostats_binspanlat_binspanlong_count | tag:vendors_461 \| geostats binspanlat=22.5 binspanlong=45.0 latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt \| limit 15 |
#      | geostats_maxzoomlevel_count_sample | tag:vendors_461 AND vendors.VendorCountry:China* \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=1 count(vendors.Weight) \| limit 15 |
#      | geostats_maxzoomlevel_count | tag:vendors_461 AND vendors.VendorCountry:China* \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 count(vendors.Weight) \| limit 15 |
#      | geostats_china_maxzoomlevel_count_by_province | tag:vendors_461 AND vendors.VendorCountry:China* \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 count(vendors.Weight) by vendors.VendorStateProvince \| limit 15 |
#      | geostats_maxzoomlevel_count_by_province | tag:vendors_461 \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 count(vendors.Weight) by vendors.VendorStateProvince \| limit 15 |
#      | geostats_china_maxzoomlevel_sum_by_province | tag:vendors_461 AND vendors.VendorCountry:China* \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 sum(vendors.Weight)  by vendors.VendorStateProvince \| limit 15 |
#      | geostats_maxzoomlevel_sum_by_province | tag:vendors_461 \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 sum(vendors.Weight)  by vendors.VendorStateProvince \| limit 15 |
