;File printwm.c
;Compiler version 6.0.36.1
	section code align=16 class=CODE use32
	section data align=8 class=DATA use32
	section bss  align=8 class=BSS use32
	section const  align=8 class=CONST use32
	section string  align=2 class=STRING use32
	section tls  align=8 class=TLS use32
	section cstartup align=2 class=INITDATA use32
	section crundown align=2 class=EXITDATA use32
section code
[global	_printwmsg]
_printwmsg:
; Line 775:	void printwmsg(HWND hwnd, int message, WPARAM wParam, LPARAM lParam)

; Line 776:	{

	add	esp,0fffffe00h
	push	ebx
	push	ebp
	push	esi
	push	edi
L_199:
	mov	ebx,dword [esp+010h+0210h]
	mov	edi,dword [esp+0ch+0210h]
	mov	esi,dword [esp+08h+0210h]
	mov	ebp,dword [esp+04h+0210h]
; Line 779:	    char buf2[256];

; Line 780:	    if (!first)

	cmp	dword [_first],byte 00h
	jne	short	L_202
; Line 781:	         first = GetTickCount();

	call	dword [GetTickCount]
	mov	dword [_first],eax
L_202:
; Line 782:	    memset(buf,0, sizeof(buf));

	push	dword 0100h
	push	byte 00h
	lea	eax,[esp-0100h+0218h]
	push	eax
	call	_memset
	add	esp,byte 0ch
; Line 783:	    memset(buf2, 0, sizeof(buf2));

	push	dword 0100h
	push	byte 00h
	lea	eax,[esp-0200h+0218h]
	push	eax
	call	_memset
	add	esp,byte 0ch
; Line 784:	    SendMessage(hwnd, WM_GETTEXT, 256, (LPARAM)buf);

	lea	eax,[esp-0100h+0210h]
	push	eax
	push	dword 0100h
	push	byte 0dh
	mov	eax,ebp
	push	eax
	call	dword [SendMessageA]
; Line 785:	    GetClassName(hwnd, buf2, 256);

	push	dword 0100h
	lea	eax,[esp-0200h+0214h]
	push	eax
	push	ebp
	call	dword [GetClassNameA]
; Line 786:	    if (!out)

	cmp	dword [_out],byte 00h
	jne	short	L_207
; Line 787:	        out = fopen("wlog.log", "w");

	push	dword L_192
	push	dword L_191
	call	_fopen
	pop	ecx
	pop	ecx
	mov	dword [_out],eax
L_207:
; Line 788:	    if (!out)

	cmp	dword [_out],byte 00h
	je	near	L_200
; Line 789:	        return ;

L_212:
; Line 790:	    fprintf(out,"%d, %s:", GetTickCount() - first, buf2);

	lea	eax,[esp-0200h+0210h]
	push	eax
	call	dword [GetTickCount]
	sub	eax,dword [_first]
	push	eax
	push	dword L_193
	mov	eax,dword [_out]
	push	eax
	call	_fprintf
	add	esp,byte 010h
	xor	ebp,ebp
L_217:
; Line 792:	    if (array[i].id == message)

	mov	eax,esi
	cmp	dword [ebp*8+04h+_array],eax
	jne	short	L_223
; Line 793:	    {

; Line 794:	        fprintf(out, "%s:", array[i].name);

	mov	eax,dword [ebp*8+_array]
	push	eax
	push	dword L_194
	mov	eax,dword [_out]
	push	eax
	call	_fprintf
	add	esp,byte 0ch
; Line 795:	    break;

	jmp	short	L_219
L_223:
L_220:
	inc	ebp
; Line 791:	    for (i = 0; i < sizeof(array) / sizeof(WMSG); i++)

L_218:
	cmp	ebp,0beh
	jl	short	L_217
L_219:
; Line 796:	    }

; Line 797:	    if (i >= sizeof(array)/sizeof(WMSG))

	cmp	ebp,0beh
	jl	short	L_232
; Line 798:	        fprintf(out, "UNKNOWN:");

	push	dword L_195
	mov	eax,dword [_out]
	push	eax
	call	_fprintf
	pop	ecx
	pop	ecx
L_232:
; Line 799:	    fprintf(out, "%d:%d:%X", message, wParam, lParam);

	mov	eax,ebx
	push	eax
	push	edi
	mov	eax,esi
	push	eax
	push	dword L_196
	mov	eax,dword [_out]
	push	eax
	call	_fprintf
	add	esp,byte 014h
; Line 800:	    if (message == WM_NOTIFY)

	cmp	esi,byte 04eh
	jne	short	L_237
; Line 801:	    {

; Line 802:	        NMHDR *xx = (NMHDR *)lParam;

; Line 803:	        fprintf(out, "   Notify:%x:%d", xx->code, xx->idFrom);

	mov	eax,dword [ebx+04h]
	push	eax
	mov	eax,dword [ebx+08h]
	push	eax
	push	dword L_197
	mov	eax,dword [_out]
	push	eax
	call	_fprintf
	add	esp,byte 010h
L_237:
; Line 804:	    }

; Line 805:	    fprintf(out, "\n");

	push	dword L_198
	mov	eax,dword [_out]
	push	eax
	call	_fprintf
	pop	ecx
	pop	ecx
; Line 806:	    fflush(out);

	mov	eax,dword [_out]
	push	eax
	call	_fflush
	pop	ecx
; Line 807:	}

L_200:
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	add	esp,0200h
	ret
section data

_array	dd	L_1
	dd	06h

	dd	L_2
	dd	01ch
	dd	L_3
	dd	030ch
	dd	L_4
	dd	04bh
	dd	L_5
	dd	01fh
	dd	L_6
	dd	0215h
	dd	L_7
	dd	030dh
	dd	L_8
	dd	0102h
	dd	L_9
	dd	02fh
	dd	L_10
	dd	022h
	dd	L_11
	dd	0401h
	dd	L_12
	dd	0465h
	dd	L_13
	dd	0466h
	dd	L_14
	dd	0303h
	dd	L_15
	dd	010h
	dd	L_16
	dd	0111h
	dd	L_17
	dd	041h
	dd	L_18
	dd	039h
	dd	L_19
	dd	07bh
	dd	L_20
	dd	0301h
	dd	L_21
	dd	04ah
	dd	L_22
	dd	01h
	dd	L_23
	dd	0135h
	dd	L_24
	dd	0136h
	dd	L_25
	dd	0133h
	dd	L_26
	dd	0134h
	dd	L_27
	dd	0132h
	dd	L_28
	dd	0137h
	dd	L_29
	dd	0138h
	dd	L_30
	dd	0300h
	dd	L_31
	dd	0103h
	dd	L_32
	dd	02dh
	dd	L_33
	dd	02h
	dd	L_34
	dd	0307h
	dd	L_35
	dd	0219h
	dd	L_36
	dd	01bh
	dd	L_37
	dd	07eh
	dd	L_38
	dd	0308h
	dd	L_39
	dd	02bh
	dd	L_40
	dd	0233h
	dd	L_41
	dd	0ah
	dd	L_42
	dd	016h
	dd	L_43
	dd	0121h
	dd	L_44
	dd	0211h
	dd	L_45
	dd	0231h
	dd	L_46
	dd	014h
	dd	L_47
	dd	0212h
	dd	L_48
	dd	0232h
	dd	L_49
	dd	01dh
	dd	L_50
	dd	087h
	dd	L_51
	dd	031h
	dd	L_52
	dd	033h
	dd	L_53
	dd	07fh
	dd	L_54
	dd	024h
	dd	L_55
	dd	0dh
	dd	L_56
	dd	0eh
	dd	L_57
	dd	053h
	dd	L_58
	dd	0312h
	dd	L_59
	dd	0114h
	dd	L_60
	dd	030eh
	dd	L_61
	dd	027h
	dd	L_62
	dd	0286h
	dd	L_63
	dd	010fh
	dd	L_64
	dd	0284h
	dd	L_65
	dd	0283h
	dd	L_66
	dd	010eh
	dd	L_67
	dd	0290h
	dd	L_68
	dd	0291h
	dd	L_69
	dd	0282h
	dd	L_70
	dd	0285h
	dd	L_71
	dd	0281h
	dd	L_72
	dd	010dh
	dd	L_73
	dd	0110h
	dd	L_74
	dd	0116h
	dd	L_75
	dd	0117h
	dd	L_76
	dd	051h
	dd	L_77
	dd	050h
	dd	L_78
	dd	0100h
	dd	L_79
	dd	0101h
	dd	L_80
	dd	08h
	dd	L_81
	dd	0203h
	dd	L_82
	dd	0201h
	dd	L_83
	dd	0202h
	dd	L_84
	dd	0209h
	dd	L_85
	dd	0207h
	dd	L_86
	dd	0208h
	dd	L_87
	dd	0222h
	dd	L_88
	dd	0227h
	dd	L_89
	dd	0220h
	dd	L_90
	dd	0221h
	dd	L_91
	dd	0229h
	dd	L_92
	dd	0228h
	dd	L_93
	dd	0225h
	dd	L_94
	dd	0224h
	dd	L_95
	dd	0234h
	dd	L_96
	dd	0223h
	dd	L_97
	dd	0230h
	dd	L_98
	dd	0226h
	dd	L_99
	dd	02ch
	dd	L_100
	dd	0120h
	dd	L_101
	dd	011fh
	dd	L_102
	dd	021h
	dd	L_103
	dd	0200h
	dd	L_104
	dd	03h
	dd	L_105
	dd	0216h
	dd	L_106
	dd	086h
	dd	L_107
	dd	083h
	dd	L_108
	dd	081h
	dd	L_109
	dd	082h
	dd	L_110
	dd	084h
	dd	L_111
	dd	0a3h
	dd	L_112
	dd	0a1h
	dd	L_113
	dd	0a2h
	dd	L_114
	dd	0a9h
	dd	L_115
	dd	0a7h
	dd	L_116
	dd	0a8h
	dd	L_117
	dd	0a0h
	dd	L_118
	dd	085h
	dd	L_119
	dd	0a6h
	dd	L_120
	dd	0a4h
	dd	L_121
	dd	0a5h
	dd	L_122
	dd	028h
	dd	L_123
	dd	04eh
	dd	L_124
	dd	055h
	dd	L_125
	dd	00h
	dd	L_126
	dd	0fh
	dd	L_127
	dd	0309h
	dd	L_128
	dd	026h
	dd	L_129
	dd	0311h
	dd	L_130
	dd	0310h
	dd	L_131
	dd	0210h
	dd	L_132
	dd	0302h
	dd	L_133
	dd	0380h
	dd	L_134
	dd	038fh
	dd	L_135
	dd	048h
	dd	L_136
	dd	0218h
	dd	L_137
	dd	0317h
	dd	L_138
	dd	0318h
	dd	L_139
	dd	0405h
	dd	L_140
	dd	0401h
	dd	L_141
	dd	0404h
	dd	L_142
	dd	0403h
	dd	L_143
	dd	0402h
	dd	L_144
	dd	0400h
	dd	L_145
	dd	0406h
	dd	L_146
	dd	037h
	dd	L_147
	dd	011h
	dd	L_148
	dd	030fh
	dd	L_149
	dd	013h
	dd	L_150
	dd	023h
	dd	L_151
	dd	012h
	dd	L_152
	dd	0206h
	dd	L_153
	dd	0204h
	dd	L_154
	dd	0205h
	dd	L_155
	dd	0306h
	dd	L_156
	dd	0305h
	dd	L_157
	dd	020h
	dd	L_158
	dd	07h
	dd	L_159
	dd	030h
	dd	L_160
	dd	032h
	dd	L_161
	dd	080h
	dd	L_162
	dd	0bh
	dd	L_163
	dd	0ch
	dd	L_164
	dd	01ah
	dd	L_165
	dd	018h
	dd	L_166
	dd	05h
	dd	L_167
	dd	030bh
	dd	L_168
	dd	0214h
	dd	L_169
	dd	02ah
	dd	L_170
	dd	07dh
	dd	L_171
	dd	07ch
	dd	L_172
	dd	0106h
	dd	L_173
	dd	015h
	dd	L_174
	dd	0112h
	dd	L_175
	dd	0107h
	dd	L_176
	dd	0104h
	dd	L_177
	dd	0105h
	dd	L_178
	dd	0118h
	dd	L_179
	dd	052h
	dd	L_180
	dd	01eh
	dd	L_181
	dd	0113h
	dd	L_182
	dd	0304h
	dd	L_183
	dd	0400h
	dd	L_184
	dd	054h
	dd	L_185
	dd	02eh
	dd	L_186
	dd	0115h
	dd	L_187
	dd	030ah
	dd	L_188
	dd	047h
	dd	L_189
	dd	046h
	dd	L_190
	dd	01ah
section bss

_out	resb	04h

_first	resb	04h

section code
section data
section string
L_198:
	db	0ah
	db	00h
L_197:
	db	"   Notify:%x:%d"
	db	00h
L_196:
	db	"%d:%d:%X"
	db	00h
L_195:
	db	"UNKNOWN:"
	db	00h
L_194:
	db	"%s:"
	db	00h
L_193:
	db	"%d, %s:"
	db	00h
L_192:
	db	"w"
	db	00h
L_191:
	db	"wlog.log"
	db	00h
L_190:
	db	"WM_WININICHANGE"
	db	00h
L_189:
	db	"WM_WINDOWPOSCHANGING"
	db	00h
L_188:
	db	"WM_WINDOWPOSCHANGED"
	db	00h
L_187:
	db	"WM_VSCROLLCLIPBOARD"
	db	00h
L_186:
	db	"WM_VSCROLL"
	db	00h
L_185:
	db	"WM_VKEYTOITEM"
	db	00h
L_184:
	db	"WM_USERCHANGED"
	db	00h
L_183:
	db	"WM_USER"
	db	00h
L_182:
	db	"WM_UNDO"
	db	00h
L_181:
	db	"WM_TIMER"
	db	00h
L_180:
	db	"WM_TIMECHANGE"
	db	00h
L_179:
	db	"WM_TCARD"
	db	00h
L_178:
	db	"WM_SYSTIMER"
	db	00h
L_177:
	db	"WM_SYSKEYUP"
	db	00h
L_176:
	db	"WM_SYSKEYDOWN"
	db	00h
L_175:
	db	"WM_SYSDEADCHAR"
	db	00h
L_174:
	db	"WM_SYSCOMMAND"
	db	00h
L_173:
	db	"WM_SYSCOLORCHANGE"
	db	00h
L_172:
	db	"WM_SYSCHAR"
	db	00h
L_171:
	db	"WM_STYLECHANGING"
	db	00h
L_170:
	db	"WM_STYLECHANGED"
	db	00h
L_169:
	db	"WM_SPOOLERSTATUS"
	db	00h
L_168:
	db	"WM_SIZING"
	db	00h
L_167:
	db	"WM_SIZECLIPBOARD"
	db	00h
L_166:
	db	"WM_SIZE"
	db	00h
L_165:
	db	"WM_SHOWWINDOW"
	db	00h
L_164:
	db	"WM_SETTINGCHANGE"
	db	00h
L_163:
	db	"WM_SETTEXT"
	db	00h
L_162:
	db	"WM_SETREDRAW"
	db	00h
L_161:
	db	"WM_SETICON"
	db	00h
L_160:
	db	"WM_SETHOTKEY"
	db	00h
L_159:
	db	"WM_SETFONT"
	db	00h
L_158:
	db	"WM_SETFOCUS"
	db	00h
L_157:
	db	"WM_SETCURSOR"
	db	00h
L_156:
	db	"WM_RENDERFORMAT"
	db	00h
L_155:
	db	"WM_RENDERALLFORMATS"
	db	00h
L_154:
	db	"WM_RBUTTONUP"
	db	00h
L_153:
	db	"WM_RBUTTONDOWN"
	db	00h
L_152:
	db	"WM_RBUTTONDBLCLK"
	db	00h
L_151:
	db	"WM_QUIT"
	db	00h
L_150:
	db	"WM_QUEUESYNC"
	db	00h
L_149:
	db	"WM_QUERYOPEN"
	db	00h
L_148:
	db	"WM_QUERYNEWPALETTE"
	db	00h
L_147:
	db	"WM_QUERYENDSESSION"
	db	00h
L_146:
	db	"WM_QUERYDRAGICON"
	db	00h
L_145:
	db	"WM_PSD_YAFULLPAGERECT"
	db	00h
L_144:
	db	"WM_PSD_PAGESETUPDLG"
	db	00h
L_143:
	db	"WM_PSD_MINMARGINRECT"
	db	00h
L_142:
	db	"WM_PSD_MARGINRECT"
	db	00h
L_141:
	db	"WM_PSD_GREEKTEXTRECT"
	db	00h
L_140:
	db	"WM_PSD_FULLPAGERECT"
	db	00h
L_139:
	db	"WM_PSD_ENVSTAMPRECT"
	db	00h
L_138:
	db	"WM_PRINTCLIENT"
	db	00h
L_137:
	db	"WM_PRINT"
	db	00h
L_136:
	db	"WM_POWERBROADCAST"
	db	00h
L_135:
	db	"WM_POWER"
	db	00h
L_134:
	db	"WM_PENWINLAST"
	db	00h
L_133:
	db	"WM_PENWINFIRST"
	db	00h
L_132:
	db	"WM_PASTE"
	db	00h
L_131:
	db	"WM_PARENTNOTIFY"
	db	00h
L_130:
	db	"WM_PALETTEISCHANGING"
	db	00h
L_129:
	db	"WM_PALETTECHANGED"
	db	00h
L_128:
	db	"WM_PAINTICON"
	db	00h
L_127:
	db	"WM_PAINTCLIPBOARD"
	db	00h
L_126:
	db	"WM_PAINT"
	db	00h
L_125:
	db	"WM_NULL"
	db	00h
L_124:
	db	"WM_NOTIFYFORMAT"
	db	00h
L_123:
	db	"WM_NOTIFY"
	db	00h
L_122:
	db	"WM_NEXTDLGCTL"
	db	00h
L_121:
	db	"WM_NCRBUTTONUP"
	db	00h
L_120:
	db	"WM_NCRBUTTONDOWN"
	db	00h
L_119:
	db	"WM_NCRBUTTONDBLCLK"
	db	00h
L_118:
	db	"WM_NCPAINT"
	db	00h
L_117:
	db	"WM_NCMOUSEMOVE"
	db	00h
L_116:
	db	"WM_NCMBUTTONUP"
	db	00h
L_115:
	db	"WM_NCMBUTTONDOWN"
	db	00h
L_114:
	db	"WM_NCMBUTTONDBLCLK"
	db	00h
L_113:
	db	"WM_NCLBUTTONUP"
	db	00h
L_112:
	db	"WM_NCLBUTTONDOWN"
	db	00h
L_111:
	db	"WM_NCLBUTTONDBLCLK"
	db	00h
L_110:
	db	"WM_NCHITTEST"
	db	00h
L_109:
	db	"WM_NCDESTROY"
	db	00h
L_108:
	db	"WM_NCCREATE"
	db	00h
L_107:
	db	"WM_NCCALCSIZE"
	db	00h
L_106:
	db	"WM_NCACTIVATE"
	db	00h
L_105:
	db	"WM_MOVING"
	db	00h
L_104:
	db	"WM_MOVE"
	db	00h
L_103:
	db	"WM_MOUSEMOVE"
	db	00h
L_102:
	db	"WM_MOUSEACTIVATE"
	db	00h
L_101:
	db	"WM_MENUSELECT"
	db	00h
L_100:
	db	"WM_MENUCHAR"
	db	00h
L_99:
	db	"WM_MEASUREITEM"
	db	00h
L_98:
	db	"WM_MDITILE"
	db	00h
L_97:
	db	"WM_MDISETMENU"
	db	00h
L_96:
	db	"WM_MDIRESTORE"
	db	00h
L_95:
	db	"WM_MDIREFRESHMENU"
	db	00h
L_94:
	db	"WM_MDINEXT"
	db	00h
L_93:
	db	"WM_MDIMAXIMIZE"
	db	00h
L_92:
	db	"WM_MDIICONARRANGE"
	db	00h
L_91:
	db	"WM_MDIGETACTIVE"
	db	00h
L_90:
	db	"WM_MDIDESTROY"
	db	00h
L_89:
	db	"WM_MDICREATE"
	db	00h
L_88:
	db	"WM_MDICASCADE"
	db	00h
L_87:
	db	"WM_MDIACTIVATE"
	db	00h
L_86:
	db	"WM_MBUTTONUP"
	db	00h
L_85:
	db	"WM_MBUTTONDOWN"
	db	00h
L_84:
	db	"WM_MBUTTONDBLCLK"
	db	00h
L_83:
	db	"WM_LBUTTONUP"
	db	00h
L_82:
	db	"WM_LBUTTONDOWN"
	db	00h
L_81:
	db	"WM_LBUTTONDBLCLK"
	db	00h
L_80:
	db	"WM_KILLFOCUS"
	db	00h
L_79:
	db	"WM_KEYUP"
	db	00h
L_78:
	db	"WM_KEYDOWN"
	db	00h
L_77:
	db	"WM_INPUTLANGCHANGEREQUEST"
	db	00h
L_76:
	db	"WM_INPUTLANGCHANGE"
	db	00h
L_75:
	db	"WM_INITMENUPOPUP"
	db	00h
L_74:
	db	"WM_INITMENU"
	db	00h
L_73:
	db	"WM_INITDIALOG"
	db	00h
L_72:
	db	"WM_IME_STARTCOMPOSITION"
	db	00h
L_71:
	db	"WM_IME_SETCONTEXT"
	db	00h
L_70:
	db	"WM_IME_SELECT"
	db	00h
L_69:
	db	"WM_IME_NOTIFY"
	db	00h
L_68:
	db	"WM_IME_KEYUP"
	db	00h
L_67:
	db	"WM_IME_KEYDOWN"
	db	00h
L_66:
	db	"WM_IME_ENDCOMPOSITION"
	db	00h
L_65:
	db	"WM_IME_CONTROL"
	db	00h
L_64:
	db	"WM_IME_COMPOSITIONFULL"
	db	00h
L_63:
	db	"WM_IME_COMPOSITION"
	db	00h
L_62:
	db	"WM_IME_CHAR"
	db	00h
L_61:
	db	"WM_ICONERASEBKGND"
	db	00h
L_60:
	db	"WM_HSCROLLCLIPBOARD"
	db	00h
L_59:
	db	"WM_HSCROLL"
	db	00h
L_58:
	db	"WM_HOTKEY"
	db	00h
L_57:
	db	"WM_HELP"
	db	00h
L_56:
	db	"WM_GETTEXTLENGTH"
	db	00h
L_55:
	db	"WM_GETTEXT"
	db	00h
L_54:
	db	"WM_GETMINMAXINFO"
	db	00h
L_53:
	db	"WM_GETICON"
	db	00h
L_52:
	db	"WM_GETHOTKEY"
	db	00h
L_51:
	db	"WM_GETFONT"
	db	00h
L_50:
	db	"WM_GETDLGCODE"
	db	00h
L_49:
	db	"WM_FONTCHANGE"
	db	00h
L_48:
	db	"WM_EXITSIZEMOVE"
	db	00h
L_47:
	db	"WM_EXITMENULOOP"
	db	00h
L_46:
	db	"WM_ERASEBKGND"
	db	00h
L_45:
	db	"WM_ENTERSIZEMOVE"
	db	00h
L_44:
	db	"WM_ENTERMENULOOP"
	db	00h
L_43:
	db	"WM_ENTERIDLE"
	db	00h
L_42:
	db	"WM_ENDSESSION"
	db	00h
L_41:
	db	"WM_ENABLE"
	db	00h
L_40:
	db	"WM_DROPFILES"
	db	00h
L_39:
	db	"WM_DRAWITEM"
	db	00h
L_38:
	db	"WM_DRAWCLIPBOARD"
	db	00h
L_37:
	db	"WM_DISPLAYCHANGE"
	db	00h
L_36:
	db	"WM_DEVMODECHANGE"
	db	00h
L_35:
	db	"WM_DEVICECHANGE"
	db	00h
L_34:
	db	"WM_DESTROYCLIPBOARD"
	db	00h
L_33:
	db	"WM_DESTROY"
	db	00h
L_32:
	db	"WM_DELETEITEM"
	db	00h
L_31:
	db	"WM_DEADCHAR"
	db	00h
L_30:
	db	"WM_CUT"
	db	00h
L_29:
	db	"WM_CTLCOLORSTATIC"
	db	00h
L_28:
	db	"WM_CTLCOLORSCROLLBAR"
	db	00h
L_27:
	db	"WM_CTLCOLORMSGBOX"
	db	00h
L_26:
	db	"WM_CTLCOLORLISTBOX"
	db	00h
L_25:
	db	"WM_CTLCOLOREDIT"
	db	00h
L_24:
	db	"WM_CTLCOLORDLG"
	db	00h
L_23:
	db	"WM_CTLCOLORBTN"
	db	00h
L_22:
	db	"WM_CREATE"
	db	00h
L_21:
	db	"WM_COPYDATA"
	db	00h
L_20:
	db	"WM_COPY"
	db	00h
L_19:
	db	"WM_CONTEXTMENU"
	db	00h
L_18:
	db	"WM_COMPAREITEM"
	db	00h
L_17:
	db	"WM_COMPACTING"
	db	00h
L_16:
	db	"WM_COMMAND"
	db	00h
L_15:
	db	"WM_CLOSE"
	db	00h
L_14:
	db	"WM_CLEAR"
	db	00h
L_13:
	db	"WM_CHOOSEFONT_SETFLAGS"
	db	00h
L_12:
	db	"WM_CHOOSEFONT_SETLOGFONT"
	db	00h
L_11:
	db	"WM_CHOOSEFONT_GETLOGFONT"
	db	00h
L_10:
	db	"WM_CHILDACTIVATE"
	db	00h
L_9:
	db	"WM_CHARTOITEM"
	db	00h
L_8:
	db	"WM_CHAR"
	db	00h
L_7:
	db	"WM_CHANGECBCHAIN"
	db	00h
L_6:
	db	"WM_CAPTURECHANGED"
	db	00h
L_5:
	db	"WM_CANCELMODE"
	db	00h
L_4:
	db	"WM_CANCELJOURNAL"
	db	00h
L_3:
	db	"WM_ASKCBFORMATNAME"
	db	00h
L_2:
	db	"WM_ACTIVATEAPP"
	db	00h
L_1:
	db	"WM_ACTIVATE"
	db	00h
section const

section code
[extern	GetClassNameA]
[extern	SendMessageA]
[extern	GetTickCount]
[extern	_memset]
[extern	_fprintf]
[extern	_fopen]
[extern	_fflush]
