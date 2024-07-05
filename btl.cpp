#include <iostream.h>
#include <conio.h>

extern ODD_SUM();
extern EXIT();
void main(void) {
	char tl;
	int chon;
	clrscr();
	cout << "\n\tTRUONG DAI HOC MO HA NOI";
	cout << "\n\tKHOA CONG NGHE THONG TIN";
	cout << "\n\t----------***-----------";
	cout << "\n\n\tBAI TAP LON MON LTHT";
	cout << "\n\n\tSinh vien thuc hien:";
	cout << "\n\n\tDang Van Cong - 2010A02";
	cout << "\n\tLe Hai Doan   - 2010A02";
	cout << "\n\tPham Van Long - 2110A05";
	cout << "\n\t-------------------------";
	cout << "\n\tCo tiep tuc chuong trinh khong(c/k)?";
	tl = getch();
	if (tl == 'c') {
		PS:
			clrscr();
			cout << "\n\t               De 1";
			cout << "\n\n\tCAC CHUC NANG TAO MD, TONG SL, CONG COM";
			cout << "\n\t---------------------------------------";
			cout << "\n\t1 ... Chuc nang MD";
			cout << "\n\t2 ... Tong le day so nguyen";
			cout << "\n\t3 ... Cong COM va dia chi";
			cout << "\n\t4 ... Thoat ve DOS";
			cout << "\n\t---------------------------------------";
			cout << "\n\tLua chon cua ban: "; cin >> chon;
			switch(chon) {
				case 1:
					cout << "\n\tTao MD";
					getch();
					break;
				case 2:
					ODD_SUM();
					break;
				case 4:
					EXIT();
					break;
				default:
					cout << "\n\tChon sai!!!";
					getch();
					break;
			}
		cout << "\n\tCo thuc hien chuc nang khac(c/k)?";
		tl = getch();
		if (tl == 'c') {
			goto PS;
		}
	}
}