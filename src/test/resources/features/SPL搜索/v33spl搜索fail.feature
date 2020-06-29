@v33new
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
    And I wait for "5000" millsecond
    And take part of "SplStatsRetTable" with name "actual/<splcasename>"
    Then I compare source image "expect/<splcasename>" with target image "actual/<splcasename>"

    Examples:
      |splcasename| splQuery|
      | where_in_null_resp_len | tag:sample04061424 \| table apache.resp_len, apache.x_forward \| where apache.resp_len in () |
      | eval_in_status_v_null_limit | tag:sample04061424 \| sort by apache.x_forward \| limit 10 \| eval is_in=in(apache.status) \| table apache.status, is_in,apache.x_forward |
      | dbxoutput_output_sample | tag:sample04061424_chart \| sort by apache.x_forward \| limit 10 \| table apache.x_forward, apache.resp_len, apache.referer_domain, apache.geo.city \| dbxoutput output=\"outsample\" |
      | dbxoutput_output_u_sample | tag:sample04061424_chart \| sort by apache.x_forward \| limit 10 \| table apache.x_forward, apache.resp_len, apache.referer_domain, apache.geo.city \| dbxoutput output=\"outsample_u\" |
      | dbxoutput_limit_output_sample | tag:sample04061424_chart \| eval int_x_forward= tolong(apache.x_forward) \| sort by +int_x_forward\| limit 10 \| table apache.x_forward, apache.resp_len \| dbxlookup file_name connection=\"v33dbx\" query=\"SELECT * FROM v33dbx.lookupsample\" on apache.x_forward=domain_id |
      | dbxlookup_lookup_aschinese | tag:sample04061424_chart \| eval int_x_forward= tolong(apache.x_forward) \| sort by +int_x_forward\| limit 10 \| table apache.x_forward, apache.resp_len \| dbxlookup file_name as '字典', defination_name as '名称' connection=\"v33dbx\" query=\"SELECT * FROM v33dbx.lookupsample\" on apache.x_forward=domain_id |
      | dbxlookup_lookup_as_where | tag:sample04061424 \| table apache.x_forward \| dbxlookup file_name as filename,verify_code as verifycode connection=\"v33dbx\" query=\"SELECT * FROM v33dbx.lookupsample\" on apache.x_forward=domain_id \| where !empty(filename) |
      | where_in_resp_len_sample | tag:sample04061424 \| table apache.resp_len,apache.x_forward \| where in(apache.resp_len, 1955,1954,1953,1952) |
      | where_in_resp_len_sample_another_format | tag:sample04061424 \| table apache.resp_len,apache.x_forward \| where apache.resp_len in (1955,1954,1953,1952) |
      | eval_in_resp_len_sample | tag:sample04061424 \| eval is_in = in(apache.resp_len, 1955,1954,1953,1952) \| table apache.resp_len, is_in, apache.x_forward \| sort by apache.x_forward \| limit 10 |
      | eval_in_if_not_resp_len | tag:sample04061424 \| eval is_in_if = if(in(apache.resp_len, 1955,1954,1953,1952), true, false) \| eval no_is_in_if = ! is_in_if \| table apache.resp_len, is_in_if, no_is_in_if, apache.x_forward \| sort by apache.x_forward \| limit 10 |
      | eval_not_in_resp_len | tag:sample04061424 \| eval is_in = in(apache.resp_len, -1, -2) \| table apache.resp_len, is_in, apache.x_forward \| sort by apache.x_forward \| limit 10 |
      | eval_in_flist_loat_v_float | tag:traceip_list_3 \| eval is_in=in(json.cost,4.993,8.973 ) \| table json.cost, is_in |
      | eval_in_forward_v_params | tag:sample04061424 \| eval is_in=in(apache.x_forward, apache.x_forward) \| table apache.status, apache.resp_len, is_in, apache.x_forward \| sort by apache.x_forward \| limit 10 |
      | eval_in_refererdomain_v_params | tag:sample04061424 \| eval is_in=in(apache.referer_domain, apache.referer_domain) \| table apache.resp_len, is_in, apache.referer_domain \| sort by apache.referer_domain \| limit 10 |
      | eval_in_resp_len_v_params_where | tag:sample04061424 \| eval is_in=in(apache.resp_len, apache.status,4653, 2017, 2020) \| where is_in==true \| table apache.status, apache.resp_len, is_in, apache.x_forward \| sort by apache.x_forward |
      | eval_in_resp_len_v_list | tag:sample04061424 \| eval is_in=in(apache.resp_len, apache.status,4653, 2017, 2020) \| where is_in==true \| table apache.status, apache.resp_len, is_in, apache.x_forward \| sort by apache.x_forward |
      | eval_in_data_list_v_data_list | tag:sample04061424 \| sort by apache.x_forward \| limit 3 \| eval list123_1=mvappend(1,2,3) \| eval list123_2=mvappend(1,2,3) \| eval is_in=in(list123_1, list123_2) \| table list123_1,is_in |
      | eval_in_string_list_v_string_list | tag:sample04061424 \| sort by apache.x_forward \| limit 1 \| eval citylist=mvappend(\"beijing\", \"tianjin\", \"Shanghai\") \| eval is_in=in(citylist, citylist) \| table citylist, is_in |
      | eval_in_string_list_v_string_list_false | tag:jpath_mvzip_1 \| eval citylist=mvappend(\"beijing1\", \"tianjin1\", \"Shanghai1\") \| eval is_in=in(json.a[].city, citylist) \| table citylist, json.a[].city, is_in |
      | kvstore_sample_stats_rename_outputlookup_csv | starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| eval int_x_forward= tolong(apache.x_forward) \| sort by +int_x_forward \| limit 10 \| stats count() as cnt by apache.clientip, apache.status \| outputlookup cnt_ip_status.csv |
      | kvstore_sample_inputlookup_csv | \| inputlookup cnt_ip_status.csv |
      | partition_status_stats_sample | tag:sample04061424 \| partition 5 by apache.status [[ stats count() by apache.status ]] |
      | partition_status_chart_sample | tag:sample04061424 \| partition 3 by apache.status [[ chart count() over apache.status span=\"100\" ]] |
      | newfields_keep_ipstatus_limit_table_ipstatus_tag | tag:sample04061424 \| sort by apache.x_forward \| fields + apache.status, apache.clientip \| limit 10 \| table apache.status, apache.clientip, tag |
      | newfields_keep_ipstatus_table_tagmethod | tag:sample04061424 \| sort by apache.x_forward \| limit 10 \| fields + apache.status, apache.clientip \| table tag, apache.method, apache.status |
      | limit_newfields_batch_keep_apache_remove_apacher_table | tag:sample04061424 \| sort by apache.x_forward \| limit 10 \| fields + apache.* \| fields - apache.g*, apache.r*, apache.timestamp,apache.ua \| table apache.* |
      | newfields_remove_tagappname_table_tagstatus | tag:sample04061424 \| sort by apache.x_forward \| fields - appname, tag \| table tag, apache.status |
      | newfields_remove_tag_keep_tag_table | tag:sample04061424 \| sort by apache.x_forward \| limit 10 \| fields - tag \| fields + tag \| table tag |
      | newfields_batch_keep_apache_limit_count_byip | tag:sample04061424 \| sort by apache.x_forward \| fields + apache.* \| limit 13 \| stats count() by apache.clientip |
      | newfields_keep_noexistfield | tag:sample04061424 \| sort by apache.x_forward \| limit 10 \| fields + noexistfield1, noexistfield2 \| table noexistfield1, noexistfield2, tag |
      | newfields_remove_noexistfield | tag:sample04061424 \| sort by apache.x_forward \| limit 10 \| fields - noexistfield1, noexistfield2 \| table apache.x_forward, apache.resp_len, apache.referer_domain, apache.clientip |
      | newfields_batch_remove_spacesplit_table | tag:sample04061424 \| sort by apache.x_forward \| limit 10 \| fields - apache.* raw_message  \| table tag, apache.x_forward |
      | newfields_batch_remove_apache_sample | tag:sample04061424 \| sort by apache.x_forward \| limit 10 \| fields - apache.*, raw_message \| table tag, apache.status |
      | newfields_keep_ipstatus_limit_sample | tag:sample04061424 \| sort by apache.x_forward \| sort by apache.x_forward \| limit 10 \| fields + apache.status, apache.clientip \| table apache.status, apache.clientip, tag |
      | limit_newfields_batch_keep_apache_count_byip | tag:sample04061424 \| sort by apache.x_forward \| limit 10 \| fields + apache.* \| stats count() by apache.clientip |


#      | geostats_sample_count | tag:vendors_461 \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt \| limit 15 |
#      | geostats_outputlatfield_outputlongfield_count | tag:vendors_461 \| geostats outputlatfield=res_latfield outputlongfield=res_longfield latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt \| limit 15 |
#      | geostats_binspanlat_binspanlong_count | tag:vendors_461 \| geostats binspanlat=22.5 binspanlong=45.0 latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude count() as cnt \| limit 15 |
#      | geostats_maxzoomlevel_count_sample | tag:vendors_461 AND vendors.VendorCountry:China* \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=1 count(vendors.Weight) \| limit 15 |
#      | geostats_maxzoomlevel_count | tag:vendors_461 AND vendors.VendorCountry:China* \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 count(vendors.Weight) \| limit 15 |
#      | geostats_china_maxzoomlevel_count_by_province | tag:vendors_461 AND vendors.VendorCountry:China* \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 count(vendors.Weight) by vendors.VendorStateProvince \| limit 15 |
#      | geostats_maxzoomlevel_count_by_province | tag:vendors_461 \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 count(vendors.Weight) by vendors.VendorStateProvince \| limit 15 |
#      | geostats_china_maxzoomlevel_sum_by_province | tag:vendors_461 AND vendors.VendorCountry:China* \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 sum(vendors.Weight)  by vendors.VendorStateProvince \| limit 15 |
#      | geostats_maxzoomlevel_sum_by_province | tag:vendors_461 \| geostats latfield=vendors.VendorLatitude longfield=vendors.VendorLongitude maxzoomlevel=3 sum(vendors.Weight)  by vendors.VendorStateProvince \| limit 15 |
