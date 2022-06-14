
#!/usr/bin/env python
# Implementation of collaborative filtering recommendation engine


from recommendation_data import dataset
from math import sqrt

def similarity_score(person1,person2):
	
	# Tỷ số trả về Điểm khoảng cách Euclide của người 1 và người 2

	both_viewed = {}		# Để nhận được cả hai mục được xếp hạng bởi người1 và người2

	for item in dataset[person1]:
		if item in dataset[person2]:
			both_viewed[item] = 1

		# Điều kiện để kiểm tra cả hai đều có một mục xếp hạng chung
		if len(both_viewed) == 0:
			return 0

		# Tìm khoảng cách Euclide
		sum_of_eclidean_distance = []	

		for item in dataset[person1]:
			if item in dataset[person2]:
				sum_of_eclidean_distance.append(pow(dataset[person1][item] - dataset[person2][item],2))
		sum_of_eclidean_distance = sum(sum_of_eclidean_distance)

		return 1/(1+sqrt(sum_of_eclidean_distance))



def pearson_correlation(person1,person2):

	# Để có được cả hai mục được xếp hạng
	both_rated = {}
	for item in dataset[person1]:
		if item in dataset[person2]:
			both_rated[item] = 1

	number_of_ratings = len(both_rated)		
	
	# Kiểm tra số lượng xếp hạng chung
	if number_of_ratings == 0:
		return 0

	# Thêm tất cả các tùy chọn của mỗi người dùng
	person1_preferences_sum = sum([dataset[person1][item] for item in both_rated])
	person2_preferences_sum = sum([dataset[person2][item] for item in both_rated])

	# Tính tổng các bình phương sở thích của từng người dùng
	person1_square_preferences_sum = sum([pow(dataset[person1][item],2) for item in both_rated])
	person2_square_preferences_sum = sum([pow(dataset[person2][item],2) for item in both_rated])

	# Tính tổng giá trị sản phẩm của cả hai ưu đãi cho từng mặt hàng
	product_sum_of_both_users = sum([dataset[person1][item] * dataset[person2][item] for item in both_rated])

	# Tính điểm pearson
	numerator_value = product_sum_of_both_users - (person1_preferences_sum*person2_preferences_sum/number_of_ratings)
	denominator_value = sqrt((person1_square_preferences_sum - pow(person1_preferences_sum,2)/number_of_ratings) * (person2_square_preferences_sum -pow(person2_preferences_sum,2)/number_of_ratings))
	if denominator_value == 0:
		return 0
	else:
		r = numerator_value/denominator_value
		return r 

def most_similar_users(person,number_of_users):
	# trả về number_of_users (những người tương tự) cho một người cụ thể nhất định.
	scores = [(pearson_correlation(person,other_person),other_person) for other_person in dataset if  other_person != person ]
	
	# Sắp xếp những người tương tự để người có điểm số cao nhất sẽ xuất hiện đầu tiên
	scores.sort()
	scores.reverse()
	return scores[0:number_of_users]

def user_reommendations(person):

	# Nhận đề xuất cho một người bằng cách sử dụng mức trung bình có trọng số của mọi xếp hạng của người dùng khác
	totals = {}
	simSums = {}
	rankings_list =[]
	for other in dataset:
		# đừng so sánh tôi với chính tôi
		if other == person:
			continue
		sim = pearson_correlation(person,other)
		#print ">>>>>>>",sim

		# bỏ qua điểm 0 hoặc thấp hơn
		if sim <=0: 
			continue
		for item in dataset[other]:

			# chỉ điểm những bộ phim tôi chưa xem
			if item not in dataset[person] or dataset[person][item] == 0:

			# Similrity * score
				totals.setdefault(item,0)
				totals[item] += dataset[other][item]* sim
				# tổng các điểm tương đồng
				simSums.setdefault(item,0)
				simSums[item]+= sim

		# Tạo danh sách chuẩn hóa

	rankings = [(total/simSums[item],item) for item,total in totals.items()]
	rankings.sort()
	rankings.reverse()
	# trả lại các mặt hàng được đề xuất
	recommendataions_list = [recommend_item for score,recommend_item in rankings]
	return recommendataions_list
		

print( user_reommendations('khiet'))