package com.webpetlove.ph.adm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webpetlove.ph.entity.Comment;
import com.webpetlove.ph.entity.Ratings;
import com.webpetlove.ph.entity.Recommend;
import com.webpetlove.ph.entity.User;
import com.webpetlove.ph.mysql.repo.CommentReposity;
import com.webpetlove.ph.mysql.repo.RatingsReposity;
import com.webpetlove.ph.mysql.repo.RecomendRepository;
import com.webpetlove.ph.mysql.repo.UserRepository;

@Controller
@RequestMapping("/user")
public class ManagerUserController {

  private @Autowired UserRepository userRepository;
  private final static int customer_group = 1;
  private @Autowired RatingsReposity ratingsreposity;
  private @Autowired CommentReposity commentreposity;
  private @Autowired RecomendRepository recomendReposity;
  
  @PostMapping("/login")
  public String userlogin(@RequestParam String command, @RequestParam String email, @RequestParam String password, HttpServletRequest request) {
    String url = "";
    User users = new User();
    HttpSession session = request.getSession();
    users = userRepository.finduser(email, password);
    if (users != null) {
        session.setAttribute("user", users);
        url ="shop/homepage";
    } else {
        session.setAttribute("error", "Email hoặc mật khẩu không đúng.!");
        url ="shop/login2";
    }
//	try {
//		String s = null;
//	    	Process p 
//	    }
//	catch{
//		
//	}
    return "redirect:/" + url;
    
  }
  
  @PostMapping("/insert")
  protected String userinsert(@RequestParam String command,@RequestParam int sex,@RequestParam String name, @RequestParam String email, @RequestParam String phone,@RequestParam String adress, @RequestParam String password, HttpServletRequest request){
	  String url = "";
      User users = new User();
      HttpSession session = request.getSession();
      users =userRepository.findByUserEmail(email);
       if(users != null)
        {
        	session.setAttribute("error", "Email đã được đăng ký vui lòng đăng ký email khác, cảm mơn");
        	url = "shop/Register";
        }
       else {
    	   User userss = new User();
        	userss.setUserEmail(email);
            userss.setUserPass(password);
            userss.setUserName(name);
            userss.setGroupid(customer_group);
            userss.setPhone(phone);
            userss.setDiachi(adress);
            userss.setGioitinh(sex);
            userRepository.save(userss);
            session.setAttribute("user", userss);
            url = "shop/homepage";
        }       
      return "redirect:/" + url;
  }
	  @PostMapping("/update")
	  public String post(@RequestParam String command, @RequestParam(required = false) Long id, @RequestParam String username,
			  @RequestParam String phone,@RequestParam int sex,@RequestParam String petlove,@RequestParam String ngaysinh,@RequestParam String diachi,HttpServletRequest request) {
		  String url = "";
	      User users = new User();
	      HttpSession session = request.getSession();
	      users =userRepository.findByUserid(id);
	      if(users !=null)
	      {
	    	  users.setDiachi(diachi);
	    	  users.setUserName(username);
	    	  users.setPhone(phone);
	    	  users.setGioitinh(sex);
	    	  users.setPetlove(petlove);
	    	  users.setNgaysinh(ngaysinh);
	    	  userRepository.save(users);
	    	  session.setAttribute("user", users);
	    	  url = "shop/infomation";
	      }
	      return "redirect:/" + url;
	  }
	  @PostMapping("/sendratings")
	  public String sendrasting(@RequestParam String command ,@RequestParam(required = false) Long id,@RequestParam Long productID,@RequestParam Long start,HttpServletRequest request) {
		  String url = "";
		  Ratings ratings = new Ratings();
		  Ratings Ratings = new Ratings();
		  Long productid = productID;
		  User users = new User();
		  HttpSession session = request.getSession();
		  users =userRepository.findByUserid(id);
		  Ratings = ratingsreposity.finByUserRantings(id, productid);
		  if(users!=null)
		  {
			  if(Ratings == null)
			  {
				  ratings.setUserId(id);
				  ratings.setProductid(productID);
				  ratings.setRatings(start);
				  ratingsreposity.save(ratings);
				  session.setAttribute("rating", ratings);
				  url ="shop/single/"+productid;
			  }
			  else {
				  session.setAttribute("error", "Bạn đã đánh giá sản phẩm này trước kia");
				  url ="shop/single/"+productid;
			  }
		  }
		  else
		  {
			  url ="shop/login2";
		  }
		  return "redirect:/" + url;
	  }
	  @PostMapping("/comment")
	  public String comment(@RequestParam String command, @RequestParam(required = false) Long id, @RequestParam(required = false) Long userid, @RequestParam String name,
			  @RequestParam String email,@RequestParam String text,HttpServletRequest request) {
		  String url = "";
	      Comment comments = new Comment();
	      User users = new User();
	      long a =5;
	      HttpSession session = request.getSession();
	      users =userRepository.findByUserid(userid);
	      if(users!=null)
	      {
	    	  comments.setCommentname(name);
		      comments.setCommentemail(email);
		      comments.setComment_text(text);
		      comments.setProductid(id);
		      commentreposity.save(comments);
		      //session.setAttribute("user", comments);
		      url = "shop/single/"+id;
		      
	      }
	      else
	      {
	    	  session.setAttribute("error", "vui lòng đăng nhập để bình luận");
	        	url = "shop/login2";
	      }
	      return "redirect:/" + url;
	  }
}
