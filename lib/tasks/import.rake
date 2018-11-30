# encoding: UTF-8
require 'csv'
namespace :import do

	task posts: :environment do
		filename = File.join Rails.root, "posts.csv"
		file = CSV.read(filename, col_sep:',', encoding: "EUC-KR")
		cnt=0
		file.each do |row|
			user_id,post_id,title, body,created_at, updated_at,open_range, like_count, posted_at, index = row

			post = Post.new(user_id:user_id,title:title,body:body,created_at:created_at,updated_at:updated_at,open_range:open_range,like_count:like_count,posted_at:posted_at)
			post.id=post_id
			post.save
			cnt+=1 if post.persisted?
		end
		puts "Imported #{cnt} posts"
	end

	task codis: :environment do
		filename = File.join Rails.root, "codis.csv"
		file = CSV.read(filename, col_sep:',', encoding: "EUC-KR")
		cnt=0
		file.each do |row|
			post_id,codi_id,e,c,u,p,i=row

			codi = Codi.new(post_id:post_id,event:e,preference:p,created_at:c,updated_at:u)
			codi.id=codi_id
			codi.save
			cnt+=1 if codi.persisted?
		end
		puts "Imported #{cnt} codis"
	end
	task clothes: :environment do
		filename = File.join Rails.root, "clothes.csv"
		file = CSV.read(filename, col_sep:',', encoding: "EUC-KR")
		cnt=0
		file.each do |row|
			codi_id,cloth_id,m,s,co,c,u=row

			cloth = Cloth.new(codi_id:codi_id,main_category:m,sub_category:s,color:co,created_at:c,updated_at:u)
			cloth.id=cloth_id
			cloth.save
			cnt+=1 if cloth.persisted?
		end
		puts "Imported #{cnt} clothes"
	end

end