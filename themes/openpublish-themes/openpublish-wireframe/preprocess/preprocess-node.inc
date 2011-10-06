<?php

function openpublish_wireframe_alpha_preprocess_node(&$vars) {
  $date_format = format_date($vars['created'], $type = 'custom', $format = 'm/d/y');
  $comment_count = l(t($vars['comment_count'] . ' Comments'), 'node/' . $vars['nid'], array('fragment' => 'comments'));
  $vars['submitted'] = t('!username | !datetime | !comment_count', array('!username' => $vars['name'], '!datetime' => $date_format, '!comment_count' => $comment_count));
}
