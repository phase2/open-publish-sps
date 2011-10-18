<?php
/**
 * @file
 * openpublish_advanced_taxonomy.features.inc
 */

/**
 * Implements hook_ctools_plugin_api().
 */
function openpublish_advanced_taxonomy_ctools_plugin_api() {
  list($module, $api) = func_get_args();
  if ($module == "context" && $api == "context") {
    return array("version" => "3");
  }
}

/**
 * Implements hook_views_api().
 */
function openpublish_advanced_taxonomy_views_api() {
  list($module, $api) = func_get_args();
  if ($module == "views" && $api == "views_default") {
    return array("version" => "3.0");
  }
}
