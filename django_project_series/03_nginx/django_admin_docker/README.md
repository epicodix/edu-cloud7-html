# Django Docker 기반 프로젝트

이 프로젝트는 Docker를 사용하여 Django 애플리케이션을 실행하는 독립적인 환경을 제공합니다. Git 리포지토리를 복제하고, 필요한 라이브러리를 설치하며, 데이터베이스 설정과 관리자 계정 생성을 자동화합니다.

## 주요 파일

- **`Dockerfile`**: 프로젝트 실행에 필요한 모든 환경(Python, Git, 라이브러리 등)을 정의하는 빌드 스크립트입니다.
- **`entrypoint.sh`**: Docker 컨테이너가 시작될 때 실행되는 셸 스크립트입니다. 아래의 작업들을 순서대로 수행합니다.
  1. 데이터베이스 마이그레이션 (`migrate`)
  2. 관리자 계정 생성 (ID: `admin`, PW: `password123`)
  3. Django 개발 서버 시작

## 사용 방법

이 폴더(`django_admin_docker`) 내에서 아래의 명령어를 순서대로 실행하세요.

**1. Docker 이미지 빌드**
```bash
docker build -t django-admin-practice .
```

**2. Docker 컨테이너 실행**
```bash
docker run -d -p 8000:8000 --name django-practice-container django-admin-practice
```

**3. 애플리케이션 접속**
- **관리자 페이지 주소:** [http://127.0.0.1:8000/admin](http://127.0.0.1:8000/admin)
- **아이디:** `admin`
- **비밀번호:** `password123`

## 종료 및 삭제

**1. 컨테이너 중지**
```bash
docker stop django-practice-container
```

**2. 컨테이너 삭제**
```bash
docker rm django-practice-container
```
