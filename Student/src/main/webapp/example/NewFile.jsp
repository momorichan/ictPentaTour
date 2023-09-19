<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>검색하기</title>
<style>
header {
	display: flex;
	width: 600px;
	flex-direction: column;
	justify-content: center;
}

.keywords {
	z-index: 1;
	background-color: white;
	display: none;
	position: absolute;
	top: 110px;
	width: 600px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.keywords li:hover, .keywords .selected {
	cursor: pointer;
	background-color: lightskyblue;
	color: white;
}

.keywords .active {
	background-color: lightskyblue;
	color: white;
}

.keywords ul {
	padding: 0;
	margin: 0;
}

.keywords li {
	list-style: none;
	padding-left: 10px;
}

table {
	margin-top: 10px;
}
</style>
<script type="text/javascript">
const getData = async () => {
    const response = await fetch("https://reqres.in/api/users?page=1") // 데이터베이스에서 받기
    return response.json()
}

const keyword = document.querySelector(".keyword")
const keywords = document.querySelector(".keywords")

function closeKeywords() {
    keywords.style.display = "none"
    keywords.innerHTML = ""
}

keyword.addEventListener("keyup", async (e) => { 
    
    const selectedKeyword = keywords.querySelector("li.selected")
    
    // li.selected 가 없는 경우에만 api에서 데이터를 가져옴
    if(keyword.value.length > 2 && !selectedKeyword) {
        console.log("=== API 호출 ===")
        const list = (await getData()).data
        
        keywords.innerHTML = ""
        
        const $ul = document.createElement("ul")
        for(let person of list) {
            const $li = document.createElement("li")
            $li.textContent = `${person.first_name} ${person.last_name}`
            $ul.append($li)
        }
        keywords.append($ul)
        
        keywords.style.display = "block" 
    } 
    if(keyword.value.length === 0) {
        keywords.innerHTML = ""
    }
    
    // 요구사항 1 - esc를 누르면 추천 검색어 창이 닫여야 합니다.
    if(e.key === "Escape") {
        closeKeywords()
    }
    
    // console.log(e.key)
    
    // 요구사항 2 - 키보드의 위, 아래 키를 누르면 추천 검색어 하이라이트가 옮겨지고 엔터를 누르면 하이라이트가 위치한 검색어가 입력창에 반영되어야 합니다.
    
    const keywordsList = keywords.querySelectorAll("li")
    
    if((e.key === "ArrowUp" || e.key === "ArrowDown") && keywords.style.display === "block") {
        let target
        const initIndex = e.key === "ArrowUp" ? keywordsList.length - 1 : 0
        const adjacentSibling = selectedKeyword && (e.key === "ArrowUp" ? selectedKeyword.previousElementSibling : selectedKeyword.nextElementSibling)
        
        if(adjacentSibling) {
            target = adjacentSibling
        } else {
            target = keywordsList.item(initIndex)
        } 
        
        selectedKeyword && selectedKeyword.classList.remove("selected")
        target.classList.add("selected")
        keyword.value = target.textContent
    }
})

document.addEventListener("click", e => {
    // 요구사항 3 - 마우스로 다른 곳을 클릭하여 input이 focus를 잃어버리는 경우 추천 검색어 창이 닫여야 합니다.
    const closestKeywords = e.target.closest(".keywords") // 부모 요소 중에 keywords 클래스를 가진 부모가 있는지 확인
    if(!closestKeywords && keywords.style.display === "block") {
        closeKeywords()
    }
})

keywords.addEventListener("click", e => {
    // 요구사항 4 - 마우스로 추천 검색어를 누르면 커서가 위치한 검색어가 입력창에 반영되어야 합니다.
    keyword.value = e.target.textContent
})
</script>
</head>
<body>
	<header>
		<h1>검색하기</h1>
		<input class="keyword" autocomplete="off" />
	</header>
	<div class="keywords"></div>

</body>
</html>