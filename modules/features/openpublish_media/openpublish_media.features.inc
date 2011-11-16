<?php
/**
 * @file
 * openpublish_media.features.inc
 */

/**
 * Implements hook_ctools_plugin_api().
 */
function openpublish_media_ctools_plugin_api() {
  list($module, $api) = func_get_args();
  if ($module == "strongarm" && $api == "strongarm") {
    return array("version" => "1");
  }
}

/**
 * Implements hook_node_info().
 */
function openpublish_media_node_info() {
  $items = array(
    'openpublish_photo_gallery' => array(
      'name' => t('Photo Gallery'),
      'base' => 'node_content',
      'description' => t('Create galleries from image media assets available on the site.'),
      'has_title' => '1',
      'title_label' => t('Title'),
      'help' => '',
    ),
    'openpublish_video' => array(
      'name' => t('Video'),
      'base' => 'node_content',
      'description' => t('Create content items with embedded video media assets.'),
      'has_title' => '1',
      'title_label' => t('Title'),
      'help' => '',
    ),
  );
  return $items;
}
