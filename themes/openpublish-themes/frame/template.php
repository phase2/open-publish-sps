<?php

/**
 * @file
 * This file is empty by default because the base theme chain (Alpha & Omega) provides
 * all the basic functionality. However, in case you wish to customize the output that Drupal
 * generates through Alpha & Omega this file is a good place to do so.
 * 
 * Alpha comes with a neat solution for keeping this file as clean as possible while the code
 * for your subtheme grows. Please read the README.txt in the /preprocess and /process subfolders
 * for more information on this topic.
 */
 
/**
 * Implements HOOK_form_FORM_ID_alter
 * This hook into the search block form adds HTML5 placeholder text for search
 */
function frame_form_search_block_form_alter(&$form, &$form_state) {
  $form['search_block_form']['#attributes']['placeholder'] = t('Search this site…');
}

/**
 *  Implements hook_form_FORM_ID_alter().
 *  Alter the search form and add our js to submit on enter keydown.
 *  We're hiding the submit button and the form removes the enter to submit functionality
 */
function frame_form_search_form_alter (&$form, &$form_state, $form_id) {
  drupal_add_js(drupal_get_path('theme', 'frame') . '/js/search.js');
}

/**
 * Implements template_preprocess_toolbar()
 * Put the node tabs and local actions into the top admin toolbar area
 */
function frame_preprocess_toolbar(&$vars) {
  $vars['toolbar']['toolbar_drawer'][0]['menu_local_tabs'] = menu_local_tabs();
  $vars['toolbar']['toolbar_drawer'][0]['menu_local_tabs']['#primary'][] = menu_local_actions();
}


/**
 * Implements THEMENAME_field__field_name().
 *
 * Add breaks after every 3rd element
 */
function frame_field__field_op_gallery_image(&$variables) {
  $output = '';

  // Render the label, if it's not hidden.
  if (!$variables['label_hidden']) {
    $output .= '<div class="field-label"' . $variables['title_attributes'] . '>' . $variables['label'] . ':&nbsp;</div>';
  }

  // Render the items.
  $output .= '<div class="field-items"' . $variables['content_attributes'] . '>';
  foreach ($variables['items'] as $delta => $item) {
    $third = !(($delta+1) % 3) && $delta;
    $classes = 'field-item ' . ($delta % 2 ? 'odd' : 'even');
    $classes .= $third ? ' row-end' : '';
    $output .= '<div class="' . $classes . '"' . $variables['item_attributes'][$delta] . '>' . drupal_render($item) . '</div>';

    if ($third) {
      $output .= '<div class="clearfix"></div>';
    }
  }
  $output .= '</div>';

  // Render the top-level DIV.
  $output = '<div class="' . $variables['classes'] . '"' . $variables['attributes'] . '>' . $output . '</div>';

  return $output;
}
