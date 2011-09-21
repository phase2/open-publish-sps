; Drupal Core
api = 2
core = 7.0

projects[field_group][subdir] = contrib
projects[field_group][type] = module
projects[field_group][version] = 1.0

projects[references][subdir] = contrib
projects[references][type] = module
projects[references][version] = 2.0-beta3

projects[ctools][subdir] = contrib
projects[ctools][type] = module
projects[ctools][version] = 1.0-rc1

projects[date][subdir] = contrib
projects[date][type] = module
projects[date][version] = 2.0-alpha4

projects[diff][subdir] = contrib
projects[diff][type] = module
projects[diff][version] = 2.0

projects[entity][subdir] = contrib
projects[entity][type] = module
projects[entity][version] = 1.0-beta10

projects[features][subdir] = contrib
projects[features][type] = module
projects[features][version] = 1.0-beta4

projects[openidadmin][subdir] = contrib
projects[openidadmin][type] = module
projects[openidadmin][version] = 1.0

projects[pathauto][subdir] = contrib
projects[pathauto][type] = module
projects[pathauto][version] = 1.0-rc2

projects[strongarm][subdir] = contrib
projects[strongarm][version] = 2.0-beta3

projects[token][subdir] = contrib
projects[token][version] = 1.0-beta5

projects[views][subdir] = contrib
projects[views][version] = 3.0-rc1

projects[nodequeue][subdir] = contrib
projects[nodequeue][type] = module
projects[nodequeue][version] = 2.0-alpha2
; projects[nodequeue][patch][] = http://drupal.org/files/issues/1023606-qid-to-name-6.patch

projects[entitycache][subdir] = contrib
projects[entitycache][type] = module
projects[entitycache][version] = 1.1

projects[conditional_styles][subdir] = contrib
projects[conditional_styles][version] = 2.0

projects[nodeconnect][type] = module
projects[nodeconnect][subdir] = contrib
projects[nodeconnect][version] = 1.0-alpha1

projects[apps][type] = module
projects[apps][subdir] = custom
projects[apps][version] = 1.0-beta3

projects[imce][subdir] = contrib
projects[imce][version] = 1.4

projects[imce_wysiwyg][subdir] = contrib
projects[imce_wysiwyg][version] = 1.x-dev

projects[filefield_sources][subdir] = contrib
projects[filefield_sources][version] = 1.4

projects[nodeblock][subdir] = contrib
projects[nodeblock][version] = 1.2
;projects[nodeblock][patch][] = http://drupal.org/files/issues/nodeblock.module.block_view.patch

projects[xmlsitemap][subdir] = contrib
projects[xmlsitemap][type] = module
projects[xmlsitemap][version] = 2.0-beta3

projects[wysiwyg][subdir] = contrib
projects[wysiwyg][type] = module
projects[wysiwyg][version] = 2.1
projects[wysiwyg][patch][] = http://drupal.org/files/issues/wysiwyg-835682-12.patch

libraries[ckeditor][download][type] = get
libraries[ckeditor][download][url] = http://download.cksource.com/CKEditor/CKEditor/CKEditor%203.6.1/ckeditor_3.6.1.tar.gz
libraries[ckeditor][directory_name] = ckeditor

projects[addthis][subdir] = contrib
projects[addthis][version] = 2.1-beta1

projects[google_analytics][subdir] = contrib
projects[google_analytics][version] = 1.2

projects[captcha][version] = 1.0-alpha2
projects[captcha][subdir] = contrib
projects[captcha][type] = module
projects[captcha][patch][] = http://drupal.org/files/issues/825088-19-captcha_ctools_export.patch

projects[recaptcha][subdir] = contrib
projects[recaptcha][type] = module
projects[recaptcha][version] = 1.7

projects[link][subdir] = contrib
projects[link][type] = module
projects[link][version] = 1.0-alpha3

projects[video_embed_field][subdir] = contrib
projects[video_embed_field][type] = module
projects[video_embed_field][version] = 1.0-alpha4

; Themes
projects[tao][type] = theme
projects[tao][version] = 3.0-beta3

projects[rubik][type] = theme
projects[rubik][version] = 4.0-beta6

projects[omega][type] = theme
projects[omega][version] = 3.0

; Page Layout + Administration
projects[context][subdir] = contrib
projects[context][type] = module
projects[context][version] = 3.0-beta2

projects[boxes][subdir] = contrib
projects[boxes][type] = module
projects[boxes][version] = 1.0-beta5

projects[context_field][subdir] = contrib
projects[context_field][type] = module
projects[context_field][version] = 1.0-beta1

projects[views_boxes][subdir] = contrib
projects[views_boxes][type] = module
projects[views_boxes][version] = 1.0-beta4

projects[entity_autocomplete][subdir] = contrib
projects[entity_autocomplete][type] = module
projects[entity_autocomplete][version] = 1.0-beta1

projects[views_arguments_extras][subdir] = contrib
projects[views_arguments_extras][type] = module
projects[views_arguments_extras][version] = 1.0-beta1

; OpenPublish specific
projects[openpublish_features][subdir] = contrib
projects[openpublish_features][type] = module
projects[openpublish_features][version] = 1.0-alpha1

// allow simpletest to look into profiles for modules
projects[drupal][patch][] = http://drupal.org/files/issues/911354.46.patch
