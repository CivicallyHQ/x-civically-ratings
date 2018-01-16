# name: civically-ratings-extension
# about: Adds additional functionality to the Ratings plugin
# version: 0.1
# authors: Angus McLeod
# url: https://github.com/civicallyhq/x-civically-ratings

after_initialize do
  SiteSetting.rating_target_id_enabled = true
end
