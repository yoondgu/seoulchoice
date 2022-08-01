package kr.co.nc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.nc.mapper.RestaurantMapper;
import kr.co.nc.vo.Restaurant;
import kr.co.nc.vo.Review;

/*
 * @Transactional
 * 		- 선언적 트랜잭션 처리를 지원하는 어노테이션이다.
 * 		- @Transactional 어노테이션이 지정된 인터페이스의 구현클래스, @Transactional 어노테이션이 지정된 구현클래스의 모든 메소드들이
 * 			실행될 때마다 트랜잭션처리가 지원된다.
 * 			@Transactional 어노테이션이 지정된 곳의 메소드가 실행되면, 메소드 실행전에 새로운 트랜잭션이 시작된다.
 * 			메소드를 실행하는 동안 오류 없이 메소드가 종료되면 해당 트랜잭션안에서 실행한 모든 작업을 데이터베이스에 반영시키는
 * 			commit이 실행되고, 메소드를 실행하는 동안 오류가 발생하면 해당 트랜잭션안에서 실행한 모든 작업의 데이터베이스를 반영을 취소시키는
 * 			rollback이 실행된다.
 * 			- 선언적 트랜잭션 처리가 필요한 곳은 비즈니스 로직을 수행하기 위해서 여러번의 데이터베이스 엑세스 작업을 실행하는
 * 			서비스 클래스다.
 */

@Service
@Transactional
public class RestaurantService {

	@Autowired
	private RestaurantMapper restaurantMapper;
	
	public Restaurant getRestaurantDetail(int restaurantNo) {
		return restaurantMapper.getRestaurantByNo(restaurantNo);
	}
	
	public List<Review> getRestaurantReview(int restaurantNo) {
		return restaurantMapper.getReviewByRestaurantNo(restaurantNo);
	}
}