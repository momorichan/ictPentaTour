package com.shopping.controller.member;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Airline;
import com.shopping.model.bean.Flight;
import com.shopping.model.bean.Rentalcar;
import com.shopping.model.bean.RentalcarCheck;
import com.shopping.model.bean.Room;
import com.shopping.model.bean.Roomreser;
import com.shopping.model.bean.Rrdetails;
import com.shopping.model.bean.Tour;
import com.shopping.model.bean.TourReser;
import com.shopping.model.bean.accommodation;
import com.shopping.model.dao.AccommodationDao;
import com.shopping.model.dao.AirDao;
import com.shopping.model.dao.FlyDao;
import com.shopping.model.dao.RentalcarCheckDao;
import com.shopping.model.dao.RentalcarDao;
import com.shopping.model.dao.RoomDao;
import com.shopping.model.dao.RoomreserDao;
import com.shopping.model.dao.TourDao;

public class MemberReservationController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		String meid = request.getParameter("meid");
		System.out.println("meid is " + meid);
		
//		항공 예약 정보
		List<Flight> fbean = new ArrayList<Flight>();
		List<Airline> airbean = new ArrayList<Airline>();
		FlyDao flydao = new FlyDao();
		AirDao airdao = new AirDao();
		fbean = flydao.getDataByFly3(meid);
		
		for(Flight bean : fbean) {
			airbean.add(airdao.getDataByFlid(bean.getFlid()));
		}
		
		request.setAttribute("fbean", fbean);
		request.setAttribute("airbean", airbean);
		
//		숙박 예약 정보
		List<accommodation> abean = new ArrayList<accommodation>();
		List<Room> rbean = new ArrayList<Room>();
		List<Roomreser> rrbean = new ArrayList<Roomreser>();
		List<Rrdetails> rrdbean = new ArrayList<Rrdetails>();
		AccommodationDao accommodationdao = new AccommodationDao();
		RoomDao roomdao = new RoomDao();
		RoomreserDao roomreserdao = new RoomreserDao();
		
		rrbean = roomreserdao.getDataByMeid(meid);
		for(Roomreser bean : rrbean) {
			rrdbean.add(roomreserdao.getDataByRrid(bean.getRrid()));
			rbean.add(roomdao.getDataByPk(roomreserdao.getDataByRrid(bean.getRrid()).getRoid()));
			abean.add(accommodationdao.getDataByPk(roomdao.getDataByPk(roomreserdao.getDataByRrid(bean.getRrid()).getRoid()).getAcid()));
		}
		
		request.setAttribute("rrbean", rrbean);
		request.setAttribute("rrdbean", rrdbean);
		request.setAttribute("rbean", rbean);
		request.setAttribute("abean", abean);
		
//		투어 예약 정보
		List<Tour> tbean = new ArrayList<Tour>();
		TourDao tourdao = new TourDao();
		List<TourReser> trbean = new ArrayList<TourReser>();
		
		trbean = tourdao.getTourReserByMeid(meid);
		for(TourReser bean : trbean) {
			tbean.add(tourdao.getDataByPrimaryKey(bean.getToid()));
		}
		
		request.setAttribute("trbean", trbean);
		request.setAttribute("tbean", tbean);
		
//		렌트카 예약 정보
		List<Rentalcar> cbean = new ArrayList<Rentalcar>();
		List<RentalcarCheck> ccbean = new ArrayList<RentalcarCheck>();
		RentalcarDao cardao = new RentalcarDao();
		RentalcarCheckDao carcheckdao = new RentalcarCheckDao();
		
		ccbean = carcheckdao.getDataByMeid(meid);
		for(RentalcarCheck bean : ccbean) {
			cbean.add(cardao.GetDataByPk(bean.getRcid()));
		}
		
		request.setAttribute("ccbean", ccbean);
		request.setAttribute("cbean", cbean);
		
		super.gotopage("member/meReservationDetail.jsp");
	}
}
