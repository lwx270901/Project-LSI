#include <iostream>
using namespace std;
class sinhvien{
    int mssv;
public:
    void getnumber()
    {
        cout<<"Nhap MSSV: ";
        cin>>mssv;
    }
    void setnumber(){
        cout<<"MSSV la: "<<mssv;
    }
};
class diemthi{
    int diem1, diem2;
public:
    void getdiem()
    {
        cout<<"Nhap diem: ";
        cin>>diem1>>diem2;
    }
    void setdiem(){
        cout<<"diem thi la: "<<diem1<<" , "<<diem2;
    }

};