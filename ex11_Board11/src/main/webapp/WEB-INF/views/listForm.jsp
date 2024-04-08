<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1"> 
	<meta http-equiv="Content-Script-Type" content="text/javascript" />
	<meta http-equiv="Content-Style-Type" content="text/css" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
	<meta property="og:title" content="HTML5 자바스크립트 그리드 AUIGrid" />
	<meta property="og:url" content="https://www.auisoft.net/demo/auigrid/index.html">
	<meta property="og:image" content="https://www.auisoft.net/images/logo3d.png">
	<meta property="og:description" content="HTML5 자바스크립트 그리드(javascript grid) - AUIGrid" />
	<meta name="Keywords" content="webgrid, web grid, datagrid, javascript grid, html5 grid, grid component, javascript grid component, 웹 그리드, 데이타 그리드, 데이터그리드, 자바스크립트 그리드, HTML5 그리드" />
	<title>HTML5 자바스크립트 그리드(JavaScript Grid) - AUIGrid</title>
	<link href="https://www.auisoft.net/aui.ico" rel="shortcut icon" />
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" />
	<link href="../resources/auigrid/
/style_20240331/demo.css" rel="stylesheet" />
		<link href="../resources/auigrid/
/style_20240331/AUIGrid_style.css" rel="stylesheet">
	<script type="text/javascript">
		var theme = "default/data/normal_100.json";
	</script>
	<!-- ajax 요청을 위한 스크립트입니다. -->
	<script type="text/javascript" src="../resources/auigrid/
/js_20240331/ajax.js"></script>

	<!-- 데모를 위한 스크립트입니다. -->
	<script type="text/javascript" src="../resources/auigrid/
/js_20240331/demo.js"></script>

	<!-- 공용 Ajax 요청 스크립트 -->
	<script type="text/javascript" src="../resources/auigrid/
/js_20240331/common.js"></script>

	<!-- AUIGrid 라이센스 파일입니다. 그리드 출력을 위해 꼭 삽입하십시오. -->
	<script type="text/javascript" src="../resources/auigrid/
/js_20240331/AUIGridLicense.js"></script>
	<script type="text/javascript" src="../resources/auigrid/
/js_20240331/AUIGrid.js"></script>
<style type="text/css">
	/* 커스텀 칼럼 스타일 정의 */
	.aui-grid-user-custom-left {
		text-align: left;
	}

	/* 엑스트라 체크박스 사용자 선택 못하는 표시 스타일 */
	.disable-check-style {
		color: #d3825c;
	}
</style>

<script type="text/javascript">

	// AUIGrid 생성 후 반환 ID
	var myGridID;

	// document ready (jQuery 의 $(document).ready(function() {}); 과 같은 역할을 합니다.
	function documentReady() {

		// AUIGrid 그리드를 생성합니다.
		createAUIGrid(columnLayout);

		// 데이터 요청, 요청 성공 시 AUIGrid 에 데이터 삽입합니다.
		requestData("../resources/auigrid/data/normal_100.json");

	};

	// AUIGrid 칼럼 설정
	// 데이터 형태는 다음과 같은 형태임,
	//[{"id":"#Cust0","date":"2014-09-03","name":"Han","country":"USA","product":"Apple","color":"Red","price":746400}, { .....} ];
var columnLayout = [
    {
        dataField: "id",
        headerText: "Client ID",
        disableGrouping: true
    },
    {
        dataField: "date",
        headerText: "Date"
    },
    {
        dataField: "name",
        headerText: "Name"
    },
    {
        dataField: "country",
        headerText: "Country"
    },
    {
        dataField: "flag",
        headerText: "Flag",
        // 여기에 flag 필드를 표시하는 방법에 대한 추가 설정이 필요할 수 있습니다.
        // 예: 이미지로 표시하는 경우의 설정
    },
    {
        dataField: "product",
        headerText: "Product",
        styleFunction: function (rowIndex, columnIndex, value, headerText, item, dataField) {
            if (value == "LG G3" || value == "IPad Air") {
                return "disable-check-style";
            }
            return null;
        }
    },
    {
        dataField: "color",
        headerText: "Color"
    },
    {
        dataField: "quantity",
        headerText: "Quantity",
        dataType: "numeric" // 수량은 숫자 형태이므로, dataType을 numeric으로 설정
    },
    {
        dataField: "price",
        headerText: "Price",
        dataType: "numeric"
    }
];
	function createAUIGrid(columnLayout) {

		var auiGridProps = {

			rowIdField: "id",

			editable: true,

			showRowCheckColumn: true,

			showRowAllCheckBox: true,
			
			softRemoveRowMode: false,

			rowCheckableFunction: function (rowIndex, isChecked, item) {
				if (item.product == "LG G3") { 
					return false;
				}
				return true;
			},

		
			rowCheckDisabledFunction: function (rowIndex, isChecked, item) {
				if (item.product == "LG G3") { 
					return false;
				}
				return true;
			}
		};

		myGridID = AUIGrid.create("#grid_wrap", columnLayout, auiGridProps);

		AUIGrid.bind(myGridID, "ready", function (event) {
			setCheckedRowsByIds(); 
		});

		AUIGrid.bind(myGridID, "rowAllChkClick", function (event) {
			alert("전체 선택  checked : " + event.checked);
		});

	};
	
	// rowIdField 값으로 체크하기 (기존 제거)
	function setCheckedRowsByIds() {

		// rowIdField 을 고객 ID로 설정했기 때문에 고객 ID ["#Cust0",  "#Cust6",  "#Cust9"] 를 체크함.
		// 기존 체크된 항목은 체크해제되고 0,6,9로만 체크됨
		var items = ["#Cust0", "#Cust6", "#Cust9"];
		AUIGrid.setCheckedRowsByIds(myGridID, items);
	};


	function deleteCheckedRows() {
		if( window.confirm("체크된 행들을 삭제하시겠습니까?")) {
			AUIGrid.removeCheckedRows(myGridID);
		}
	}

	function getCheckedRowItems() {
		var checkedItems = AUIGrid.getCheckedRowItems(myGridID);
		if (checkedItems.length <= 0) {
			alert("없음");
			return;
		}
		var str = "";
		var rowItem;
		for (var i = 0, len = checkedItems.length; i < len; i++) {
			rowItem = checkedItems[i];
			str += "row : " + rowItem.rowIndex + ", id :" + rowItem.item.id + ", name : " + rowItem.item.name + "\n";
		}

	}
</script>


</head>
<body>
<div class="desc">
			<ul class="nav_u">
			<li><span onclick="deleteCheckedRows()" class="btn">체크된 행(들) 삭제</span></li>
		</ul>

	</div>
	<div>
		<!-- 에이유아이 그리드가 이곳에 생성됩니다. -->
		<div id="grid_wrap" style="width:100%;height:480px; margin:0 auto;"></div>
	</div>
</body>

</html>