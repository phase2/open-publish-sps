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
function gazette_preprocess_views_view_unformatted(&$vars) {
  foreach($vars['classes'] as &$rowclasses) {
    $rowclasses[] = 'clearfix';
  }
  foreach($vars['classes_array'] as &$rowclasses) {
    $rowclasses .= ' clearfix';
  }
  foreach($vars['attributes_array']['class'] as &$rowclasses) {
    $rowclasses .= ' clearfix';
  }
}
 
