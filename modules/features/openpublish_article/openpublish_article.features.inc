<?php
/**
 * @file
 * openpublish_article.features.inc
 */

/**
 * Implements hook_ctools_plugin_api().
 */
function openpublish_article_ctools_plugin_api() {
  list($module, $api) = func_get_args();
  if ($module == "strongarm" && $api == "strongarm") {
    return array("version" => "1");
  }
}

/**
 * Implements hook_node_info().
 */
function openpublish_article_node_info() {
  $items = array(
    'openpublish_article' => array(
      'name' => t('Article'),
      'base' => 'node_content',
      'description' => t('Used to create individual stories as would appear in News, Sport, or Business content areas.'),
      'has_title' => '1',
      'title_label' => t('Title'),
      'help' => '',
    ),
  );
  return $items;
}
