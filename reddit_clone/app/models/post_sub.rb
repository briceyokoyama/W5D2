class PostSub < ApplicationRecord

  belongs_to :posts,
    foreign_key: :post_id,
    class_name: 'Post'

    belongs_to :subs,
      foreign_key: :sub_id,
      class_name: :Sub
end
