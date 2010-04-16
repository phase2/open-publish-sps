core = 6.x

; Utilities
projects[install_profile_api][install_path] = sites/all
projects[token][install_path] = sites/all
projects[devel][install_path] = sites/all
projects[autoload][install_path] = sites/all
projects[mollom][install_path] = sites/all
projects[ctools][install_path] = sites/all

projects[admin][version] = "2.0-beta1"
projects[admin][install_path] = sites/all
projects[admin][patch][] = http://drupal.org/files/issues/admin-611254-1.patch
;projects[admin][patch][] = http://drupal.org/files/issues/admin.module-696304.patch

libraries[tao][download][type] = get
libraries[tao][download][url] = http://code.developmentseed.org/sites/code.developmentseed.org/files/fserver/tao-6.x-1.9.tgz
libraries[tao][destination] = themes
libraries[tao][directory_name] = tao
libraries[tao][install_path] = sites/all

libraries[rubik][download][type] = get
libraries[rubik][download][url] = http://code.developmentseed.org/sites/code.developmentseed.org/files/fserver/rubik-6.x-1.0-beta7.tgz
libraries[rubik][destination] = themes
libraries[rubik][directory_name] = rubik
libraries[rubik][install_path] = sites/all

projects[context][version] = 2.0-beta7
projects[context][install_path] = sites/all
projects[context][patch][] = http://drupal.org/files/issues/context.core_.inc-64256.patch

; Misc stand-alone
projects[openidadmin][install_path] = sites/all




projects[swftools][install_path] = sites/all

; SWFObject2 Library required by SWFTools 
libraries[swfobject2][download][type] = get
libraries[swfobject2][download][url] = http://swfobject.googlecode.com/files/swfobject_2_2.zip
libraries[swfobject2][destination] = modules/swftools/shared
libraries[swfobject2][directory_name] = swfobject2
libraries[swfobject2][install_path] = sites/all

; FlowPlayer Library required by SWFTools to play audio/video files
libraries[flowplayer][download][type] = get
libraries[flowplayer][download][url] = http://www.opensourceopenminds.com/sites/default/files/releases/flowplayer-package.zip
libraries[flowplayer][destination] = modules/swftools/shared
libraries[flowplayer][directory_name] = flowplayer3
libraries[flowplayer][install_path] = sites/all

; 1PixelOut Library could be required by SWFTools to play audio files
libraries[onepixelout][download][type] = get
libraries[onepixelout][download][url] = http://wpaudioplayer.com/wp-content/downloads/audio-player-standalone.zip
libraries[onepixelout][destination] = modules/swftools/shared
libraries[onepixelout][directory_name] = 1pixelout
libraries[onepixelout][install_path] = sites/all



projects[flag][install_path] = sites/all

projects[nodewords][install_path] = sites/all
projects[nodewords][version] = 1.12-beta3

projects[paging][install_path] = sites/all
projects[pathauto][install_path] = sites/all
projects[tabs][install_path] = sites/all
projects[panels][install_path] = sites/all
projects[custompage][install_path] = sites/all

;-- We need to install dev version of CMF, since the latest stable has security issue: http://drupal.org/node/704114
projects[cmf][download][type] = get
projects[cmf][download][url] = http://ftp.drupal.org/files/projects/cmf-6.x-2.x-dev.tar.gz
projects[cmf][destination] = modules
projects[cmf][directory_name] = cmf
projects[cmf][install_path] = sites/all

projects[advuser][install_path] = sites/all
projects[scheduler][install_path] = sites/all
projects[premium][install_path] = sites/all
projects[premium_views_field][install_path] = sites/all
projects[nodequeue][install_path] = sites/all
projects[twitter_pull][install_path] = sites/all
projects[advanced_help][install_path] = sites/all

projects[jcarousel][installtest_path] = sites/all
projects[jcarousel][version] = 1.1

projects[viewscarousel][download][type] = get
projects[viewscarousel][download][url] = http://ftp.drupal.org/files/projects/viewscarousel-6.x-2.x-dev.tar.gz
projects[viewscarousel][destination] = modules
projects[viewscarousel][directory_name] = viewscarousel
projects[viewscarousel][install_path] = sites/all


; Login Destination and patch to not run during install profile
projects[login_destination][install_path] = sites/all
;projects[login_destination][version] = 2.5
;projects[login_destination][patch][] = http://drupal.org/files/issues/ld-install-profile-626788-1.patch

; Acquia Modules
projects[acquia_connector][install_path] = sites/all
projects[acquia_search][install_path] = sites/all
projects[acquia_search][type] = module
projects[acquia_search][download][type] = get
projects[acquia_search][download][url] = http://acquia.com/files/downloads/acquia-search-current.tar.gz
projects[acquia_search][patch][] = http://drupal.org/files/issues/openpublish-acquia-search-624792-2.patch
projects[apachesolr][install_path] = sites/all

; wysiwyg
projects[ckeditor][version] = 1.0
projects[ckeditor][install_path] = sites/all
projects[ckeditor][patch][] = http://drupal.org/files/issues/ckeditor.install-736786_0.patch
projects[ckeditor][patch][] = http://drupal.org/files/issues/ckeditor.module-772134.patch
projects[imce][install_path] = sites/all

;date
projects[date][install_path] = sites/all

;imagecache
projects[imageapi][install_path] = sites/all
projects[imagecache][install_path] = sites/all

;imagecrop
projects[imagecrop][install_path] = sites/all


;cck
projects[cck][install_path] = sites/all
projects[emfield][install_path] = sites/all
projects[filefield][install_path] = sites/all
projects[imagefield][install_path] = sites/all
projects[link][install_path] = sites/all

projects[noderelationships][version] = 1.5
projects[noderelationships][install_path] = sites/all
projects[noderelationships][patch][] = http://drupal.org/files/issues/noderelationships.660958.patch
projects[noderelationships][patch][] = http://drupal.org/files/issues/687746_0.patch

projects[jquery_ui][install_path] = sites/all


;-- We need to install dev version of Modalframe, since the latest stable is not, yet, compatible with Admin 2.x. @See: http://drupal.org/node/732820
projects[modalframe][download][type] = get
projects[modalframe][download][url] = http://ftp.drupal.org/files/projects/modalframe-6.x-1.x-dev.tar.gz
projects[modalframe][destination] = modules
projects[modalframe][directory_name] = cmf
projects[modalframe][install_path] = sites/all

; get jquery_ui lib
libraries[jquery_ui_lib][download][type] = get
libraries[jquery_ui_lib][download][url] = http://jquery-ui.googlecode.com/files/jquery.ui-1.6.zip
libraries[jquery_ui_lib][destination] = modules/jquery_ui
libraries[jquery_ui_lib][directory_name] = jquery.ui
libraries[jquery_ui_lib][install_path] = sites/all



; Calais Collection
projects[rdf][version] = 1.0-alpha7
projects[rdf][install_path] = sites/all
projects[rdf][patch][] = http://drupal.org/files/issues/rdf-693018.install.patch

projects[flickrapi][install_path] = sites/all
projects[gmap][install_path] = sites/all
projects[opencalais][install_path] = sites/all
projects[morelikethis][install_path] = sites/all
projects[topichubs][install_path] = sites/all

; Feed API
projects[feedapi][install_path] = sites/all

projects[feedapi_mapper][type] = module
projects[feedapi_mapper][install_path] = sites/all
projects[feedapi_mapper][download][type] = get
projects[feedapi_mapper][download][url] = http://ftp.drupal.org/files/projects/feedapi_mapper-6.x-1.3.tar.gz
;projects[feedapi_mapper][install_path] = sites/all
;projects[feedapi_mapper][version] = 1.3

; Views
projects[views][install_path] = sites/all

; Publishers Extras
projects[apture][install_path] = sites/all
projects[quantcast][install_path] = sites/all

; OpenPublish custom modules
projects[openpublish_core][install_path] = sites/all

; Custom theme developed for OpenPublish
projects[openpublish_theme][install_path] = sites/all

; Distro module
projects[distro][install_path] = sites/all

; CKEditor Library
libraries[ckeditorlib][download][type] = get
;libraries[ckeditorlib][download][url] = http://www.opensourceopenminds.com/sites/default/files/releases/ckeditor_3.2.tar.gz
libraries[ckeditorlib][download][url] = http://download.cksource.com/CKEditor/CKEditor/CKEditor%203.2/ckeditor_3.2.zip
libraries[ckeditorlib][destination] = libraries
libraries[ckeditorlib][install_path] = sites/all
libraries[ckeditorlib][directory_name] = ckeditor

; SimplePie RSS parser
libraries[simplepie][download][type] = get
libraries[simplepie][download][url] = http://simplepie.org/downloads/simplepie_1.2.zip
libraries[simplepie][destination] = modules/feedapi/parser_simplepie
libraries[simplepie][install_path] = sites/all
libraries[simplepie][copy][] = simplepie.inc

; ARC2 Library required by RDF 
libraries[arc][download][type] = get
libraries[arc][download][url] = http://code.semsol.org/source/arc.tar.gz
libraries[arc][destination] = modules/rdf/vendor
libraries[arc][directory_name] = arc
libraries[arc][install_path] = sites/all

; Features
projects[features][version] = 1.0-beta5
projects[features][install_path] = sites/all
projects[features][patch][] = http://drupal.org/files/issues/features.admin_.inc-670788.patch
projects[features][patch][] = http://drupal.org/files/issues/features.ctools.inc-696396.patch

projects[strongarm][install_path] = sites/all
projects[strongarm][version] = 2.0-beta3

; OpenPublish Features modules
projects[openpublish_features][install_path] = sites/all
projects[openpublish_features][type] = module
