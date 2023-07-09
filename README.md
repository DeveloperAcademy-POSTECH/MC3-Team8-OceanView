<img src="https://github.com/ApplePod/SwiftUI_complete/assets/20789760/82809541-456d-4c7a-b999-ce9dbae369af"/>
<h3 align="center">(Hotel room)Ocean View: 여름의연애</h3>
<p align="center">사과들의 연애를 앱스토어에서 만나보세요</p>

<div style="display: flex; flex-direction: column;" align="center" >
  <a href="https://www.apple.com/kr/store">
    <img src="https://user-images.githubusercontent.com/81340603/204947353-18c33fe9-c49b-443a-b1e2-7cf9a85bb91b.png" width=180px />
  </a>
<p3>&nbsp;&nbsp;&nbsp;</p3>
  <a href="https://github.com/DeveloperAcademy-POSTECH/MC2-Team11-EZ">
    <img src="https://user-images.githubusercontent.com/81340603/205491490-1ec07066-5b90-4277-9907-42b1ef47fe45.png" width=60px/>
  </a>
</div>

<div>  </div>

<h2>🧐 Preview</h2>
업데이트 예정


<div align="center">
  ➿
  상세설명 작성예정
  ➿
</div>

<br>

<h2>🗂 Directory Structure</h2>


➿
상세설명 작성예정
➿
<br>

<h2>🔩 Tech & Skills</h2>

➿
상세설명 작성예정
➿

<br>

<h2>🛠 Development Environment</h2>

<img width="100" src="https://img.shields.io/badge/IOS-16%2B-silver"> <img width="125" src="https://img.shields.io/badge/Xcode-14.3-blue">

<br>


<h2>🔏 License</h2>
<img width="170" src="https://img.shields.io/badge/MIT License-2.0-yellow">


<br>

<h2>👨‍🎨 Authors</h2>

|[Ocean / 최수현](https://github.com)|[Luna / 박보경](https://github.com)|[Kiwi / 송기원](https://github.com)|[D.goggins / 성훈용](https://github.com)|[Heemoo / 문서희](https://github.com)|[Puppy / 최영재](https://github.com)|
|:---:|:---:|:---:|:---:|:---:|:---:|
| <img width=200px src="https://user-images.githubusercontent.com/20789760/251167485-d16dfcc5-7c68-49d5-8df7-88a758d82f51.jpeg"/> | <img width=200px src="https://user-images.githubusercontent.com/20789760/251167508-36f8efcd-dd3e-41ac-87d3-a9765a1e40b4.png"/> | <img width=200px src="https://user-images.githubusercontent.com/20789760/251167554-ddad6d46-eed5-44ec-a70a-d94a020da15f.jpeg"/> | <img width=200px src="https://user-images.githubusercontent.com/20789760/251167578-2df25fd9-9819-4eed-a1fb-4145470fa653.JPG"/> | <img width=200px src="https://user-images.githubusercontent.com/20789760/251167565-d927b638-0692-476b-aca5-b858bd3b8b88.png"/> | <img width=200px src="https://user-images.githubusercontent.com/20789760/251167592-a9d4a0a6-395b-4cc7-a98b-eb7e8510b92f.png"/> |  
|<center>iOS Lead Developer</center>|<center>iOS Lead Developer</center>|<center>iOS Lead Developer</center>|<center>iOS Lead Developer</center>|<center>iOS Lead Developer</center>|<center>iOS Lead Developer</center>|


<br>

<h2> 🚨 호텔룸오션뷰 Git Workflow </h2>

1. 우리팀 상황
- 팀원 5명
- 협업툴이 모두 다르며 , 사용이 익숙한 팀원이 다수 

2. 브랜치 정의
- main: 제품으로 출시될 수 있는 브랜치 (사용)
- develop : 다음 출시 버전을 개발하는 브랜치 (사용)
- feature : 기능을 개발하는 브랜치 (사용)
- release : 이번 출시 버전을 준비하는 브랜치 (미사용)
- hotfix : 출시 버전에서 발생한 버그를 수정 하는 브랜치 (미사용)

<img src="https://user-images.githubusercontent.com/20789760/235433624-399b14a2-caf9-4b1b-8941-9f8241f8aa24.png" />

3. 커밋 메세지 규칙 (대문자)
- FIX : 버그 수정, 에러 해결 등
- ADD : 파일 / UI / API 추가
- FEAT : 기능 추가
- DELETE : 파일 삭제
- REFACTOR : 기존 파일 개선/보완
- MOVE : 파일 위치 변경 / 이름 변경 등 실제 코드 내용 변경 없을 시
- CHORE : 기타 
- SETTING : 세팅
- 첫 줄에 커밋 제목 작성, 추가 설명이 필요한 경우 줄 바꿈 후 여러 줄에 내역 작성
- ex) [FEAT] 로그아웃 및 회원탈퇴 구현 (#320), [CHORE] 코드리뷰 반영 (#204), [FIX] 초대코드 복사 토스트가 계속 내려오는 문제 해결 (#197), [ADD] ToastView 컴포넌트화

4. 깃 조작방법 
- 새로운 feature 개발: 최신 develop의 변경사항을 local에 반영시킨다.
- 이슈를 열어서 이슈번호를 확인한다. 라벨로 표기하면 더욱 보기에 좋다. ex) [FEAT] 팀 관리 모달 api 연결 
- $ git checkout develop : develop 브랜치로 checkout
- $ git pull : develop 브랜치의 최신 변경사항을 로컬로 가져온다. 
- $ git checkout -b <닉네임_branch명/이슈번호> :명령어를 통해 브랜치 생성 후 checkout한다 ex) puppy_feat/#320
- 코드작성
- $ git add <file 명>: git add . 를 통해 모든 파일을 staging area에 추가할 수 있다. 
- $ git commit -m "커밋메세지" ex) 커밋 규칙 확인
- $ git push origin <feature branch>: origin(원격 저장소)의 feature branch로 로컬 변경 내역을 push
- github에서 develop branch <- feature branch 방향으로  Pull Request 진행
- 리뷰가 종료되고 모두 Approve 된다면 Merge한다. 

5. PR 규칙
 - 템플릿 예정
