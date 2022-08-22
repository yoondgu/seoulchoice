<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">

	#footer {
		margin: 0px!important;
	}

</style>
<title>서울어때</title>
</head>
<body>
<%@ include file="common/nav.jsp" %>
<div class="w-100 m-0">
	<div class="row w-100 m-0">
		<!-- 검색창, 결과 조회 -->
		<div class="col-3 px-0">
			<div class="p-3 bg-light">
	  			<form id="form-search" class="d-flex justify-content-center p-3 my-auto" action="javascript:search(1);" autocomplete="off">
					<input class="form-control me-2" type="text" id="search" name="keyword" placeholder="통합검색" style="max-width:600px;height:auto">
					<input type="hidden" name="type" value="">
					<input type="hidden" name="currentLat" value="37.5666805">
					<input type="hidden" name="currentLong" value="126.9784147">
					<input type="hidden" name="userNo" value="${LOGIN_USER.no }">
					<button class="btn btn-outline-primary" type="submit"><i class="bi bi-search"></i></button>
				</form>
				<ul class="nav nav-pills d-flex justify-content-evenly" id="tab-types"  role="tablist">
					<li class="nav-item">
						<button class="nav-link active" type="button" role="tab" data-bs-toggle="tab" aria-selected="true" onclick="setType('')">전체</button>
					</li>
					<li class="nav-item">
						<button class="nav-link" type="button" role="tab" data-bs-toggle="tab" aria-selected="true" data-type="A" onclick="setType('A')">숙소</button>
					</li>
					<li class="nav-item">
						<button class="nav-link" type="button" role="tab" data-bs-toggle="tab" aria-selected="true" data-type="R" onclick="setType('R')">맛집</button>
					</li>
					<li class="nav-item">
						<button class="nav-link" type="button" role="tab" data-bs-toggle="tab" aria-selected="true" data-type="M" onclick="setType('M')">MY</button>
					</li>
				</ul>
			</div>
			<div id="places-wrapper" class="p-3">
				<!-- 검색결과가 이곳에 출력된다. -->
			</div>
			<div id="pagination-wrapper" class="d-flex justify-content-center">
				<ul id="ul-item-wrapper" class="pagination" class="mx-auto">
					<!-- 페이징 번호 버튼이 이곳에 출력된다. -->
				</ul>
			</div>
		</div>
		<!-- 지도 -->
		<div class="col-9 px-0">
			<div id="map" class="vh-100">
				<div class="position-absolute" style="z-index: 1000;">
					<div class="position-relative start-0 top-0 p-3 d-flex">
						<!-- 현재 위치 가져오기 -->
						<button id="refresh-loc-btn" type="button" class="btn btn-danger me-1">
							<i class="bi bi-compass" style="cursor: pointer;"></i>
						</button>
						<!-- 지도 중심 가져오기 -->
						<button type="button" class="btn btn-danger">지도위치로 검색</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="common/footer.jsp" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=258075821638bd633c20115d42be0584"></script>
<script type="text/javascript">
$(function(){
	
/*
 * 현재 위치 좌표 갱신하고, 숙소 검색 결과 갱신하기 : 최초 화면 출력시에 실행하고, 사용자가 내 위치 버튼 클릭 시에도 실행한다.
 */
	// 현재 위치 좌표를 저장하는 변수
	let currentLat = '';
	let currentLong = '';
	refreshLocation();
	
	/*
	 * 카카오 openAPI로 지도 가져오기
	 */
	// 지도 정의하기
	let container = document.getElementById('map');
	// mapcenter 값 설정
	let options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng("37.5666805", "126.9784147"), //지도의 중심좌표
			level: 7 //지도의 레벨(확대, 축소 정도)
	};
	// 지도 생성, 윈도우로 보내기(지도 객체를 사용하는 search함수를 외부에서 정의하기 위함)
	window.map = new kakao.maps.Map(container, options);
	
	// 현재 선택한 지역에 따른 지도의 중심좌표와 확대 레벨 재설정
	// 내 위치 마커 생성하기
	// 내 위치 마커 이미지 만들기
	let myLocaMarkerImage =  new kakao.maps.MarkerImage('/resources/images/markericons/house-door-fill.svg', new kakao.maps.Size(45,45));
	let myLocationMarker = new kakao.maps.Marker({
	    position: new kakao.maps.LatLng("37.5666805", "126.9784147"),
	    image: myLocaMarkerImage
	});
	
	//////초기 실행
	// 내 위치 마커 지도에 표시하기
	myLocationMarker.setMap(map);
	// 화면 첫 출력시 페이지버튼과 전체 검색결과를 띄운다
	refreshPaginationButton(1);
	search(1);
	
});


// geolocation.getCurrentPosition은 비동기 통신으로 이루어지므로 반드시 이 통신이 완료되고 숙소 검색 요청을 보내야 한다.
// 아래 함수를 실행하면 현재 위치 좌표를 새로 조회하고, 전역변수 currentLat, currentLong와 hidden 태그에 값이 저장된다.
// 현재 위치 좌표를 새로 조회하지 못하면 서울 중심 좌표를 대신 저장한다.
// 위 수행을 완료하면 숙소 검색 결과를 새로 요청해 화면에 출력한다.
function refreshLocation() {
	// navigator.geolocation에서 지원하는 메소드를 사용해 사용자의 현재 위치 좌표값을 획득한다.
	// 받아온 좌표값은 hidden태그에 저장해서 검색 시 거리계산 조건에 사용할 수 있게 한다.
	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(function(position) {
			// 성공 시 콜백함수
	    	currentLat = position.coords.latitude;
	    	currentLong = position.coords.longitude;
			$(":hidden[name=currentLat]").val(currentLat);
			$(":hidden[name=currentLong]").val(currentLong);
			// 화면, 모달창에 현재 위치 주소를 출력한다.
			search(1);
    	}, function(position) {
			// 실패 시 콜백함수
			// 현재 위치를 받을 수 없으면 서울 중심 좌표를 저장
			  	currentLat = 37.564214;
			  	currentLong = 127.0016985;
			$(":hidden[name=currentLat]").val(currentLat);
			$(":hidden[name=currentLong]").val(currentLong);
			// 화면, 모달창에 (정보없음)을 출력한다. (위치는 서울 중심으로 되어있지만 정보가 없음을 알려주기)
	 		refreshPaginationButton(1);
	 		search(1);
		});
	}
}

////////////// 지도 관련

// 마커에서 사용할 이미지 객체를 만든다.
let placeMarkerImage =  new kakao.maps.MarkerImage('/resources/images/markericons/geo-alt-fill.svg', new kakao.maps.Size(45,45));
// 현재 지도에 표시된 마커를 관리하기 위한 배열을 정의한다.
let placeMarkers = [];

//배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수.
//* 인자값이 null이면 마커를 삭제하고, 지도 객체이면 그 지도에 마커를 표시한다.
function setMarker(map) {
	console.log(placeMarkers.length);
	for (let i = 0; i < placeMarkers.length; i++) {
		placeMarkers[i].setMap(map);
	}
}

/*
 * 검색창에 입력한 키워드에 따른 검색결과를 ajax로 획득하여 화면, 지도에 출력하는 함수
 */
function search(currentPage) {
	let queryString = $("#form-search").serialize() + "&currentPage=" + currentPage;
	$.getJSON("/places", queryString).done(function(places) {
		let $wrapper = $("#places-wrapper").empty();
		let content = '';
		if (places.length === 0) {
			content += '<div class="p-3 text-center my-auto">조회 결과가 없습니다.</div>';
		} else {
			// 기존에 지도에 표시된 마커를 모두 삭제하고, 배열을 비운다.
			setMarker(null);
			placeMarkers = [];
			$.each(places, function(index, place) {
				let detailURL = '';
				if (place.type === "숙소") {
					detailURL = "/acco/detail?id=" + place.id;
				} else {
					detailURL = "/restaurant/detail?restaurantNo=" + place.id;
				}
				content += '	<div class="row p-3 border-bottom">';
				content += '		<p class="mb-1">';
				content += '			<a class="fw-light text-muted" href="' + detailURL + '">' + place.name + '<small class="border-end mx-3"></small></a><small>' + place.type + '</small>';
				content += '			<i class="bi ' + (place.liked ? 'bi-heart-fill' : 'bi-heart') + ' fs-5 text-primary float-end"></i>';
				content += '		</p>';
				content += '		<p class="text-warning small">';
				content += '			<span class="badge bg-warning">' + place.reviewRate.toFixed(1) + '</span>';
				content += '			<i class="bi ' + place.reviewRateIcon.star1 + '"></i>';
				content += '			<i class="bi ' + place.reviewRateIcon.star2 + '"></i>';
				content += '			<i class="bi ' + place.reviewRateIcon.star3 + '"></i>';
				content += '			<i class="bi ' + place.reviewRateIcon.star4 + '"></i>';
				content += '			<i class="bi ' + place.reviewRateIcon.star5 + '"></i>';
				content += '			<span class="border-end mx-1"></span>';
				content += '			<span class="text-muted">리뷰 ' + place.reviewCount +'건</span>';
				content += '			<span class="border-end mx-1"></span>';
				content += '			<span class="text-muted"> 찜 ' + place.likeCount +'명</span>';
				content += '			<span class="badge bg-danger float-end">' + place.distance +'km</span>';
				content += '		</p>';
				content += '		<p class="small mb-1">';
				content += '			<span>' + place.address +'</span>';
				content += '		</p>';
				content += '	</div>';
				
				// 지도에 표시할 마커 객체 생성
				let markerPosition = new kakao.maps.LatLng(place.latitude, place.longitude);
				console.log(markerPosition);
				let marker = new kakao.maps.Marker({
				    position: markerPosition,
				    image: placeMarkerImage
				});
				
				// TO DO : 마커에 click 이벤트를 등록
				
				// 마커에 mouseover, mouseout 이벤트를 등록
				// * mouseover 시 보여줄 커스텀오버레이를 생성 (숙소 정보 요약)
				let overlaycontent = '';
				overlaycontent += `<div class="position-relative">
										<div class="position-absolute" style="top: -130px; left: -95px;">
											<button type="button" class="btn btn-dark position-relative" style="background-color: rgba( 0, 0, 0, 0.5 );">
												<div>`;
				overlaycontent += place.name + '<br/>';
				overlaycontent += '<small>평점 : </small><span class="badge bg-warning">' + place.reviewRate.toFixed(1) + '</span><br/>';
				overlaycontent += '<small>내 위치까지 거리 : <strong>' + place.distance + 'km</strong></small>';
				overlaycontent += `				</div>
											<svg width="1em" height="1em" viewBox="0 0 16 16" class="position-absolute top-100 start-50 translate-middle mt-1 opacity-50" fill="#212529" xmlns="http://www.w3.org/2000/svg"><path d="M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/></svg>
										</button>
									</div>
								</div>`;
				let overlay = new kakao.maps.CustomOverlay({
					content: overlaycontent,
					position: markerPosition
				});
				kakao.maps.event.addListener(marker, 'mouseover', function() {
					overlay.setMap(map);
				});
				kakao.maps.event.addListener(marker, 'mouseout', function() {
					overlay.setMap(null);
				});
				
				// 배열에 마커 객체를 저장
				placeMarkers.push(marker);
				console.log('test');
			});
			// 배열에 담긴 마커를 지도에 모두 표시한다.
			setMarker(map);
		}
		$wrapper.append(content);
	})
}

/**
 * 현재 페이지에 대한 pagination 객체를 db로부터 조회해 페이지 버튼 엘리먼트를 생성하는 함수
 * 검색날짜를 변경해서, 객실 데이터 행 수가 변경될 때 실행한다.
 */
function refreshPaginationButton(currentPage) {
	let queryString = $("#form-search").serialize() + "&currentPage=" + currentPage;
	$.getJSON("/places/pagination", queryString).done(function(pagination) {
		let $wrapper = $("#ul-item-wrapper").empty();
		let content = '';
		content += '<li class="page-item">';
		content += '	<a class="page-link ' + (pagination.currentPage <= 1 ? "disabled" : "") + '" href="javascript:changeCurrentPage(' + (currentPage - 1) +');" aria-label="Previous">';
		content += '		<span aria-hidden="true">&laquo;</span>';
		content += '	</a>';
		content += '</li>';
		for (let num = pagination.beginPage; num <= pagination.endPage; num ++) {
			content += '<li class="page-item ' + (pagination.currentPage == num ? "active" : "") + '" data-page-num="' + num + '">';
			content += '	<a class="page-link" href="javascript:changeCurrentPage(' + num +');">' + num +'</a>';
			content += '</li>';
		}
		content += '<li class="page-item">';
		content += '	<a class="page-link ' + (pagination.currentPage >= pagination.totalPages ? "disabled" : "") + '" href="javascript:changeCurrentPage(' + (currentPage + 1) +');" aria-label="Next">';
		content += '    <span aria-hidden="true">&raquo;</span>';
		content += '  </a>';
		content += '</li>';
		
		$wrapper.append(content);
	});
}

// $(function(){}) 안이므로 이 함수는 외부에서 호출이 불가능하다. 따라서 widnow 바깥으로 빼준다
// (다음에 html컨텐츠 만들때 href에 연결하지 말고 별도 이벤트등록할 것)
function changeCurrentPage(num) {
	$("#pagination-wrapper .page-item").removeClass("active");
	$('li[data-page-num="' + num +'"]').addClass("active");
	// num을 currentPage로 하는 객실 정보 출력
	search(num);
	// 페이지 버튼 상태 갱신
	refreshPaginationButton(num);
}

/*
	 * 엘리먼트에 대한 사용자 상호작용 이벤트 등록
	 */
$("#refresh-loc-btn").click(function() {
	refreshLocation();
});
 // 탭 버튼 누를 때마다 타입 설정 바꾸고 검색 요청하는 이벤트핸들러 함수
 function setType(type) {
	 if (type === "M") {
		 //ajax로 내 찜하기 목록 조회하는 함수
		 console.log("my");
	 } else {
		 // ajax로 검색결과 조회하는 함수 실행
		$(":hidden[name=type]").val(type);
		changeCurrentPage(1);
	 }
}
 
</script>
</body>
</html>