package com.webpetlove.ph.adm.controller;

import java.io.File;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.webpetlove.ph.entity.Bill;
import com.webpetlove.ph.entity.BillDetail;
import com.webpetlove.ph.entity.Category;
import com.webpetlove.ph.entity.Category_givepet;
import com.webpetlove.ph.entity.Product;
import com.webpetlove.ph.entity.QCategory_givepet;
import com.webpetlove.ph.entity.User;
import com.webpetlove.ph.model.CustomUrl;
import com.webpetlove.ph.model.Message;
import com.webpetlove.ph.model.ProductDto;
import com.webpetlove.ph.model.Value;
import com.webpetlove.ph.mysql.repo.BillDetailRepository;
import com.webpetlove.ph.mysql.repo.BillRepository;
import com.webpetlove.ph.mysql.repo.Bilstatus;
import com.webpetlove.ph.mysql.repo.CategoryRepository;
import com.webpetlove.ph.mysql.repo.Category_givepetRepository;
import com.webpetlove.ph.mysql.repo.ProductRepository;

import com.webpetlove.ph.mysql.repo.UserRepository;

@Controller
@RequestMapping("/admin")
public class AdminViewController {

	private @Autowired UserRepository userRepository;
	private @Autowired CategoryRepository categoryRepository;
	private @Autowired ProductRepository productRepository;
	private @Autowired BillRepository billRepository;
	private @Autowired BillDetailRepository billDetailRepository;
	private @Autowired Bilstatus billstatus;
	private @Autowired Category_givepetRepository category_givepetRepository;
	

	@GetMapping("/login")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView("/admin/login");
		return mv;
	}

	@PostMapping("/login")
	public String submitLogin(@RequestParam String email, @RequestParam String password, HttpServletRequest request) {
		String url = "";
		User user = userRepository.findAdmin(email, password);
		if (user != null) {
			request.getSession().setAttribute("useradmin", user);
			url = "admin/home";
		} else {
			request.getSession().setAttribute("error", "Email hoặc mật khẩu không đúng.!");
			url = "admin/login";
		}
		return "redirect:/" + url;
	}

	@RequestMapping("/home")
	public ModelAndView home(HttpServletRequest request) {

		HttpSession session = request.getSession();
		if (session.getAttribute("useradmin") == null) {
			return new ModelAndView("redirect:/admin/login");
		}
		ModelAndView mv = new ModelAndView("admin/trangchu");
		mv.addObject("user", request.getSession().getAttribute("user"));
		return mv;
	}

	@GetMapping("/logout")
	public ModelAndView logout(HttpServletRequest request) {
		request.getSession().removeAttribute("useradmin");
		return new ModelAndView("/admin/login");
	}

	@GetMapping("/manager_category")
	public ModelAndView get() {
		ModelAndView mv = new ModelAndView("admin/manager_category");
		mv.addObject("cates", categoryRepository.findAll());
		return mv;
	}
	@GetMapping("/manager_category_givepet")
	public ModelAndView getGivepet() {
		ModelAndView mv = new ModelAndView("admin/manager_catergory_givepet");
		mv.addObject("cates_givepet", category_givepetRepository.findAll());
		return mv;
	}
	@GetMapping("/manager_category_givepet/delete/{id}")
	public String getGivepet(@PathVariable Long id) {
		category_givepetRepository.deleteById(id);
		return "redirect:/admin/manager_category_givepet";
	}

	@GetMapping("/update_category_givepet/{id}/{name}")
	public ModelAndView getGivepet(@PathVariable Long id, @PathVariable String name) {
		ModelAndView mv = new ModelAndView("admin/UpdateCateGory_GivePet");
		mv.addObject("cate", category_givepetRepository.findByIdAndName(id, name));
		return mv;
	}

	@GetMapping("/category_givepet/add")
	public ModelAndView cateegoryAddGivepet() {
		return new ModelAndView("admin/insert_category_givepet");
	}
	@PostMapping("/manager_category_givepet")
	public String postgivepet(@RequestParam String command, @RequestParam(required = false) Long id,
			@RequestParam String cateName, Model m) {

		String url = "", error = "";
		if (StringUtils.isEmpty(cateName)) {
			error = "Vui lòng nhập tên danh mục!";
			m.addAttribute("error", error);
		}

		try {
			if (error.length() == 0) {
				switch (command) {
				case "insert":
					category_givepetRepository.save(new Category_givepet(cateName));
					url = "/admin/manager_category_givepet";
					break;
				case "update":
					category_givepetRepository.save(new Category_givepet(id, cateName));
					url = "/admin/manager_category_givepet";
					break;
				}
			} else {
				url = "/admin/insert_category";
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return "redirect:" + url;
	}
	//end give pet
	@GetMapping("/manager_category/delete/{id}")
	public String get(@PathVariable Long id) {
		categoryRepository.deleteById(id);
		return "redirect:/admin/manager_category";
	}

	@GetMapping("/update_category/{id}/{name}")
	public ModelAndView get(@PathVariable Long id, @PathVariable String name) {
		ModelAndView mv = new ModelAndView("admin/update_category");
		mv.addObject("cate", categoryRepository.findByIdAndName(id, name));
		return mv;
	}

	@GetMapping("/category/add")
	public ModelAndView cateegoryAdd() {
		return new ModelAndView("admin/insert_category");
	}

	@PostMapping("/manager_category")
	public String post(@RequestParam String command, @RequestParam(required = false) Long id,
			@RequestParam String cateName, Model m) {

		String url = "", error = "";
		if (StringUtils.isEmpty(cateName)) {
			error = "Vui lòng nhập tên danh mục!";
			m.addAttribute("error", error);
		}

		try {
			if (error.length() == 0) {
				switch (command) {
				case "insert":
					categoryRepository.save(new Category(cateName));
					url = "/admin/manager_category";
					break;
				case "update":
					categoryRepository.save(new Category(id, cateName));
					url = "/admin/manager_category";
					break;
				}
			} else {
				url = "/admin/insert_category";
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return "redirect:" + url;
	}

//	@GetMapping("/manager_product")
//	public ModelAndView product() {
//		ModelAndView mv = new ModelAndView("admin/manager_product");
//		mv.addObject("prods", productRepository.findAll());
//		return mv;
//	}

	@GetMapping("/product/add")
	public ModelAndView productAdd() {
		ModelAndView mv = new ModelAndView("admin/insert_product");
		mv.addObject("cates", categoryRepository.findAll());
		mv.addObject("cates_givepet", category_givepetRepository.findAll());
		return mv;
	}

	@GetMapping("/product/update_product/{id}")
	public ModelAndView productUpdate(@PathVariable Long id) {
		ModelAndView mv = new ModelAndView("admin/update_product");
		Product p = productRepository.findById(id).get();
		mv.addObject("cates", categoryRepository.findAll());
		mv.addObject("product", p);
		mv.addObject("cate", categoryRepository.findById(p.getCategoryId()).get());
		return mv;
	}

	@PostMapping("/product/manager_product")
	public @ResponseBody CustomUrl prodUpdate(@RequestBody ProductDto dto, HttpServletRequest request) {
		String error = "";
		if (!StringUtils.isEmpty(dto.getProdName())) {
			error = "Vui lòng nhập tên sản phẩm!";
			request.setAttribute("error", error);
		}

		Product p = new Product(dto.getCateId(),dto.getCatergoty_givepetid(), dto.getProdName(), "/resources/images/" + dto.getImage(),
				dto.getPrice(), dto.getDescrip());
		p.setProductBuy(dto.getBuy());
		p.setProductProvider(dto.getProvider());
		p.setProductQuantity(dto.getQuantity());
		CustomUrl url = new CustomUrl();
		try {
			switch (dto.getCommand()) {
			case "insert":
				productRepository.save(p);
				url.setUrl("/admin/manager_product");
				break;
			case "update":
				p.setProductID(dto.getProdId());
				productRepository.save(p);
				url.setUrl("/admin/manager_product");
				break;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return url;
	}

	@PostMapping("/product/file")
	public @ResponseBody String uploadProductFile(@ModelAttribute MultipartFile hinhanh, HttpServletRequest request) {
		ServletContext servletContext = request.getServletContext();
		String contextPath = servletContext.getRealPath("/");
		String filename = contextPath + "/resources/images/" + hinhanh.getOriginalFilename();

		try {
			hinhanh.transferTo(new File(filename));
		} catch (IllegalStateException e1) {
			System.out.println(e1);
		} catch (IOException e1) {
			System.out.println(e1);
		}

		return hinhanh.getOriginalFilename();
	}

	@GetMapping("/product/delete/{id}")
	public String productDelete(@PathVariable Long id) {
		productRepository.deleteById(id);
		return "redirect:/admin/manager_product";
	}
	@GetMapping("/bill_Wait")
	  public ModelAndView billCho(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin/billwait");
		List<Bill> bills = billstatus.findAllActiveUsersNative();
		bills.forEach(i -> {
			i.setUserEmail(userRepository.findById(i.getUserId()).get().getUserEmail());
		});
		mv.addObject("bills",bills);
	    return mv;
	  }
	@GetMapping("/bill_success")
	  public ModelAndView billsuccess(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin/billsuccess");
		List<Bill> bills = billstatus.findAllActivebillsuccess();
		bills.forEach(i -> {
			i.setUserEmail(userRepository.findById(i.getUserId()).get().getUserEmail());
		});
		mv.addObject("bills",bills);
	    return mv;
	  }
	@GetMapping("/bill_delete")
	  public ModelAndView billdelete(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin/billdelete");
		List<Bill> bills = billstatus.findAllActivebilldelete();
		bills.forEach(i -> {
			i.setUserEmail(userRepository.findById(i.getUserId()).get().getUserEmail());
		});
		mv.addObject("bills",bills);
	    return mv;
	  }
	@GetMapping("/bill/delete/{id}")
	public String deletebill(@PathVariable Long id) {
		billRepository.deleteById(id);
		return "redirect:/admin/manager_bill";
	}

	@GetMapping("/bill/update/{id}/{stt}")
	public @ResponseBody Message updatebill(@PathVariable Long id, @PathVariable Short stt) {
		Bill bill = billRepository.findById(id).get();
		List<BillDetail> details = billDetailRepository.findByBillId(bill.getId());
		List<Product> products = new LinkedList<>();
		for (BillDetail d : details) {
			Product p = productRepository.findById(d.getProductId()).get();
			if (d.getQuantity() > p.getProductQuantity()) {
				return new Message("eq");
			}
			p.setProductQuantity(p.getProductQuantity() - d.getQuantity());
			products.add(p);
		}

		productRepository.saveAll(products);
		billRepository.updateStatus(id, stt);

		return new Message("ok");
	}

	@GetMapping("/chart")
	public ModelAndView chart() {
		List<Value> chartDatas = new LinkedList<>();
		for (Category category : categoryRepository.findAll()) {
			chartDatas.add(new Value(category.getCategoryName(),
					productRepository.findByCategoryId(category.getCategoryID()).size()));
			System.out.println(category.getCategoryName());
			System.out.println(productRepository.findByCategoryId(category.getCategoryID()).size());
		}
		ModelAndView mv = new ModelAndView("admin/manager_chart");
		mv.addObject("datas", chartDatas);
		return mv;
	}
  @RequestMapping(value = {"/manager_bill","/manager_bill/{page}"}, method = RequestMethod.GET)
  public ModelAndView showbill(@PathVariable(required=false,name="page") String page, HttpServletRequest request, HttpServletResponse response) {
    ModelAndView mv = new ModelAndView("admin/manager_bill");
    PagedListHolder<Bill> billList;
    List<Bill> bills = billRepository.findAll(Sort.by("status"));
	  bills.forEach(i -> {
			i.setUserEmail(userRepository.findById(i.getUserId()).get().getUserEmail());
		});
    if(page == null) {
      billList = new PagedListHolder<Bill>();
      List<Bill> billList1 =bills;
      // Setting the source for PagedListHolder
      billList.setSource(billList1);
      billList.setPageSize(10);
      // Setting PagedListHolder instance to session
      request.getSession().setAttribute("billList", billList);
    }else if(page.equals("prev")) {
    	billList = (PagedListHolder<Bill>)request.getSession().getAttribute("billList");
    	billList.previousPage();
    }else if(page.equals("next")) {
    	billList = (PagedListHolder<Bill>)request.getSession().getAttribute("billList");
    	billList.nextPage();
    }else {
      int pageNum = Integer.parseInt(page);
      billList = (PagedListHolder<Bill>)request.getSession().getAttribute("billList");
      // set the current page number
      // page number starts from zero in PagedListHolder that's why subtracting 1
      billList.setPage(pageNum - 1);
    }
    mv.addObject("bills",billList);
    return mv;
  }
  @RequestMapping(value = {"/manager_product","/manager_product/{page}"}, method = RequestMethod.GET)
  public ModelAndView managerproduct(@PathVariable(required=false,name="page") String page, HttpServletRequest request, HttpServletResponse response) {
    ModelAndView mv = new ModelAndView("admin/manager_product");
    PagedListHolder<Product> productlist;
    List<Product> product = productRepository.findAll();
    if(page == null) {
    	productlist = new PagedListHolder<Product>();
      List<Product> productlist1 =product;
      productlist.setSource(productlist1);
      productlist.setPageSize(10);
      request.getSession().setAttribute("productlist", productlist);
    }else if(page.equals("prev")) {
    	productlist = (PagedListHolder<Product>)request.getSession().getAttribute("productlist");
    	productlist.previousPage();
    }else if(page.equals("next")) {
    	productlist = (PagedListHolder<Product>)request.getSession().getAttribute("productlist");
    	productlist.nextPage();
    }else {
      int pageNum = Integer.parseInt(page);
      productlist = (PagedListHolder<Product>)request.getSession().getAttribute("productlist");
      productlist.setPage(pageNum - 1);
    }
    mv.addObject("productlists",productlist);
    return mv;
  }
  
}