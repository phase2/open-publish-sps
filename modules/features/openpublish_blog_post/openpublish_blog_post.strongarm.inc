<?php
/**
 * @file
 * openpublish_blog_post.strongarm.inc
 */

/**
 * Implements hook_strongarm().
 */
function openpublish_blog_post_strongarm() {
  $export = array();

  $strongarm = new stdClass;
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'node_options_openpublish_blog_post';
  $strongarm->value = array(
    0 => 'status',
  );
  $export['node_options_openpublish_blog_post'] = $strongarm;

  return $export;
}
