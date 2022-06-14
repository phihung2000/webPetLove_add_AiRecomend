# webPetLove_add_AiRecomend
website have AI Recomend product , use Apriori
Tomcat : 9.0
version : 1.0
java version : 1.8
JDK :1.8.0
Tải về vào server -> vào tomcat 9 -> vào server.xml -> ở dòng cuối cùng
Context docBase="webPetLove" path="" reloadable="true" source="org.eclipse.jst.jee.server:webPetLove"/> sửa path ="" như vậy .
sau đó khi chạy localhost thì search : http://localhost:8080/shop/homepage ( đây là trang chủ hiện tất cả các sản phẩm chưa có phân trang vì nó chưa phải trang chính )
http://localhost:8080/shop/allpet ( trang để cbi cho hệ thống khuyến nghị )
http://localhost:8080/admin/login ( trang admin)
file webpetlove.txt là file sql tải về đổi tên và chạy thứ tự theo relationship
![image](https://user-images.githubusercontent.com/65330451/143565579-994db2fc-fb0a-47e0-8359-83c290d2df55.png)

