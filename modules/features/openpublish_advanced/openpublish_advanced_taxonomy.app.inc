<?php
/*
 * implements hook_apps_app_info
 */
function openpublish_advanced_taxonomy_apps_app_info() {
  return array(
    'configure form' => 'openpublish_advanced_taxonomy_configure',
  );
}
/*
 * implements the configure form for the openpublish_advance_taxonomy app
 */
function openpublish_advanced_taxonomy_configure($form, $form_state) {

  $vocabs = taxonomy_vocabulary_get_names();
  foreach($vocabs as $key => $vocab) {
    $options[$key] = $vocab->name;
    if(variable_get("taxonomy_view_mode_$key", FALSE) &&
       context_load("openpublish_advanced_taxonomy_{$key}_facets") ){
      $defaults[$key] = $vocab->name;    
    }

  }
  $context = context_load("openpublish_advanced_taxonomy_default_facets");

  $form['enable'] = array(
    '#type' => 'checkbox',
    '#title' => "Enable Advance Search pages for all Vocaularies",
    '#default_value' => (bool) !$context->disabled && variable_get("taxonomy_view_mode_any", FALSE),
  );
  $form['help'] = array(
    '#type' => 'fieldset',
    '#title' => 'Customize Instructions',
  );
  $form['help']['help_text'] = array(
    '#markup' => t('This will have info like how to edit the default context, and how to add facets. and stuff about setting it up so that each vocab has its own context.'),
  );

  $form['sumbit'] = array(
    '#type' => 'submit',
    '#value' => 'Save',
  );
  return $form;
}
function openpublish_advanced_taxonomy_configure_submit($form, $form_state) {
  if($form_state['values']['enable']) {
    variable_set('taxonomy_view_mode_any', 'full');
    ctools_include("export");
    ctools_export_set_status('context', 'openpublish_advanced_taxonomy_default_facets', FALSE);
    context_invalidate_cache();
  }
  else {
    variable_del('taxonomy_view_mode_any');
    ctools_include("export");
    ctools_export_set_status('context', 'openpublish_advanced_taxonomy_default_facets', TRUE);
    context_invalidate_cache();
  }
}
