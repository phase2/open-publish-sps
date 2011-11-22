<?php
/**
 * @file
 * openpublish_section_fronts.strongarm.inc
 */

/**
 * Implements hook_strongarm().
 */
function openpublish_section_fronts_strongarm() {
  $export = array();

  $strongarm = new stdClass;
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'node_options_section_front';
  $strongarm->value = array(
    0 => 'status',
  );
  $export['node_options_section_front'] = $strongarm;

  return $export;
}
