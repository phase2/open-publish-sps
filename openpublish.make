core = 6.x

; Utilities
projects[install_profile_api][install_path] = sites/all
projects[token][install_path] = sites/all
projects[devel][install_path] = sites/all
projects[autoload][install_path] = sites/all
projects[mollom][install_path] = sites/all
projects[ctools][install_path] = sites/all
projects[admin][install_path] = sites/all
projects[admin][patch][] = http://drupal.org/files/issues/admin-611254-1.patch

; Misc stand-alone
projects[swftools][install_path] = sites/all
projects[flag][install_path] = sites/all
projects[nodewords][install_path] = sites/all
projects[paging][install_path] = sites/all
projects[pathauto][install_path] = sites/all
projects[tabs][install_path] = sites/all
projects[panels][install_path] = sites/all
projects[custompage][install_path] = sites/all

; Login Destination and patch to not run during install profile
projects[login_destination][install_path] = sites/all
projects[login_destination][patch][] = http://drupal.org/files/issues/ld-install-profile-626788-1.patch

; Acquia Modules
projects[acquia_connector][install_path] = sites/all
projects[acquia_search][install_path] = sites/all
projects[acquia_search][type] = module
projects[acquia_search][download][type] = get
projects[acquia_search][download][url] = http://acquia.com/files/downloads/acquia-search-current.tar.gz
projects[acquia_search][patch][] = http://drupal.org/files/issues/openpublish-acquia-search-624792-2.patch
projects[apachesolr][install_path] = sites/all

; wysiwyg
projects[fckeditor][install_path] = sites/all
projects[imce][install_path] = sites/all

;date
projects[date][install_path] = sites/all

;imagecache
projects[imageapi][install_path] = sites/all
projects[imagecache][install_path] = sites/all

;cck
projects[cck][install_path] = sites/all
projects[emfield][install_path] = sites/all
projects[filefield][install_path] = sites/all
projects[imagefield][install_path] = sites/all
projects[link] = 2.6
projects[link][install_path] = sites/all

; Calais Collection
projects[rdf][install_path] = sites/all

projects[flickrapi][install_path] = sites/all
projects[gmap][install_path] = sites/all
projects[opencalais][install_path] = sites/all
projects[morelikethis][install_path] = sites/all
projects[topichubs][install_path] = sites/all

; Feed API
projects[feedapi][install_path] = sites/all
projects[feedapi_mapper][install_path] = sites/all

; Views
projects[views][install_path] = sites/all

; Publishers Extras
projects[apture][install_path] = sites/all
projects[contenture][install_path] = sites/all
projects[quantcast][install_path] = sites/all

; OpenPublish custom modules
projects[openpublish_core][install_path] = sites/all
projects[openpublish_core][type] = module
projects[openpublish_core][download][type] = git
projects[openpublish_core][download][url] = git://github.com/phase2/openpublish_core.git

; Themes
projects[rootcandy][install_path] = sites/all

; Custom theme developed for OpenPublish
projects[openpublish_theme][install_path] = sites/all
projects[openpublish_theme][type] = theme
projects[openpublish_theme][download][type] = git
projects[openpublish_theme][download][url] = git://github.com/phase2/openpublish_theme.git

; FCKEditor Library
libraries[fckeditorlib][download][type] = get
libraries[fckeditorlib][download][url] = http://downloads.sourceforge.net/project/fckeditor/FCKeditor/2.6.5/FCKeditor_2.6.5.tar.gz
libraries[fckeditorlib][destination] = modules/fckeditor/fckeditor
libraries[fckeditorlib][directory_name] = ./
libraries[fckeditorlib][install_path] = sites/all

libraries[simplepie][download][type] = get
libraries[simplepie][download][url] = http://simplepie.org/downloads/simplepie_1.2.zip
libraries[simplepie][install_path] = sites/all

; ARC2 Library required by RDF 
libraries[arc][download][type] = get
libraries[arc][download][url] = http://code.semsol.org/source/arc.tar.gz
libraries[arc][destination] = modules/rdf/vendor
libraries[arc][directory_name] = arc
libraries[arc][install_path] = sites/all

