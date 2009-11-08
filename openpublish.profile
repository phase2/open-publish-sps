<?php
/**
 * @file openpublish.profile
 *
 * TODO:
 *  - Remove ping module
 *  - Remove PHP module and any content that requires it
 *  - Export the placeholder content to flat files or something. Slim this file down
 *  - Cleanup Permissions
 *  - Export imagecache presets as code
 *  - More general variable handling
 *  - Process Menus more generally
 *  - Remove PHP from block bodies
 *  - Integrate Content for better block handling
 */

/**
 * Implementation of hook_profile_details()
 */
function openpublish_profile_details() {  
  return array(
    'name' => 'OpenPublish',
    'description' => st('The power of Drupal for today\'s online publishing from Phase2 Technology.'),
  );
} 

/**
 * Implementation of hook_profile_modules().
 */
function openpublish_profile_modules() {
  $core_modules = array(
    // Required core modules
    'block', 'filter', 'node', 'system', 'user',

    // Optional core modules.
    'dblog','blog', 'comment', 'help', 'locale', 'menu', 'openid', 'path', 'ping', 
	  'profile', 'search', 'statistics', 'taxonomy', 'translation', 'upload', 'install_profile_api',
	  'php'
  );


  $contributed_modules = array(
    //misc stand-alone, required by others
    'admin_menu', 'rdf', 'token', 'gmap', 'devel', 'flickrapi', 'autoload', 'apture', 
    'fckeditor', 'flag', 'imce', 'mollom', 'nodewords', 'paging',
    'pathauto', 'tabs', 'login_destination', 

    //date
    'date_api', 'date', 'date_timezone',
  
    //imagecache
    'imageapi', 'imageapi_gd', 'imagecache', 'imagecache_ui',
  
    //cck
    'content', 'content_copy', 'content_permissions', 'emfield', 'emaudio', 'emimage', 
    'emvideo', 'fieldgroup', 'filefield', 'imagefield', 'link', 'number',
    'optionwidgets', 'text', 'nodereference', 'userreference',
	
    // Calais
    'calais_api', 'calais', 'calais_geo', 'calais_tagmods',
    
    // Feed API
    'feedapi', 'feedapi_node', 'feedapi_inherit', 'feedapi_mapper', 'parser_simplepie', 

    // More Like this
    'morelikethis', 'morelikethis_flickr', 'morelikethis_googlevideo', 'morelikethis_taxonomy',
    'morelikethis_yboss',
	
    //swftools
    'swftools', 'swfobject2', 'flowplayer3',
	
    //views
    'views', 'views_export', 'views_ui',
	
    //topic hubs
    'ctools', 
    'views_content', 'page_manager', 'panels', 'panels_node', 
    'topichubs', 'topichubs_calais_geo', 'topichubs_contributors', 'topichubs_most_comments',
    'topichubs_most_recent', 'topichubs_most_viewed', 'topichubs_panels', 'topichubs_recent_comments',
    'topichubs_related_topics',
	
    // Custom modules developed for OpenPublish
    'openpublish_administration', 'popular_terms', 'openpublish_views',    
  );

  return array_merge($core_modules, $contributed_modules);
} 

/**
 * Return a list of tasks that this profile supports.
 *
 * @return
 *   A keyed array of tasks the profile will perform during
 *   the final stage. The keys of the array will be used internally,
 *   while the values will be displayed to the user in the installer
 *   task list.
 */
function openpublish_profile_task_list() {
  
  global $conf;
  $conf['site_name'] = 'OpenPublish';
  $conf['theme_settings'] = array(
    'default_logo' => 0,
    'logo_path' => 'sites/all/themes/openpublish_theme/images/logo.png',
  );
  
  $tasks['op-configure-batch'] = st('Configure OpenPublish');
  return $tasks;
}

/**
 * Implementation of hook_profile_tasks().
 */
function openpublish_profile_tasks(&$task, $url) {
  $output = "";
  
  install_include(openpublish_profile_modules());

  if($task == 'profile') {
    drupal_set_title(t('OpenPublish Installation'));
    _openpublish_log(t('Starting Installation'));
    _openpublish_base_settings();
    $task = "op-configure";
  }
    
  if($task == 'op-configure') {
    $batch['title'] = st('Configuring @drupal', array('@drupal' => drupal_install_profile_name()));
    $cck_files = file_scan_directory ( dirname(__FILE__) . '/cck' , '.*\.inc$' );
    foreach ( $cck_files as $file ) {   
      $batch['operations'][] = array('_openpublish_import_cck', array($file));      
    }    
    $batch['operations'][] = array('_openpublish_initialize_settings', array());      
    $batch['operations'][] = array('_openpublish_placeholder_content', array());      
    $batch['operations'][] = array('_openpublish_set_views', array());      
    $batch['operations'][] = array('_openpublish_modify_menus', array());      
    $batch['operations'][] = array('_openpublish_setup_blocks', array());      
    $batch['operations'][] = array('_openpublish_cleanup', array());      
    $batch['error_message'] = st('There was an error configuring @drupal.', array('@drupal' => drupal_install_profile_name()));
    $batch['finished'] = '_openpublish_configure_finished';
    variable_set('install_task', 'op-configure-batch');
    batch_set($batch);
    batch_process($url, $url);
  }
     
  // Land here until the batches are done
  if ($task == 'op-configure-batch') {
    include_once 'includes/batch.inc';
    $output = _batch_page();
  }
    
  return $output;
} 

/**
 * Import process is finished, move on to the next step
 */
function _openpublish_configure_finished($success, $results) {
  _openpublish_log(t('OpenPublish has been installed.'));
  variable_set('install_task', 'profile-finished');
}

/**
 * Do some basic setup
 */
function _openpublish_base_settings() {  
  $types = array(
    array(
      'type' => 'page',
      'name' => st('Page'),
      'module' => 'node',
      'description' => st("A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an \"About us\" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site's initial home page."),
      'custom' => TRUE,
      'modified' => TRUE,
      'locked' => FALSE,
      'help' => '',
      'min_word_count' => '',
    ),   
  );

  foreach ($types as $type) {
    $type = (object) _node_type_set_defaults($type);
    node_type_save($type);
  }

  // Default page to not be promoted and have comments disabled.
  variable_set('node_options_page', array('status'));
  variable_set('comment_page', COMMENT_NODE_DISABLED);

  // Theme related.  
  install_default_theme('openpublish_theme');
  variable_set('admin_theme', 'rootcandy');	
  
  $theme_settings = variable_get('theme_settings', array());
  $theme_settings['toggle_node_info_page'] = FALSE;
  variable_set('theme_settings', $theme_settings);    
  
  // Basic Drupal settings.
  variable_set('site_frontpage', 'node');
  variable_set('user_register', 1); 
  variable_set('user_pictures', '1');
  variable_set('statistics_count_content_views', 1);
  variable_set('filter_default_format', '2');
  
  _openpublish_log(st('Configured basic settings'));
}

/**
 * Import cck definitions from included files
 */
function _openpublish_import_cck($file) {   
  // blog type is from drupal, so modify it
  if ($file->name == 'blog') {
    install_add_existing_field('blog', 'field_teaser', 'text_textarea');
    install_add_existing_field('blog', 'field_show_author_info', 'optionwidgets_onoff');      
  }
  else if ($file->name == 'feed') {
    $content = array();
    ob_start();
    include $file->filename;
    ob_end_clean();
    $feed = (object)$content['type'];
    variable_set('feedapi_settings_feed', $feed->feedapi);
  }
  else {
    install_content_copy_import_from_file($file->filename);
  }
  
  _openpublish_log(st('Content Type @type setup', array('@type' => $file->name)));
}  

/**
 * Create some content of type "page" as placeholders for content
 * and so menu items can be created
 */
function _openpublish_placeholder_content() {
  global $base_url;  

  $user = user_load(array('uid' => 1));
 
  $page = array (
    'type' => 'page',
    'language' => 'en',
    'uid' => 1,
    'status' => 1,
    'comment' => 0,
    'promote' => 0,
    'moderate' => 0,
    'sticky' => 0,
    'tnid' => 0,
    'translate' => 0,    
    'revision_uid' => 1,
    'title' => st('Default'),
    'body' => 'Placeholder',    
    'format' => 2,
    'name' => $user->name,
  );
  
  $about_us = (object) $page;
  $about_us->title = st('About Us');
  node_save($about_us);	
  
  $adverstise = (object) $page;
  $adverstise->title = st('Advertise');
  node_save($adverstise);	
  
  $subscribe = (object) $page;
  $subscribe->title = st('Subscribe');
  node_save($subscribe);	
  
  $rss = (object) $page;
  $rss->title = st('RSS Feeds List');
  $rss->body = '<p><strong>Articles</strong><ul><li><a href="'. $base_url . '/rss/articles/all">All Categories</a></li><li><a href="'. $base_url . '/rss/articles/Business">Business</a></li><li><a href="'. $base_url . '/rss/articles/Health">Health</a></li><li><a href="'. $base_url . '/rss/articles/Politics">Politics</a></li><li><a href="'. $base_url . '/rss/articles/Technology">Technology</a></li><li><a href="'. $base_url . '/rss/blogs">Blogs</a></li><li><a href="/rss/events">Events</a></li><li><a href="'. $base_url . '/rss/resources">Resources</a></li><li><a href="'. $base_url . '/rss/multimedia">Multimedia</a></li></p>';
  node_save($rss);
  
  $jobs = (object) $page;
  $jobs->title = st('Jobs');
  node_save($jobs);
  
  $store = (object) $page;
  $store->title = st('Store');
  node_save($store);
  
  $sitemap = (object) $page;
  $sitemap->title = st('Site Map');
  node_save($sitemap);
  
  $termsofuse = (object) $page;
  $termsofuse->title = st('Terms of Use');
  node_save($termsofuse);
  
  $privacypolicy = (object) $page;
  $privacypolicy->title = st('Privacy Policy');
  node_save($privacypolicy); 
  
  $start = (object) $page;
  $start->title = st('Getting Started');
  $start->body = '<h1>Welcome to your new OpenPublish Site.</h1>Initially your site does not have any content, and that is where the fun begins. Use the thin black administration menu across the top of the page to accomplish many of the tasks needed to get your site up and running in no time.<br/><br/><h3>To create content</h3>Select <em>Content Management</em> -> <em>Create Content</em> from the administration menu (remember that little black bar at the top of the page?) to get started.  You can create a variety of content, but to start out you may want to create a few simple <a href="'. $base_url . '/node/add/article">Articles</a> or import items from an <a href="'. $base_url . '/node/add/feed">RSS Feed</a><h3>To change configuration options</h3>Select <em>Site Configuration</em> from the administration menu to change various configuration options and settings on your site.<h3>To add other users</h3>Select <em>User Management</em> -> <em>Users</em> from the administration menu to add new users or change user roles and permissions.<h3>Need more help?</h3>Select <em>Help</em> from the administration menu to learn more about what you can do with your site.<br/><br/>Don\'t forget to look for more resources and documentation at the <a href="http://www.openpublishapp.com">OpenPublish</a> website.<br/><br/>ENJOY!!!!';  
  node_save($start);

  menu_rebuild();
}

/**
 * Set roles and permissions and other misc settins
 */
function _openpublish_initialize_settings(){
  // Add roles
  install_add_role('administrator');
  install_add_role('editor');
  install_add_role('author');
  install_add_role('web editor');

  $admin_rid = install_get_rid('administrator');
  $editor_rid = install_get_rid('editor');
  $author_rid = install_get_rid('author');
  $webed_rid = install_get_rid('web editor');
  $anon_rid = install_get_rid('anonymous user');
  $auth_rid = install_get_rid('authenticated user');
  
  install_add_permissions($anon_rid, array('access calais rdf', 'access comments','view field_audio_file',
  		'view field_author','view field_center_intro','view field_center_main_image',
		'view field_center_related','view field_center_title','view field_deck',
		'view field_embedded_audio','view field_embedded_video','view field_event_date',
		'view field_flash_file','view field_left_intro','view field_left_related',
		'view field_links','view field_main_image','view field_right_intro',
		'view field_right_related','view field_show_author_info','view field_teaser',
		'view field_thumbnail_image','view imagefield uploads, access content',
		'search content','view uploaded files','access user profiles'));		
		
  install_add_permissions($auth_rid, array('access calais rdf', 'access comments','post comments','post comments without approval',
  		'view field_audio_file','view field_author','view field_center_intro',
		'view field_center_main_image','view field_center_related','view field_center_title',
		'view field_deck','view field_embedded_audio','view field_embedded_video',
		'view field_event_date','view field_flash_file','view field_left_intro',
		'view field_left_related','view field_links','view field_main_image, view field_right_intro',
		'view field_right_related','view field_show_author_info','view field_teaser',
		'view field_thumbnail_image','view imagefield uploads','access content, search content',
		'view uploaded files','access user profiles'));		
		
  install_add_permissions($admin_rid, array('access administration menu','display drupal links, administer apture',
  		'administer blocks','use PHP for block visibility','create blog entries',
		'delete any blog entry','delete own blog entries','edit any blog entry',
		'edit own blog entries','access calais', 'access calais rdf','administer calais',
		'administer calais api','administer calais geo','access comments','administer comments',
		'post comments','post comments without approval','Use PHP input for field settings (dangerous - grant with care)',
		'edit field_audio_file','edit field_author','edit field_center_intro',
		'edit field_center_main_image','edit field_center_related','edit field_center_title',
		'edit field_deck','edit field_embedded_audio','edit field_embedded_video','edit field_event_date',
		'edit field_flash_file','edit field_left_intro','edit field_left_related','edit field_links',
		'edit field_main_image','edit field_right_intro','edit field_right_related',
		'edit field_show_author_info','edit field_teaser','edit field_thumbnail_image',
		'view field_audio_file','view field_author','view field_center_intro','view field_center_main_image',
		'view field_center_related','view field_center_title','view field_deck','view field_embedded_audio',
		'view field_embedded_video','view field_event_date','view field_flash_file','view field_left_intro',
		'view field_left_related','view field_links','view field_main_image','view field_right_intro',
		'view field_right_related','view field_show_author_info','view field_teaser','view field_thumbnail_image',
		'administer custompage','edit custompage tiles','access devel information','display source code',
		'execute php code','switch users','access fckeditor','administer fckeditor','allow fckeditor file uploads',
		'administer feedapi','advanced feedapi options','administer filters','administer flags',
		'administer imageapi','administer imagecache','flush imagecache','view imagecache featured_image',
		'view imagecache package_featured','view imagecache spotlight_homepage','view imagecache thumbnail',
		'view imagefield uploads','administer languages','translate interface','administer login destination',
		'administer menu','post with no checking','administer morelikethis','access content',
		'administer content types','administer nodes','create article content','create audio content',
		'create event content','create feed content','create feeditem content','create op_image content',
		'create package content','create page content','create resource content','create topichub content',
		'create twitter_item content','create video content','delete any article content',
		'delete any audio content','delete any event content','delete any feed content',
		'delete any feeditem content','delete any op_image content','delete any package content',
		'delete any page content','delete any resource content','delete any topichub content',
		'delete any twitter_item content','delete any video content','delete own article content',
		'delete own audio content','delete own event content','delete own feed content',
		'delete own feeditem content','delete own op_image content','delete own package content',
		'delete own page content','delete own resource content','delete own topichub content',
		'delete own twitter_item content','delete own video content','delete revisions',
		'edit any article content','edit any audio content','edit any event content',
		'edit any feed content','edit any feeditem content','edit any op_image content',
		'edit any package content','edit any page content','edit any resource content',
		'edit any topichub content','edit any twitter_item content','edit any video content',
		'edit own article content','edit own audio content','edit own event content',
		'edit own feed content','edit own feeditem content','edit own op_image content',
		'edit own package content','edit own page content','edit own resource content',
		'edit own topichub content','edit own twitter_item content',
		'edit own video content','revert revisions','view revisions','administer meta tags',
		'edit meta tags','access openpublish admin pages','set api keys',
		'administer url aliases','create url aliases','administer pathauto',
		'notify of path changes','access RDF data','administer RDF data',
		'administer RDF namespaces','administer RDF repositories','export RDF data',
		'import RDF data','administer search','search content','use advanced search',
		'access statistics','view post access counter','administer flash',
		'access administration pages','access site reports','administer actions',
		'administer files','administer site configuration','select different theme',
		'administer taxonomy','administer topichubs','translate content','upload files',
		'view uploaded files','access user profiles','administer permissions',
		'administer users','change own username','administer views','use views exporter',
		'access all views','override node priority','override term priority',
		'administer advanced pane settings', 'administer pane access', 'administer pane visibility',
		'use panels caching features', 'view all panes', 'view pane admin links',
		'administer panel-node', 'create panel-nodes', 'edit own panel-nodes', 'administer panel-nodes'));
  
  install_add_permissions($editor_rid, array('access administration menu','display drupal links',
  		'create blog entries','delete any blog entry','delete own blog entries',
		'edit any blog entry','edit own blog entries','access calais', 'access calais rdf', 'access comments',
		'administer comments','post comments','post comments without approval',
		'edit field_audio_file','edit field_author','edit field_center_intro',
		'edit field_center_main_image','edit field_center_related',
		'edit field_center_title','edit field_deck','edit field_embedded_audio',
		'edit field_embedded_video','edit field_event_date','edit field_flash_file',
		'edit field_left_intro','edit field_left_related','edit field_links',
		'edit field_main_image','edit field_right_intro','edit field_right_related',
		'edit field_show_author_info','edit field_teaser','edit field_thumbnail_image',
		'view field_audio_file','view field_author','view field_center_intro',
		'view field_center_main_image','view field_center_related',
		'view field_center_title','view field_deck','view field_embedded_audio',
		'view field_embedded_video','view field_event_date','view field_flash_file',
		'view field_left_intro','view field_left_related','view field_links',
		'view field_main_image','view field_right_intro','view field_right_related',
		'view field_show_author_info','view field_teaser','view field_thumbnail_image',
		'edit custompage tiles','access fckeditor','allow fckeditor file uploads',
		'view imagecache featured_image','view imagecache package_featured',
		'view imagecache spotlight_homepage','view imagecache thumbnail',
		'view imagefield uploads','translate interface','administer menu',
		'post with no checking','administer morelikethis','access content',
		'administer nodes','create article content','create audio content',
		'create event content','create feed content','create feeditem content',
		'create op_image content','create package content','create page content',
		'create resource content','create topichub content','create twitter_item content',
		'create video content','delete any article content','delete any audio content',
		'delete any event content','delete any feed content','delete any feeditem content',
		'delete any op_image content','delete any package content',
		'delete any page content','delete any resource content','delete any topichub content',
		'delete any twitter_item content','delete any video content',
		'delete own article content','delete own audio content','delete own event content',
		'delete own feed content','delete own feeditem content','delete own op_image content',
		'delete own package content','delete own page content','delete own resource content',
		'delete own topichub content','delete own twitter_item content','delete own video content',
		'delete revisions','edit any article content','edit any audio content',
		'edit any event content','edit any feed content','edit any feeditem content',
		'edit any op_image content','edit any package content','edit any page content',
		'edit any resource content','edit any topichub content','edit any twitter_item content',
		'edit any video content','edit own article content','edit own audio content',
		'edit own event content','edit own feed content','edit own feeditem content',
		'edit own op_image content','edit own package content','edit own page content',
		'edit own resource content','edit own topichub content',
		'edit own twitter_item content','edit own video content','revert revisions',
		'view revisions','administer meta tags','edit meta tags',
		'access openpublish admin pages','create url aliases','administer pathauto',
		'search content','use advanced search','access statistics',
		'view post access counter','access administration pages','access site reports',
		'administer files','administer taxonomy','administer topichubs','translate content',
		'upload files','view uploaded files','access user profiles','administer users',
		'change own username','override node priority','override term priority'));  

  install_add_permissions($author_rid, array('access administration menu','display drupal links',
  		'create blog entries','delete own blog entries','edit own blog entries',
		'access calais', 'access calais rdf', 'access comments','administer comments','post comments',
		'post comments without approval','edit field_audio_file','edit field_author',
		'edit field_center_intro','edit field_center_main_image',
		'edit field_center_related','edit field_center_title','edit field_deck',
		'edit field_embedded_audio','edit field_embedded_video','edit field_event_date',
		'edit field_flash_file','edit field_left_intro','edit field_left_related',
		'edit field_links','edit field_main_image','edit field_right_intro',
		'edit field_right_related','edit field_show_author_info','edit field_teaser',
		'edit field_thumbnail_image','view field_audio_file','view field_author',
		'view field_center_intro','view field_center_main_image',
		'view field_center_related','view field_center_title','view field_deck',
		'view field_embedded_audio','view field_embedded_video','view field_event_date',
		'view field_flash_file','view field_left_intro','view field_left_related',
		'view field_links','view field_main_image','view field_right_intro',
		'view field_right_related','view field_show_author_info','view field_teaser',
		'view field_thumbnail_image','access fckeditor','allow fckeditor file uploads',
		'view imagecache featured_image','view imagecache package_featured',
		'view imagecache spotlight_homepage','view imagecache thumbnail',
		'view imagefield uploads','translate interface','post with no checking',
		'access content','create article content','create audio content',
		'create event content','create feed content','create feeditem content',
		'create op_image content','create package content','create page content',
		'create resource content','create topichub content','create twitter_item content',
		'create video content','delete own article content','delete own audio content',
		'delete own event content','delete own feed content','delete own feeditem content',
		'delete own op_image content','delete own package content',
		'delete own page content','delete own resource content',
		'delete own topichub content','delete own twitter_item content',
		'delete own video content','edit own article content','edit own audio content',
		'edit own event content','edit own feed content','edit own feeditem content',
		'edit own op_image content','edit own package content','edit own page content',
		'edit own resource content','edit own topichub content',
		'edit own twitter_item content','edit own video content','revert revisions',
		'view revisions','edit meta tags','access openpublish admin pages',
		'search content','use advanced search','access statistics',
		'view post access counter','access administration pages','access site reports',
		'translate content','upload files','view uploaded files','access user profiles'));
  
  install_add_permissions($webed_rid, array('access administration menu','display drupal links',
  		'administer apture','administer blocks','use PHP for block visibility',
		'create blog entries','delete any blog entry','delete own blog entries',
		'edit any blog entry','edit own blog entries','access calais', 'access calais rdf', 'administer calais',
		'access comments','administer comments','post comments',
		'post comments without approval','edit field_audio_file','edit field_author',
		'edit field_center_intro','edit field_center_main_image',
		'edit field_center_related','edit field_center_title','edit field_deck',
		'edit field_embedded_audio','edit field_embedded_video','edit field_event_date',
		'edit field_flash_file','edit field_left_intro','edit field_left_related',
		'edit field_links','edit field_main_image','edit field_right_intro',
		'edit field_right_related','edit field_show_author_info','edit field_teaser',
		'edit field_thumbnail_image','view field_audio_file','view field_author',
		'view field_center_intro','view field_center_main_image',
		'view field_center_related','view field_center_title','view field_deck',
		'view field_embedded_audio','view field_embedded_video','view field_event_date',
		'view field_flash_file','view field_left_intro','view field_left_related',
		'view field_links','view field_main_image','view field_right_intro',
		'view field_right_related','view field_show_author_info','view field_teaser',
		'view field_thumbnail_image','administer custompage','edit custompage tiles',
		'access fckeditor','allow fckeditor file uploads','administer feedapi',
		'view imagecache featured_image','view imagecache package_featured',
		'view imagecache spotlight_homepage','view imagecache thumbnail',
		'view imagefield uploads','administer languages','translate interface',
		'administer menu','post with no checking','administer morelikethis',
		'access content','administer content types','administer nodes',
		'create article content','create audio content','create event content',
		'create feed content','create feeditem content','create op_image content',
		'create package content','create page content','create resource content',
		'create topichub content','create twitter_item content','create video content',
		'delete any article content','delete any audio content',
		'delete any event content','delete any feed content',
		'delete any feeditem content','delete any op_image content',
		'delete any package content','delete any page content',
		'delete any resource content','delete any topichub content',
		'delete any twitter_item content','delete any video content',
		'delete own article content','delete own audio content','delete own event content',
		'delete own feed content','delete own feeditem content',
		'delete own op_image content','delete own package content',
		'delete own page content','delete own resource content',
		'delete own topichub content','delete own twitter_item content',
		'delete own video content','delete revisions','edit any article content',
		'edit any audio content','edit any event content','edit any feed content',
		'edit any feeditem content','edit any op_image content',
		'edit any package content','edit any page content',
		'edit any resource content','edit any topichub content',
		'edit any twitter_item content','edit any video content',
		'edit own article content','edit own audio content','edit own event content',
		'edit own feed content','edit own feeditem content','edit own op_image content',
		'edit own package content','edit own page content','edit own resource content',
		'edit own topichub content','edit own twitter_item content',
		'edit own video content','revert revisions','view revisions',
		'administer meta tags','edit meta tags','access openpublish admin pages',
		'administer url aliases','create url aliases','administer pathauto',
		'search content','use advanced search','access statistics',
		'view post access counter','administer flash','access administration pages',
		'access site reports','administer taxonomy','administer topichubs',
		'translate content','upload files','view uploaded files',
		'access user profiles','change own username','administer views',
		'access all views','override node priority','override term priority'));  
  
  db_query('INSERT INTO {users_roles} (uid, rid) VALUES (%d, %d)', 1, $admin_rid);

  // Image cache
  $imagecachepreset = imagecache_preset_save(array('presetname' => 'featured_image'));
  $imagecacheaction = new stdClass ();
  $imagecacheaction->presetid = $imagecachepreset['presetid'];
  $imagecacheaction->module = 'imagecache';
  $imagecacheaction->action = 'imagecache_scale';
  $imagecacheaction->data = array('width' => '200', 'height' => '', 'upscale' => 1);
  drupal_write_record('imagecache_action', $imagecacheaction);
  
  $imagecachepreset = imagecache_preset_save(array('presetname' => 'thumbnail'));
  $imagecacheaction = new stdClass ();
  $imagecacheaction->presetid = $imagecachepreset['presetid'];
  $imagecacheaction->module = 'imagecache';
  $imagecacheaction->action = 'imagecache_scale';
  $imagecacheaction->data = array('width' => '100', 'height' => '', 'upscale' => 1);
  drupal_write_record('imagecache_action', $imagecacheaction);
  
  $imagecachepreset = imagecache_preset_save(array('presetname' => 'spotlight_homepage'));
  $imagecacheaction = new stdClass ();
  $imagecacheaction->presetid = $imagecachepreset['presetid'];
  $imagecacheaction->module = 'imagecache';
  $imagecacheaction->action = 'imagecache_scale';
  $imagecacheaction->data = array('width' => '290', 'height' => '', 'upscale' => 1);
  drupal_write_record('imagecache_action', $imagecacheaction);
  
  $imagecachepreset = imagecache_preset_save(array('presetname' => 'package_featured'));
  $imagecacheaction = new stdClass ();
  $imagecacheaction->presetid = $imagecachepreset['presetid'];
  $imagecacheaction->module = 'imagecache';
  $imagecacheaction->action = 'imagecache_scale';
  $imagecacheaction->data = array('width' => '425', 'height' => '', 'upscale' => 0);
  drupal_write_record('imagecache_action', $imagecacheaction);
     
  // Profile Fields
  $profile_full_name = array(
    'title' => 'Full Name', 
	  'name' => 'profile_full_name',
    'category' => 'Author Info',
    'type' => 'textfield',
  	'required'=> 0,
  	'register'=> 0,
  	'visibility' => 2,		
  	'weight' => -10,	
  );
  $profile_job_title = array(
    'title' => 'Job Title', 
	  'name' => 'profile_job_title',
    'category' => 'Author Info',
    'type' => 'textfield',
  	'required'=> 0,
  	'register'=> 0,
  	'visibility' => 2,		
  	'weight' => -9,	
  );
  $profile_bio = array(
    'title' => 'Bio', 
	  'name' => 'profile_bio',
    'category' => 'Author Info',
    'type' => 'textarea',
  	'required'=> 0,
  	'register'=> 0,
  	'visibility' => 2,		
  	'weight' => -8,	
  );
  install_profile_field_add($profile_full_name);
  install_profile_field_add($profile_job_title);
  install_profile_field_add($profile_bio);
 
 
  // Pathauto
  variable_set('pathauto_node_pattern', '[title-raw]');
  variable_set('pathauto_node_article_pattern', 'article/[title-raw]');
  variable_set('pathauto_node_blog_pattern', 'blog/[title-raw]');
  variable_set('pathauto_node_audio_pattern', 'audio/[title-raw]');
  variable_set('pathauto_node_event_pattern', 'event/[title-raw]');
  variable_set('pathauto_node_op_image_pattern', 'image/[title-raw]');
  variable_set('pathauto_node_package_pattern', 'package/[title-raw]');
  variable_set('pathauto_node_topichub_pattern', 'topic-hub/[title-raw]');
  variable_set('pathauto_node_video_pattern', 'video/[title-raw]');
  variable_set('pathauto_blog_pattern', 'blogs/[user-raw]');
  variable_set('pathauto_node_feeditem_pattern', 'feed-item/[title-raw]');
  variable_set('pathauto_node_twitter_item_pattern', 'twitter-item/[title-raw]');
 
  // Login Destination
  variable_set('ld_condition_type', 'pages');
  variable_set('ld_condition_snippet', 'user
user/login');
  variable_set('ld_url_type', 'snippet');
  variable_set('ld_destination', 0);
  variable_set('ld_url_destination', '
global $user;
foreach($user->roles as $id => $role) {
  if ($role == "administrator" || $role == "author" || $role == "editor" || $role == "web editor") {
    return "admin/settings/openpublish/content";
  }
}
return "user"');
  
  // Calais
  $calais_all = calais_api_get_all_entities();
  $calais_ignored = array('Anniversary', 'Currency', 'EmailAddress', 'FaxNumber', 'PhoneNumber', 'URL');
  $calais_used = array_diff($calais_all, $calais_ignored);
  
  $calais_entities = calais_get_entity_vocabularies();
  
  variable_set('calais_api_allow_searching', false);
  variable_set('calais_api_allow_distribution', false);
  variable_set('calais_applied_entities_global', drupal_map_assoc($calais_used));
  
  variable_set('calais_node_blog_process', 'AUTO');
  variable_set('calais_node_article_process', 'AUTO');
  variable_set('calais_node_audio_process', 'AUTO');
  variable_set('calais_node_video_process', 'AUTO');
  variable_set('calais_node_op_image_process', 'AUTO');
  variable_set('calais_node_resource_process', 'AUTO');
  variable_set('calais_node_event_process', 'AUTO');
  variable_set('calais_node_feeditem_process', 'AUTO');
  
  // Config feed items to use SemanticProxy by default
  variable_set('calais_semanticproxy_field_feeditem', 'calais_feedapi_node');
  
  $node_types = array('article', 'blog', 'audio', 'video', 'op_image', 'resource', 'event', 'feeditem');
  foreach($node_types as $key) {
    if(!empty($calais_entities)) {
      foreach ($calais_entities as $entity => $vid) {
        if (!in_array($entity, $calais_ignored)) {
          db_query("INSERT INTO {vocabulary_node_types} (vid, type) values('%d','%s') ", $vid, $key);
        }
      }
    }
  }
 
  variable_set('calais_threshold_article', '.25');
  variable_set('calais_threshold_audio', '.25');
  variable_set('calais_threshold_blog', '.25');
  variable_set('calais_threshold_event', '.25');
  variable_set('calais_threshold_feeditem', '.25');
  variable_set('calais_threshold_op_image', '.25');
  variable_set('calais_threshold_resource', '.25');
  variable_set('calais_threshold_video', '.25');
  
  // Calais Geo
  $geo_vocabs = array();
  foreach($calais_entities as $key => $value) {
    if ($key == 'ProvinceOrState' || $key == 'City' || $key == 'Country') {
      $geo_vocabs[$value] = $value;
    }
  }
  variable_set('gmap_default', array('width' => '100%', 'height' => '300px', 'zoom' => '5', 'maxzoom' => '14'));
  variable_set('calais_geo_vocabularies', $geo_vocabs);
  variable_set('calais_geo_nodes_enabled', array('blog'=>'blog', 'article'=>'article', 'audio'=>'audio',
  				'event'=>'event','op_image'=>'op_image', 'resource'=>'resource', 'video'=>'video'));

  // Calais Tagmods
  variable_set('calais_tag_blacklist', 'Other, Person Professional, Quotation, Person Political, Person Travel, Person Professional Past, Person Political Past');
  
  // MoreLikeThis
  $target_types = array('blog' => 'blog', 'article' => 'article', 'event' => 'event', 'resource' => 'resource');
  variable_set('morelikethis_taxonomy_threshold_article', '.25');
  variable_set('morelikethis_taxonomy_threshold_blog', '.25');
  variable_set('morelikethis_taxonomy_threshold_event', '.25');
  variable_set('morelikethis_taxonomy_threshold_resource', '.25');
  variable_set('morelikethis_taxonomy_target_types_resource', $target_types);
  variable_set('morelikethis_taxonomy_target_types_event', $target_types);
  variable_set('morelikethis_taxonomy_target_types_article', $target_types);
  variable_set('morelikethis_taxonomy_target_types_blog', $target_types);
  variable_set('morelikethis_taxonomy_enabled_resource', 1);
  variable_set('morelikethis_taxonomy_enabled_article', 1);
  variable_set('morelikethis_taxonomy_enabled_blog', 1);
  variable_set('morelikethis_taxonomy_enabled_event', 1);
  variable_set('morelikethis_taxonomy_count_article', '5');
  variable_set('morelikethis_taxonomy_count_event', '5');
  variable_set('morelikethis_taxonomy_count_blog', '5');
  variable_set('morelikethis_gv_content_type_article', 1);
  variable_set('morelikethis_gv_content_type_blog', 1);
  variable_set('morelikethis_gv_content_type_event', 1);
  variable_set('morelikethis_gv_content_type_resource', 1);
  variable_set('morelikethis_flickr_content_type_resource ', 1);
  variable_set('morelikethis_flickr_content_type_event', 1);
  variable_set('morelikethis_flickr_content_type_blog', 1);
  variable_set('morelikethis_flickr_content_type_article', 1);
  variable_set('morelikethis_calais_default', 1); 
  variable_set('morelikethis_calais_relevance', '.45');  
  
  // Topic Hubs
  variable_set('topic_hub_plugin_type_default', array('blog' => 'blog', 'article' => 'article' ,'audio' => 'audio',
    'event' => 'event', 'op_image' => 'op_image', 'video' => 'video'));
  variable_set('topichubs_contrib_ignore', array(1=>1));
  
  // SWF Tools
  variable_set('swftools_embed_method', 'swfobject2_replace');
  variable_set('swftools_flv_display', 'flowplayer3_mediaplayer');
  variable_set('swftools_flv_display_list', 'flowplayer3_mediaplayer'); 
  variable_set('swftools_media_display_list', 'flowplayer3_mediaplayer');
  variable_set('swftools_mp3_display', 'flowplayer3_mediaplayer');
  variable_set('swftools_mp3_display', 'flowplayer3_mediaplayer');
  variable_set('swftools_mp3_display_list', 'flowplayer3_mediaplayer');
  variable_set('emfield_emvideo_allow_youtube', 1);
  variable_set('flowplayer3_mediaplayer_file', 'flowplayer-3.1.1.swf');
  variable_set('flowplayer3_mediaplayer_stream_plugin', 'flowplayer.rtmp-3.0.2.swf');

  _openpublish_log(t('Roles, permissions and configuration settings are in place'));
}

/**
 * Setup 3 custom menus and primary links.
 */
function _openpublish_modify_menus() {
  cache_clear_all();
  menu_rebuild();
  
  // TODO: Rework into new Dashboard
  $op_plid = install_menu_create_menu_item('admin/settings/openpublish/api-keys', 'OpenPublish Control Panel', 'Short cuts to important functionality.', 'navigation', 1, -49);
  install_menu_create_menu_item('admin/settings/openpublish/api-keys', 'API Keys', 'Calais, Apture and Flickr API keys.', 'navigation', $op_plid, 1);
  install_menu_create_menu_item('admin/settings/openpublish/calais-suite', 'Calais Suite', 'Administrative links to Calais, More Like This and Topic Hubs functionality.', 'navigation', $op_plid, 2);
  install_menu_create_menu_item('admin/settings/openpublish/content', 'Content Links', 'Administrative links to content, comment, feed and taxonomy management.', 'navigation', $op_plid, 3);

  install_menu_create_menu('Footer Primary', 'footer-primary');
  install_menu_create_menu('Footer Secondary', 'footer-secondary');
  install_menu_create_menu('Top Menu', 'top-menu'); 
  
  $top_menu = array (
    array (
  	  'menu' => 'menu-top-menu',
  	  'title' => 'About Us',
  	  'path' => 'node/1',
  	  'weight' => 1
  	),
  	array (
  	  'menu' => 'menu-top-menu',
  	  'title' => 'Advertise',
  	  'path' => 'node/2',
  	  'weight' => 2
  	),
  	array (
  	  'menu' => 'menu-top-menu',
  	  'title' => 'Subscribe',
  	  'path' => 'node/3',
  	  'weight' => 3
  	),
  	array (
  	  'menu' => 'menu-top-menu',
  	  'title' => 'RSS',
  	  'path' => 'node/4',
  	  'weight' => 4
  	),		
  );
  
  $footer_secondary_menu = array (
    array(
      'menu' => 'menu-footer-secondary',
  	  'title' => 'Subscribe',
  	  'path' => 'node/3',
  	  'weight' => 1,
  	),
  	array(
  	  'menu' => 'menu-footer-secondary',
  	  'title' => 'Advertise',
  	  'path' => 'node/2',
  	  'weight' => 2,
  	),
  	array(
  	  'menu' => 'menu-footer-secondary',
  	  'title' => 'Jobs',
  	  'path' => 'node/5',
  	  'weight' => 4,
  	),
  	array(
  	  'menu' => 'menu-footer-secondary',
  	  'title' => 'Store',
  	  'path' => 'node/6',
  	  'weight' => 5,
  	),
  	array(
  	  'menu' => 'menu-footer-secondary',
  	  'title' => 'About Us',
  	  'path' => 'node/1',
  	  'weight' => 6,
  	),
  	array(
  	  'menu' => 'menu-footer-secondary',
  	  'title' => 'Site Map',
  	  'path' => 'node/7',
  	  'weight' => 7,
  	),
  	array(
  	  'menu' => 'menu-footer-secondary',
  	  'title' => 'Terms of Use',
  	  'path' => 'node/8',
  	  'weight' => 8,
  	),
  	array(
  	  'menu' => 'menu-footer-secondary',
  	  'title' => 'Privacy Policy',
  	  'path' => 'node/9',
  	  'weight' => 9,
  	),
  );
  
  $footer_primary_menu = array(
    array(
      'menu' => 'menu-footer-primary',
  	  'title' => 'Latest News',
  	  'path' => 'articles/all',
  	  'weight' => 1,
  	),
  	array(
  	  'menu' => 'menu-footer-primary',
  	  'title' => 'Hot Topics',
  	  'path' => 'popular/all',
  	  'weight' => 2,
  	),
  	array(
  	  'menu' => 'menu-footer-primary',
  	  'title' => 'Blogs',
  	  'path' => 'blogs',
  	  'weight' => 3,
  	),
  	array(
  	  'menu' => 'menu-footer-primary',
  	  'title' => 'Resources',
  	  'path' => 'resources',
  	  'weight' => 4,
  	),
  	array(
  	  'menu' => 'menu-footer-primary',
  	  'title' => 'Events',
  	  'path' => 'events',
  	  'weight' => 5,
  	),
  );
  
  $primary_links = array(
    array(
      'menu' => 'primary-links',
  	  'title' => 'Home',
  	  'path' => '<front>',
  	  'weight' => 1,
  	),
  	array(
      'menu' => 'primary-links',
  	  'title' => 'Business',
  	  'path' => 'articles/Business',
  	  'weight' => 2,
  	),
  	array(
      'menu' => 'primary-links',
  	  'title' => 'Health',
  	  'path' => 'articles/Health',
  	  'weight' => 3,
  	),	
  	array(
      'menu' => 'primary-links',
  	  'title' => 'Politics',
  	  'path' => 'articles/Politics',
  	  'weight' => 4,
  	),
  	array(
      'menu' => 'primary-links',
  	  'title' => 'Technology',
  	  'path' => 'articles/Technology',
  	  'weight' => 5,
  	),
  	array(
      'menu' => 'primary-links',
  	  'title' => 'Blogs',
  	  'path' => 'blogs',
  	  'weight' => 6,
  	),
  	array(
      'menu' => 'primary-links',
  	  'title' => 'Resources',
  	  'path' => 'resources',
  	  'weight' => 7,
  	),
  	array(
      'menu' => 'primary-links',
  	  'title' => 'Events',
  	  'path' => 'events',
  	  'weight' => 8,
  	),
  	array(
      'menu' => 'primary-links',
  	  'title' => 'Topic Hubs',
  	  'path' => 'topic-hubs',
  	  'weight' => 9,
  	),
  );  
 
  // TODO: Merge all arrays and process in one loop.
  foreach ($primary_links as $item) {	
    install_menu_create_menu_item($item[path], $item[title], '', $item[menu], 0, $item[weight]);
  }

  foreach ($footer_primary_menu as $item) {	
    install_menu_create_menu_item($item[path], $item[title], '', $item[menu], 0, $item[weight]);
  }

  foreach ($top_menu as $item) {	
    install_menu_create_menu_item($item[path], $item[title], '', $item[menu], 0, $item[weight]);
  }
  
  foreach ($footer_secondary_menu as $item) {	
    install_menu_create_menu_item($item[path], $item[title], '', $item[menu], 0, $item[weight]);
  }
} 

/**
 * Set views as "default views" so they can be reverted
 */
function _openpublish_set_views() {
  views_include_default_views();
  
  //popular view is disabled by default, enable it
  $view = views_get_view('popular');
  $view->disabled = FALSE;
  $view->save();
} 


/**
 * Create custom blocks and set region and pages.
 * 
 * TODO: Rework this to use Context.
 */
function _openpublish_setup_blocks() {  
  global $base_url; 
  cache_clear_all();
  
  // Ensures that $theme_key gets set
  install_default_theme('openpublish_theme');

  // install the five manual blocks create through the UI  
  $ad_base = $base_url . '/sites/all/themes/openpublish_theme/images';
  $bid = install_create_custom_block('<img src="' . $ad_base . '/placeholder_ad_banner.gif"/><div class="clear"></div>', 'Top Banner Ad', 2);
  install_set_block('block', $bid, 'openpublish_theme', 'header', -10);

  $bid = install_create_custom_block('<p><img src="' . $ad_base . '/placeholder_ad_rectangle.gif"/></p>', 'Right Block Square Ad', 2);
  install_set_block('block', $bid, 'openpublish_theme', 'right', -8);

  $bid = install_create_custom_block('<p><img src="' . $ad_base . '/placeholder_ad_rectangle.gif"/></p>', 'Homepage Ad Block 1', 2);
  install_set_block('block', $bid, 'openpublish_theme', 'homepage_right', -10);
  
  $bid = install_create_custom_block('<p><img src="' . $ad_base . '/placeholder_ad_rectangle.gif"/></p>', 'Homepage Ad Block 2', FILTER_HTML_ESCAPE);
  install_set_block('block', $bid, 'openpublish_theme', 'homepage_right', -8);  
  
  $bid = install_create_custom_block('<p id="credits"><a href="http://www.phase2technology.com/" target="_blank">Phase2 Technology</a></p>', 'Credits', FILTER_HTML_ESCAPE);
  install_set_block('block', $bid, 'openpublish_theme', 'footer',  - 2);
  
  install_init_blocks();
 
  install_set_block('views', 'blogs-block_2', 'openpublish_theme', 'homepage_center', -10);
  install_set_block('views', 'multimedia-block_1', 'openpublish_theme', 'homepage_center', -9);
  install_set_block('views', 'resources-block_1', 'openpublish_theme', 'homepage_center', -8);
  install_set_block('views', 'twitter_items-block_1', 'openpublish_theme', 'homepage_center', -7);
  install_set_block('views', 'events-block_1', 'openpublish_theme', 'homepage_center', -6);
  install_set_block('views', 'articles-block_2', 'openpublish_theme', 'homepage_left', -10);
  install_set_block('views', 'articles-block_1', 'openpublish_theme', 'homepage_left', -9);
  install_set_block('views', 'feed_items-block_1', 'openpublish_theme', 'homepage_left', -8);
  install_set_block('views', 'most_viewed_by_taxonomy-block', 'openpublish_theme', 'right', -7);
  install_set_block('views', 'most_viewed_by_node_type-block', 'openpublish_theme', 'right', -6);
  install_set_block('views', 'most_viewed_multimedia-block', 'openpublish_theme', 'right', -5);
  install_set_block('views', 'most_commented_articles-block_1', 'openpublish_theme', 'right', -4);
  install_set_block('views', 'most_commented_blogs-block_1', 'openpublish_theme', 'right', -3);
  
  install_set_block('morelikethis', 'googlevideo', 'openpublish_theme', 'content', -10); 	  
  install_set_block('popular_terms', '0', 'openpublish_theme', 'homepage_right', -9);
  install_set_block('popular_terms', '1', 'openpublish_theme', 'homepage_right', -7);
  install_set_block('morelikethis', 'taxonomy', 'openpublish_theme', 'right', -10);
  install_set_block('morelikethis', 'flickr', 'openpublish_theme', 'right', -9);

  db_query("UPDATE {blocks} SET title = '%s' WHERE module = '%s' AND delta = '%s' AND theme= '%s'", 'Google Videos Like This', 'morelikethis', 'taxonomy', 'openpublish_theme');
  db_query("UPDATE {blocks} SET title = '%s' WHERE module = '%s' AND delta = '%s' AND theme= '%s'", 'Flickr Images Like This', 'morelikethis', 'flickr', 'openpublish_theme');
  db_query("UPDATE {blocks} SET title = '%s' WHERE module = '%s' AND delta = '%s' AND theme= '%s'", 'Recommended Reading', 'morelikethis', 'taxonomy', 'openpublish_theme'); 
  db_query("UPDATE {blocks} SET title = '%s' WHERE module = '%s' AND delta = '%s' AND theme= '%s'", 'Most Used Terms', 'popular_terms', '0', 'openpublish_theme');
  db_query("UPDATE {blocks} SET title = '%s' WHERE module = '%s' AND delta = '%s' AND theme= '%s'", 'Featured Topic Hubs', 'popular_terms', '1', 'openpublish_theme');
  
  db_query("UPDATE {blocks} SET region = '%s', status = 1, weight = %d WHERE module = '%s' AND delta = '%s' AND theme = '%s'", $region, $weight, $module, $delta, $theme);
 
  db_query("UPDATE {blocks} SET pages = '%s', visibility = 1 WHERE module = '%s' AND delta = '%s' AND theme = '%s'", 'article/*
blog/*
resource/*
event/*', 'morelikethis', 'googlevideo', 'openpublish_theme');  
 
  db_query("UPDATE {blocks} SET pages = '%s', weight = -20 WHERE module = '%s' AND delta = '%s' AND theme = '%s'", 'admin*
topic-hub/*
package/*', 'block', '3', 'openpublish_theme');
 
  db_query("UPDATE {blocks} SET pages = '%s', visibility = 1 WHERE module = '%s' AND delta = '%s' AND theme = '%s'", 'article/*
blog/*
resource/*
event/*', 'morelikethis', 'flickr', 'openpublish_theme');
 
  db_query("UPDATE {blocks} SET pages = '%s', visibility = 1 WHERE module = '%s' AND delta = '%s' AND theme = '%s'", 'article/*
blog/*
resource/*
event/*', 'morelikethis', 'taxonomy ', 'openpublish_theme');

  db_query("UPDATE {blocks} SET pages = '%s', visibility = 1 WHERE module = '%s' AND delta = '%s' AND theme = '%s'", 'articles/*', 'views', 'most_commented_articles-block_1', 'openpublish_theme');
  db_query("UPDATE {blocks} SET pages = '%s', visibility = 1 WHERE module = '%s' AND delta = '%s' AND theme = '%s'", 'blogs', 'views', 'most_commented_blogs-block_1', 'openpublish_theme');
 
  db_query("UPDATE {blocks} SET pages = '%s', visibility = 1 WHERE module = '%s' AND delta = '%s' AND theme = '%s'", 'resources*
events*
blogs*', 'views', 'most_viewed_by_node_type-block', 'openpublish_theme');
 
  db_query("UPDATE {blocks} SET pages = '%s', visibility = 1 WHERE module = '%s' AND delta = '%s' AND theme = '%s'", 'articles*', 'views', 'most_viewed_by_taxonomy-block', 'openpublish_theme');
  db_query("UPDATE {blocks} SET pages = '%s', visibility = 1 WHERE module = '%s' AND delta = '%s' AND theme = '%s'", 'multimedia', 'views', 'most_viewed_multimedia-block', 'openpublish_theme'); 

 
  db_query("UPDATE {blocks} SET pages = '%s', visibility = 1 WHERE module = '%s' AND delta = '%s' AND theme = '%s'", 'admin
admin/*', 'openpublish_administration', '0', 'openpublish_theme');
  
  install_disable_block('user', '0', 'openpublish_theme');
  install_disable_block('user', '1', 'openpublish_theme');
  install_disable_block('system', '0', 'openpublish_theme');
  
  //install_set_block('openpublish_administration', '0', 'openpublish', 'left', 0);
  //install_add_block_role('openpublish_administration', '0', install_get_rid('administrator'));
  //install_add_block_role('openpublish_administration', '0', install_get_rid('editor'));
  //install_add_block_role('openpublish_administration', '0', install_get_rid('author'));
  //install_add_block_role('openpublish_administration', '0', install_get_rid('web editor'));  
}

/**
 * Cleanup after the install
 */
function _openpublish_cleanup($success, $results) {
  drupal_flush_all_caches();    
  install_init_blocks();
  views_invalidate_cache();
}

/**
 * Set OpenPublish as the default
 */
function system_form_install_select_profile_form_alter(&$form, $form_state) {
  foreach($form['profile'] as $key => $element) {
    $form['profile'][$key]['#value'] = 'openpublish';
  }
}

function _openpublish_log($msg) {
  error_log($msg);
  drupal_set_message($msg);
}
