<?php
/**
 * @file
 * recent_videos_box.box.inc
 */

/**
 * Implements hook_default_box().
 */
function recent_videos_box_default_box() {
  $export = array();

  $box = new stdClass;
  $box->disabled = FALSE; /* Edit this to true to make a default box disabled initially */
  $box->api_version = 1;
  $box->delta = 'op_recent_videos';
  $box->plugin_key = 'view';
  $box->title = 'Recent Videos';
  $box->description = 'Open Publish Recent Videos';
  $box->options = array(
    'view' => 'op_recent_content--block_3',
    'settings' => array(
      'limit' => '3',
    ),
    'view_object' => NULL,
    'view_more_text' => '',
    'view_more_link' => '',
    'expose_filters' => 0,
    'additional_classes' => '',
  );
  $export['op_recent_videos'] = $box;

  return $export;
}
