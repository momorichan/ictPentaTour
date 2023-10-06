package com.shopping.controller.rentalcar;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Rentalcar;
import com.shopping.model.dao.RentalcarDao;

import com.shopping.utility.Paging;

public class RentalcarListController extends SuperClass{
	

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		super.doGet(request, response);
		
		String pageNumber = request.getParameter("pageNumber") ;
		String pageSize = request.getParameter("pageSize") ;	
		
		/* 렌트카 페이징 */
		// rclist.jsp의  name value 가져옴
		String startLocation = request.getParameter("startLocation");
		String endLocation = request.getParameter("endLocation"); 
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		
		RentalcarDao dao = new RentalcarDao();
		try {
			int totalCount = dao.GetTotalRecordCountSLELSDED(startLocation, endLocation, startDate, endDate);
			String url = super.getUrlInfomation("rcList");
			boolean isGrid = true;
			Paging pageInfo = new Paging(isGrid, pageNumber, pageSize, totalCount, url, startLocation, endLocation, startDate, endDate);
			List<Rentalcar> lists = dao.selectSLELSDED(pageInfo);
			
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("datalist", lists);
			super.gotoPage("rentalcar/rcList.jsp");
		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

		
		
		
		
		
//		int totalCount = 0;
//		List<Rentalcar> lists = new ArrayList<Rentalcar>();
//		Paging pageInfo = null;
//
//		try {			
//			boolean isGrid = true;
//			String url = super.getUrInfomation("rcList") ;
//
//			/* totalCount */
//			/* x _ _ _ */
//			if(startLocation == null || startLocation.equals("all")) {
//				/* x x _ _ */
//				if(endLocation == null || endLocation.equals("all")) {
//					/* x x x _ */
//					if(startDate == null || startDate.equals("")) {
//						/* x x x x*/
//						if(endDate == null || endDate.equals("")) {
//							System.out.println("totalCount: 싹 다 널 값");
//							totalCount = dao.GetTotalRecordCountAll();
//						/* x x x o*/
//						}else {
//							System.out.println("totalCount: /* x x x o*/");
//							totalCount = dao.GetTotalRecordCountSDED(startDate, endDate);
//						}
//					/* x x o _ */	
//					}else {
//						/* x x o x*/
//						if(endDate == null || endDate.equals("")) {
//							System.out.println("totalCount:/* x x o x*/");
//							totalCount = dao.GetTotalRecordCountSDED(startDate, endDate);
//						/* x x o o */
//						}else {
//							System.out.println("totalCount:/* x x o o */");
//							totalCount = dao.GetTotalRecordCountSDED(startDate, endDate);
//						}						
//					}
//				/* x o _ _ */	
//				}else {
//					/* x o x _*/
//					if(startDate == null || startDate.equals("")) {
//						/* x o x x*/
//						if(endDate == null || endDate.equals("")) {
//							System.out.println("totalCount:/* x o x x*/");
//							totalCount = dao.GetTotalRecordCountSLEL(startLocation, endLocation);
//						/* x o x o*/
//						}else {
//							System.out.println("totalCount:/* x o x o*/");
//							totalCount = dao.GetTotalRecordCountSLELSDED(startLocation, endLocation, startDate, endDate);
//						}
//					/* x o o _ */	
//					}else {
//						/* x o o x*/
//						if(endDate == null || endDate.equals("")) {
//							System.out.println("totalCount:/* x o o x*/");
//							totalCount = dao.GetTotalRecordCountSLELSDED(startLocation, endLocation, startDate, endDate);
//						/* x o o o */
//						}else {
//							System.out.println("totalCount:/* x o o o */");
//							totalCount = dao.GetTotalRecordCountSLELSDED(startLocation, endLocation, startDate, endDate);							
//						}						
//					}
//				}
//			/* o _ _ _*/
//			}else {
//				/* o x _ _*/
//				if(endLocation == null || startLocation.equals("")) {
//					/* o x x _*/
//					if(startDate == null || startDate.equals("")) {
//						/* o x x x*/
//						if(endDate == null || endDate.equals("")) {
//							System.out.println("totalCount:/* o x x x*/");
//							totalCount = dao.GetTotalRecordCountSL(startLocation);
//						/* o x x o */
//						}else {
//							System.out.println("totalCount:/* o x x o */");
//							totalCount = dao.GetTotalRecordCountSLELSDED(startLocation, endLocation, startDate, endDate);
//						}
//					/* o x o _ */
//					}else {
//						/* o x o x*/
//						if (endDate == null || endDate.equals("")) {
//							System.out.println("totalCount:/* o x o x*/");
//							totalCount = dao.GetTotalRecordCountSLELSDED(startLocation, endLocation, startDate, endDate);
//						/* o x o o */
//						} else {
//							System.out.println("totalCount:/* o x o o */");
//							totalCount = dao.GetTotalRecordCountSLELSDED(startLocation, endLocation, startDate, endDate);
//						}
//					}					
//				/* o o _ _*/
//				}else {
//					/* o o x _*/
//					if(startDate == null || startDate.equals("")) {
//						/* o o x x*/
//						if(endDate == null || endDate.equals("")) {
//							System.out.println("totalCount:/* o o x x*/");
//							totalCount = dao.GetTotalRecordCountSLELSDED(startLocation, endLocation, startDate, endDate);
//						/* o o x o */
//						}else {
//							System.out.println("totalCount:/* o o x o */");
//							totalCount = dao.GetTotalRecordCountSLELSDED(startLocation, endLocation, startDate, endDate);
//						}
//					/* o o o _ */
//					}else {
//						/* o o o x */
//						if (endDate == null || endDate.equals("")) {
//							System.out.println("totalCount:/* o o o x */");
//							totalCount = dao.GetTotalRecordCountSLELSDED(startLocation, endLocation, startDate, endDate);
//						/* o o o o */
//						} else {
//							System.out.println("totalCount:/* o o o o */");
//							totalCount = dao.GetTotalRecordCountSLELSDED(startLocation, endLocation, startDate, endDate);
//						}
//					}
//					
//				}			
//				
//			}			
//			
//			/* Paging */			
//			/* x _ _ _ */
//			if (startLocation == null || startLocation.equals("all")) {
//				/* x x _ _ */
//				if (endLocation == null || endLocation.equals("all")) {
//					/* x x x _ */
//					if (startDate == null || startDate.equals("")) {
//						/* x x x x */
//						if (endDate == null || endDate.equals("")) {
//							System.out.println("Paging: 싹 다 널 값");
//							pageInfo = new Paging(isGrid, pageNumber, pageSize, totalCount, url, startLocation, endLocation, startDate, endDate);
//						/* x x x o */
//						} else {
//							System.out.println("Paging:/* x x x o */");
//							pageInfo = new Paging(isGrid, pageNumber, pageSize, totalCount, url, startLocation, endLocation, startDate, endDate);
//						}
//						/* x x o _ */
//					} else {
//						/* x x o x */
//						if (endDate == null || endDate.equals("")) {
//							System.out.println("Paging:/* x x o x */");
//							pageInfo = new Paging(isGrid, pageNumber, pageSize, totalCount, url, startLocation, endLocation);
//							/* x x o o */
//						} else {
//							System.out.println("Paging:/* x x o o */");
//							pageInfo = new Paging(isGrid, pageNumber, pageSize, totalCount, url, startLocation, endLocation);
//						}
//					}
//					/* x o _ _ */
//				} else {
//					/* x o x _ */
//					if (startDate == null || startDate.equals("")) {
//						/* x o x x */
//						if (endDate == null || endDate.equals("")) {
//							System.out.println("Paging:/* x o x x */");
//							pageInfo = new Paging(isGrid, pageNumber, pageSize, totalCount, url, startLocation, endLocation);
//						/* x o x o */
//						} else {
//							System.out.println("Paging:/* x o x o */");
//							pageInfo = new Paging(isGrid, pageNumber, pageSize, totalCount, url, startLocation, endLocation);
//						}
//					/* x o o _ */
//					} else {
//						/* x o o x */
//						if (endDate == null || endDate.equals("")) {
//							System.out.println("Paging:/* x o o x */");
//							pageInfo = new Paging(isGrid, pageNumber, pageSize, totalCount, url, startLocation, endLocation);
//						/* x o o o */
//						} else {
//							System.out.println("Paging:/* x o o o */");
//							pageInfo = new Paging(isGrid, pageNumber, pageSize, totalCount, url, startLocation, endLocation);
//						}
//					}
//				}
//			/* o _ _ _ */
//			} else {
//			/* o x _ _ */
//				if (endLocation == null || endLocation.equals("all")) {
//					/* o x x _ */
//					if (startDate == null || startDate.equals("")) {
//						/* o x x x */
//						if (endDate == null || endDate.equals("")) {
//							System.out.println("Paging:/* o x x x */");
//							pageInfo = new Paging(isGrid, pageNumber, pageSize, totalCount, url, startLocation, endLocation);
//						/* o x x o */
//						} else {
//							System.out.println("Paging:/* o x x o */");
//							pageInfo = new Paging(isGrid, pageNumber, pageSize, totalCount, url, startLocation, endLocation);
//						}
//					/* o x o _ */
//					} else {
//						/* o x o x */
//						if (endDate == null || endDate.equals("")) {
//							System.out.println("Paging:/* o x o x */");
//							pageInfo = new Paging(isGrid, pageNumber, pageSize, totalCount, url, startLocation, endLocation);
//						/* o x o o */
//						} else {
//							System.out.println("Paging:/* o x o o */");
//							pageInfo = new Paging(isGrid, pageNumber, pageSize, totalCount, url, startLocation, endLocation);
//						}
//					}
//				/* o o _ _ */
//				} else {
//					/* o o x _ */
//					if (startDate == null || startDate.equals("")) {
//						/* o o x x */
//						if (endDate == null || endDate.equals("")) {
//							System.out.println("Paging:/* o o x x */");
//							pageInfo = new Paging(isGrid, pageNumber, pageSize, totalCount, url, startLocation, endLocation);
//						/* o o x o */
//						} else {
//							System.out.println("Paging:/* o o x o */");
//							pageInfo = new Paging(isGrid, pageNumber, pageSize, totalCount, url, startLocation, endLocation);
//						}
//					/* o o o _ */
//					} else {
//						/* o o o x */
//						if (endDate == null || endDate.equals("")) {
//							System.out.println("Paging:/* o o o x */");
//							pageInfo = new Paging(isGrid, pageNumber, pageSize, totalCount, url, startLocation, endLocation);
//						/* o o o o */
//						} else {
//							System.out.println("Paging:/* o o o o */");
//							pageInfo = new Paging(isGrid, pageNumber, pageSize, totalCount, url, startLocation, endLocation);
//						}
//					}
//				}
//			}
//						
//			/* lists*/
//			/* x _ _ _ */
//			if (startLocation == null || startLocation.equals("all")) {
//				/* x x _ _ */
//				if (endLocation == null || endLocation.equals("all")) {
//					/* x x x _ */
//					if (startDate == null || startDate.equals("")) {
//						/* x x x x */
//						if (endDate == null || endDate.equals("")) {
//							System.out.println("lists: 싹 다 널 값");
//							lists = dao.selectAll();
//						/* x x x o */
//						} else {
//							System.out.println("lists:/* x x x o */");
//							lists = dao.selectED(pageInfo);
//						}
//					/* x x o _ */
//					} else {
//						/* x x o x */
//						if (endDate == null || endDate.equals("")) {
//							System.out.println("lists:/* x x o x */");
//							lists = dao.selectSD(pageInfo);
//						/* x x o o */
//						} else {
//							System.out.println("lists:/* x x o o */");							
//							lists = dao.selectSDED(pageInfo);
//							
//						}
//					}
//					/* x o _ _ */
//				} else {
//					/* x o x _ */
//					if (startDate == null || startDate.equals("")) {
//						/* x o x x */
//						if (endDate == null || endDate.equals("")) {
//							System.out.println("lists: /* x o x x */");
//							lists = dao.selectSLELSDED(pageInfo);
//						/* x o x o */
//						} else {
//							System.out.println("lists: /* x o x o */");
//							lists = dao.selectSLELSDED(pageInfo);
//						}
//					/* x o o _ */
//					} else {
//						/* x o o x */
//						if (endDate == null || endDate.equals("")) {
//							System.out.println("lists: /* x o o x */");
//							lists = dao.selectSLELSDED(pageInfo);
//						/* x o o o */
//						} else {
//							System.out.println("lists: /* x o o o */");
//							lists = dao.selectSLELSDED(pageInfo);
//						}
//					}
//				}
//			/* o _ _ _ */
//			} else {
//			/* o x _ _ */
//				if (endLocation == null || endLocation.equals("all")) {
//					/* o x x _ */
//					if (startDate == null || startDate.equals("")) {
//						/* o x x x */
//						if (endDate == null || endDate.equals("")) {
//							System.out.println("lists: /* o x x x */");
//							lists = dao.selectSL(pageInfo);
//						/* o x x o */
//						} else {
//							System.out.println("lists: /* o x x o */");
//							lists = dao.selectSLELSDED(pageInfo);
//						}
//					/* o x o _ */
//					} else {
//						/* o x o x */
//						if (endDate == null || endDate.equals("")) {
//							System.out.println("lists: /* o x o x */");
//							lists = dao.selectSLELSDED(pageInfo);
//						/* o x o o */
//						} else {
//							System.out.println("lists: /* o x o o */");
//							lists = dao.selectSLELSDED(pageInfo);
//						}
//					}
//				/* o o _ _ */
//				} else {
//					/* o o x _ */
//					if (startDate == null || startDate.equals("")) {
//						/* o o x x */
//						if (endDate == null || endDate.equals("")) {
//							System.out.println("lists: /* o o x x */");
//							lists = dao.selectSLEL(pageInfo);
//						/* o o x o */
//						} else {
//							System.out.println("lists: /* o o x o */");
//							lists = dao.selectSLELSDED(pageInfo);
//						}
//					/* o o o _ */
//					} else {
//						/* o o o x */
//						if (endDate == null || endDate.equals("")) {
//							System.out.println("lists: /* o o o x */");
//							lists = dao.selectSLELSDED(pageInfo);
//						/* o o o o */
//						} else {
//							System.out.println("lists: /* o o o o */");
//							lists = dao.selectSLELSDED(pageInfo);
//						}
//					}
//				}
//			}
//		
//			request.setAttribute("datalist", lists);
//			// 페이징 관련 정보를 바인딩
//			request.setAttribute("pageInfo", pageInfo);
//			
//			super.gotoPage("rentalcar/rcList.jsp");
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}		
//	}
//	}
