class Item < ApplicationRecord
   has_one_attached :image
   
   def add_tax_price
      (self.price * 1.10).round
   end
   
   def get_image
     unless image.attached?
        file_path = Rails.root.join("app/assets/images/no_image.jpeg")
        image.attach(io: File.open(file_path), filename:"default-image.jpg", content_type: "image/jpeg")
     end
     image
   end
   
   belongs_to :genre
end
