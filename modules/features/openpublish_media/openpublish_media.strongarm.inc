<?php
/**
 * @file
 * openpublish_media.strongarm.inc
 */

/**
 * Implements hook_strongarm().
 */
function openpublish_media_strongarm() {
  $export = array();

  $strongarm = new stdClass;
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'menu_options_openpublish_photo_gallery';
  $strongarm->value = array(
    0 => 'main-menu',
  );
  $export['menu_options_openpublish_photo_gallery'] = $strongarm;

  $strongarm = new stdClass;
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'menu_options_openpublish_video';
  $strongarm->value = array(
    0 => 'main-menu',
  );
  $export['menu_options_openpublish_video'] = $strongarm;

  $strongarm = new stdClass;
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'menu_parent_openpublish_photo_gallery';
  $strongarm->value = 'main-menu:0';
  $export['menu_parent_openpublish_photo_gallery'] = $strongarm;

  $strongarm = new stdClass;
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'menu_parent_openpublish_video';
  $strongarm->value = 'main-menu:0';
  $export['menu_parent_openpublish_video'] = $strongarm;

  $strongarm = new stdClass;
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'node_options_openpublish_photo_gallery';
  $strongarm->value = array(
    0 => 'status',
  );
  $export['node_options_openpublish_photo_gallery'] = $strongarm;

  $strongarm = new stdClass;
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'node_options_openpublish_video';
  $strongarm->value = array(
    0 => 'status',
  );
  $export['node_options_openpublish_video'] = $strongarm;

  $strongarm = new stdClass;
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'node_preview_openpublish_photo_gallery';
  $strongarm->value = '1';
  $export['node_preview_openpublish_photo_gallery'] = $strongarm;

  $strongarm = new stdClass;
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'node_preview_openpublish_video';
  $strongarm->value = '1';
  $export['node_preview_openpublish_video'] = $strongarm;

  $strongarm = new stdClass;
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'node_submitted_openpublish_photo_gallery';
  $strongarm->value = 1;
  $export['node_submitted_openpublish_photo_gallery'] = $strongarm;

  $strongarm = new stdClass;
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'node_submitted_openpublish_video';
  $strongarm->value = 0;
  $export['node_submitted_openpublish_video'] = $strongarm;

  return $export;
}
