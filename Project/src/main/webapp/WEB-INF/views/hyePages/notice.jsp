<%@page import="java.util.ArrayList"%>
<%@page import="com.koreait.project.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<jsp:include page="../template/header.jsp">
	<jsp:param value="회원정보 수정 페이지" name="title"/>
</jsp:include>

<!-- header와 충돌이 생겨 style에 지정함 -->
<style type="text/css">
#noticeWrapper {
	width: 700px;
	transform: translate(20%, 5%);
}
#noticeSubject {
	height: 200px;
	width: 700px;
	text-align: center;
	line-height: 200px;
	font-size: 30px;
	margin-bottom: 20px;
	background: #20c997;
	color: #fff;
}
</style>

<title>정부 방역 지침 안내</title>


		<!-- wrapper는 나중에 css 작업에 용이하게 하기 위함 -->
<div id="noticeWrapper">
	<div id="noticeSubject">
		모임 방역 수칙 안내 😷
	</div>
	(2021.02.10 업데이트)<br/><br/>



안녕하세요 여러분, letsports 팀입니다.<br/>

따뜻하고 건강한 하루하루 보내고 계시나요?<br/>



2021년에도 COVID-19로 인한 사회적 거리두기가 계속되고 있습니다.<br/>
사회적 거리두기 2단계/ 2.5단계/ 3단계 기간 letsports 오프라인 모임 운영 방침을 안내드립니다.<br/>



1월 18일부터 letsports는 사회적 거리두기 2단계/ 2.5단계/ 3단계 기간에 예정된 모든 오프라인 모임을 취소합니다. <br/>
멤버들께는 취소된 모임에 해당하는 멤버십 금액을 조건 없이 전액 환불해드립니다. <br/>
취소된 모임의 멤버들께는 문자로 별도 연락을 드리겠습니다.<br/><br/>



[사회적 거리두기 1단계/ 1.5단계]<br/>

오프라인 모임 정상 운영<br/>


[사회적 거리두기 2단계/ 2.5단계/ 3단계]<br/><br/>

오프라인 모임 취소<br/>
취소된 모임의 멤버 전원 대상, 취소된 모임에 해당하는 멤버십 금액 전액 환불<br/>


지난 1년 동안 멤버들께 약속한 4회의 모임을 최대한 정상적으로 제공하기 위해 최선을 다해왔습니다.<br/>
 참석을 원치 않는 멤버들께 환불해 드리고, 모임 일정을 변경하기도 하고, 온라인으로 바꿔서 진행하기도 했습니다. <br/>
 클럽별로 모임 진행 방향을 파악하는 과정에서 많은 멤버, 파트너, 클럽장 님들이 의사를 전달해 주시고 바뀐 일정을 확인하시느라 시간도 마음도 많이 쓰셨습니다. 진심으로 감사한 마음뿐입니다.<br/><br/>



올해도 letsports는 사회적 거리두기에 적극 동참하겠습니다.<br/>
더하여, 멤버들께서 지속적으로 전해주신 잦은 일정 변경으로 인한 피로감과 불편함을 최소화하고자 합니다.<br/>



2021년 1월 18일부로 사회적 거리두기에 따른 letsports 운영 정책은 단순화했습니다. <br/>
기존의 클럽별 모임 방향 투표 등의 단계는 사라지고, 사회적 거리두기가 2단계/ 2.5단계/ 3단계일 경우 모든 오프라인 모임을 취소하고 멤버 전원께 취소된 모임에 해당하는 금액을 전액 환불해 드립니다. <br/>
정상적으로 모임을 운영하지 못하는 상황이 너무나도 안타깝습니다. 멤버, 파트너, 클럽장 님께 너른 이해를 부탁드립니다.<br/>



읽고, 쓰고, 대화하고, 친해지는 일련의 과정이 우리의 삶을 더 행복하고 풍요롭게 만든다고 믿습니다. <br/>
저희와 같은 마음을 가진 멤버들 덕분에 2020년을 건너올 수 있었습니다. <br/>
고맙습니다. 앞으로도 멤버들이 letsports에서 편안하고 즐겁게 읽고, 쓰고, 대화하며, 친해질 수 있도록 최선을 다하겠습니다.<br/><br/><br/>



감사합니다.<br/>

letsports 팀 드림<br/>

	
</div>
	
<%@ include file="../template/footer.jsp" %>