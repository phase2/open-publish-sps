core = 6.x

;--------- Utilities

projects[install_profile_api][install_path] = sites/all
projects[install_profile_api][version] = 2.1

projects[token][install_path] = sites/all
project[token][version] = 1.12

projects[devel][install_path] = sites/all
projects[devel][version] = 1.22

projects[autoload][install_path] = sites/all
projects[autoload][version] = 1.4
 
projects[mollom][install_path] = sites/all
projects[mollom][version] = 1.13

projects[views][install_path] = sites/all
project[views][version] = 2.11

projects[cck][install_path] = sites/all
projects[cck][version] = 2.8

projects[emfield][install_path] = sites/all
projects[emfield][version] = 1.24

projects[filefield][install_path] = sites/all
projects[filefield][version] = 3.7

projects[filefield_sources][install_path] = sites/all
projects[filefield_sources][version] = 1.2

projects[node_embed][install_path] = sites/all
projects[node_embed][version] = 1.2

projects[imagefield][install_path] = sites/all
projects[imagefield][version] = 3.7

projects[link][install_path] = sites/all
projects[link][version] = 2.9

projects[noderelationships][install_path] = sites/all
projects[noderelationships][version] = 1.5
projects[noderelationships][patch][] = http://drupal.org/files/issues/noderelationships.660958.patch
projects[noderelationships][patch][] = http://drupal.org/files/issues/687746_0.patch


projects[ctools][install_path] = sites/all
projects[ctools][version] = 1.7

projects[panels][install_path] = sites/all
projects[panels][version] = 3.7

projects[custompage][install_path] = sites/all
projects[custompage][version] = 1.17


projects[admin][install_path] = sites/all
#projects[admin][version] = "2.0-beta6"
projects[admin][version] = "2.0"
projects[admin][patch][] = http://drupal.org/files/issues/admin-611254-1.patch

projects[context][version] = "3.0-beta5"
#projects[context][version] = "3.0-rc2"
# patch not required for the latest, but can't update to the latest w/o Features update
#projects[context][patch][] = http://drupal.org/files/issues/context_ui-833214.patch
projects[context][install_path] = sites/all


;--------- Multimedia

projects[swftools][install_path] = sites/all
projects[swftools][version] = 2.5

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


;--------- Phase2 Modules (version specificity not required because we can verify/ensure compatibility.)

projects[premium_views_field][install_path] = sites/all
projects[twitter_pull][install_path] = sites/all
projects[opencalais][install_path] = sites/all
projects[morelikethis][install_path] = sites/all
projects[topichubs][install_path] = sites/all
projects[openpublish_core][install_path] = sites/all
projects[distro][install_path] = sites/all
projects[apture][install_path] = sites/all
projects[quantcast][install_path] = sites/all



;--------- Misc stand-alone

projects[openidadmin][install_path] = sites/all
projects[openidadmin][version] = 1.2

projects[flag][install_path] = sites/all
projects[flag][version] = 1.3

projects[nodewords][install_path] = sites/all
projects[nodewords][version] = 1.12-beta9

projects[paging][install_path] = sites/all
projects[paging][version] = "1.0-beta3"

projects[pathauto][install_path] = sites/all
projects[pathauto][version] = 1.4

projects[tabs][install_path] = sites/all
projects[tabs][version] = 1.3

;-- We need to install dev version of CMF, since the latest stable has a security issue: http://drupal.org/node/704114
projects[cmf][download][type] = get
projects[cmf][download][url] = http://ftp.drupal.org/files/projects/cmf-6.x-2.x-dev.tar.gz
projects[cmf][destination] = modules
projects[cmf][directory_name] = cmf
projects[cmf][install_path] = sites/all

projects[advuser][install_path] = sites/all
projects[advuser][version] = 2.3

projects[scheduler][install_path] = sites/all
projects[scheduler][version] = 1.7

; Monetization
projects[premium][install_path] = sites/all
projects[premium][version] = "1.0-alpha1"


projects[nodequeue][install_path] = sites/all
projects[nodequeue][version] = 2.9

projects[advanced_help][install_path] = sites/all
projects[advanced_help][version] = 1.2

projects[jcarousel][install_path] = sites/all
projects[jcarousel][version] = 1.1

projects[login_destination][install_path] = sites/all
projects[login_destination][version] = 2.10

projects[ckeditor][install_path] = sites/all
projects[ckeditor][version] = 1.1
projects[ckeditor][patch][] = http://drupal.org/files/issues/ckeditor.install-736786_0.patch
projects[ckeditor][patch][] = http://drupal.org/files/issues/ckeditor.module-772134.patch
projects[ckeditor][patch][] = http://openpublishapp.com/sites/default/files/releases/patches/ckeditor.config.js-nodeembed.patch

projects[imce][install_path] = sites/all
projects[imce][version] = 1.4

projects[date][install_path] = sites/all
projects[date][version] = 2.6

projects[imageapi][install_path] = sites/all
projects[imageapi][version] = 1.8

projects[imagecache][install_path] = sites/all
projects[imagecache][version] = 2.0-beta10

projects[jquery_update][install_path] = sites/all
projects[jquery_update][version] = "2.0-alpha1"

projects[ie_css_optimizer][install_path] = sites/all
projects[ie_css_optimizer][version] = 1.0

projects[jquery_ui][install_path] = sites/all
projects[jquery_ui][version] = 1.3

;-- We need to install dev version of Modalframe, since the latest stable is not, yet, compatible with Admin 2.x. @See: http://drupal.org/node/732820
;projects[modalframe][download][type] = get
;projects[modalframe][download][url] = http://ftp.drupal.org/files/projects/modalframe-6.x-1.x-dev.tar.gz
;projects[modalframe][destination] = modules
;projects[modalframe][directory_name] = modalframe
;projects[modalframe][install_path] = sites/all
projects[modalframe][install_path] = sites/all
projects[modalframe][version] = 1.7


;--------- Acquia Modules

projects[acquia_connector][install_path] = sites/all
projects[acquia_search][install_path] = sites/all
projects[acquia_search][type] = module
projects[acquia_search][download][type] = get
projects[acquia_search][download][url] = http://acquia.com/files/downloads/acquia-search-current.tar.gz
projects[acquia_search][patch][] = http://drupal.org/files/issues/openpublish-acquia-search-624792-2.patch
projects[apachesolr][install_path] = sites/all


; Calais Collection
projects[rdf][install_path] = sites/all
projects[rdf][version] = 1.0-alpha7
projects[rdf][patch][] = http://drupal.org/files/issues/rdf-693018.install.patch

projects[gmap][install_path] = sites/all
projects[gmap][version] = 1.1

; Feed API
projects[feedapi][install_path] = sites/all
projects[feedapi][version] = 1.8

projects[feedapi_mapper][type] = module
projects[feedapi_mapper][install_path] = sites/all
projects[feedapi_mapper][download][type] = get
projects[feedapi_mapper][download][url] = http://ftp.drupal.org/files/projects/feedapi_mapper-6.x-1.3.tar.gz
;projects[feedapi_mapper][install_path] = sites/all
;projects[feedapi_mapper][version] = 1.3


;--------- Features-related

;projects[features][version] = "1.0-beta6" 
projects[features][version] = "1.0-beta8" 
projects[features][install_path] = sites/all


projects[strongarm][install_path] = sites/all
projects[strongarm][version] = 2.0

; OpenPublish Features modules
projects[openpublish_features][install_path] = sites/all
projects[openpublish_features][type] = module


;--------- Themes

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

; Custom theme developed for OpenPublish
projects[openpublish_theme][install_path] = sites/all


;--------- Modules without stable release (dev release only)

projects[imagecrop][install_path] = sites/all
projects[flickrapi][install_path] = sites/all

projects[viewscarousel][download][type] = get
projects[viewscarousel][download][url] = http://ftp.drupal.org/files/projects/viewscarousel-6.x-2.x-dev.tar.gz
projects[viewscarousel][destination] = modules
projects[viewscarousel][directory_name] = viewscarousel
projects[viewscarousel][install_path] = sites/all



;--------- Libraries

; get jquery_ui lib
libraries[jquery_ui_lib][download][type] = get
libraries[jquery_ui_lib][download][url] = http://jquery-ui.googlecode.com/files/jquery-ui-1.7.3.zip
libraries[jquery_ui_lib][destination] = modules/jquery_ui
libraries[jquery_ui_lib][directory_name] = jquery.ui
libraries[jquery_ui_lib][install_path] = sites/all

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

; CKeditor plugin for Node Embed
libraries[node_embed_ckeditor][download][type] = get
libraries[node_embed_ckeditor][download][url] = http://openpublishapp.com/sites/default/files/releases/packages/NodeEmbed.zip
libraries[node_embed_ckeditor][destination] = modules/ckeditor/plugins
libraries[node_embed_ckeditor][directory_name] = nodeembed
libraries[node_embed_ckeditor][install_path] = sites/all

;--------- Translation

projects[l10n_update][download][type] = get
projects[l10n_update][download][url] = http://ftp.drupal.org/files/projects/l10n_update-6.x-1.x-dev.tar.gz
projects[l10n_update][destination] = modules
projects[l10n_update][directory_name] = l10n_update
projects[l10n_update][install_path] = sites/all
