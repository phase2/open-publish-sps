<?php
/**
 * @file
 * openpublish_advanced_taxonomy.views_default.inc
 */

/**
 * Implements hook_views_default_views().
 */
function openpublish_advanced_taxonomy_views_default_views() {
  $export = array();

  $view = new view;
  $view->name = 'openpublish_advanced_taxonomy';
  $view->description = '';
  $view->tag = 'default';
  $view->base_table = 'search_api_index_openpublish_node_index';
  $view->human_name = 'openpublish_advanced_taxonomy';
  $view->core = 7;
  $view->api_version = '3.0-alpha1';
  $view->disabled = FALSE; /* Edit this to true to make a default view disabled initially */

  /* Display: Master */
  $handler = $view->new_display('default', 'Master', 'default');
  $handler->display->display_options['access']['type'] = 'none';
  $handler->display->display_options['cache']['type'] = 'none';
  $handler->display->display_options['query']['type'] = 'views_query';
  $handler->display->display_options['exposed_form']['type'] = 'basic';
  $handler->display->display_options['pager']['type'] = 'full';
  $handler->display->display_options['style_plugin'] = 'default';
  $handler->display->display_options['row_plugin'] = 'entity';
  $handler->display->display_options['row_options']['view_mode'] = 'teaser';
  /* Field: Node: Item language */
  $handler->display->display_options['fields']['search_api_language']['id'] = 'search_api_language';
  $handler->display->display_options['fields']['search_api_language']['table'] = 'search_api_index_openpublish_node_index';
  $handler->display->display_options['fields']['search_api_language']['field'] = 'search_api_language';
  /* Contextual filter: Node: Blog */
  $handler->display->display_options['arguments']['field_op_blogpost_blog']['id'] = 'field_op_blogpost_blog';
  $handler->display->display_options['arguments']['field_op_blogpost_blog']['table'] = 'search_api_index_openpublish_node_index';
  $handler->display->display_options['arguments']['field_op_blogpost_blog']['field'] = 'field_op_blogpost_blog';
  $handler->display->display_options['arguments']['field_op_blogpost_blog']['default_argument_type'] = 'fixed';
  $handler->display->display_options['arguments']['field_op_blogpost_blog']['summary']['format'] = 'default_summary';

  /* Display: Blog */
  $handler = $view->new_display('block', 'Blog', 'block_1');
  $handler->display->display_options['defaults']['arguments'] = FALSE;
  /* Contextual filter: Node: Blog */
  $handler->display->display_options['arguments']['field_op_blogpost_blog']['id'] = 'field_op_blogpost_blog';
  $handler->display->display_options['arguments']['field_op_blogpost_blog']['table'] = 'search_api_index_openpublish_node_index';
  $handler->display->display_options['arguments']['field_op_blogpost_blog']['field'] = 'field_op_blogpost_blog';
  $handler->display->display_options['arguments']['field_op_blogpost_blog']['default_action'] = 'default';
  $handler->display->display_options['arguments']['field_op_blogpost_blog']['default_argument_type'] = 'taxonomy_tid';
  $handler->display->display_options['arguments']['field_op_blogpost_blog']['default_argument_options']['term_page'] = 1;
  $handler->display->display_options['arguments']['field_op_blogpost_blog']['default_argument_options']['node'] = 0;
  $handler->display->display_options['arguments']['field_op_blogpost_blog']['default_argument_options']['limit'] = 0;
  $handler->display->display_options['arguments']['field_op_blogpost_blog']['default_argument_options']['vocabularies'] = array(
    'blog' => 0,
  );
  $handler->display->display_options['arguments']['field_op_blogpost_blog']['default_argument_skip_url'] = 0;
  $handler->display->display_options['arguments']['field_op_blogpost_blog']['summary']['format'] = 'default_summary';

  /* Display: Topic */
  $handler = $view->new_display('block', 'Topic', 'block_2');
  $handler->display->display_options['defaults']['arguments'] = FALSE;
  /* Contextual filter: Node: Topic */
  $handler->display->display_options['arguments']['field_topic']['id'] = 'field_topic';
  $handler->display->display_options['arguments']['field_topic']['table'] = 'search_api_index_openpublish_node_index';
  $handler->display->display_options['arguments']['field_topic']['field'] = 'field_topic';
  $handler->display->display_options['arguments']['field_topic']['default_action'] = 'default';
  $handler->display->display_options['arguments']['field_topic']['default_argument_type'] = 'taxonomy_tid';
  $handler->display->display_options['arguments']['field_topic']['default_argument_options']['term_page'] = 1;
  $handler->display->display_options['arguments']['field_topic']['default_argument_options']['node'] = 0;
  $handler->display->display_options['arguments']['field_topic']['default_argument_options']['limit'] = 0;
  $handler->display->display_options['arguments']['field_topic']['default_argument_options']['vocabularies'] = array(
    'blog' => 0,
    'topic' => 0,
  );
  $handler->display->display_options['arguments']['field_topic']['default_argument_skip_url'] = 0;
  $handler->display->display_options['arguments']['field_topic']['summary']['format'] = 'default_summary';
  $export['openpublish_advanced_taxonomy'] = $view;

  return $export;
}
