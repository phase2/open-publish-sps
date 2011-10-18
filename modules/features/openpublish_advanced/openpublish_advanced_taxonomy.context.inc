<?php
/**
 * @file
 * openpublish_advanced_taxonomy.context.inc
 */

/**
 * Implements hook_context_default_contexts().
 */
function openpublish_advanced_taxonomy_context_default_contexts() {
  $export = array();

  $context = new stdClass;
  $context->disabled = FALSE; /* Edit this to true to make a default context disabled initially */
  $context->api_version = 3;
  $context->name = 'openpublish_advanced_taxonomy_default_facets';
  $context->description = 'Default Taxonomy Facets';
  $context->tag = 'OpenPublish Advanced Taxonomy';
  $context->conditions = array(
    'path' => array(
      'values' => array(
        'taxonomy/term/*' => 'taxonomy/term/*',
      ),
    ),
  );
  $context->reactions = array(
    'block' => array(
      'blocks' => array(
        'views-9b9cc3179386216ec551909b82e554ce' => array(
          'module' => 'views',
          'delta' => '9b9cc3179386216ec551909b82e554ce',
          'region' => 'content',
          'weight' => '1',
        ),
        'search_api_facets-openpublish_node_ind_field_op_au' => array(
          'module' => 'search_api_facets',
          'delta' => 'openpublish_node_ind_field_op_au',
          'region' => 'sidebar_second',
          'weight' => '-10',
        ),
        'search_api_facets-openpublish_node_ind_field_op_bl' => array(
          'module' => 'search_api_facets',
          'delta' => 'openpublish_node_ind_field_op_bl',
          'region' => 'sidebar_second',
          'weight' => '-10',
        ),
        'search_api_facets-openpublish_node_ind_type' => array(
          'module' => 'search_api_facets',
          'delta' => 'openpublish_node_ind_type',
          'region' => 'sidebar_second',
          'weight' => '-10',
        ),
      ),
    ),
  );
  $context->condition_mode = 0;

  // Translatables
  // Included for use with string extractors like potx.
  t('Default Taxonomy Facets');
  t('OpenPublish Advanced Taxonomy');
  $export['openpublish_advanced_taxonomy_default_facets'] = $context;

  return $export;
}
