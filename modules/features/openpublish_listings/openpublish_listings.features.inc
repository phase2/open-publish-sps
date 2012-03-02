<?php
/**
 * @file
 * openpublish_listings.features.inc
 */

/**
 * Implements hook_ctools_plugin_api().
 */
function openpublish_listings_ctools_plugin_api() {
  list($module, $api) = func_get_args();
  if ($module == "boxes" && $api == "box") {
    return array("version" => "1");
  }
}

/**
 * Implements hook_views_api().
 */
function openpublish_listings_views_api() {
  list($module, $api) = func_get_args();
  if ($module == "views" && $api == "views_default") {
    return array("version" => "3.0");
  }
}

/**
 * Implements hook_image_default_styles().
 */
function openpublish_listings_image_default_styles() {
  $styles = array();

  // Exported image style: featured_story
  $styles['featured_story'] = array(
    'name' => 'featured_story',
    'effects' => array(
      2 => array(
        'label' => 'Scale and crop',
        'help' => 'Scale and crop will maintain the aspect-ratio of the original image, then crop the larger dimension. This is most useful for creating perfectly square thumbnails without stretching the image.',
        'effect callback' => 'image_scale_and_crop_effect',
        'dimensions callback' => 'image_resize_dimensions',
        'form callback' => 'image_resize_form',
        'summary theme' => 'image_resize_summary',
        'module' => 'image',
        'name' => 'image_scale_and_crop',
        'data' => array(
          'width' => '624',
          'height' => '387',
        ),
        'weight' => '1',
      ),
    ),
  );

  return $styles;
}
