<?php
/**
 * @file
 * openpublish_site_page.strongarm.inc
 */

/**
 * Implements hook_strongarm().
 */
function openpublish_site_page_strongarm() {
  $export = array();

  $strongarm = new stdClass;
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'node_options_openpublish_site_page';
  $strongarm->value = array(
    0 => 'status',
  );
  $export['node_options_openpublish_site_page'] = $strongarm;

  return $export;
}
