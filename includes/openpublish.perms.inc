<?php
// This file was generated using admin/settings/openpublish/export-perms on Mon, 09 Nov 2009 16:48:22 -0500

install_add_role('anonymous user');
install_add_role('authenticated user');
install_add_role('administrator');
install_add_role('editor');
install_add_role('author');
install_add_role('web editor');

$openpublish_perms = array(
  'Use PHP input for field settings (dangerous - grant with care)' => array(
    '0' => 'administrator',
  ),
  'access RDF data' => array(
    '0' => 'administrator',
  ),
  'access administration pages' => array(
    '0' => 'administrator',
    '1' => 'author',
    '2' => 'editor',
    '3' => 'web editor',
  ),
  'access all views' => array(
    '0' => 'administrator',
    '1' => 'web editor',
  ),
  'access calais' => array(
    '0' => 'administrator',
    '1' => 'author',
    '2' => 'editor',
    '3' => 'web editor',
  ),
  'access calais rdf' => array(
    '0' => 'administrator',
    '1' => 'anonymous user',
    '2' => 'authenticated user',
    '3' => 'author',
    '4' => 'editor',
    '5' => 'web editor',
  ),
  'access comments' => array(
    '0' => 'administrator',
    '1' => 'anonymous user',
    '2' => 'authenticated user',
    '3' => 'author',
    '4' => 'editor',
    '5' => 'web editor',
  ),
  'access content' => array(
    '0' => 'administrator',
    '1' => 'anonymous user',
    '2' => 'authenticated user',
    '3' => 'author',
    '4' => 'editor',
    '5' => 'web editor',
  ),
  'access devel information' => array(
    '0' => 'administrator',
  ),
  'access fckeditor' => array(
    '0' => 'administrator',
    '1' => 'author',
    '2' => 'editor',
    '3' => 'web editor',
  ),
  'access openpublish admin pages' => array(
    '0' => 'administrator',
    '1' => 'author',
    '2' => 'editor',
    '3' => 'web editor',
  ),
  'access site reports' => array(
    '0' => 'administrator',
    '1' => 'author',
    '2' => 'editor',
    '3' => 'web editor',
  ),
  'access statistics' => array(
    '0' => 'administrator',
    '1' => 'author',
    '2' => 'editor',
    '3' => 'web editor',
  ),
  'access user profiles' => array(
    '0' => 'administrator',
    '1' => 'anonymous user',
    '2' => 'authenticated user',
    '3' => 'author',
    '4' => 'editor',
    '5' => 'web editor',
  ),
  'admin inline' => array(
    '0' => 'administrator',
    '1' => 'author',
    '2' => 'editor',
    '3' => 'web editor',
  ),
  'admin menu' => array(
    '0' => 'administrator',
    '1' => 'author',
    '2' => 'editor',
    '3' => 'web editor',
  ),
  'administer RDF data' => array(
    '0' => 'administrator',
  ),
  'administer RDF repositories' => array(
    '0' => 'administrator',
  ),
  'administer actions' => array(
    '0' => 'administrator',
  ),
  'administer advanced pane settings' => array(
    '0' => 'administrator',
  ),
  'administer blocks' => array(
    '0' => 'administrator',
    '1' => 'web editor',
  ),
  'administer calais' => array(
    '0' => 'administrator',
    '1' => 'web editor',
  ),
  'administer calais api' => array(
    '0' => 'administrator',
  ),
  'administer calais geo' => array(
    '0' => 'administrator',
  ),
  'administer comments' => array(
    '0' => 'administrator',
    '1' => 'author',
    '2' => 'editor',
    '3' => 'web editor',
  ),
  'administer content types' => array(
    '0' => 'administrator',
    '1' => 'web editor',
  ),
  'administer fckeditor' => array(
    '0' => 'administrator',
  ),
  'administer feedapi' => array(
    '0' => 'administrator',
    '1' => 'web editor',
  ),
  'administer files' => array(
    '0' => 'administrator',
    '1' => 'editor',
  ),
  'administer filters' => array(
    '0' => 'administrator',
  ),
  'administer flags' => array(
    '0' => 'administrator',
  ),
  'administer flash' => array(
    '0' => 'administrator',
    '1' => 'web editor',
  ),
  'administer imageapi' => array(
    '0' => 'administrator',
  ),
  'administer imagecache' => array(
    '0' => 'administrator',
  ),
  'administer languages' => array(
    '0' => 'administrator',
    '1' => 'web editor',
  ),
  'administer login destination' => array(
    '0' => 'administrator',
  ),
  'administer menu' => array(
    '0' => 'administrator',
    '1' => 'editor',
    '2' => 'web editor',
  ),
  'administer meta tags' => array(
    '0' => 'administrator',
    '1' => 'editor',
    '2' => 'web editor',
  ),
  'administer morelikethis' => array(
    '0' => 'administrator',
    '1' => 'editor',
    '2' => 'web editor',
  ),
  'administer nodes' => array(
    '0' => 'administrator',
    '1' => 'editor',
    '2' => 'web editor',
  ),
  'administer pane access' => array(
    '0' => 'administrator',
  ),
  'administer pane visibility' => array(
    '0' => 'administrator',
  ),
  'administer panel-nodes' => array(
    '0' => 'administrator',
  ),
  'administer pathauto' => array(
    '0' => 'administrator',
    '1' => 'editor',
    '2' => 'web editor',
  ),
  'administer permissions' => array(
    '0' => 'administrator',
  ),
  'administer search' => array(
    '0' => 'administrator',
  ),
  'administer site configuration' => array(
    '0' => 'administrator',
  ),
  'administer taxonomy' => array(
    '0' => 'administrator',
    '1' => 'editor',
    '2' => 'web editor',
  ),
  'administer topichubs' => array(
    '0' => 'administrator',
    '1' => 'editor',
    '2' => 'web editor',
  ),
  'administer url aliases' => array(
    '0' => 'administrator',
    '1' => 'web editor',
  ),
  'administer users' => array(
    '0' => 'administrator',
    '1' => 'editor',
  ),
  'administer views' => array(
    '0' => 'administrator',
    '1' => 'web editor',
  ),
  'advanced feedapi options' => array(
    '0' => 'administrator',
  ),
  'allow fckeditor file uploads' => array(
    '0' => 'administrator',
    '1' => 'author',
    '2' => 'editor',
    '3' => 'web editor',
  ),
  'change own username' => array(
    '0' => 'administrator',
    '1' => 'editor',
    '2' => 'web editor',
  ),
  'create blog entries' => array(
    '0' => 'administrator',
    '1' => 'author',
    '2' => 'editor',
    '3' => 'web editor',
  ),
  'create feed content' => array(
    '0' => 'administrator',
    '1' => 'author',
    '2' => 'editor',
    '3' => 'web editor',
  ),
  'create page content' => array(
    '0' => 'administrator',
    '1' => 'author',
    '2' => 'editor',
    '3' => 'web editor',
  ),
  'create panel-nodes' => array(
    '0' => 'administrator',
  ),
  'create topichub content' => array(
    '0' => 'administrator',
    '1' => 'author',
    '2' => 'editor',
    '3' => 'web editor',
  ),
  'create url aliases' => array(
    '0' => 'administrator',
    '1' => 'editor',
    '2' => 'web editor',
  ),
  'delete any blog entry' => array(
    '0' => 'administrator',
    '1' => 'editor',
    '2' => 'web editor',
  ),
  'delete any feed content' => array(
    '0' => 'administrator',
    '1' => 'editor',
    '2' => 'web editor',
  ),
  'delete any page content' => array(
    '0' => 'administrator',
    '1' => 'editor',
    '2' => 'web editor',
  ),
  'delete any topichub content' => array(
    '0' => 'administrator',
    '1' => 'editor',
    '2' => 'web editor',
  ),
  'delete own blog entries' => array(
    '0' => 'administrator',
    '1' => 'author',
    '2' => 'editor',
    '3' => 'web editor',
  ),
  'delete own feed content' => array(
    '0' => 'administrator',
    '1' => 'author',
    '2' => 'editor',
    '3' => 'web editor',
  ),
  'delete own page content' => array(
    '0' => 'administrator',
    '1' => 'author',
    '2' => 'editor',
    '3' => 'web editor',
  ),
  'delete own topichub content' => array(
    '0' => 'administrator',
    '1' => 'author',
    '2' => 'editor',
    '3' => 'web editor',
  ),
  'delete revisions' => array(
    '0' => 'administrator',
    '1' => 'editor',
    '2' => 'web editor',
  ),
  'display source code' => array(
    '0' => 'administrator',
  ),
  'edit any blog entry' => array(
    '0' => 'administrator',
    '1' => 'editor',
    '2' => 'web editor',
  ),
  'edit any feed content' => array(
    '0' => 'administrator',
    '1' => 'editor',
    '2' => 'web editor',
  ),
  'edit any page content' => array(
    '0' => 'administrator',
    '1' => 'editor',
    '2' => 'web editor',
  ),
  'edit any topichub content' => array(
    '0' => 'administrator',
    '1' => 'editor',
    '2' => 'web editor',
  ),
  'edit own blog entries' => array(
    '0' => 'administrator',
    '1' => 'author',
    '2' => 'editor',
    '3' => 'web editor',
  ),
  'edit own feed content' => array(
    '0' => 'administrator',
    '1' => 'author',
    '2' => 'editor',
    '3' => 'web editor',
  ),
  'edit own page content' => array(
    '0' => 'administrator',
    '1' => 'author',
    '2' => 'editor',
    '3' => 'web editor',
  ),
  'edit own panel-nodes' => array(
    '0' => 'administrator',
  ),
  'edit own topichub content' => array(
    '0' => 'administrator',
    '1' => 'author',
    '2' => 'editor',
    '3' => 'web editor',
  ),
  'execute php code' => array(
    '0' => 'administrator',
  ),
  'export RDF data' => array(
    '0' => 'administrator',
  ),
  'flush imagecache' => array(
    '0' => 'administrator',
  ),
  'import RDF data' => array(
    '0' => 'administrator',
  ),
  'notify of path changes' => array(
    '0' => 'administrator',
  ),
  'post comments' => array(
    '0' => 'administrator',
    '1' => 'authenticated user',
    '2' => 'author',
    '3' => 'editor',
    '4' => 'web editor',
  ),
  'post comments without approval' => array(
    '0' => 'administrator',
    '1' => 'authenticated user',
    '2' => 'author',
    '3' => 'editor',
    '4' => 'web editor',
  ),
  'post with no checking' => array(
    '0' => 'administrator',
    '1' => 'author',
    '2' => 'editor',
    '3' => 'web editor',
  ),
  'revert revisions' => array(
    '0' => 'administrator',
    '1' => 'author',
    '2' => 'editor',
    '3' => 'web editor',
  ),
  'search content' => array(
    '0' => 'administrator',
    '1' => 'anonymous user',
    '2' => 'authenticated user',
    '3' => 'author',
    '4' => 'editor',
    '5' => 'web editor',
  ),
  'select different theme' => array(
    '0' => 'administrator',
  ),
  'set api keys' => array(
    '0' => 'administrator',
  ),
  'switch users' => array(
    '0' => 'administrator',
  ),
  'translate content' => array(
    '0' => 'administrator',
    '1' => 'author',
    '2' => 'editor',
    '3' => 'web editor',
  ),
  'translate interface' => array(
    '0' => 'administrator',
    '1' => 'author',
    '2' => 'editor',
    '3' => 'web editor',
  ),
  'upload files' => array(
    '0' => 'administrator',
    '1' => 'author',
    '2' => 'editor',
    '3' => 'web editor',
  ),
  'use PHP for block visibility' => array(
    '0' => 'administrator',
    '1' => 'web editor',
  ),
  'use advanced search' => array(
    '0' => 'administrator',
    '1' => 'author',
    '2' => 'editor',
    '3' => 'web editor',
  ),
  'use panels caching features' => array(
    '0' => 'administrator',
  ),
  'use views exporter' => array(
    '0' => 'administrator',
  ),
  'view all panes' => array(
    '0' => 'administrator',
  ),
  'view imagecache featured_image' => array(
    '0' => 'administrator',
    '1' => 'author',
    '2' => 'editor',
    '3' => 'web editor',
  ),
  'view imagecache package_featured' => array(
    '0' => 'administrator',
    '1' => 'author',
    '2' => 'editor',
    '3' => 'web editor',
  ),
  'view imagecache spotlight_homepage' => array(
    '0' => 'administrator',
    '1' => 'author',
    '2' => 'editor',
    '3' => 'web editor',
  ),
  'view imagecache thumbnail' => array(
    '0' => 'administrator',
    '1' => 'author',
    '2' => 'editor',
    '3' => 'web editor',
  ),
  'view pane admin links' => array(
    '0' => 'administrator',
  ),
  'view post access counter' => array(
    '0' => 'administrator',
    '1' => 'author',
    '2' => 'editor',
    '3' => 'web editor',
  ),
  'view revisions' => array(
    '0' => 'administrator',
    '1' => 'author',
    '2' => 'editor',
    '3' => 'web editor',
  ),
  'view uploaded files' => array(
    '0' => 'administrator',
    '1' => 'anonymous user',
    '2' => 'authenticated user',
    '3' => 'author',
    '4' => 'editor',
    '5' => 'web editor',
  ),
);