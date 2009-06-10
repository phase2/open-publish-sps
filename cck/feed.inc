<?php

$content['type']  = array (
  'name' => 'Feed',
  'type' => 'feed',
  'description' => 'Items from these Feeds will be turned into Feed Item nodes, which will appear on the Homepage or can be used elsewhere in the system.',
  'title_label' => 'Title',
  'body_label' => 'Body',
  'min_word_count' => '0',
  'help' => '',
  'node_options' => 
  array (
    'status' => true,
    'promote' => false,
    'sticky' => false,
    'revision' => false,
  ),
  'language_content_type' => '0',
  'upload' => '0',
  'nodewords' => 0,
  'old_type' => 'feed',
  'orig_type' => 'feed',
  'module' => 'node',
  'custom' => '1',
  'modified' => '1',
  'locked' => '0',
  'rdf_schema_class' => '',
  'comment' => '0',
  'comment_default_mode' => '4',
  'comment_default_order' => '1',
  'comment_default_per_page' => '50',
  'comment_controls' => '3',
  'comment_anonymous' => 0,
  'comment_subject_field' => '1',
  'comment_preview' => '1',
  'comment_form_location' => '0',
  'xmlsitemap_node_type_priority' => '0.5',
  'xmlsitemap_old_priority' => '0.5',
  'feedapi' => 
  array (
    'enabled' => 1,
    'refresh_on_create' => 1,
    'update_existing' => 1,
    'skip' => 0,
    'items_delete' => '0',
    'parsers' => 
    array (
      'parser_simplepie' => 
      array (
        'enabled' => 1,
        'weight' => '0',
      ),
    ),
    'processors' => 
    array (
      'feedapi_node' => 
      array (
        'enabled' => 1,
        'weight' => '0',
        'content_type' => 'feeditem',
        'node_date' => 'feed',
        'promote' => '0',
        'x_dedupe' => '0',
      ),
      'feedapi_inherit' => 
      array (
        'enabled' => 0,
        'weight' => '0',
        'inherit_taxonomy' => 1,
      ),
    ),
  ),
);

