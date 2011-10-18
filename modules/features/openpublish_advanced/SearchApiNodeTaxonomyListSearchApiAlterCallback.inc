<?php
/**
  * @file
  * Provides data alteration for search api for including ppo language data in candidate records
  */
class SearchApiNodeTaxonomyListSearchApiAlterCallback extends SearchApiAbstractAlterCallback {
  public function supportsIndex(SearchApiIndex $index) {
    return true;
    return $index->item_type == 'node';
  }

  public function alterItems(array &$items) {
    $fields = field_info_fields();
    foreach ($items as $id => &$item) {
      $item->search_api_node_taxonomy_list_tid = array();
      $lang = $item->language;
      dpm($item);
      foreach($fields as $field) {
        if (isset($item->{$field['field_name']}) &&
            ($field['type'] == 'taxonomy_term_reference')) {
          foreach($item->{$field['field_name']}[$lang] as $value) {
            $item->search_api_node_taxonomy_list_tid[] = $value['tid'];
          }
        }
      }
    dpm($item->search_api_node_taxonomy_list_tid);
    $item->search_api_node_taxonomy_list_tid_string= implode(" ", $item->search_api_node_taxonomy_list_tid);
    dpm($item->search_api_node_taxonomy_list_tid_string);
    }   
    dpm($items);
  }

  public function propertyInfo() {
    return array(
      'search_api_node_taxonomy_list_tid' => array(
        'label' => t('Taxonomy List Tid'),
        'type' => 'list<integer>',
        'description' => t('A list of all Taxonomy Terms Ids '),
      ),  
      'search_api_node_taxonomy_list_tid_string' => array(
        'label' => t('Taxonomy List Tid String'),
        'type' => 'text',
        'description' => t('A list of all Taxonomy Terms Ids in a space delimited string'),
      ),  
    );  
  }
}
