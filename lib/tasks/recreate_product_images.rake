namespace :product do
  desc "Recreating thumb and main images"
  task :recreate_images => :environment do
    ProductImage.all.each do |product_image|
      product_image.image.recreate_versions!
    end
  end
end
