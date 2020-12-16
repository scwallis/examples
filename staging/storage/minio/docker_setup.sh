#!/bin/sh

#swap memory disable
swapoff -a
# 패키지 관리 도구 업데이트
$ sudo apt update
$ sudo apt-get update
# 기존 docker 설치된 리소스 확인 후 발견되면 삭제
$ sudo apt-get remove docker docker-engine docker.io
# docker를 설치하기 위한 각종 라이브러리 설치
$ sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
# curl 명령어를 통해 gpg key 내려받기
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# 키를 잘 내려받았는지 확인
$ sudo apt-key fingerprint 0EBFCD88
# 패키지 관리 도구에 도커 다운로드 링크 추가
$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
# 패키지 관리 도구 업데이트
$ sudo apt-get update
# docker-ce의 버젼을 최신으로 사용하는게 아니라 18.06.2~3의 버젼을 사용하는 이유는 
# kubernetes에서 권장하는 버젼의 범위가 최대 v18.09 이기 때문이다.
$ sudo apt-get install docker-ce=18.06.2~ce~3-0~ubuntu -y
# Docker 설치 완료 후 테스트로 hello-world 컨테이너 구동
$ sudo docker run hello-world
