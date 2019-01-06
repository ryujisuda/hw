#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>

int gugudan10() {
	int i, x, y, ans, res;
	int repeat = 7, timelimit = 15;
	time_t t1, t2, t3;
	srand((int)time(NULL));
	printf("게임 방법 : %d초 안에 9x9 구구단 문제 %d 개를 맞추세요.<ENTER> \n", timelimit, repeat);
	getchar();
	t1 = time(NULL);
	for (i = 0; i < repeat; i++) {
		t2 = time(NULL);
		if (t2 - t1 > timelimit) {
			printf("%d초가 지나 시간초과입니다\n", timelimit);
			res = 0;
			getchar();
			return res;
		}
		x = rand() % 8 + 2;
		y = rand() % 8 + 2;
		printf("%d * %d = ? ", x, y);
		scanf_s("%d", &ans);
		if (ans == x * y) {
			printf("정답!\n");
		}
		else {
			printf("틀림!\n");
			i--;
		}
	}
	t2 = time(NULL);
	t3 = t2 - t1;
	printf("경과시간 : %d초 \n", t3);
	if (t3 <= timelimit) {
		printf("성공입니다\n");
		res = 1;
	}
	else {
		printf("실패입니다\n");
		res = 0;
	}
	printf("<ENTER>\n");
	getchar();
	return res;
}

int gugudan16() {
	int i, x, y, ans, res;
	int repeat = 1, timelimit = 20;
	time_t t1, t2, t3;
	srand((int)time(NULL));
	printf("게임 방법 : %d초 안에 16진수 F x F 구구단 문제 %d 개를 맞추세요.(16진수로 정답입력) <ENTER>\n", timelimit, repeat);
	getchar();
	t1 = time(NULL);
	for (i = 0; i < repeat; i++) {
		t2 = time(NULL);
		if (t2 - t1 > timelimit) {
			printf("%d초가 지나 시간초과입니다\n", timelimit);
			res = 0;
			getchar();
			return res;
		}
		x = rand() % 10 + 6;
		y = rand() % 10 + 6;
		printf("%x * %x = ? ", x, y);
		scanf_s("%x", &ans);
		if (ans == x * y) {
			printf("정답!\n");
		}
		else {
			printf("틀림!\n");
			i--;
		}
	}
	t2 = time(NULL);
	t3 = t2 - t1;
	printf("경과시간 : %d초 \n", t3);
	if (t3 <= timelimit) {
		printf("성공입니다\n");
		res = 1;
	}
	else {
		printf("실패입니다\n");
		res = 0;
	}
	getchar();
	return res;
}
int UPDOWN() {

	int n; //리턴값
	int count = 0; //카운트 0
	int v, user_v;
	srand((unsigned)time(NULL));
	v = rand() % 100 + 1; //1~100랜덤 수

	do {

		if (count == 7)
		{
			printf("7번 도전을 다 하셨습니다. 실패입니다~ ! \n");
			n = 0;
			getchar();
			return n;
		}

		if (count == 0)
			printf("업다운 게임 시작 !\n");

		printf("현재 시도횟수: %d\t 1~100사이의 숫자를 입력하세요.\n ", count);
		scanf_s("%d", &user_v); //입력받음

		count++;

		if (v == user_v) {
			printf("축하합니다. 맞추셨습니다~!\n");
			n = 1;
			printf("총 시도횟수 :%d\n", count);
			getchar();
			return n;
		}
		else if (v < user_v&&user_v>0 && user_v < 100) {
			printf("DOWN !\n");

		}
		else if (v > user_v&&user_v > 0 && user_v < 100) {
			printf("UP !\n");

		}
		else {
			if (user_v < 0)
			{
				printf("0이상 숫자를 입력해 주세요.\n ");
			}
			else if (user_v > 100) {
				printf("100이하 숫자를 입력해 주세요.\n");
			}
			count--;

		}

	} while (user_v != v);

	printf("총 시도횟수 :%d\n", count);


}



int gawibawibo() //1.가위 2.바위. 3.보
{
	srand((unsigned)time(NULL));
	int n;
	int player;
	int com;
	while (1)
	{

		com = rand() % 3 + 1;
		printf("가위,바위,보 중 하나를 입력하시오(1.가위,2바위,3.보)>>");
		scanf_s("%d", &player);
		if (player == 1)
		{
			if (com == 1)
			{
				printf("비겼습니다. 다시 하십시오.\n");
				printf("Player:가위, Com:가위\n");
				getchar();
				continue;
			}
			if (com == 2)
			{
				printf("졌습니다!\n");
				printf("Player:가위, Com:바위\n");
				getchar();
				n = 0;
				break;
			}
			if (com == 3)
			{
				printf("이겼습니다!\n");
				printf("Player:가위, Com:보\n");
				getchar();
				n = 1;
				break;
			}
		}
		if (player == 2)
		{
			if (com == 2)
			{
				printf("비겼습니다. 다시 하십시오.\n");
				printf("Player:바위, Com:바위\n");
				getchar();
				continue;
			}
			if (com == 3)
			{
				printf("졌습니다!\n");
				printf("Player:바위, Com:보\n");
				getchar();
				n = 0;
				break;
			}
			if (com == 1)
			{
				printf("이겼습니다!\n");
				printf("Player:바위, Com:가위\n");
				getchar();
				n = 1;
				break;
			}
		}
		if (player == 3)
		{
			if (com == 3)
			{
				printf("비겼습니다. 다시 하십시오.\n");
				printf("Player:보, Com:보\n");
				getchar();
				continue;
			}
			if (com == 1)
			{
				printf("졌습니다!\n");
				printf("Player:보, Com:가위\n");
				getchar();
				n = 0;
				break;
			}
			if (com == 2)
			{
				printf("이겼습니다!\n");
				printf("Player:보, Com:바위\n");
				getchar();
				n = 1;
				break;
			}
		}
		else
		{
			printf("잘못 입력하셨습니다.다시 입력하십시오.\n");
			continue;
		}
	}
	return n;
}

//맵 구상 6행 6열
//□ □ □ □ □ □
//□                   □
//□   ┏━┓      □
//□   ┗━┛      □
//□                    □
//□ □ □ □ □ □


//캐릭터 
typedef struct man {
	int row;
	int col;
	char horse;
	int flag;
}MAN;

int num = 0; //몇명할건지 받는 변수
int score[4] = { 0,0,0,0 };
int ranking[4] = { 0,0,0,0 };
//주사위 이미지 
char dice_img[7] = { ' ',' ',' ',' ',' ',' ' };

//주사위, 주사위 값 캐릭터가 받기,움직이기, 맵에 표시하기.
MAN dice(MAN m, char a[6][6], int b[6][6]) // 캐릭터 구조체 man 캐릭터 위치를 받아서 거기에 캐릭터 이미지 넣는 배열 a, 캐릭터가 존재하는 곳 1표시 해주는 b 배열
{

	int i = 0;
	srand((int)time(NULL));
	int dice_num = rand() % 6 + 1;

	a[m.row][m.col] = ' ';
	// 원래 있던자리 없앰

	//주사위 초기화
	for (i = 0; i < 6; i++)
	{
		dice_img[i] = ' ';
	}


	switch (dice_num)
	{
		//나중에 배열에 값 넣을것을 생각해서 6x6판이지만 0-5번째로 생각
		//case 주사위 숫자

	case 1:
		m.flag = 0;
		b[m.row][m.col] = 0; //현재 위치를 떠나서 다른 곳으로 갈테니깐 원래 위치에 이제 아무도 없을거라고 표시 . 
		if (m.row == 1 && m.col == 1)
		{
			m.row = 0;
			m.col = 0;
		}
		//첫 라인
		if (m.row == 0 && m.col < 5)
			++m.col;

		//두번째 라인
		else if (m.col == 5 && m.row < 5)
			++m.row;

		//세번쨰 라인
		else if (m.row == 5 && m.col > 0)
			--m.col;

		//네번째 라인
		else if (m.col == 0 && m.row > 0)
			--m.row;

		while (b[m.row][m.col] == 1) // 누가 있으면
		{
			printf("자리에 누군가 있습니다, 뒤로 이동! \n");
			m.flag = 1;
			if (m.row == 0 && 0 < m.col)
				--m.col;
			else if (m.col == 5 && 0 < m.row)
				--m.row;
			else if (m.row == 5 && m.col < 5)
				++m.col;
			else if (m.col == 0 && m.row <5)
				++m.row;
			getchar();
		}
		if (b[m.row][m.col] == 0)
		{
			b[m.row][m.col] = 1; // 자기가 있다는 표시 .
			a[m.row][m.col] = m.horse;
		}

		//주사위 그림 표현할거 
		dice_img[0] = '1';
		break;

	case 2:
		m.flag = 0;
		b[m.row][m.col] = 0;
		if (m.row == 1 && m.col == 1)
		{
			m.row = 0;
			m.col = 0;
		}
		//첫 라인
		if (m.row == 0 && m.col < 4)
			m.col = m.col + 2;
		else if (m.row == 0 && m.col == 4)
		{
			++m.col;
			++m.row;
		}

		//두번째 라인
		else if (m.col == 5 && m.row < 4)
			m.row = m.row + 2;
		else if (m.col == 5 && m.row == 4)
		{
			++m.row;
			--m.col;
		}

		//세번째 라인
		else if (m.row == 5 && m.col > 1)
			m.col = m.col - 2;
		else if (m.row == 5 && m.col == 1)
		{
			--m.col;
			--m.row;
		}

		//네번째 라인
		else if (m.col == 0 && m.row > 1)
			m.row = m.row - 2;
		else if (m.col == 0 && m.row == 1)
		{
			m.col++;
			m.row--;
		}


		while (b[m.row][m.col] == 1) // 누가 있으면
		{
			printf("자리에 누군가 있습니다, 뒤로 이동! <enter> \n ");

			m.flag = 1;
			if (m.row == 0 && 0 < m.col)
				--m.col;
			else if (m.col == 5 && 0 < m.row)
				--m.row;
			else if (m.row == 5 && m.col < 5)
				++m.col;
			else if (m.col == 0 && m.row <5)
				++m.row;
			getchar();
		}
		if (b[m.row][m.col] == 0)
		{
			b[m.row][m.col] = 1; // 자기가 있다는 표시 .
			a[m.row][m.col] = m.horse;
		}

		dice_img[0] = '2';
		break;

	case 3:
		m.flag = 0;
		b[m.row][m.col] = 0;
		if (m.row == 1 && m.col == 1)
		{
			m.row = 0;
			m.col = 0;
		}
		//첫 라인
		if (m.row == 0 && m.col < 3)
			m.col = m.col + 3;
		else if (m.row == 0 && m.col == 3)
		{
			m.col = m.col + 2;
			m.row = m.row + 1;
		}
		else if (m.row == 0 && m.col == 4)
		{
			m.col = m.col + 1;
			m.row = m.row + 2;
		}

		//두번째 라인
		else if (m.col == 5 && m.row < 3)
		{
			m.row = m.row + 3;
		}
		else if (m.col == 5 && m.row == 3)
		{
			m.row = m.row + 2;
			m.col = m.col - 1;
		}
		else if (m.col == 5 && m.row == 4)
		{
			m.row = m.row + 1;
			m.col = m.col - 2;
		}

		//세번째 라인
		else if (m.row == 5 && m.col > 2)
			m.col = m.col - 3;
		else if (m.row == 5 && m.col == 2)
		{
			m.col = m.col - 2;
			m.row = m.row - 1;
		}
		else if (m.row == 5 && m.col == 1)
		{
			m.col = m.col - 1;
			m.row = m.row - 2;
		}

		//네번째 라인
		else if (m.col == 0 && m.row > 2)
			m.row = m.row - 3;
		else if (m.col == 0 && m.row == 2)
		{
			m.row = m.row - 2;
			m.col = m.col + 1;
		}
		else if (m.col == 0 && m.row == 1)
		{
			m.row = m.row - 1;
			m.col = m.col + 2;
		}

		while (b[m.row][m.col] == 1) // 누가 있으면
		{
			printf("자리에 누군가 있습니다, 뒤로 이동! \n");
			m.flag = 1;
			if (m.row == 0 && 0 < m.col)
				--m.col;
			else if (m.col == 5 && 0 < m.row)
				--m.row;
			else if (m.row == 5 && m.col < 5)
				++m.col;
			else if (m.col == 0 && m.row <5)
				++m.row;
			getchar();
		}
		if (b[m.row][m.col] == 0)
		{
			b[m.row][m.col] = 1; // 자기가 있다는 표시 .
			a[m.row][m.col] = m.horse;
		}
		dice_img[0] = '3';

		break;

	case 4:
		m.flag = 0;
		b[m.row][m.col] = 0;
		if (m.row == 1 && m.col == 1)
		{
			m.row = 0;
			m.col = 0;
		}
		//첫라인
		if (m.row == 0 && m.col < 2)
			m.col = m.col + 4;
		else if (m.row == 0 && m.col == 2)
		{
			m.col = m.col + 3;
			++m.row;
		}
		else if (m.row == 0 && m.col == 3)
		{
			m.col = m.col + 2;
			m.row = m.row + 2;
		}
		else if (m.row == 0 && m.col == 4)
		{
			m.col = m.col + 1;
			m.row = m.row + 3;
		}


		//두번째 라인
		else if (m.col == 5 && m.row < 2)
			m.row = m.row + 4;
		else if (m.col == 5 && m.row == 2)
		{
			m.row = m.row + 3;
			m.col = m.col - 1;
		}
		else if (m.col == 5 && m.row == 3)
		{
			m.row = m.row + 2;
			m.col = m.col - 2;
		}
		else if (m.col == 5 && m.row == 4)
		{
			m.row = m.row + 1;
			m.col = m.col - 3;
		}

		//세번째 라인
		else if (m.row == 5 && m.col > 3)
			m.col = m.col - 4;
		else if (m.row == 5 && m.col == 3)
		{
			m.col = m.col - 3;
			m.row = m.row - 1;
		}
		else if (m.row == 5 && m.col == 2)
		{
			m.col = m.col - 2;
			m.row = m.row - 2;
		}
		else if (m.row == 5 && m.col == 1)
		{
			m.col = m.col - 1;
			m.row = m.row - 3;
		}

		// 네번째 라인
		else if (m.col == 0 && m.row > 3)
			m.row = m.row - 4;
		else if (m.col == 0 && m.row == 3)
		{
			m.row = m.row - 3;
			m.col = m.col + 1;
		}

		else if (m.col == 0 && m.row == 2)
		{
			m.row = m.row - 2;
			m.col = m.col + 2;
		}

		else if (m.col == 0 && m.row == 1)
		{
			m.row = m.row - 1;
			m.col = m.col + 3;
		}


		while (b[m.row][m.col] == 1) // 누가 있으면
		{
			printf("자리에 누군가 있습니다, 뒤로 이동! \n");
			m.flag = 1;
			if (m.row == 0 && 0 < m.col)
				--m.col;
			else if (m.col == 5 && 0 < m.row)
				--m.row;
			else if (m.row == 5 && m.col < 5)
				++m.col;
			else if (m.col == 0 && m.row <5)
				++m.row;
			getchar();
		}
		if (b[m.row][m.col] == 0)
		{
			b[m.row][m.col] = 1; // 자기가 있다는 표시 .
			a[m.row][m.col] = m.horse;
		}

		dice_img[0] = '4';

		break;

	case 5:
		m.flag = 0;
		b[m.row][m.col] = 0;
		if (m.row == 1 && m.col == 1)
		{
			m.row = 0;
			m.col = 0;
		}
		//첫 라인
		if (m.row == 0 && m.col == 0)
			m.col = m.col + 5;
		else if (m.row == 0 && m.col == 1)
		{
			m.col = m.col + 4;
			m.row = m.row + 1;
		}
		else if (m.row == 0 && m.col == 2)
		{
			m.col = m.col + 3;
			m.row = m.row + 2;
		}
		else if (m.row == 0 && m.col == 3)
		{
			m.col = m.col + 2;
			m.row = m.row + 3;
		}
		else if (m.row == 0 && m.col == 4)
		{
			m.col = m.col + 1;
			m.row = m.row + 4;
		}

		//두번째 라인
		else if (m.col == 5 && m.row == 0)
			m.row = m.row + 5;
		else if (m.col == 5 && m.row == 1)
		{
			m.row = m.row + 4;
			m.col = m.col - 1;
		}
		else if (m.col == 5 && m.row == 2)
		{
			m.row = m.row + 3;
			m.col = m.col - 2;
		}
		else if (m.col == 5 && m.row == 3)
		{
			m.row = m.row + 2;
			m.col = m.col - 3;
		}
		else if (m.col == 5 && m.row == 4)
		{
			m.row = m.row + 1;
			m.col = m.col - 4;
		}

		//세번째라인
		else if (m.row == 5 && m.col == 5)
			m.col = m.col - 5;
		else if (m.row == 5 && m.col == 4)
		{
			m.col = m.col - 4;
			m.row = m.row - 1;
		}
		else if (m.row == 5 && m.col == 3)
		{
			m.col = m.col - 3;
			m.row = m.row - 2;
		}
		else if (m.row == 5 && m.col == 2)
		{
			m.col = m.col - 2;
			m.row = m.row - 3;
		}
		else if (m.row == 5 && m.col == 1)
		{
			m.col = m.col - 1;
			m.row = m.row - 4;
		}

		//네번째 라인
		else if (m.col == 0 && m.row == 5)
		{
			m.row = m.row - 5;

		}

		else if (m.col == 0 && m.row == 4)
		{

			m.row = m.row - 4;
			m.col = m.col + 1;
		}

		else if (m.col == 0 && m.row == 3)

		{
			m.row = m.row - 3;
			m.col = m.col + 2;
		}
		else if (m.col == 0 && m.row == 2)
		{
			m.row = m.row - 2;
			m.col = m.col + 3;
		}

		else if (m.col == 0 && m.row == 1)
		{
			m.row = m.row - 1;
			m.col = m.col + 4;
		}


		while (b[m.row][m.col] == 1) // 누가 있으면
		{
			printf("자리에 누군가 있습니다, 뒤로 이동! \n");
			m.flag = 1;
			if (m.row == 0 && 0 < m.col)
				--m.col;
			else if (m.col == 5 && 0 < m.row)
				--m.row;
			else if (m.row == 5 && m.col < 5)
				++m.col;
			else if (m.col == 0 && m.row <5)
				++m.row;
			getchar();
		}
		if (b[m.row][m.col] == 0)
		{
			b[m.row][m.col] = 1; // 자기가 있다는 표시 .
			a[m.row][m.col] = m.horse;
		}

		dice_img[0] = '5';

		break;


	case 6:
		m.flag = 0;
		b[m.row][m.col] = 0;
		if (m.row == 1 && m.col == 1)
		{
			m.row = 0;
			m.col = 0;
		}

		//첫라인
		if (m.row == 0 && m.col == 0)
		{
			m.col = m.col + 5;
			m.row = m.row + 1;
		}
		else if (m.row == 0 && m.col == 1)
		{
			m.col = m.col + 4;
			m.row = m.row + 2;
		}
		else if (m.row == 0 && m.col == 2)
		{
			m.col = m.col + 3;
			m.row = m.row + 3;
		}
		else if (m.row == 0 && m.col == 3)
		{
			m.col = m.col + 2;
			m.row = m.row + 4;
		}
		else if (m.row == 0 && m.col == 4)
		{
			m.col = m.col + 1;
			m.row = m.row + 5;
		}

		//두번째 라인
		else if (m.col == 5 && m.row == 0)
		{
			m.row = m.row + 5;
			m.col = m.col - 1;
		}
		else if (m.col == 5 && m.row == 1)
		{
			m.row = m.row + 4;
			m.col = m.col - 2;
		}
		else if (m.col == 5 && m.row == 2)
		{
			m.row = m.row + 3;
			m.col = m.col - 3;
		}
		else if (m.col == 5 && m.row == 3)
		{
			m.row = m.row + 2;
			m.col = m.col - 4;
		}
		else if (m.col == 5 && m.row == 4)
		{
			m.row = m.row + 1;
			m.col = m.col - 5;
		}

		//세번째 라인
		else if (m.row == 5 && m.col == 5)
		{
			m.col = m.col - 5;
			m.row = m.row - 1;
		}
		else if (m.row == 5 && m.col == 4)
		{
			m.col = m.col - 4;
			m.row = m.row - 2;
		}
		else if (m.row == 5 && m.col == 3)
		{
			m.col = m.col - 3;
			m.row = m.row - 3;
		}
		else if (m.row == 5 && m.col == 2)
		{
			m.col = m.col - 2;
			m.row = m.row - 4;
		}
		else if (m.row == 5 && m.col == 1)
		{
			m.col = m.col - 1;
			m.row = m.row - 5;
		}

		//네번째 라인
		else if (m.row == 5 && m.col == 0) {
			m.row = m.row - 5;
			m.col = m.col + 1;
		}

		else if (m.row == 4 && m.col == 0)
		{
			m.row = m.row - 4;
			m.col = m.col + 2;
		}
		else if (m.row == 3 && m.col == 0)
		{
			m.row = m.row - 3;
			m.col = m.col + 3;
		}
		else if (m.row == 2 && m.col == 0)
		{
			m.row = m.row - 2;
			m.col = m.col + 4;
		}
		else if (m.row == 1 && m.col == 0)
		{
			m.row = m.row - 1;
			m.col = m.col + 5;
		}

		while (b[m.row][m.col] == 1) // 누가 있으면
		{
			printf("자리에 누군가 있습니다, 뒤로 이동! \n");
			m.flag = 1;
			if (m.row == 0 && 0 < m.col)
				--m.col;
			else if (m.col == 5 && 0 < m.row)
				--m.row;
			else if (m.row == 5 && m.col < 5)
				++m.col;
			else if (m.col == 0 && m.row <5)
				++m.row;
			getchar();
		}
		if (b[m.row][m.col] == 0)
		{
			b[m.row][m.col] = 1; // 자기가 있다는 표시 .
			a[m.row][m.col] = m.horse;
		}

		dice_img[0] = '6';

		break;



	}
	return m;
}
//맵
void mapdraw(char a[6][6])
{
	int i = 0;
	int j = 0;

	printf("\n            미니게임 ★ 보드게임     \n\n");
	for (i = 0; i < 6; i++) {
		if (i != 0 && i != 5)
		{
			if (i == 2)
			{
				printf("    ┏━━━┓      ┏━━━━━━┓      ┏━━━┓\n");
				printf("    ");
				for (j = 0; j < 6; j++)
				{
					if (j == 0 || j == 5)

						printf("┃%3c┃", a[i][j]);
					else if (j == 2)
						printf("┃    ");
					else if (j == 3)
						printf("  ┃");
					else  printf("      ");
				}
				printf("\n");
				printf("    ┗━━━┛      ┃  %c%c%c ┃      ┗━━━┛\n", dice_img[0], dice_img[1], dice_img[2]);
			}


			else if (i == 3)
			{
				printf("    ┏━━━┓      ┃  %c%c%c ┃      ┏━━━┓\n", dice_img[3], dice_img[4], dice_img[5]);
				printf("");
				for (j = 0; j < 6; j++)
				{
					if (j == 0)
						printf("    ┃%3c┃", a[i][j]);
					else if (j == 5)
						printf(" ┃%3c┃", a[i][j]);
					else if (j == 2)
						printf(" ┃  ");
					else if (j == 3)
						printf("    ┃");
					else { printf("     "); }
				}
				printf("\n");
				printf("    ┗━━━┛      ┗━━━━━━┛      ┗━━━┛\n");
			}

			else
			{
				printf("    ┏━━━┓                    ┏━━━┓\n");
				printf("  ");
				for (j = 0; j < 6; j++)
				{
					printf("  ");
					if (j == 0 || j == 5)

					{
						if (j == 5)

						{
							printf("  ");
						}
						printf("┃%3c┃", a[i][j]);
					}
					else { printf("  "); }
				}
				printf("\n");
				printf("    ┗━━━┛                    ┗━━━┛\n");
			}
		}

		else
		{
			printf("    ┏━━━┓┏━━━┓┏━━━┓┏━━━┓┏━━━┓┏━━━┓\n");
			printf("    ");
			for (j = 0; j < 6; j++)
			{

				printf("┃%3c┃", a[i][j]);
			}
			printf("\n");
			printf("    ┗━━━┛┗━━━┛┗━━━┛┗━━━┛┗━━━┛┗━━━┛\n");
		}

	}
}
int main(void)
{
	int i = 0;
	int j = 0;

	int rank_i = 0;
	int rank_j = 0;
	int jumsu = 0;

	FILE *f;//게임결과를 저장할 파일포인터
	time_t now;//게임진행시각 
	srand((unsigned)time(NULL));
	//1~10랜덤 수

	char map[6][6] = { "" };//맵 안에 자료( 캐릭터들 위치에 자신들 표현 ) 출력을 위해 
	for (i = 0; i < 6; i++)
	{
		for (j = 0; j < 6; j++)
			map[i][j] = ' ';
	}// map 초기화 

	int char_on[6][6]; // 캐릭터가 현재있는 곳을 표시해주는 배열 . 존재하면 1 없으면 0 ;
	for (i = 0; i < 6; i++)
	{
		for (j = 0; j < 6; j++)
			char_on[i][j] = 0;
	} // 0으로 초기화


	printf("\n");
	printf(" ----------------------------------<보드게임 규칙>------------------------------------\n");
	printf("\n");
	printf("              1. 미니게임에서 지면 1~5점 랜덤 감점, 이기면 1~15점 랜덤 득점                       \n");
	printf("\n");
	printf("               2. 다른 플레이어가 있는 칸에 가면 한칸 뒤로 감          \n");
	printf("\n");
	printf("                    3. 먼저 20점 이상에 도달한 플레이어가 승리                               \n");
	printf("\n");
	printf("\n");
	printf(" -------------------------------------------------------------------------------------\n");
	printf("                             시작하시겠습니까? <enter>                                  ");
	getchar();


	system("clear"); // 화면 초기화 . 리눅스에서는 이거말고 수업시간에 배웠던 화면초기화쓰기 
	printf("보드게임을 할 인원을 입력하세요 ( 최대 4명 )  >> ");
	scanf_s("%d", &num);
	system("clear");

	MAN m[4] = { { 0,0,'1' },{ 0,0,'2' },{ 0,0,'3' },{ 0,0,'4' } }; // 캐릭터 -> (시작위치 0 ,0) 행, 열,자기 표시 (1번은 '1' ) 
	int na = 0; // 반복문 돌아간 ?? 총 횟수 

	for (i = 1;; i++)
	{
		system("clear");
		mapdraw(map); // 전단계에서 바뀐 맵 (맨 처음은 그냥 초기 맵) 
		for (rank_i = 0; rank_i < num; rank_i++)
		{
			printf("플레이어 %d의 점수 : %d\n", rank_i + 1, score[rank_i]);
		}
		if (na == 0) getchar(); //규칙설명하고나서 enter입력없이 1의 주사위가 굴러가버리는걸 방지하기 위해서 
		printf("< %d째 순서 > 주사위를 돌려주세요 <enter> ", i);
		getchar();
		m[i - 1] = dice(m[i - 1], map, char_on); // 다이스 함수를 이용해서 변환 위치를 가지고있는 캐릭터를 받음. 

		if (m[i - 1].row == 1 && m[i - 1].col == 1 && m[i - 1].flag == 1)
		{

		}
		else
		{
			system("clear");
			mapdraw(map);
			for (rank_i = 0; rank_i < num; rank_i++)
			{
				printf("플레이어 %d의 점수 : %d\n", rank_i + 1, score[rank_i]);
			}

			int game_num = rand() % 8;
			switch (game_num)
			{
			case 0:
				break;
			case 1:
			{

				int a = gawibawibo();
				if (a)
				{
					jumsu = rand() % 15 + 1;
					score[i - 1] = score[i - 1] + jumsu;

					printf("이겼습니다 ! %d점 획득 <enter>를 누르시오\n", jumsu);
					getchar();
				}
				else
				{
					jumsu = rand() % 5 + 1;
					score[i - 1] = score[i - 1] - jumsu;
					printf("져서 %d점을 잃었습니다 !<enter>를 누르시오\n", jumsu);
					getchar();

				}
				if (score[i - 1] >= 20)
				{
					for (rank_i = 0; rank_i < num; rank_i++)
					{
						printf("플레이어 %d의 점수 : %d\n", rank_i + 1, score[rank_i]);
					}
					for (rank_i = 0; rank_i < num; rank_i++)
					{
						for (rank_j = rank_i + 1; rank_j < num; rank_j++)
						{
							if (score[rank_j] > score[rank_i])

							{
								ranking[rank_i]++;
							}
							else if (score[rank_j] < score[rank_i])
							{
								ranking[rank_j]++;
							}
						}
					}
					//f = fopen("game_result.txt", "a");
					time(&now);
					//fprintf(f, "게임 진행된 시각 : %s", asctime(localtime(&now)));
					for (rank_i = 0; rank_i <num; rank_i++)
					{
						printf("플레이어 %d,%d점: %d위", rank_i + 1, score[rank_i], ranking[rank_i] + 1);
						printf("\n");
						//fprintf(f, "플레이어 %d,%d점: %d위", rank_i + 1, score[rank_i], ranking[rank_i] + 1);
						//fprintf(f, "\n");

					}
					//fclose(f);
					printf("\n");
					return;
				}

				break;

			}
			case 2:
			{

				int a = gawibawibo();
				if (a)
				{
					jumsu = rand() % 15 + 1;
					score[i - 1] = score[i - 1] + jumsu;

					printf("이겼습니다 ! %d점 획득 <enter>를 누르시오\n", jumsu);
					getchar();
				}
				else
				{
					jumsu = rand() % 5 + 1;
					score[i - 1] = score[i - 1] - jumsu;
					printf("져서 %d점을 잃었습니다 !<enter>를 누르시오\n", jumsu);
					getchar();

				}
				if (score[i - 1] >= 20)
				{
					for (rank_i = 0; rank_i < num; rank_i++)
					{
						printf("플레이어 %d의 점수 : %d\n", rank_i + 1, score[rank_i]);
					}
					for (rank_i = 0; rank_i < num; rank_i++)
					{
						for (rank_j = rank_i + 1; rank_j < num; rank_j++)
						{
							if (score[rank_j] > score[rank_i])

							{
								ranking[rank_i]++;
							}
							else if (score[rank_j] < score[rank_i])
							{
								ranking[rank_j]++;
							}
						}
					}
					//f = fopen("game_result.txt", "a");
					time(&now);
					//fprintf(f, "게임 진행된 시각 : %s", asctime(localtime(&now)));
					for (rank_i = 0; rank_i <num; rank_i++)
					{
						printf("플레이어 %d,%d점: %d위", rank_i + 1, score[rank_i], ranking[rank_i] + 1);
						printf("\n");
						//fprintf(f, "플레이어 %d,%d점: %d위", rank_i + 1, score[rank_i], ranking[rank_i] + 1);
						//fprintf(f, "\n");

					}
					//fclose(f);
					printf("\n");
					return;
				}

				break;

			}
			case 3:
			{
				break;
			}
			case 4:
			{
				break;
			}
			case 5:
			{
				int a = UPDOWN();
				if (a)
				{
					jumsu = rand() % 15 + 1;
					score[i - 1] = score[i - 1] + jumsu;

					printf("이겼습니다 ! %d점 획득 <enter>를 누르시오\n", jumsu);
					getchar();
				}
				else
				{
					jumsu = rand() % 5 + 1;
					score[i - 1] = score[i - 1] - jumsu;
					printf("져서 %d점을 잃었습니다 !<enter>를 누르시오\n", jumsu);
					getchar();

				}
				if (score[i - 1] >= 20)
				{
					for (rank_i = 0; rank_i < num; rank_i++)
					{
						printf("플레이어 %d의 점수 : %d\n", rank_i + 1, score[rank_i]);
					}
					for (rank_i = 0; rank_i < num; rank_i++)
					{
						for (rank_j = rank_i + 1; rank_j < num; rank_j++)
						{
							if (score[rank_j] > score[rank_i])

							{
								ranking[rank_i]++;
							}
							else if (score[rank_j] < score[rank_i])
							{
								ranking[rank_j]++;
							}
						}
					}
					//f = fopen("game_result.txt", "a");
					time(&now);
					//fprintf(f, "게임 진행된 시각 : %s", asctime(localtime(&now)));
					for (rank_i = 0; rank_i <num; rank_i++)
					{
						printf("플레이어 %d,%d점: %d위", rank_i + 1, score[rank_i], ranking[rank_i] + 1);
						printf("\n");
						//fprintf(f, "플레이어 %d,%d점: %d위", rank_i + 1, score[rank_i], ranking[rank_i] + 1);
						//fprintf(f, "\n");

					}
					//fclose(f);
					printf("\n");
					return;
				}
				break;
			}
			case 6:
			{

				int a = gugudan10();
				if (a)
				{
					jumsu = rand() % 15 + 1;
					score[i - 1] = score[i - 1] + jumsu;

					printf("이겼습니다 ! %d점 획득 <enter>를 누르시오\n", jumsu);
					getchar();
				}
				else
				{
					jumsu = rand() % 5 + 1;
					score[i - 1] = score[i - 1] - jumsu;
					printf("져서 %d점을 잃었습니다 !<enter>를 누르시오\n", jumsu);
					getchar();

				}
				if (score[i - 1] >= 20)
				{
					for (rank_i = 0; rank_i < num; rank_i++)
					{
						printf("플레이어 %d의 점수 : %d\n", rank_i + 1, score[rank_i]);
					}
					for (rank_i = 0; rank_i < num; rank_i++)
					{
						for (rank_j = rank_i + 1; rank_j < num; rank_j++)
						{
							if (score[rank_j] > score[rank_i])

							{
								ranking[rank_i]++;
							}
							else if (score[rank_j] < score[rank_i])
							{
								ranking[rank_j]++;
							}
						}
					}
					//f = fopen("game_result.txt", "a");
					time(&now);
					//fprintf(f, "게임 진행된 시각 : %s", asctime(localtime(&now)));
					for (rank_i = 0; rank_i <num; rank_i++)
					{
						printf("플레이어 %d,%d점: %d위", rank_i + 1, score[rank_i], ranking[rank_i] + 1);
						printf("\n");
						//fprintf(f, "플레이어 %d,%d점: %d위", rank_i + 1, score[rank_i], ranking[rank_i] + 1);
						//fprintf(f, "\n");

					}
					//fclose(f);
					printf("\n");
					return;
				}
				break;

			}
			case 7:
			{

				int a = gugudan16();
				if (a)
				{
					jumsu = rand() % 15 + 1;
					score[i - 1] = score[i - 1] + jumsu;

					printf("이겼습니다 ! %d점 획득 <enter>를 누르시오\n", jumsu);
					getchar();
				}
				else
				{
					jumsu = rand() % 5 + 1;
					score[i - 1] = score[i - 1] - jumsu;
					printf("져서 %d점을 잃었습니다 !<enter>를 누르시오\n", jumsu);
					getchar();

				}
				if (score[i - 1] >= 20)
				{
					for (rank_i = 0; rank_i < num; rank_i++)
					{
						printf("플레이어 %d의 점수 : %d\n", rank_i + 1, score[rank_i]);
					}
					for (rank_i = 0; rank_i < num; rank_i++)
					{
						for (rank_j = rank_i + 1; rank_j < num; rank_j++)
						{
							if (score[rank_j] > score[rank_i])

							{
								ranking[rank_i]++;
							}
							else if (score[rank_j] < score[rank_i])
							{
								ranking[rank_j]++;
							}
						}
					}
					//f = fopen("game_result.txt", "a");
					time(&now);
					//fprintf(f, "게임 진행된 시각 : %s", asctime(localtime(&now)));
					for (rank_i = 0; rank_i <num; rank_i++)
					{
						printf("플레이어 %d,%d점: %d위", rank_i + 1, score[rank_i], ranking[rank_i] + 1);
						printf("\n");
						//fprintf(f, "플레이어 %d,%d점: %d위", rank_i + 1, score[rank_i], ranking[rank_i] + 1);
						//fprintf(f, "\n");

					}
					//fclose(f);
					printf("\n");
					return;
				}
				break;

			}
			}
		}



		if (i == num)
			i = 0; // 1 ~ num( 몇명할지) 를 반복하기위해서 .
		na++;

		if (na == 1000)
			break;
	}


	return 0;
}
