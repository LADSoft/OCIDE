#include  <windows.h>


#define ID_ICON 1000
int psp ;

char *szAppName   =   "WinDemo";
char *stitle       =  "A windows program";
char *string1     =  "Watermelons are good";
char *string2     =  "Fish are nice";
char *about       =  "ABOUT";
char *menuname    =  "GenericMenu";
int flag ;
HWND hWnd ;
MSG msgx;
WNDCLASS  wc ;

#define STRING "THIS IS A WINDOWS PROGRAM"


int PASCAL AboutBoxProc (HWND hWnd, int wmsg, int wParam, int lParam)
{
    switch(wmsg) {
        case WM_INITDIALOG:
            return 0;
        case WM_COMMAND:
            switch(LOWORD(wParam)) {
                case 100:
                    EndDialog(hWnd,1) ;
                    break ;
            } 
    }
    return 0 ;
}
int PASCAL WndProc (HWND hWnd, int wmsg, int wParam, int lParam)
{
   HDC dc ;
    switch(wmsg) {
        case WM_CREATE:
            SetTimer(hWnd,1,1000,0) ;
            break ;
        case WM_TIMER:
            if (wParam == 1) {
                if (!flag)
                    SetWindowText(hWnd,string1) ;
                else
                    SetWindowText(hWnd,string2);
                flag = !flag ;
            }
            break ;
        case WM_PAINT:
            {
                PAINTSTRUCT ps ;
            RECT r ;
            COLORREF old ;
            GetClientRect(hWnd,&r) ;
            dc = BeginPaint(hWnd,&ps);
            old = SetTextColor(dc,0xff0000) ;
            TextOut(dc,(r.left + r.right - strlen(STRING) * 8 /* an approximation */)/2,(r.bottom +r.top)/2,STRING,strlen(STRING)) ;
            SetTextColor(dc,old) ;
                EndPaint(hWnd,&ps) ;
            }
            break ;
        case WM_COMMAND:
            switch(LOWORD(wParam)) {
                case 200:
//					DialogBox(hInstance,about,hWnd,AboutBoxProc) ;
                    break ;
            }
            break ;
        case WM_DESTROY:
            PostQuitMessage(0) ;
            break ;
        default:
            return DefWindowProc(hWnd,wmsg,wParam,lParam);	
    }
    return 0 ;
}

int PASCAL WinMain( HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpszCmdLine,
                    int nCmdShow )
{
    if (!hPrevInstance) {
        wc.style = CS_HREDRAW + CS_VREDRAW ;
        wc.lpfnWndProc = WndProc ;
        wc.cbClsExtra = 0 ;
        wc.cbWndExtra = 0 ;
        wc.hInstance = hInstance ;
        wc.hIcon = 0 ; // LoadIcon(hInstance, ID_ICON) ;
        wc.hCursor = LoadCursor(0,IDC_ARROW) ;
        wc.hbrBackground = GetStockObject(WHITE_BRUSH) ;
        wc.lpszMenuName = 0 ; // menuname ;
        wc.lpszClassName = szAppName ;
        if (!RegisterClass(&wc))
            return 0 ;
    }
    hWnd= CreateWindow(szAppName,stitle,WS_OVERLAPPEDWINDOW + WS_VISIBLE,
            CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,
            0,0,hInstance,0) ;
    ShowWindow(hWnd,nCmdShow) ;
    UpdateWindow(hWnd) ;
    while (GetMessage(&msgx,0,0,0)) {
        TranslateMessage(&msgx);
        DispatchMessage(&msgx) ;
    }
    return msgx.wParam ;
}