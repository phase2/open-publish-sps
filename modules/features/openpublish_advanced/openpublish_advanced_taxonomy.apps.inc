<?php
/*
    variable_set("taxonomy_view_$vocab_name", 'full');
  $key = "openpublish_advanced_taxonomy_field_$vocab_name";
  variable_set($key, $form_state['values'][$key]);
*/

/*
 * implements hook_apps_app_info
 */
function openpublish_advanced_taxonomy_apps_app_info() {
  return array(
    'configure form' => 'openpublish_advanced_taxonomy_configure',
  );
}

function openpublish_advanced_taxonomy_configure($form, $form_state) {

    $options = taxonomy_vocabulary_get_names(),
  $form['test'] = array(
    '#type' => 'checkboxes',
    '#title' => "Facet display for:",
    '#options' => $options,
  );
  $form['sumbit'] = array(
    '#type' => 'submit',
    '#value' => 'Save',
  );
  return $form;
}
function openpublish_advanced_taxonomy_configure_submit($form, $form_state) {


}
