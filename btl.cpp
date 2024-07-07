#include <iostream.h>
#include <conio.h>

extern CRE_DIR();
extern ODD_SUM();
extern COM();
extern EXIT();
void main(void) {
	char tl;
	int chon;
	clrscr();
	cout << "\n\t     TRUONG DAI HOC MO HA NOI";
	cout << "\n\t     KHOA CONG NGHE THONG TIN";
	cout << "\n\t----------------***-----------------";
	cout << "\n\n\t          BAI TAP LON";
	cout << "\n\t     MON: LAP TRINH HE THONG";
	cout << "\n\n\tGiang vien: Nguyen Dac Phuong Thao";
	cout << "\n\n\tNhom/Sinh vien thuc hien: 01";
	cout << "\n\n\tDang Van Cong - 2010A02";
	cout << "\n\tLe Hai Doan   - 2010A02";
	cout << "\n\tPham Van Long - 2110A05";
	cout << "\n\t------------------------------------";
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
					CRE_DIR();
					getch();
					break;
				case 2:
					ODD_SUM();
					break;
				case 3:
					COM();
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