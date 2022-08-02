package kr.co.nc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nc.mapper.AccommodationMapper;
import kr.co.nc.vo.AccommodationType;
import kr.co.nc.vo.City;
import kr.co.nc.vo.CommonFacility;
import kr.co.nc.vo.RoomFacility;

@Service
public class AccommodationService {

	@Autowired
	private AccommodationMapper accommodationMapper;
	
	public List<AccommodationType> getAllTypes() {
		return accommodationMapper.getAllTypes();
	}
	
	public List<City> getAllCities() {
		return accommodationMapper.getAllCities();
	}

	public String getTypeNameById(String typeId) {
		return accommodationMapper.getTypeNameById(typeId);
	}

	public List<CommonFacility> getCommonFacilityOptions(String typeId) {
		return accommodationMapper.getCommonFacilitiesByAccoType(typeId);
	}

	public List<RoomFacility> getRoomFacilityOptions() {
		return accommodationMapper.getAllRoomFacilities();
	}

	public List<String> getAllAccoTagOptions() {
		return accommodationMapper.getAllAccoTags();
	}
}
