core = 6.x
; set path to drupal root
install_path = sites/all
;misc stand-alone, required by others
projects[install_profile_api][install_path] = sites/all
projects[admin_menu][install_path] = sites/all
projects[rdf][install_path] = sites/all
projects[token][install_path] = sites/all
projects[gmap][install_path] = sites/all
projects[devel][install_path] = sites/all
projects[flickrapi][install_path] = sites/all
projects[autoload][install_path] = sites/all
projects[apture][install_path] = sites/all

projects[fckeditor][install_path] = sites/all
projects[flag][install_path] = sites/all
projects[imce][install_path] = sites/all
projects[login_destination][install_path] = sites/all
projects[mollom][install_path] = sites/all
projects[nodewords][install_path] = sites/all
projects[paging][install_path] = sites/all

projects[pathauto][install_path] = sites/all
projects[tabs][install_path] = sites/all


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

;Calais
projects[opencalais][install_path] = sites/all

;Feed API
projects[feedapi][install_path] = sites/all
projects[feedapi_mapper][install_path] = sites/all


;More Like this
projects[morelikethis][install_path] = sites/all

;swftools
projects[swftools][install_path] = sites/all

;views
projects[views][install_path] = sites/all


;topic hubs
projects[panels][install_path] = sites/all

projects[topichubs][install_path] = sites/all

projects[contenture][install_path] = sites/all

projects[quantcast][install_path] = sites/all
projects[ctools][install_path] = sites/all
projects[views_content][install_path] = sites/all
projects[page_manager][install_path] = sites/all


;Custom modules developed for OpenPublish
projects[openpublish_core][install_path] = sites/all
projects[openpublish_core][type] = module
projects[openpublish_core][download][type] = git
projects[openpublish_core][download][url] = git://github.com/phase2/openpublish_core.git

;themes
projects[rootcandy][install_path] = sites/all

;Custom theme developed for OpenPublish
projects[openpublish_theme][install_path] = sites/all
projects[openpublish_theme][type] = theme
projects[openpublish_theme][download][type] = git
projects[openpublish_theme][download][url] = git://github.com/phase2/openpublish_theme.git



