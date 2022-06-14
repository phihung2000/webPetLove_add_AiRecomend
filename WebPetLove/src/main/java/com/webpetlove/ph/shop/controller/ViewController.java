package com.webpetlove.ph.shop.controller;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.lang.System;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.webpetlove.ph.entity.Bill;
import com.webpetlove.ph.entity.BillDetail;
import com.webpetlove.ph.entity.Comment;
import com.webpetlove.ph.entity.Product;
import com.webpetlove.ph.entity.Ratings;
import com.webpetlove.ph.entity.Recommend;
import com.webpetlove.ph.entity.User;
import com.webpetlove.ph.model.BillDto;
import com.webpetlove.ph.model.Cart;
import com.webpetlove.ph.model.CommentsDto;
import com.webpetlove.ph.model.Item;
import com.webpetlove.ph.model.RatingDto;
import com.webpetlove.ph.mysql.repo.BillDetailRepository;
import com.webpetlove.ph.mysql.repo.BillRepository;
import com.webpetlove.ph.mysql.repo.CategoryRepository;
import com.webpetlove.ph.mysql.repo.Category_givepetRepository;
import com.webpetlove.ph.mysql.repo.CommentReposity;
import com.webpetlove.ph.mysql.repo.ProductGPRepository;
import com.webpetlove.ph.mysql.repo.ProductRepository;
import com.webpetlove.ph.mysql.repo.RatingsReposity;
import com.webpetlove.ph.mysql.repo.RecomendRepository;
import com.webpetlove.ph.mysql.repo.StatusProduct;
import com.webpetlove.ph.mysql.repo.UserRepository;

@Controller
@RequestMapping("/shop")
public class ViewController {

  private @Autowired ProductRepository productRepository ;
  private @Autowired CategoryRepository categoryRepository;
  private @Autowired BillRepository billRepository;
  private @Autowired BillDetailRepository billDetailRepository;
  private @Autowired UserRepository userRepository;
  private @Autowired StatusProduct statusproduct;
  private @Autowired RatingsReposity ratingsreposity;
  private @Autowired Category_givepetRepository categorygivepetRepository;
  private @Autowired CommentReposity commentreposity;
  private @Autowired ProductGPRepository productGPrepository;
  private @Autowired RecomendRepository recomendReposity;
  
  @GetMapping("/homepage")
  public ModelAndView home(HttpServletRequest request) {
    ModelAndView mv = new ModelAndView("index");
    mv.addObject("products", productRepository.findAll());
    mv.addObject("categories", categoryRepository.findAll());
    mv.addObject("category_givepet",categorygivepetRepository.findAll());
    mv.addObject("user", request.getSession().getAttribute("user"));
    mv.addObject("menu", "homepage");
    setDataCart(mv, request);
    return mv;
  }
  @GetMapping("/blog")
  public ModelAndView blog(HttpServletRequest request) {
	  ModelAndView mv = new ModelAndView("blog");
	  mv.addObject("products", statusproduct.findByProduct());
	  mv.addObject("categories", categoryRepository.findAll());
	  mv.addObject("category_givepet",categorygivepetRepository.findAll());
	  mv.addObject("user", request.getSession().getAttribute("user"));
	  mv.addObject("menu", "trangchu");
	  setDataCart(mv, request);
	  return mv;
  }
  @GetMapping("/allpet")
  public ModelAndView allpet(HttpServletRequest request) {
	  ModelAndView mv = new ModelAndView("trangchu");
	  mv.addObject("products", statusproduct.findByProduct());
	  mv.addObject("categories", categoryRepository.findAll());
	  mv.addObject("category_givepet",categorygivepetRepository.findAll());
	  mv.addObject("user", request.getSession().getAttribute("user"));
	  mv.addObject("menu", "trangchu");
	  setDataCart(mv, request);
	  return mv;
  }
  @GetMapping("/single/{id}")
  public ModelAndView single(@PathVariable Long id, HttpServletRequest request) {
    ModelAndView mv = new ModelAndView("single");
    Long ratingstar1= (long) 0;
	Long ratingstar2=(long) 0;
	Long ratingstar3=(long) 0;
	Long ratingstar4=(long) 0;
	Long ratingstar5=(long) 0;
	Long sumcmt=(long) 0;

	List<Recommend> list_Loai_recomend =recomendReposity.findByLoaiRecomend(id);
	mv.addObject("Search_Loairecomend",list_Loai_recomend );
	Long id1 =null,id2 =null, id3 = null;
	for( int i=0 ; i< list_Loai_recomend.size() ; i++)
	{
		if(i<0)
		{
			id1 =null;
			id2 =null;
			id3 = null;
		}
		else if(i<1)
		{
			id1 =list_Loai_recomend.get(0).getLoai_Recommend();
			id2 =null;
			id3 = null;
		}
		else if(i<2)
		{
			id2 =list_Loai_recomend.get(1).getLoai_Recommend();
			id3 = null;
		}
		else if(i<3)
		{
			id3 =list_Loai_recomend.get(2).getLoai_Recommend();
		}
	}
	System.out.print(id1 +" d2 "+ id2 + " id3 "+ id3);
	List<Product> list_recomend = productRepository.findNameProduct(id1,id2,id3);
	for( int i=0 ; i< list_recomend.size() ; i++)
	{
		System.out.print(list_recomend.get(i).getProductName());
	}
	mv.addObject("List_product_recomend",list_recomend );
    mv.addObject("product", productRepository.findById(id).get());
    mv.addObject("cates", categoryRepository.findAll());
    mv.addObject("categories", categoryRepository.findAll());
    mv.addObject("category_givepet",categorygivepetRepository.findAll());
    mv.addObject("productId", id);
    mv.addObject("user", request.getSession().getAttribute("user"));
    List<Comment> comments =commentreposity.findBycommetn(id);
    mv.addObject("comments",comments);
    List<CommentsDto> commentsdto = new LinkedList<>();
    if(comments !=null && !comments.isEmpty())
    {
    	CommentsDto cmtdto = new CommentsDto();
    	for(Comment cmt : comments) {
    		if(cmt.getCommentid()>0)
    		{
    			cmtdto.setSumcomments(sumcmt+1);
    			sumcmt+=1;
    		}
    	}
    	commentsdto.add(cmtdto);
    }
    mv.addObject("sumcmt",commentsdto);
    List<Ratings> ratingstar = ratingsreposity.findByrantigs(id);
    List<RatingDto> dtos = new LinkedList<>();
    if(ratingstar != null && !ratingstar.isEmpty()) {
    	RatingDto dto = new RatingDto();
      for (Ratings b: ratingstar) {
            try {
            	if(b.getRatings()==1)
            	{
            		dto.setStar1(ratingstar1+1);
            		ratingstar1+=1;
            	}
            	else if(b.getRatings() ==2)
				{
            		dto.setStar2(ratingstar2+1);
            		ratingstar2+=1;
            		}
				else if(b.getRatings() ==3)
				{
					dto.setStar3(ratingstar3+1);
					ratingstar3+=1;
					}
            	
				else if(b.getRatings() ==4)
				{
					dto.setStar4(ratingstar4+1);
					ratingstar4+=1;
				}
				else if (b.getRatings() ==5)
				{
					dto.setStar5(ratingstar5+1);
					ratingstar5+=1;
				}
            
            } catch (Exception e) {
              System.out.println(e.getMessage()); 
        }
      }
      dtos.add(dto);
    }
    mv.addObject("RatingStar", dtos);
    mv.addObject("menu", "product");
    setDataCart(mv, request);
    return mv;
  }
  @GetMapping("/Single/{id}")
  public ModelAndView singleGP(@PathVariable Long id, HttpServletRequest request) {
    ModelAndView mv = new ModelAndView("Singe");
    Long ratingstar1= (long) 0;
	Long ratingstar2=(long) 0;
	Long ratingstar3=(long) 0;
	Long ratingstar4=(long) 0;
	Long ratingstar5=(long) 0;
	Long sumcmt=(long) 0;
    mv.addObject("productsGivepet", productGPrepository.findByProductID(id));
    mv.addObject("cates", categoryRepository.findAll());
    mv.addObject("category_givepet",categorygivepetRepository.findAll());
    mv.addObject("productGPId", id);
    mv.addObject("user", request.getSession().getAttribute("user"));
    List<Comment> comments =commentreposity.findBycommetn(id);
    mv.addObject("comments",comments);
    List<CommentsDto> commentsdto = new LinkedList<>();
    if(comments !=null && !comments.isEmpty())
    {
    	CommentsDto cmtdto = new CommentsDto();
    	for(Comment cmt : comments) {
    		if(cmt.getCommentid()>0)
    		{
    			cmtdto.setSumcomments(sumcmt+1);
    			sumcmt+=1;
    		}
    	}
    	commentsdto.add(cmtdto);
    }
    mv.addObject("sumcmt",commentsdto);
    List<Ratings> ratingstar = ratingsreposity.findByrantigs(id);
    List<RatingDto> dtos = new LinkedList<>();
    if(ratingstar != null && !ratingstar.isEmpty()) {
    	RatingDto dto = new RatingDto();
      for (Ratings b: ratingstar) {
            try {
            	if(b.getRatings()==1)
            	{
            		dto.setStar1(ratingstar1+1);
            		ratingstar1+=1;
            	}
            	else if(b.getRatings() ==2)
				{
            		dto.setStar2(ratingstar2+1);
            		ratingstar2+=1;
            		}
				else if(b.getRatings() ==3)
				{
					dto.setStar3(ratingstar3+1);
					ratingstar3+=1;
					}
            	
				else if(b.getRatings() ==4)
				{
					dto.setStar4(ratingstar4+1);
					ratingstar4+=1;
				}
				else if (b.getRatings() ==5)
				{
					dto.setStar5(ratingstar5+1);
					ratingstar5+=1;
				}
            
            } catch (Exception e) {
              System.out.println(e.getMessage()); 
        }
      }
      dtos.add(dto);
    }
    mv.addObject("RatingStar", dtos);
    mv.addObject("menu", "productsGivepet");
    setDataCart(mv, request);
    return mv;
  }
  @GetMapping("/checkout")
  public ModelAndView checkout(HttpServletRequest request) {
    ModelAndView mv = new ModelAndView("checkout");
    setDataCart(mv, request);
    mv.addObject("categories", categoryRepository.findAll());
    mv.addObject("category_givepet",categorygivepetRepository.findAll());
    return mv;
  }
  
  @GetMapping("/single/product/category/{id}")
  public ModelAndView prodByCate(@PathVariable Long id, HttpServletRequest request) {
    ModelAndView mv = new ModelAndView("product");
    mv.addObject("products", productRepository.findByCategoryId(id));
    mv.addObject("categoryId", id);
    mv.addObject("categories", categoryRepository.findAll());
    mv.addObject("category_givepet",categorygivepetRepository.findAll());
    mv.addObject("menu", "product");
    setDataCart(mv, request);
    return mv;
  }
  @GetMapping("/single/product/categoryGP/{id}")
  public ModelAndView prodByCateGP(@PathVariable Long id, HttpServletRequest request) {
    ModelAndView mv = new ModelAndView("product");
    mv.addObject("products", productRepository.findByCategoryGPID(id));
    mv.addObject("categoryId", id);
    mv.addObject("categories", categoryRepository.findAll());
    mv.addObject("category_givepet",categorygivepetRepository.findAll());
    mv.addObject("menu", "product");
    setDataCart(mv, request);
    return mv;
  }
  @GetMapping("/single/productgivepet/category/{id}")
  public ModelAndView productgivepetByCate(@PathVariable Long id, HttpServletRequest request) {
    ModelAndView mv = new ModelAndView("productGivePet");
    mv.addObject("productsGivepet", productGPrepository.findByCategoryGPId(id));
    mv.addObject("categoryGivepetId", id);
    mv.addObject("categories", categoryRepository.findAll());
    mv.addObject("category_givepet",categorygivepetRepository.findAll());
    mv.addObject("menu", "productsGivepet");
    setDataCart(mv, request);
    return mv;
  }
  @GetMapping("/delivery")
  public ModelAndView delivery(HttpServletRequest request) {
    ModelAndView mv = new ModelAndView("chinhsach");
    mv.addObject("categories", categoryRepository.findAll());
    mv.addObject("category_givepet",categorygivepetRepository.findAll());
    mv.addObject("menu", "policy");
    setDataCart(mv, request);
    return mv;
  }
  
  @GetMapping("/contact")
  public ModelAndView contact(HttpServletRequest request) {
    ModelAndView mv = new ModelAndView("mail");
    mv.addObject("categories", categoryRepository.findAll());
    mv.addObject("category_givepet",categorygivepetRepository.findAll());
    mv.addObject("menu", "contact");
    setDataCart(mv, request);
    return mv;
  }
  
  @GetMapping("/login")
  public ModelAndView login(HttpServletRequest request) {
    ModelAndView mv = new ModelAndView("login");
    mv.addObject("categories", categoryRepository.findAll());
    mv.addObject("category_givepet",categorygivepetRepository.findAll());
    setDataCart(mv, request);
    return mv;
  }
  @GetMapping("/login2")
  public ModelAndView login2(HttpServletRequest request) {
    ModelAndView mv = new ModelAndView("Login2");
    mv.addObject("categories", categoryRepository.findAll());
    mv.addObject("category_givepet",categorygivepetRepository.findAll());
    setDataCart(mv, request);
    return mv;
  }
  @GetMapping("/register")
  public ModelAndView register() {
    ModelAndView mv = new ModelAndView("register");
    mv.addObject("categories", categoryRepository.findAll());
    mv.addObject("category_givepet",categorygivepetRepository.findAll());
    return mv;
  }
  @GetMapping("/Register")
  public ModelAndView Register() {
    ModelAndView mv = new ModelAndView("Registration");
    mv.addObject("categories", categoryRepository.findAll());
    mv.addObject("category_givepet",categorygivepetRepository.findAll());
    return mv;
  }
  @GetMapping("/infomation")
  public ModelAndView infomation(HttpServletRequest request) {
    ModelAndView mv = new ModelAndView("thongtincanhan");
    mv.addObject("user", request.getSession().getAttribute("user"));
    mv.addObject("categories", categoryRepository.findAll());
    mv.addObject("category_givepet",categorygivepetRepository.findAll());
    return mv;
  }
  
  @GetMapping("/update_infomation")
  public ModelAndView update_info(HttpServletRequest request) {
    ModelAndView mv = new ModelAndView("update_inf");
    mv.addObject("user", request.getSession().getAttribute("user"));
    mv.addObject("categories", categoryRepository.findAll());
    mv.addObject("category_givepet",categorygivepetRepository.findAll());
    return mv;
  }
  
  @GetMapping("/logout")
  public ModelAndView logout(HttpServletRequest request) {
    ModelAndView mv = new ModelAndView("logout");
    mv.addObject("categories", categoryRepository.findAll());
    mv.addObject("category_givepet",categorygivepetRepository.findAll());
    request.getSession().removeAttribute("cart");
    return mv;
  }
  
  @GetMapping("/thanhtoan")
  public ModelAndView payment(HttpServletRequest request) {
    if (request.getSession().getAttribute("user") == null) return new ModelAndView("Login2");
    
    ModelAndView mv = new ModelAndView("thanhtoan");
    mv.addObject("categories", categoryRepository.findAll());
    mv.addObject("category_givepet",categorygivepetRepository.findAll());
    setDataCart(mv, request);
    return mv;
  }
  
  @GetMapping("/product/search")
  public ModelAndView search(@RequestParam String keyword, HttpServletRequest request) {
    ModelAndView mv = new ModelAndView("search");
	 mv.addObject("products", productRepository.findByFirstnameLike(keyword));
    mv.addObject("categories", categoryRepository.findAll());
    mv.addObject("category_givepet",categorygivepetRepository.findAll());
    mv.addObject("menu", "product");
    setDataCart(mv, request);
    return mv;
  }
  @GetMapping("/product/loc")
  public ModelAndView loc(@RequestParam double value1,@RequestParam double value2, HttpServletRequest request) {
    ModelAndView mv = new ModelAndView("index");
	 mv.addObject("products", productRepository.findByProductPrice(value1,value2));
    mv.addObject("categories", categoryRepository.findAll());
    mv.addObject("category_givepet",categorygivepetRepository.findAll());
    mv.addObject("menu", "product");
    setDataCart(mv, request);
    return mv;
  }
  
  @GetMapping("/mail")
  public ModelAndView mail(HttpServletRequest request) {
    ModelAndView mv = new ModelAndView("mail");
    setDataCart(mv, request);
    return mv;
  }
  
  private void setDataCart(ModelAndView mv, HttpServletRequest request) {
    HttpSession session = request.getSession();
    Cart cart = (Cart) session.getAttribute("cart");
    Double totalPrices = 0d;
    int quantity = 0;
    
    if (cart != null) {
      Map<Long, Item> datas = cart.getCartItems();
      
      for(Item i: datas.values()) {
        totalPrices += (i.getProduct().getProductPrice() * i.getQuantity());
        quantity += i.getQuantity();
      }
    } else {
      session.setAttribute("cart", cart);
    }
    
    mv.addObject("quantity", quantity);
    mv.addObject("totalPrices", totalPrices);
  }
  
  @GetMapping("/history")
  public ModelAndView buyHistory(HttpServletRequest request) {
    ModelAndView mv = new ModelAndView("bill");
    User user = (User)request.getSession().getAttribute("user");
    if (user == null) {
      mv.setViewName("login");
      return mv;
    }
    List<BillDto> dtos = new LinkedList<>();
    List<Bill> bills = billRepository.findByUserId(user.getId());
    
    if(bills != null && !bills.isEmpty()) {
      for (Bill b: bills) {
        List<BillDetail> details = billDetailRepository.findByBillId(b.getId());
        for(BillDetail d: details) {
            try {
              BillDto dto = new BillDto();
              dto.setDate(b.getDate());
              Product p = productRepository.findById(d.getProductId()).get();
              dto.setProductId(p.getProductID());
              dto.setProduct(p.getProductName());
              dto.setQuantity(d.getQuantity());
              dto.setPrice(d.getPrice());
              dto.setProductImage(p.getProductImage());
              dto.setStatus(b.getStatus());
              dto.setDate(b.getDate());
            dtos.add(dto);
            } catch (Exception e) {
              System.out.println(e.getMessage());
            }
        }
      }
    }
    mv.addObject("bills", dtos);
    mv.addObject("categories", categoryRepository.findAll());
//    setDataCart(mv, request);
    return mv;
  }
}
