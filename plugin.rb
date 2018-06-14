# name: civically-ratings-extension
# about: Adds additional functionality to the Ratings plugin
# version: 0.1
# authors: Angus McLeod
# url: https://github.com/civicallyhq/x-civically-ratings

after_initialize do
  SiteSetting.rating_target_id_enabled = true

  DiscourseEvent.on(:post_created) do |post, opts, user|
    if post.is_first_post? && opts[:rating]
      Jobs.enqueue(:bulk_unread_lists_update,
        category_id: post.topic.category_id,
        add_lists: ['rating']
      )
    end
  end
end
