
package kr.co.nc.vo;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Alias("Restaurant")
public class Restaurant {

	private int no;
	private String name;
	private String location;
	private String imgname;
	private String tel; 		// 전화번호
	private int likeCount;
	private int reviewCount;
	private int reviewPoint;
	private Date createdDate;
	private Date updateDate;
	private String latitud;		// 위도
	private String longitude; 	// 경도
	private String delete;
	private String cityId;
	private String opening;		// 운영시간
	private String breakTime;	// 휴식시간
	private String close;		// 휴무일
	private MultipartFile imgfile;
	private String district;	// 구역(시/군/구 정보)
	
	// 조회할 때 사용하는 변수
	private String distance;
	private boolean liked;
	
	private List<RestaurantTag> tags;				// 음식점 태그
	private List<RestaurantMenu> menus;				// 음식점 메뉴
	private List<RestaurantCategory> categories;	// 음식점 카테고리
}