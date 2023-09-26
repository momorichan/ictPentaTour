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
		
		int totalCount = 0;
		List<Rentalcar> lists = new ArrayList<Rentalcar>();
		Paging pageInfo = null;
		try {			
			boolean isGrid = false ;
			String url = super.getUrlInfomation("rcList") ;
//			String startDateReplace = startDate.replace("/", ""); /* 날짜 문자열 */
//			System.out.println(startDateReplace);
//			String endDateReplace = endDate.replace("/", ""); /* 날짜 문자열 */
//			System.out.println(endDateReplace);
			
			
			/* totalCount */
			/* x _ _ _ */
			if(startLocation == null || startLocation.equals("all")) {
				/* x x _ _ */
				if(endLocation == null || endLocation.equals("all")) {
					/* x x x _ */
					if(startDate == null || startDate.equals("")) {
						/* x x x x*/
						if(endDate == null || endDate.equals("")) {
							System.out.println("totalCount: 싹 다 널 값");
							totalCount = dao.GetTotalRecordCountAll();
						/* x x x o*/
						}else {
							totalCount = dao.GetTotalRecordCountSDED(startDate, endDate);
						}
					/* x x o _ */	
					}else {
						/* x x o x*/
						if(endDate == null || endDate.equals("")) {
							totalCount = dao.GetTotalRecordCountSDED(startDate, endDate);
						/* x x o o */
						}else {
							totalCount = dao.GetTotalRecordCountSDED(startDate, endDate);
						}						
					}
				/* x o _ _ */	
				}else {
					/* x o x _*/
					if(startDate == null || startDate.equals("")) {
						/* x o x x*/
						if(endDate == null || endDate.equals("")) {							
							totalCount = dao.GetTotalRecordCountSLEL(startLocation, endLocation);
						/* x o x o*/
						}else {
							totalCount = dao.GetTotalRecordCountSLELSDED(startLocation, endLocation, startDate, endDate);
						}
					/* x o o _ */	
					}else {
						/* x o o x*/
						if(endDate == null || endDate.equals("")) {
							totalCount = dao.GetTotalRecordCountSLELSDED(startLocation, endLocation, startDate, endDate);
						/* x o o o */
						}else {
							totalCount = dao.GetTotalRecordCountSLELSDED(startLocation, endLocation, startDate, endDate);							
						}						
					}
				}
			/* o _ _ _*/
			}else {
				/* o x _ _*/
				if(endLocation == null || startLocation.equals("")) {
					/* o x x _*/
					if(startDate == null || startDate.equals("")) {
						/* o x x x*/
						if(endDate == null || endDate.equals("")) {
							totalCount = dao.GetTotalRecordCountSL(startLocation);
						/* o x x o */
						}else {
							totalCount = dao.GetTotalRecordCountSLELSDED(startLocation, endLocation, startDate, endDate);
						}
					/* o x o _ */
					}else {
						/* o x o x*/
						if (endDate == null || endDate.equals("")) {
							totalCount = dao.GetTotalRecordCountSLELSDED(startLocation, endLocation, startDate, endDate);
						/* o x o o */
						} else {
							totalCount = dao.GetTotalRecordCountSLELSDED(startLocation, endLocation, startDate, endDate);
						}
					}					
				/* o o _ _*/
				}else {
					/* o o x _*/
					if(startDate == null || startDate.equals("")) {
						/* o o x x*/
						if(endDate == null || endDate.equals("")) {
							totalCount = dao.GetTotalRecordCountSLELSDED(startLocation, endLocation, startDate, endDate);
						/* o o x o */
						}else {
							totalCount = dao.GetTotalRecordCountSLELSDED(startLocation, endLocation, startDate, endDate);
						}
					/* o o o _ */
					}else {
						/* o o o x*/
						if (endDate == null || endDate.equals("")) {
							totalCount = dao.GetTotalRecordCountSLELSDED(startLocation, endLocation, startDate, endDate);
						/* o o o o */
						} else {
							totalCount = dao.GetTotalRecordCountSLELSDED(startLocation, endLocation, startDate, endDate);
						}
					}
					
				}			
				
			}			
			
			/* Paging */			
			/* x _ _ _ */
			if (startLocation == null || startLocation.equals("all")) {
				/* x x _ _ */
				if (endLocation == null || endLocation.equals("all")) {
					/* x x x _ */
					if (startDate == null || startDate.equals("")) {
						/* x x x x */
						if (endDate == null || endDate.equals("")) {
							System.out.println("싹 다 널값(all)이면 여기로 옴");
							pageInfo = new Paging(pageNumber, pageSize, totalCount, url, endDate, url, isGrid);
							/* x x x o */
						} else {
							
						}
						/* x x o _ */
					} else {
						/* x x o x */
						if (endDate == null || endDate.equals("")) {
							pageInfo = new Paging(isGrid, pageNumber, pageSize, totalCount, url, startLocation, endLocation);
							/* x x o o */
						} else {
							pageInfo = new Paging(isGrid, pageNumber, pageSize, totalCount, url, startLocation, endLocation);
						}
					}
					/* x o _ _ */
				} else {
					/* x o x _ */
					if (startDate == null || startDate.equals("")) {
						/* x o x x */
						if (endDate == null || endDate.equals("")) {
							pageInfo = new Paging(isGrid, pageNumber, pageSize, totalCount, url, startLocation, endLocation);
						/* x o x o */
						} else {
							pageInfo = new Paging(isGrid, pageNumber, pageSize, totalCount, url, startLocation, endLocation);
						}
					/* x o o _ */
					} else {
						/* x o o x */
						if (endDate == null || endDate.equals("")) {
							pageInfo = new Paging(isGrid, pageNumber, pageSize, totalCount, url, startLocation, endLocation);
						/* x o o o */
						} else {
							pageInfo = new Paging(isGrid, pageNumber, pageSize, totalCount, url, startLocation, endLocation);
						}
					}
				}
			/* o _ _ _ */
			} else {
			/* o x _ _ */
				if (endLocation == null || endLocation.equals("all")) {
					/* o x x _ */
					if (startDate == null || startDate.equals("")) {
						/* o x x x */
						if (endDate == null || endDate.equals("")) {
							pageInfo = new Paging(isGrid, pageNumber, pageSize, totalCount, url, startLocation, endLocation);
						/* o x x o */
						} else {
							pageInfo = new Paging(isGrid, pageNumber, pageSize, totalCount, url, startLocation, endLocation);
						}
					/* o x o _ */
					} else {
						/* o x o x */
						if (endDate == null || endDate.equals("")) {
							pageInfo = new Paging(isGrid, pageNumber, pageSize, totalCount, url, startLocation, endLocation);
						/* o x o o */
						} else {
							pageInfo = new Paging(isGrid, pageNumber, pageSize, totalCount, url, startLocation, endLocation);
						}
					}
				/* o o _ _ */
				} else {
					/* o o x _ */
					if (startDate == null || startDate.equals("")) {
						/* o o x x */
						if (endDate == null || endDate.equals("")) {
							pageInfo = new Paging(isGrid, pageNumber, pageSize, totalCount, url, startLocation, endLocation);
						/* o o x o */
						} else {
							pageInfo = new Paging(isGrid, pageNumber, pageSize, totalCount, url, startLocation, endLocation);
						}
					/* o o o _ */
					} else {
						/* o o o x */
						if (endDate == null || endDate.equals("")) {
							pageInfo = new Paging(isGrid, pageNumber, pageSize, totalCount, url, startLocation, endLocation);
						/* o o o o */
						} else {
							pageInfo = new Paging(isGrid, pageNumber, pageSize, totalCount, url, startLocation, endLocation);
						}
					}
				}
			}
						
			/* lists*/
			/* x _ _ _ */
			if (startLocation == null || startLocation.equals("all")) {
				/* x x _ _ */
				if (endLocation == null || endLocation.equals("all")) {
					/* x x x _ */
					if (startDate == null || startDate.equals("")) {
						/* x x x x */
						if (endDate == null || endDate.equals("")) {
							System.out.println("싹 다 널값(all)이면 여기로 옴");
							lists = dao.selectAll();
						/* x x x o */
						} else {
							lists = dao.selectSLELSDED(pageInfo);
						}
						/* x x o _ */
					} else {
						/* x x o x */
						if (endDate == null || endDate.equals("")) {
							lists = dao.selectSLELSDED(pageInfo);
							/* x x o o */
						} else {
							lists = dao.selectSLELSDED(pageInfo);
						}
					}
					/* x o _ _ */
				} else {
					/* x o x _ */
					if (startDate == null || startDate.equals("")) {
						/* x o x x */
						if (endDate == null || endDate.equals("")) {
							lists = dao.selectSLELSDED(pageInfo);
						/* x o x o */
						} else {
							lists = dao.selectSLELSDED(pageInfo);
						}
					/* x o o _ */
					} else {
						/* x o o x */
						if (endDate == null || endDate.equals("")) {
							lists = dao.selectSLELSDED(pageInfo);
						/* x o o o */
						} else {
							lists = dao.selectSLELSDED(pageInfo);
						}
					}
				}
			/* o _ _ _ */
			} else {
			/* o x _ _ */
				if (endLocation == null || endLocation.equals("all")) {
					/* o x x _ */
					if (startDate == null || startDate.equals("")) {
						/* o x x x */
						if (endDate == null || endDate.equals("")) {
							lists = dao.selectSLELSDED(pageInfo);
						/* o x x o */
						} else {
							lists = dao.selectSLELSDED(pageInfo);
						}
					/* o x o _ */
					} else {
						/* o x o x */
						if (endDate == null || endDate.equals("")) {
							lists = dao.selectSLELSDED(pageInfo);
						/* o x o o */
						} else {
							lists = dao.selectSLELSDED(pageInfo);
						}
					}
				/* o o _ _ */
				} else {
					/* o o x _ */
					if (startDate == null || startDate.equals("")) {
						/* o o x x */
						if (endDate == null || endDate.equals("")) {
							lists = dao.selectSLELSDED(pageInfo);
						/* o o x o */
						} else {
							lists = dao.selectSLELSDED(pageInfo);
						}
					/* o o o _ */
					} else {
						/* o o o x */
						if (endDate == null || endDate.equals("")) {
							lists = dao.selectSLELSDED(pageInfo);
						/* o o o o */
						} else {
							lists = dao.selectSLELSDED(pageInfo);
						}
					}
				}
			}
		
			request.setAttribute("datalist", lists);
			// 페이징 관련 정보를 바인딩
			request.setAttribute("pageInfo", pageInfo);
			
			super.gotoPage("rentalcar/rcList.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
}
