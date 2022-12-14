package kr.co.nc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.nc.criteria.AccoCriteria;
import kr.co.nc.criteria.LikeCriteria;
import kr.co.nc.criteria.RoomCriteria;
import kr.co.nc.vo.Accommodation;
import kr.co.nc.vo.AccommodationRoom;
import kr.co.nc.vo.AccommodationType;
import kr.co.nc.vo.City;
import kr.co.nc.vo.CommonFacility;
import kr.co.nc.vo.RoomFacility;

@Mapper
public interface AccommodationMapper {

	// 모든 숙소유형 정보 조회
	List<AccommodationType> getAllTypes();
	// 모든 지역 정보 조회
	List<City> getAllCities();
	// 숙소유형 아이디에 따른 숙소유형명 조회
	String getTypeNameById(String typeId);
	
	// 해당 숙소유형에 따른 공용시설 옵션 조회
	List<CommonFacility> getCommonFacilitiesByAccoType(String typeId);
	// 모든 객실시설 옵션 조회
	List<RoomFacility> getAllRoomFacilities();
	// 해당 숙소유형에 따른 모든 부가사항 태그 조회
	List<String> getAllAccoTagsByAccoType(String typeId);
	// 모든 부가사항 태그 조회
	List<String> getAllAccoTags();
	
	// 검색조건에 따른 숙소정보 조회
	List<Accommodation> getAccommodationsByCriteria(AccoCriteria criteria);
	
	// 숙소번호에 따른 숙소정보 기본 조회 (업데이트할 때 사용)
	Accommodation getAccommodationById(int accoId);
	// 숙소번호에 따른 숙소정보 상세 조회
	Accommodation getAccommodationdDetailById(int accoId);
	// 숙소번호에 따른 공용시설 조회
	List<CommonFacility> getCommonFacilitiesByAccoId(int accoId);
	// 숙소번호에 따른 객실시설 조회(중복 제외)
	List<RoomFacility> getRoomFacilitiesByAccoId(int accoId);
	// 숙소번호에 따른 태그 조회
	List<String> getAccoTagsByAccoId(int accoId);
	// 숙소번호에 따른 이미지(파일명) 조회
	List<String> getImagesByAccoId(int accoId);
	
	// 해당 객실번호에 따른 객실 정보 조회
	AccommodationRoom getRoomByNo(int roomNo);
	// 해당 객실번호에 따른 숙소이름, 객실이름 조회
	AccommodationRoom getNamesByRoomNo(int roomNo);

	// 숙소번호에 따른 모든 객실정보 조회 (예약 가능 여부 제외)
	List<AccommodationRoom> getAllRoomsByAccoId(int accoId);
	// 숙소번호에 따른 모든 객실정원 정보 조회
	List<Integer> getAllRoomCapacitiesByAccoId(int accoId);
	// 객실번호에 따른 객실시설 조회
	List<RoomFacility> getRoomFacilitiesByRoomNo(int roomNo);
	// 객실번호에 따른 이미지(파일명) 조회
	List<String> getImagesByRoomNo(int roomNo);
	// 검색 기간에 따른 특정 객실의 예약 가능 여부 조회 (가능하면 1, 불가능하면 0을 반환)
	Integer getAvailableRoomStock(RoomCriteria criteria);
	
	//// 찜하기 관련
	// 해당 사용자의, 해당 번호의 숙소에 대한 찜하기 정보가 존재하면 1을, 존재하지 않으면 0을 반환
	int isExistUserLikeByAccoId(LikeCriteria criteria);
	// 해당 사용자의, 해당 번호의 숙소에 대한 찜하기 정보 저장
	void insertUserLikeByAccoId(LikeCriteria criteria);
	// 해당 사용자의, 해당 번호의 숙소에 대한 찜하기 정보 삭제
	void deleteUserLikeByAccoId(LikeCriteria criteria);
	// 사용자가 찜하기 누른 모든 숙소 정보 반환
	List<Accommodation> getAllLikedAccoByUserNo(int no); 
	
	// 인기숙소 상위 n건 조회
	List<Accommodation> getBestAccommodations(int count);
	
	//// 페이징 관련
	// 해당 숙소의 객실정보 행 수 조회
	int getTotalRowsOfRoomsByAccoId(RoomCriteria criteria);
	// 특정 숙소의 객실정보를 특정 페이지번호에 맞게 조회
	List<AccommodationRoom> getRoomsByAccoIdwithPagination(RoomCriteria criteria);
	
	// 숙소정보 업데이트
	void updateAccommodation(Accommodation accommodation);
	
}
