// Mozilla, Opera, Webkit
if (document.addEventListener) {
	document.addEventListener(
		'DOMContentLoaded',
		function () {
			document.removeEventListener('DOMContentLoaded', arguments.callee, false);
			initDemo(); //데모를 위한 스크립트
			documentReady();
			loadScroll();
			window.addEventListener('resize', handleGlobalWinResize);
			isNavOpen = window.innerWidth >= 1300 ? true : false;
		},
		false
	);

	// If IE event model is used
} else if (document.attachEvent) {
	// ensure firing before onload
	document.attachEvent('onreadystatechange', function () {
		if (document.readyState === 'complete') {
			document.detachEvent('onreadystatechange', arguments.callee);
			initDemo(); //데모를 위한 스크립트
			documentReady();
			loadScroll();
		}
	});
}

function isIE() {
	var ua = window.navigator.userAgent;
	return ua.indexOf('Trident/7.0') > 0 || /MSIE 10/i.test(ua);
}

function handleGlobalWinResize() {
	if (window.innerWidth >= 1300) {
		isNavOpen = true;
	} else {
		isNavOpen = false;
	}
	toggleNavWrapper();
}

function loadScroll() {
	var navWrapper = document.getElementById('nav-wrapper');
	if (!navWrapper) return;
	navWrapper.scrollTop = Number(_getParam('s'));
}

var _getParam = function (key) {
	var _parammap = {};
	document.location.search.replace(/\??(?:([^=]+)=([^&]*)&?)/g, function () {
		function decode(s) {
			return decodeURIComponent(s.split('+').join(' '));
		}
		_parammap[decode(arguments[1])] = decode(arguments[2]);
	});
	return _parammap[key];
};

// 데모 메뉴 액티브 스타일 만들기
function initDemo() {
	var url = location.href;
	var idx = url.indexOf('?');
	var lastIdx = url.indexOf('&');
	var menuItem;
	if (idx > 0) {
		var link = url.substring(idx + 1, lastIdx);
		if (link && link.length > 2) {
			menuItem = document.getElementById(link);
			if (menuItem) {
				menuItem.className = menuItem.className + ' active';
			}
		}
	}

	if (isIE()) {
		// IE 에서는 트랜지션 무시.
		document.getElementById('nav-wrapper').style.transition = 'initial';
	}

	// theme 셀렉트 선택
	var select = document.getElementById('themeSelect');
	if (!select) return;

	switch (theme) {
		case 'modern':
			select.selectedIndex = 1;
			break;
		case 'modern_red':
			select.selectedIndex = 2;
			break;
		case 'classic':
			select.selectedIndex = 3;
			break;
		case 'dark':
			select.selectedIndex = 4;
			break;
		case 'blue':
			select.selectedIndex = 5;
			break;
		case 'default':
		default:
			select.selectedIndex = 0;
	}
}

function getScroll() {
	var scrollTop = 0;
	var navWrapper = document.getElementById('nav-wrapper');
	if (!navWrapper) return 0;
	scrollTop = navWrapper.scrollTop || 0;
	return scrollTop;
}

function changeLocation(href, scrollPos) {
	if (scrollPos === undefined) {
		scrollPos = Math.floor(getScroll());
	}
	location.href = href + '&theme=' + theme + '&s=' + scrollPos;
}

function themeSelectHandler(event) {
	var select = document.getElementById('themeSelect');
	theme = select.value;

	var url = location.href;
	var idx = url.indexOf('&');
	var link = url.substring(0, idx);

	changeLocation(link);
}

var isNavOpen = true;
function handleKnobClick() {
	isNavOpen = !isNavOpen;
	toggleNavWrapper();
}
function toggleNavWrapper() {
	if (isNavOpen) {
		//document.getElementById("nav-wrapper").style = "transform: translateX(0px)";
		document.getElementById('nav-wrapper').style.transform = 'translateX(0px)'; 
	} else {
		//document.getElementById("nav-wrapper").style = "transform: translateX(-300px)";
		document.getElementById('nav-wrapper').style.transform = 'translateX(-300px)'; 
	}
}
