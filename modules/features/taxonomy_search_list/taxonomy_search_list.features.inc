<?php
/**
 * @file
 * taxonomy_search_list.features.inc
 */

/**
 * Implements hook_views_api().
 */
function taxonomy_search_list_views_api() {
  list($module, $api) = func_get_args();
  if ($module == "views" && $api == "views_default") {
    return array("version" => "3.0");
  }
}

/**
 * Implements hook_default_search_api_facet().
 */
function taxonomy_search_list_default_search_api_facet() {
  $items = array();
  $items['openpublish_node_ind_field_topic'] = entity_import('search_api_facet', '{
    "delta" : "openpublish_node_ind_field_topic",
    "index_id" : "openpublish_node_index",
    "field" : "field_topic",
    "name" : "openpublish_node_index: Topic",
    "enabled" : "1",
    "options" : {
      "limit" : 10,
      "display_more_link" : false,
      "more_limit" : 10,
      "min_count" : 1,
      "sort" : "count",
      "missing" : false,
      "show_active" : true,
      "default_true" : true,
      "ids_list" : [],
      "type" : "",
      "field_name" : "Topic",
      "entity_type" : "taxonomy_term"
    },
    "rdf_mapping" : []
  }');
  return $items;
}
