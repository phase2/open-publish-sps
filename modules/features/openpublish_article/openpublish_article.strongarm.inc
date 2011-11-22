<?php
/**
 * @file
 * openpublish_article.strongarm.inc
 */

/**
 * Implements hook_strongarm().
 */
function openpublish_article_strongarm() {
  $export = array();

  $strongarm = new stdClass;
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'menu_options_openpublish_article';
  $strongarm->value = array(
    0 => 'main-menu',
  );
  $export['menu_options_openpublish_article'] = $strongarm;

  $strongarm = new stdClass;
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'menu_parent_openpublish_article';
  $strongarm->value = 'main-menu:0';
  $export['menu_parent_openpublish_article'] = $strongarm;

  $strongarm = new stdClass;
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'node_options_openpublish_article';
  $strongarm->value = array(
    0 => 'status',
  );
  $export['node_options_openpublish_article'] = $strongarm;

  $strongarm = new stdClass;
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'node_preview_openpublish_article';
  $strongarm->value = '1';
  $export['node_preview_openpublish_article'] = $strongarm;

  $strongarm = new stdClass;
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'node_submitted_openpublish_article';
  $strongarm->value = 1;
  $export['node_submitted_openpublish_article'] = $strongarm;

  return $export;
}
